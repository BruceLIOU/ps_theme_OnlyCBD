<?php
/**
 * Hervé HENNES
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file docs/licenses/LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to contact@h-hennes.fr so we can send you a copy immediately.
 *
 * @author    Hervé HENNES <contact@h-hhennes.fr>
 * @copyright since 2022 Hervé HENNES
 * @license   https://opensource.org/licenses/AFL-3.0  Academic Free License ("AFL") v. 3.0
 */

use PrestaShop\PrestaShop\Adapter\Presenter\Product\ProductLazyArray;

if (!defined('_PS_VERSION_')) {
    exit;
}


class Hhproductcomments extends Module
{

    /** @var string Nom du module de gestion des commentaires */
    const PRODUCT_COMMENTS_MODULE_NAME = 'productcomments';

    public function __construct()
    {
        $this->name = 'hhproductcomments';
        $this->tab = 'others';
        $this->version = '0.1.1';
        $this->author = 'hhennes';
        $this->bootstrap = true;
        $this->dependencies = [self::PRODUCT_COMMENTS_MODULE_NAME];
        parent::__construct();

        $this->displayName = $this->l('Hh product comments');
        $this->description = $this->l('Display prestashop module comments in product extra content');
    }

    /**
     * Installation du module
     * @return bool
     */
    public function install()
    {
        return parent::install()
            && $this->registerHook(['displayProductExtraContent', 'actionFrontControllerSetMedia'])
            && $this->unregisterProductCommentsFooter();
    }

    /**
     * Suppression du hook footer pour le module productComments
     * @return bool
     */
    protected function unregisterProductCommentsFooter(): bool
    {
        if ($productCommentModule = $this->getProductCommentsModule()) {
            return $productCommentModule->unregisterHook('displayFooterProduct');
        }
        return true;
    }

    /**
     * Récupération du module de commentaire produits
     * @return false|Module
     */
    protected function getProductCommentsModule()
    {
        return Module::getInstanceByName(self::PRODUCT_COMMENTS_MODULE_NAME);
    }

    /**
     * Affichage du contenu du module productComments dans le hookDisplay extra Content
     * @param array $params
     * @return array
     */
    public function hookDisplayProductExtraContent($params)
    {
        $return = [];
        $productCommentModule = $this->getProductCommentsModule();
        if ($productCommentModule && $productCommentModule->active == true) {
            /** @var \ProductComments $productCommentModule */
            try {
                //Problème à ce niveau : dans notre hook on a une instance de Product et le hook du module veut avoir un ProductLazyArray
                $params['product'] = $this->getPresentedProduct($params);
                $content = $productCommentModule->hookDisplayFooterProduct($params);
            } catch (Exception $e) {
                $content = 'Error ' . $e->getMessage();
            }
            $return[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setAttr([
                    'id' => 'hh-product-comments_button',
                ])
                ->setTitle($this->l('Reviews'))
                ->setContent($content);
        }
        return $return;
    }

    /**
     * Ajout d'un javascript sur le controller produit pour gérer l'affichage du bloc des commentaires
     * @param array $params
     * @return void
     */
    public function hookActionFrontControllerSetMedia(array $params)
    {
        //Uniquement sur le controller produit
        if ($this->context->controller instanceof ProductController) {
            $this->context->controller->registerJavascript(
                $this->name . '-product',
               'modules/'.$this->name.'/views/js/' . $this->name . '-product.js'
            );
        }
    }

    /**
     * Récupération d'une instance ProductLazyArray pour le frontOffice
     * @param array $params
     * @return ProductLazyArray
     * @throws ReflectionException
     */
    protected function getPresentedProduct(array $params): ProductLazyArray
    {
        //Gestion des paramètres de présentation
        $settings = new \PrestaShop\PrestaShop\Core\Product\ProductPresentationSettings();
        $settings->catalog_mode = Configuration::isCatalogMode();
        $settings->catalog_mode_with_prices = (int)Configuration::get('PS_CATALOG_MODE_WITH_PRICES');
        $settings->include_taxes = true;
        $settings->allow_add_variant_to_cart_from_listing = (int)Configuration::get('PS_ATTRIBUTE_CATEGORY_DISPLAY');
        $settings->stock_management_enabled = Configuration::get('PS_STOCK_MANAGEMENT');
        $settings->showPrices = Configuration::showPrices();
        $settings->lastRemainingItems = Configuration::get('PS_LAST_QTIES');
        $settings->showLabelOOSListingPages = (bool)Configuration::get('PS_SHOW_LABEL_OOS_LISTING_PAGES');

        //Récupération de l'instance du presenter
        $productPresenter = new \ProductPresenterFactory($this->context, null);
        $presenter = $productPresenter->getPresenter();

        //Récupération d'une instance de l'assembler
        $assembler = new ProductAssembler($this->context);

        //Conversion de l'objet "Product" en tableau et ajout de son identifiant
        $product = (array)$params['product'];
        $product['id_product'] = $product['id'];

        return $presenter->present(
            $settings,
            $assembler->assembleProduct($product),
            $this->context->language
        );
    }
}
