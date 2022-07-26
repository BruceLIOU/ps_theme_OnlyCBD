<?php
/**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(dirname(__FILE__).'/classes/brlCustomblocksForms.php');

class Brlcustomblocks extends Module
{
    protected $modeDebug = true;
    protected $errorMessages = '';
    protected $confirmMessages = '';

    public function __construct()
    {
        $this->name = 'brlcustomblocks';
        $this->id_product = self::getIdConfPrestashop();
        $this->tab = 'front_office_features';
        $this->version = '1.0.2';
        $this->author = 'Autour du digital';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.6',
            'max' => _PS_VERSION_
        ];
        $this->bootstrap = true;
        $this->module_key = 'f259887d568bd28670a0348f84ec2605';

        parent::__construct();

        $this->displayName = $this->l('Custom HTML Blocks');
        $this->description = $this->l('This module allows you to create your own blocks and place them wherever you want.');
    }

    public function install()
    {
        if (! Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'brlcustomblocks` (
                `id_brlcustomblocks` int(11) NOT null AUTO_INCREMENT,
                `id_shop` int(11) NOT null,
                `id_hook` int(11) NOT null,
                `id_group` int(11) NOT null,
                `is_active` tinyint(1) NOT null,
                `label` varchar(255) NOT null,
                `date_start` DATETIME null,
                `date_end` DATETIME null,
                `position` int(11) unsigned NOT NULL DEFAULT \'0\',
                PRIMARY KEY(`id_brlcustomblocks`)
            ) ENGINE='._MYSQL_ENGINE_.' default CHARSET=utf8')) {
            return false;
        }
        if (! Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'brlcustomblocks_lang` (
                `id_brlcustomblocks` int(11) NOT null,
                `id_lang` tinyint(4) NOT null,
                `content_text` TEXT NOT null,
                PRIMARY KEY(`id_brlcustomblocks`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' default CHARSET=utf8')) {
            return false;
        }

        // création de l'AdminAjax en BDD pour la prise en compte du controller admin
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = 'AdminAjaxBrlcustomblocks';
        foreach (Language::getLanguages(true) as $lang) {
            $tab->name[$lang['id_lang']] = 'brlcustomblocks';
        }
        $tab->id_parent = -1;
        $tab->module = 'brlcustomblocks';
        $tab->add();

        Configuration::updateValue('brl_id_product', '');

        if (Shop::isFeatureActive()) {
            Shop::setContext(Shop::CONTEXT_ALL);
        }

        if (version_compare(_PS_VERSION_, '1.7.0.0', '<')) {
            return parent::install() &&
            $this->registerHook('displayCustomerAccount') &&
            $this->registerHook('displayCustomerAccountForm') &&
            $this->registerHook('displayCustomerAccountFormTop') &&
            $this->registerHook('displayFooter') &&
            $this->registerHook('displayFooterProduct') &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayHome') &&
            $this->registerHook('displayLeftColumn') &&
            $this->registerHook('displayLeftColumnProduct') &&
            $this->registerHook('displayMyAccountBlock') &&
            $this->registerHook('displayOrderConfirmation') &&
            $this->registerHook('displayOrderDetail') &&
            $this->registerHook('displayPaymentReturn') &&
            $this->registerHook('displayPaymentTop') &&
            $this->registerHook('displayRightColumn') &&
            $this->registerHook('displayRightColumnProduct') &&
            $this->registerHook('displayShoppingCartFooter') &&
            $this->registerHook('displayTop') &&
            $this->registerHook('displayShoppingCart') &&
            $this->registerHook('displayProductTabContent') &&
            $this->registerHook('displayProductTab') &&
            $this->registerHook('displayMyAccountBlockfooter') &&
            $this->registerHook('displayHookCustomBlocks');
        } else {
            return parent::install() &&
                $this->registerHook('displayAfterProductThumbs') &&
                $this->registerHook('displayContentWrapperBottom') &&
                $this->registerHook('displayContentWrapperTop') &&
                $this->registerHook('displayCustomerAccount') &&
                $this->registerHook('displayCustomerAccountForm') &&
                $this->registerHook('displayCustomerAccountFormTop') &&
                $this->registerHook('displayCustomerLoginFormAfter') &&
                $this->registerHook('displayFooter') &&
                $this->registerHook('displayFooterAfter') &&
                $this->registerHook('displayFooterBefore') &&
                $this->registerHook('displayFooterProduct') &&
                $this->registerHook('displayHeader') &&
                $this->registerHook('displayHome') &&
                $this->registerHook('displayLeftColumn') &&
                $this->registerHook('displayLeftColumnProduct') &&
                $this->registerHook('displayMaintenance') &&
                $this->registerHook('displayMyAccountBlock') &&
                $this->registerHook('displayNav1') &&
                $this->registerHook('displayNav2') &&
                $this->registerHook('displayNavFullWidth') &&
                $this->registerHook('displayNotFound') &&
                $this->registerHook('displayOrderConfirmation') &&
                $this->registerHook('displayOrderConfirmation1') &&
                $this->registerHook('displayOrderConfirmation2') &&
                $this->registerHook('displayOrderDetail') &&
                $this->registerHook('displayPaymentReturn') &&
                $this->registerHook('displayPaymentTop') &&
                $this->registerHook('displayPersonalInformationTop') &&
                $this->registerHook('displayProductAdditionalInfo') &&
                $this->registerHook('displayProductExtraContent') &&
                $this->registerHook('displayRightColumn') &&
                $this->registerHook('displayRightColumnProduct') &&
                $this->registerHook('displayShoppingCartFooter') &&
                $this->registerHook('displayTop') &&
                $this->registerHook('displayWrapperBottom') &&
                $this->registerHook('displayWrapperTop') &&
                $this->registerHook('displayFooterCategory') &&
                $this->registerHook('displayHookCustomBlocks');
        }
    }

    public function uninstall()
    {
        Configuration::deleteByName('brl_id_product');
        Db::getInstance()->execute('DROP TABLE IF EXISTS '._DB_PREFIX_.'brlcustomblocks');
        Db::getInstance()->execute('DROP TABLE IF EXISTS '._DB_PREFIX_.'brlcustomblocks_lang');

        return parent::uninstall();
    }

    /**
     * Stock id_product in conf PS.
     */
    public function getIdConfPrestashop()
    {
        $id_product = Configuration::get('brl_id_product');
        
        if (empty($id_product)) {
            $url_get_id_product = 'http://demops17.autour-du-digital.fr/get_idproduct_moduleprestashop.php?nom_module='.$this->name;
            $id_product = Tools::file_get_contents($url_get_id_product);
            Configuration::updateValue($this->name.'_id_product', $id_product);
        }
        return $id_product;
    }

    public function getContent()
    {
        BrlCustomblocksForms::init($this);

        // lecture de ma variable qui comptient l'url pour mon js
        $this->addJsDefList();

        // if ($this->modeDebug) {
        //     //print_r($this);
        //     error_reporting(E_ALL);
        //     ini_set("display_errors", 1);
        // }
        
        // pour récupérer la valeur dans smarty, assigner la config à une variable que l'on appel dans le tpl
        $this->context->smarty->assign([
            'brl_id_product' => $this->id_product,
            'brl_module_version' => $this->version,
            'brl_php_version' => phpversion(),
            'brl_ps_version' => _PS_VERSION_
        ]);

        $this->context->controller->addJqueryUI('ui.sortable');
        // 1.7 ou 1.6
        if (version_compare(_PS_VERSION_, '1.7.0.0', '<')) {
            $this->context->controller->addJS($this->_path.'views/js/back1-6.js');
        } else {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
        }
        $this->context->controller->addCSS($this->_path.'/views/css/back.css');

        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitBrlcustomblocksModule')) == true) {
            $this->postProcess();
            $this->confirmMessages .= $this->displayConfirmation($this->l("Saved changes"));
        }

        if (((bool)Tools::isSubmit('addbrlcustomblocks')) == true) {
            $retour = '';

            $back_url = $this->context->link->getAdminLink('AdminModules', false)
                .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
                .'&token='.Tools::getAdminTokenLite('AdminModules');

            $form_structure = brlCustomblocksForms::getAddForm($this->l("Add a new custom block"));
            $retour .= $this->renderFormAddCustomblocks($form_structure, brlCustomblocksForms::getCustomblocksValues(), 'submitbrlcustomblocks', true, $back_url);

            return $retour;
        }

        if (((bool)Tools::isSubmit('updatebrlcustomblocks')) == true) {
            $retour = '';

            $back_url = $this->context->link->getAdminLink('AdminModules', false)
                .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
                .'&token='.Tools::getAdminTokenLite('AdminModules');

            $form_structure = brlCustomblocksForms::getAddForm($this->l("Update the custom block"));
            $retour .= $this->renderFormAddCustomblocks($form_structure, brlCustomblocksForms::getCustomblocksValues(), 'submitupdatebrlcustomblocks', true, $back_url);

            return $retour;
        }

        if (((bool)Tools::isSubmit('submitbrlcustomblocks')) == true) {
            $message = brlCustomblocksForms::postCustomblocks();
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }

        if (((bool)Tools::isSubmit('submitupdatebrlcustomblocks')) == true) {
            $message = brlCustomblocksForms::postCustomblocks(true);
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }

        if (((bool)Tools::isSubmit('deletebrlcustomblocks')) == true) {
            $message = brlCustomblocksForms::deleteCustomblocks();
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }


        // FOR PERSONNALIZE HOOKS
        if (((bool)Tools::isSubmit('addbrlcustomblockshook')) == true) {
            $retour = '';

            $back_url = $this->context->link->getAdminLink('AdminModules', false)
                .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
                .'&token='.Tools::getAdminTokenLite('AdminModules');

            $form_structure = brlCustomblocksForms::getAddFormHook($this->l("Add a new custom hook"));
            $retour .= $this->renderFormAddHookCustomblocks($form_structure, brlCustomblocksForms::getCustomblocksValuesHook(), 'submithookbrlcustomblocks', true, $back_url);

            return $retour;
        }

        if (((bool)Tools::isSubmit('updatehook')) == true) {
            $retour = '';

            $back_url = $this->context->link->getAdminLink('AdminModules', false)
                .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
                .'&token='.Tools::getAdminTokenLite('AdminModules');

            $form_structure = brlCustomblocksForms::getAddFormHook($this->l("Update the custom hook"));
            $retour .= $this->renderFormAddHookCustomblocks($form_structure, brlCustomblocksForms::getCustomblocksValuesHook(), 'submitupdatehookbrlcustomblocks', true, $back_url);

            return $retour;
        }

        if (((bool)Tools::isSubmit('submithookbrlcustomblocks')) == true) {
            $message = brlCustomblocksForms::postHooksCustomblocks();
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }

        if (((bool)Tools::isSubmit('submitupdatehookbrlcustomblocks')) == true) {
            $message = brlCustomblocksForms::postHooksCustomblocks(true);
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }

        if (((bool)Tools::isSubmit('deletehook')) == true) {
            $message = brlCustomblocksForms::deleteHookCustomblocks();
            if (strpos($message, 'Error') !== false) {
                $this->errorMessages .= $this->displayError($this->l($message));
            } else {
                $this->confirmMessages .= $this->displayConfirmation($this->l($message));
            }
        }

        $retour  = $this->confirmMessages . $this->errorMessages;

        $this->context->smarty->assign(
            'action',
            $this->context->link->getAdminLink(
                'AdminModules',
                false
            )
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.
            $this->name.'&token='.Tools::getAdminTokenLite('AdminModules')
        );

        // PARTIES HEADER & FOOTER
        $output = '';
        $output2 = '';

        $this->context->smarty->assign('module_dir', $this->_path);
        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/brlheader.tpl');
        $output2 = $this->context->smarty->fetch($this->local_path.'views/templates/admin/brlfooter.tpl');


        if ((int)Shop::getContextShopID() != 0) {
            return $retour . $output . $this->renderListCustomBlocks() . $this->renderListHooksCustomBlocks() . $output2;
        } else {
            return $retour . $output . $this->displayError($this->l("Please select a store to start configure the module.")) . $output2;
        }
    }

    /**
     * Create the list of your elements.
     */
    public function renderListCustomBlocks()
    {
        $values = BrlCustomblocksForms::getLstCustomblocks($this->context->language->id);
        
        $helper_list = new HelperList();

        $helper_list->title = $this->l('List of custom blocks');
        $helper_list->table = 'brlcustomblocks';
        $helper_list->table_id = 'brlcustomblocksDrag';
        $helper_list->no_link = true;
        $helper_list->shopLinkType = '';
        $helper_list->identifier = 'id_brlcustomblocks';
        $helper_list->actions = array('edit', 'delete');

        $helper_list->listTotal = count($values);
        $helper_list->tpl_vars = array('show_filters' => false);

        $helper_list->toolbar_btn['new'] = array(
            'href' => $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
            .'&id_brlcustomblocks=0&addbrlcustomblocks&token='.Tools::getAdminTokenLite('AdminModules'),
            'desc' => $this->l('Add')
        );
        $helper_list->token = Tools::getAdminTokenLite('AdminModules');
        $helper_list->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;

        $helper_list->show_toolbar = true;
        $helper_list->module = $this;
        $helper_list->simple_header = false;

        // This is needed for displayEnableLink to avoid code duplication
        $this->_helperlist = $helper_list;

        return $helper_list->generateList($values, brlCustomblocksForms::getFieldsList());
    }

    /**
     * Create the form Add.
     */
    protected function renderFormAddCustomblocks($form, $form_values, $action, $cancel = false, $back_url = false)
    {
        $id_brlcustomblocks = Tools::getValue('id_brlcustomblocks');

        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = $action;

        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
        .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;

        if (isset($id_brlcustomblocks) && !empty($id_brlcustomblocks)) {
            $helper->currentIndex .= '&id_brlcustomblocks='.(int)$id_brlcustomblocks;
        }

        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $form_values,
            'id_language' => $this->context->language->id,
            'languages' => $this->context->controller->getLanguages(),
            'back_url' => $back_url,
            'show_cancel_button' => $cancel,
        );
        
        return $helper->generateForm($form);
    }

    /**
     * Create the list of your elements.
     */
    public function renderListHooksCustomBlocks()
    {
        $values = BrlCustomblocksForms::getLstHooksCustomblocks();
        $helper_list = new HelperList();

        $helper_list->title = $this->l('List of custom hooks');
        $helper_list->table = 'hook';
        $helper_list->no_link = true;
        $helper_list->shopLinkType = '';
        $helper_list->identifier = 'id_hook';
        $helper_list->actions = array('edit', 'delete');

        $helper_list->listTotal = count($values);
        $helper_list->tpl_vars = array('show_filters' => false);

        $helper_list->toolbar_btn['new'] = array(
            'href' => $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name
            .'&id_hook=0&addbrlcustomblockshook&token='.Tools::getAdminTokenLite('AdminModules'),
            'desc' => $this->l('Add')
        );
        $helper_list->token = Tools::getAdminTokenLite('AdminModules');
        $helper_list->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;

        $helper_list->show_toolbar = true;
        $helper_list->module = $this;
        $helper_list->simple_header = false;

        // This is needed for displayEnableLink to avoid code duplication
        $this->_helperlist = $helper_list;

        return $helper_list->generateList($values, brlCustomblocksForms::getFieldsListHooks());
    }

    /**
     * Create the form Add.
     */
    protected function renderFormAddHookCustomblocks($form, $form_values, $action, $cancel = false, $back_url = false)
    {
        $id_hook = Tools::getValue('id_hook');

        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = $action;

        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
        .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;

        if (isset($id_hook) && !empty($id_hook)) {
            $helper->currentIndex .= '&id_hook='.(int)$id_hook;
        }

        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $form_values,
            'id_language' => $this->context->language->id,
            'languages' => $this->context->controller->getLanguages(),
            'back_url' => $back_url,
            'show_cancel_button' => $cancel,
        );
        
        return $helper->generateForm($form);
    }

    protected function addJsDefList()
    {
        // 1.7 ou 1.6
        if (version_compare(_PS_VERSION_, '1.7.0.0', '<')) {
            Media::addJsDef(array('brlcustomblocks' => array(
                'controller_ajax_url' => $this->context->link->getAdminLink('AdminAjaxBrlcustomblocks')
            )));
        } else {
            Media::addJsDef(array(
                'controller_ajax_url' => $this->context->link->getAdminLink('AdminAjaxBrlcustomblocks'),
                'successPosition' => $this->l('Position changed successfully!'),
                'errorPosition' => $this->l('An error occurred when switching position'),
            ));
        }
    }

    //hook Prestashop 1.7
    public function hookDisplayAfterProductThumbs()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayAfterProductThumbs');
    }

    public function hookDisplayContentWrapperBottom()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayContentWrapperBottom');
    }

    public function hookDisplayContentWrapperTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayContentWrapperTop');
    }

    public function hookDisplayCustomerLoginFormAfter()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayCustomerLoginFormAfter');
    }

    public function hookDisplayFooterAfter()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayFooterAfter');
    }

    public function hookDisplayFooterBefore()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayFooterBefore');
    }

    public function hookDisplayMaintenance()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayMaintenance');
    }

    public function hookDisplayNav1()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayNav1');
    }

    public function hookDisplayNav2()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayNav2');
    }

    public function hookDisplayNavFullWidth()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayNavFullWidth');
    }

    public function hookDisplayNotFound()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayNotFound');
    }

    public function hookDisplayOrderConfirmation1()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayOrderConfirmation1');
    }

    public function hookDisplayOrderConfirmation2()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayOrderConfirmation2');
    }

    public function hookDisplayPersonalInformationTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayPersonalInformationTop');
    }

    public function hookDisplayProductAdditionalInfo()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayProductAdditionalInfo');
    }

    public function hookDisplayProductExtraContent()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayProductExtraContent');
    }

    public function hookDisplayWrapperBottom()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayWrapperBottom');
    }

    public function hookDisplayWrapperTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayWrapperTop');
    }

    public function hookDisplayFooterCategory()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayFooterCategory');
    }

    //hook Prestashop 1.6
    public function hookDisplayShoppingCart()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayShoppingCart');
    }
    public function hookDisplayProductTabContent()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayProductTabContent');
    }
    public function hookDisplayProductTab()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayProductTab');
    }
    public function hookDisplayMyAccountBlockfooter()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayMyAccountBlockfooter');
    }

    //hook Prestashop 1.7/1.6
    public function hookDisplayCustomerAccount()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayCustomerAccount');
    }

    public function hookDisplayCustomerAccountForm()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayCustomerAccountForm');
    }

    public function hookDisplayCustomerAccountFormTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayCustomerAccountFormTop');
    }
    public function hookDisplayFooter()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayFooter');
    }
    public function hookDisplayFooterProduct()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayFooterProduct');
    }

    public function hookDisplayHeader()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayHeader');
    }

    public function hookDisplayHome()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayHome');
    }

    public function hookDisplayLeftColumn()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayLeftColumn');
    }

    public function hookDisplayLeftColumnProduct()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayLeftColumnProduct');
    }
    public function hookDisplayMyAccountBlock()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayMyAccountBlock');
    }
    public function hookDisplayOrderConfirmation()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayOrderConfirmation');
    }
    public function hookDisplayOrderDetail()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayOrderDetail');
    }

    public function hookDisplayPaymentReturn()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayPaymentReturn');
    }

    public function hookDisplayPaymentTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayPaymentTop');
    }
    public function hookDisplayRightColumn()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayRightColumn');
    }

    public function hookDisplayRightColumnProduct()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayRightColumnProduct');
    }

    public function hookDisplayShoppingCartFooter()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayShoppingCartFooter');
    }

    public function hookDisplayTop()
    {
        // si la fonction a trouvé des correspondances, affiches-les.
        return brlCustomblocksForms::displayTplCustomblocks('displayTop');
    }

    public function hookDisplayHookCustomBlocks($params)
    {
        $idHookCustomblocks = $params['idHookCustomblocks'];
        $idCustomer = Context::getContext()->customer->id;
        $lstGroupCustomer = Customer::getGroupsStatic($idCustomer);
        $resultsContentText = brlCustomblocksForms::getContentText($idHookCustomblocks);
        $dateduJour = date("Y-m-d");
        $key = "";

        if (!empty($resultsContentText)) {
            // pour chaque block qui a le hook donné en param
            foreach ($resultsContentText as $contentText) {
                // SI l'id du groupe est le même que le client, ou s'il est égal à 0, ET si la date est OK ou vide, AFFICHE le template du hook
                if (((($key = array_search($contentText['id_group'], $lstGroupCustomer)) !== false)  || $contentText['id_group'] == 0) && (($dateduJour >= $contentText['date_start'] && $dateduJour <= $contentText['date_end']) || ((empty($contentText['date_start']) && $dateduJour <= $contentText['date_end'])) || ($dateduJour >= $contentText['date_start'] && (empty($contentText['date_end']))) || (empty($contentText['date_start']) && empty($contentText['date_end'])))) {
                    echo html_entity_decode($contentText['content_text']);
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
}
