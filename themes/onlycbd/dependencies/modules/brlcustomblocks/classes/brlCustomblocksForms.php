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

class BrlCustomblocksForms
{
    protected static $module = false;

    public static function init($module)
    {
        if (self::$module == false) {
            self::$module = $module;
        }

        return self::$module;
    }

    public static function getFieldsList()
    {
        $fields_list = array(
            'hookName' => array(
                'title' => self::$module->l('Hook'),
                'id' => 'id_hook',
                'prefix' => '<i class="icon-arrows"></i>',
            ),
            'label' => array(
                'title' => self::$module->l('Label'),
            ),
            'nameGroup' => array(
                'title' => self::$module->l('Target group'),
                'id' => 'id_group',
            ),
            'date_start' => array(
                'title' => self::$module->l('Start date'),
            ),
            'date_end' => array(
                'title' => self::$module->l('End date'),
            ),
            'content_text' => array(
                'title' => self::$module->l('Text content'),
                'class' => 'brlcustomblocksMessageWidth'
            ),
            'is_active' => array(
                'title' => self::$module->l('Statut'),
                'class' => 'text-center brlTextIsActive',
            ),
            'position' => array(
                'title' => self::$module->l('Position'),
            ),
            'id_brlcustomblocks' => array(
                'title' => self::$module->l('Id'),
                'class' => 'brlIdCustomBlocks',
            )
        );

        return $fields_list;
    }

    // récupère la liste pour l'affichage
    public static function getLstCustomblocks($idLang)
    {
        $idShop = (int)Shop::getContextShopID();
        
        $sql = 'SELECT BRLC.*, DATE_FORMAT(BRLC.date_start, "%Y/%m/%d") as date_start, DATE_FORMAT(BRLC.date_end, "%Y/%m/%d") as date_end, BRLCL.*, BRLH.name as hookName, BRLH.title, BRLH.id_hook, BRLGL.name as nameGroup
        FROM ' . _DB_PREFIX_ . 'brlcustomblocks BRLC
        INNER join ' . _DB_PREFIX_ . 'brlcustomblocks_lang BRLCL ON BRLCL.id_brlcustomblocks = BRLC.id_brlcustomblocks
        LEFT JOIN ' . _DB_PREFIX_ . 'group_lang BRLGL ON BRLGL.id_group = BRLC.id_group
        LEFT JOIN ' . _DB_PREFIX_ . 'hook BRLH ON BRLH.id_hook = BRLC.id_hook
        WHERE BRLCL.id_lang = '.(int)$idLang ;
        // vérifier s'il s'agit d'une multiboutique
        if (Configuration::get('PS_MULTISHOP_FEATURE_ACTIVE')) {
            if (!empty($idShop)) {
                $sql .= " AND BRLC.id_shop = ".(int)$idShop."";
            }
        }
        $sql .= " GROUP BY BRLGL.name, BRLC.id_brlcustomblocks 
        ORDER BY hookName, position";
        
        $lstCustomblocks = Db::getInstance()->executeS($sql);
        $i = 0;
        // pour chaque résultat, mettre le bon format du contenu du texte, donc en mode balise html
        foreach ($lstCustomblocks as $customblock) {
            $lstCustomblocks[$i]['content_text'] = html_entity_decode($customblock['content_text']);
            if ($lstCustomblocks[$i]['is_active'] == 1) {
                $lstCustomblocks[$i]['is_active'] = self::$module->l('Active');
            } else {
                $lstCustomblocks[$i]['is_active'] = self::$module->l('Inactive');
            }
            $i++;
        }
        
        return $lstCustomblocks;
    }

    public static function getAddForm($title = 'Add')
    {
        $form = array(
            array(
                'form' => array(
                    'legend' => array(
                    'title' => self::$module->l($title),
                    'icon' => 'icon-cogs',
                    ),
                    'submit' => array(
                        'title' => self::$module->l('Save'),
                        'type' => 'submit'
                    ),
                ),
            ),
        );

        $form[0]['form']['input'][] = array(
            'type' => 'text',
            'name' => 'label',
            'label' => self::$module->l('Label : '),
            'desc' => self::$module->l('Choose a label for this block.'),
        );
        $form[0]['form']['input'][] = array(
            'label' => self::$module->l('Is active ?'),
            'name' => 'is_active',
            'type' => 'switch',
            'desc' => self::$module->l('"Yes", if you want to display the block on your store.'),
            'is_bool' => true,
            'values' => array(
                array('label' => self::$module->l("Yes"),
                    'value' => 1,
                    'id' => 'is_active_1'),
                array('label' => self::$module->l("No"),
                    'value' => 0,
                    'id' => 'is_active_0')
            )
        );
        $form[0]['form']['input'][] = array(
            'type' => 'select',
            'name' => 'id_group',
            'label' => self::$module->l('The target group : '),
            'desc' => self::$module->l('Select the target group who you want to display the block.'),
            'lang' => false,
            'options' => array(
                'query' => self::getLstClientGroup(),
                'id' => 'id_group',
                'name' => 'nameGroup',
            )
        );
        $form[0]['form']['input'][] = array(
            'label' => self::$module->l('Start date : '),
            'name' => 'date_start',
            'type' => 'date',
            'desc' => self::$module->l('Choose the date from which the block will be displayed. Keep blank if you don\'t want a date.'),
        );
        $form[0]['form']['input'][] = array(
            'label' => self::$module->l('End date : '),
            'name' => 'date_end',
            'type' => 'date',
            'desc' => self::$module->l('Choose the date of the end of posting. Keep blank if you don\'t want a date.'),
        );
        $form[0]['form']['input'][] = array(
            'type' => 'select',
            'name' => 'id_hook',
            'label' => self::$module->l('Display position : '),
            'desc' => self::$module->l('Select the hook where you want to display the block.'),
            'lang' => false,
            'options' => array(
                'query' => self::getLstHook(),
                'id' => 'id_hook',
                'name' => 'nameHook',
            )
        );
        $form[0]['form']['input'][] = array(
            'type' => 'textarea',
            'name' => 'content_text',
            'label' => self::$module->l('Content of your block : '),
            'lang' => true,
            'autoload_rte' => true,
            'cols' => 40,
            'rows' => 10,
            // 'hint' => $this->l('Invalid characters : ').' <>;=#{}',
        );

        return $form;
    }

    // Récupère la liste des groupes clients
    private static function getLstClientGroup()
    {
        $id_lang = Context::getContext()->language->id;
        $idShop = (int)Shop::getContextShopID();
        $lst_group = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
        SELECT brlgl.id_group, brlgl.name as nameGroup
        FROM ' . _DB_PREFIX_ . 'group_lang brlgl
        LEFT JOIN ' . _DB_PREFIX_ . 'group_shop brlgs ON brlgs.id_group = brlgl.id_group
        WHERE brlgl.id_lang = ' . (int)$id_lang . ' AND brlgs.id_shop = ' . (int)$idShop);
        $array1 = array('id_group'=>0, 'nameGroup'=>self::$module->l('All'));
        array_unshift($lst_group, $array1);
        return $lst_group;
    }

    // Récupère la liste des hooks
    private static function getLstHook()
    {
        $i = 0;
        $key = "";
        $idShop = (int)Shop::getContextShopID();
        if (version_compare(_PS_VERSION_, '1.7', '>')) {
            $arrayHooksPS = array('displayAfterProductThumbs', 'displayContentWrapperBottom', 'displayContentWrapperTop', 'displayCustomerAccount', 'displayCustomerAccountForm', 'displayCustomerAccountFormTop', 'displayCustomerLoginFormAfter', 'displayFooter', 'displayFooterAfter', 'displayFooterBefore', 'displayFooterProduct', 'displayHeader', 'displayHome', 'displayLeftColumn', 'displayLeftColumnProduct', 'displayMaintenance', 'displayMyAccountBlock', 'displayNav1', 'displayNav2', 'displayNavFullWidth', 'displayNotFound', 'displayOrderConfirmation', 'displayOrderConfirmation1', 'displayOrderConfirmation2', 'displayOrderDetail', 'displayPaymentReturn', 'displayPaymentTop', 'displayPersonalInformationTop', 'displayProductAdditionalInfo', 'displayProductExtraContent', 'displayRightColumn', 'displayRightColumnProduct', 'displayShoppingCartFooter', 'displayTop', 'displayWrapperBottom', 'displayWrapperTop', 'displayFooterCategory', 'Header');
        } else {
            $arrayHooksPS = array( 'displayCustomerAccount', 'displayCustomerAccountForm', 'displayCustomerAccountFormTop', 'displayFooter', 'displayFooterProduct', 'displayHeader', 'displayHome', 'displayLeftColumn', 'displayLeftColumnProduct', 'displayMyAccountBlock', 'displayOrderConfirmation', 'displayOrderDetail', 'displayPaymentReturn', 'displayPaymentTop', 'displayRightColumn', 'displayRightColumnProduct', 'displayShoppingCartFooter', 'displayTop', 'displayShoppingCart', 'displayProductTabContent', 'displayProductTab', 'displayMyAccountBlockfooter', 'Header');
        }

        $lst_hook = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
        SELECT brlh.id_hook, brlh.name as nameHook, brlh.description
        FROM ' . _DB_PREFIX_ . 'hook brlh
        INNER JOIN ' . _DB_PREFIX_ . 'hook_module brlhm ON brlh.id_hook = brlhm.id_hook
        INNER JOIN ' . _DB_PREFIX_ . 'module brlm ON brlm.id_module = brlhm.id_module
        WHERE brlm.name = \'brlcustomblocks\' AND brlh.name != \'displayHookCustomBlocks\' AND brlhm.id_shop = '. (int)$idShop);
        
        foreach ($lst_hook as $hook) {
            $key = array_search($hook['nameHook'], $arrayHooksPS);
            if ($key !== false) {
                if ($hook['description'] != null) {
                    $lst_hook[$i]['nameHook'] = $hook['nameHook'] . ' (' . $hook['description'] . ')';
                }
            } else {
                $lst_hook[$i]['nameHook'] = self::$module->l('Your hook : ') . $hook['nameHook'];
            }
            $i++;
        }
        return $lst_hook;
    }

    // récupère la position la plus élevée pour l'insertion
    public static function getLastPositionCustomblocks()
    {
        $idShop = (int)Shop::getContextShopID();
        $query = 'SELECT MAX(brlc.position) as maxPos
                FROM ' . _DB_PREFIX_ . 'brlcustomblocks brlc
                WHERE brlc.id_shop = '.(int)$idShop.';';
        return Db::getInstance()->executeS($query);
    }

    // Enregistre les données en BDD
    public static function postCustomblocks($isUpdate = false)
    {
        // Récupérer la langue par défaut
        // $idLangDefault = Configuration::get('PS_LANG_DEFAULT');
        $idShop = (int)Shop::getContextShopID();

        $idBrlcustomblocks = 0;

        // Si c'est un update, on récupère l'id de la table brlged
        if ($isUpdate) {
            $idBrlcustomblocks = Tools::getValue('id_brlcustomblocks');
        }

        $enregistrementOk = true;

        // appel de la fonction pour récupérer la position la plus élevée
        $resultPos = self::getLastPositionCustomblocks();
        $maxPos = $resultPos[0]['maxPos']+1;

        // si c'est un ajout d'un nouveau document
        if (!$isUpdate) {
            $query = 'INSERT INTO '._DB_PREFIX_.'brlcustomblocks (`id_shop`, `id_hook`, `id_group`, `is_active`, `label`, `date_start`, `date_end`, `position`) VALUES (\''.(int)$idShop.'\', \''.(int)Tools::getValue('id_hook'). '\', \''.(int)Tools::getValue('id_group'). '\', \''.(int)Tools::getValue('is_active'). '\', \''.pSQL(Tools::getValue('label')). '\', ' . ((!empty(Tools::getValue('date_start')))? '\''.Tools::getValue('date_start').'\'' : 'NULL') . ', ' . ((!empty(Tools::getValue('date_end')))? '\''.Tools::getValue('date_end').'\'' : 'NULL') . ', \''.(int)$maxPos.'\')';
            if (Db::getInstance()->execute($query) == false) {
                return 'Error : Parameters not saved';
            } else {
                $idBrlcustomblocks = Db::getInstance()->Insert_ID();
            }
        } else {
            $query = 'UPDATE '._DB_PREFIX_.'brlcustomblocks SET `id_shop`=\''.(int)$idShop.'\',`id_hook`=\''.(int)Tools::getValue('id_hook'). '\',`id_group`=\''.(int)Tools::getValue('id_group'). '\',`is_active`=\''.(int)Tools::getValue('is_active'). '\',`label`=\''.pSQL(Tools::getValue('label')). '\',`date_start`=' . ((!empty(Tools::getValue('date_start')))? '\''.Tools::getValue('date_start').'\'' : 'NULL') . ',`date_end`=' . ((!empty(Tools::getValue('date_end')))? '\''.Tools::getValue('date_end').'\'' : 'NULL') . ' WHERE `id_brlcustomblocks`=\''.(int)$idBrlcustomblocks.'\'';
            if (Db::getInstance()->execute($query) == false) {
                return 'Error : Parameters not saved';
            }
        }
        // Récupération des différents languages pour le multilangue
        $languages = Language::getLanguages(false);
        // On boucle sur les langues
        foreach ($languages as $lang) {
            if (!$isUpdate) { // si c'est un ajout d'un nouveau doc, faut faire un insert sur la table brlcustomblocks_lang du label et de la lang
                $contentText = htmlentities(Tools::getValue('content_text_'.$lang['id_lang']));
                // si les autres langues ne sont pas renseignées
                // if (empty($contentText) && $lang['id_lang'] != $idLangDefault) {
                //     $contentText = htmlentities(Tools::getValue('content_text_'.$idLangDefault));
                //     var_dump($contentText);
                // }

                $query = 'INSERT INTO '._DB_PREFIX_.'brlcustomblocks_lang (`id_brlcustomblocks`, `id_lang`, `content_text`) VALUES (\''.(int)$idBrlcustomblocks.'\', \'' . (int)$lang['id_lang'] . '\', "'.pSQL($contentText). '");';
                if (Db::getInstance()->execute($query) == false) {
                    return 'Error : Parameters not saved';
                }
            } else { // si c'est un update d'un document, faut faire un update sur la table brlcustomblocks_lang du label et de la lang
                $query = 'UPDATE '._DB_PREFIX_.'brlcustomblocks_lang SET `id_lang` = \'' . (int)$lang['id_lang'] . '\', `content_text` = "'.htmlentities(Tools::getValue('content_text_'.$lang['id_lang'])). '" WHERE `id_brlcustomblocks` = \''.(int)$idBrlcustomblocks.'\' AND id_lang = ' .(int)$lang['id_lang'].'';
                if (Db::getInstance()->execute($query) == false) {
                    return 'Error : Parameters not saved';
                }
            }
        }

        if ($enregistrementOk) {
            return 'Parameters saved';
        }
        return 'Error : Parameters not saved';
    }
    
    // récupère les valeurs lorsqu'on clique sur "modifier" dans la liste
    public static function getCustomblocksValues()
    {
        $idBrlcustomblocks = Tools::getValue('id_brlcustomblocks');

        $dbquery = new DbQuery();
        $dbquery->select('BRLC.*, BRLCL.*');
        $dbquery->from('brlcustomblocks', 'BRLC');
        $dbquery->leftJoin('brlcustomblocks_lang', 'BRLCL', 'BRLCL.id_brlcustomblocks = BRLC.id_brlcustomblocks');
        $dbquery->where('BRLC.id_brlcustomblocks = ' . (int) $idBrlcustomblocks);
        $customblocksValueLangs = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($dbquery->build());
        
        $results = array();
        foreach ($customblocksValueLangs as $valueLang) {
            $results[(int)$valueLang['id_lang']] = $valueLang;
            $results[(int)$valueLang['id_lang']]['content_text'] = html_entity_decode($valueLang['content_text']);
        }

        $fields_value = array();
        $languages = Language::getLanguages(false);
        foreach ($languages as $language) {
            if (Tools::getValue('content_text_'.$language['id_lang'])) {
                $fields_value['content_text'][$language['id_lang']] = html_entity_decode(Tools::getValue('content_text_'.$language['id_lang']));
            } elseif (isset($results) && isset($results[$language['id_lang']]['content_text'])) {
                $fields_value['content_text'][$language['id_lang']] = $results[$language['id_lang']]['content_text'];
            } else {
                $fields_value['content_text'][$language['id_lang']] = '';
            }
        }


        if (!empty($customblocksValueLangs)) {
            $fields_value['id_hook'] = $customblocksValueLangs[0]['id_hook'];
            $fields_value['id_group'] = $customblocksValueLangs[0]['id_group'];
            $fields_value['is_active'] = $customblocksValueLangs[0]['is_active'];
            $fields_value['label'] = $customblocksValueLangs[0]['label'];
            $fields_value['date_start'] = $customblocksValueLangs[0]['date_start'];
            $fields_value['date_end'] = $customblocksValueLangs[0]['date_end'];
        } else {
            $fields_value['id_hook'] = '';
            $fields_value['id_group'] = '';
            $fields_value['is_active'] = '';
            $fields_value['label'] = '';
            $fields_value['date_start'] = '';
            $fields_value['date_end'] = '';
        }

        return $fields_value;
    }

    public static function deleteCustomblocks()
    {
        $idBrlcustomblocks = Tools::getValue('id_brlcustomblocks');

        if (isset($idBrlcustomblocks) && ! empty($idBrlcustomblocks)) {
            $query="DELETE FROM "._DB_PREFIX_."brlcustomblocks WHERE id_brlcustomblocks = " .(int) $idBrlcustomblocks;
            if (Db::getInstance()->execute($query) == false) {
                return 'Error: deletion';
            }
            
            $query="DELETE FROM "._DB_PREFIX_."brlcustomblocks_lang WHERE id_brlcustomblocks = " .(int) $idBrlcustomblocks;
            if (Db::getInstance()->execute($query) == false) {
                return 'Error: deletion';
            }
            
            return 'Deleted item';
        }
    }

    public static function getFieldsListHooks()
    {
        $fields_list = array(
            'nameHook' => array(
                'title' => self::$module->l('Label'),
                'search' => false,
            ),
            'hookTag' => array(
                'title' => self::$module->l('Hook Tag (copy/paste the tag into the template)'),
                'search' => false,
                'id' => 'id_hook',
            )
        );

        return $fields_list;
    }

    // Récupère la liste des hooks personnalisés
    public static function getLstHooksCustomblocks()
    {
        $idShop = (int)Shop::getContextShopID();
        if (version_compare(_PS_VERSION_, '1.7', '>')) {
            $lst_hook_custom = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
            SELECT brlh.id_hook, brlh.name as nameHook, brlh.description as hookTag
            FROM ' . _DB_PREFIX_ . 'hook brlh
            INNER JOIN ' . _DB_PREFIX_ . 'hook_module brlhm ON brlh.id_hook = brlhm.id_hook
            INNER JOIN ' . _DB_PREFIX_ . 'module brlm ON brlm.id_module = brlhm.id_module
            WHERE brlm.name = \'brlcustomblocks\' AND brlh.name != \'displayAfterProductThumbs\' AND  brlh.name != \'displayContentWrapperBottom\' AND  brlh.name != \'displayContentWrapperTop\' AND  brlh.name != \'displayCustomerAccount\' AND  brlh.name != \'displayCustomerAccountForm\' AND  brlh.name != \'displayCustomerAccountFormTop\' AND  brlh.name != \'displayCustomerLoginFormAfter\' AND  brlh.name != \'displayFooter\' AND  brlh.name != \'displayFooterAfter\' AND  brlh.name != \'displayFooterBefore\' AND  brlh.name != \'displayFooterProduct\' AND  brlh.name != \'displayHeader\' AND  brlh.name != \'displayHome\' AND  brlh.name != \'displayLeftColumn\' AND  brlh.name != \'displayLeftColumnProduct\' AND  brlh.name != \'displayMaintenance\' AND  brlh.name != \'displayMyAccountBlock\' AND  brlh.name != \'displayNav1\' AND  brlh.name != \'displayNav2\' AND  brlh.name != \'displayNavFullWidth\' AND  brlh.name != \'displayNotFound\' AND  brlh.name != \'displayOrderConfirmation\' AND  brlh.name != \'displayOrderConfirmation1\' AND  brlh.name != \'displayOrderConfirmation2\' AND  brlh.name != \'displayOrderDetail\' AND  brlh.name != \'displayPaymentReturn\' AND  brlh.name != \'displayPaymentTop\' AND  brlh.name != \'displayPersonalInformationTop\' AND  brlh.name != \'displayProductAdditionalInfo\' AND  brlh.name != \'displayProductExtraContent\' AND  brlh.name != \'displayProductPageDrawer\' AND  brlh.name != \'displayRightColumn\' AND  brlh.name != \'displayRightColumnProduct\' AND  brlh.name != \'displayShoppingCartFooter\' AND  brlh.name != \'displayTop\' AND  brlh.name != \'displayWrapperBottom\' AND  brlh.name != \'displayWrapperTop\' AND  brlh.name != \'displayFooterCategory\' AND  brlh.name != \'Header\' AND  brlh.name != \'displayHookCustomBlocks\' AND brlhm.id_shop = '.(int)$idShop.'
            ORDER BY brlh.name');
        } else {
            $lst_hook_custom = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
            SELECT brlh.id_hook, brlh.name as nameHook, brlh.description as hookTag
            FROM ' . _DB_PREFIX_ . 'hook brlh
            INNER JOIN ' . _DB_PREFIX_ . 'hook_module brlhm ON brlh.id_hook = brlhm.id_hook
            INNER JOIN ' . _DB_PREFIX_ . 'module brlm ON brlm.id_module = brlhm.id_module
            WHERE brlm.name = \'brlcustomblocks\' AND brlh.name != \'Header\' AND  brlh.name != \'displayCustomerAccount\' AND  brlh.name != \'displayCustomerAccountForm\' AND  brlh.name != \'displayCustomerAccountFormTop\' AND  brlh.name != \'displayFooter\' AND  brlh.name != \'displayFooterProduct\' AND  brlh.name != \'displayHeader\' AND  brlh.name != \'displayHome\' AND  brlh.name != \'displayLeftColumn\' AND  brlh.name != \'displayLeftColumnProduct\' AND  brlh.name != \'displayMyAccountBlock\' AND  brlh.name != \'displayOrderConfirmation\' AND  brlh.name != \'displayOrderDetail\' AND  brlh.name != \'displayPaymentReturn\' AND  brlh.name != \'displayPaymentTop\' AND  brlh.name != \'displayRightColumn\' AND  brlh.name != \'displayRightColumnProduct\' AND  brlh.name != \'displayShoppingCartFooter\' AND  brlh.name != \'displayTop\' AND  brlh.name != \'displayShoppingCart\' AND  brlh.name != \'displayProductTabContent\' AND  brlh.name != \'displayProductTab\' AND  brlh.name != \'displayMyAccountBlockfooter\' AND  brlh.name != \'displayHookCustomBlocks\' AND brlhm.id_shop = '.(int)$idShop.'
            ORDER BY brlh.name');
        }

        return $lst_hook_custom;
    }

    public static function getAddFormHook($title = 'Add')
    {
        $form = array(
            array(
                'form' => array(
                    'legend' => array(
                    'title' => self::$module->l($title),
                    'icon' => 'icon-cogs',
                    ),
                    'submit' => array(
                        'title' => self::$module->l('Save'),
                        'type' => 'submit'
                    ),
                ),
            ),
        );

        $form[0]['form']['input'][] = array(
            'type' => 'text',
            'name' => 'label',
            'label' => self::$module->l('Label of your hook : '),
            'desc' => self::$module->l('Give a name for your custom hook.'),
        );

        return $form;
    }

    public static function getIdModule()
    {
        $query = 'SELECT brlm.id_module
                    FROM '._DB_PREFIX_.'module brlm
                    WHERE brlm.name = \'brlcustomblocks\'';
        return Db::getInstance()->executeS($query);
    }

    // Enregistre les données en des hooks personnalisés dans la table ps_hook et ps_hook_module
    public static function postHooksCustomblocks($isUpdate = false)
    {
        $idShop = (int)Shop::getContextShopID();
        $resultat = self::getIdModule();
        $idModule = $resultat[0]['id_module'];
        $idHook = 0;

        // Si c'est un update, on récupère l'id de la table hook
        if ($isUpdate) {
            $idHook = Tools::getValue('id_hook');
        }

        $enregistrementOk = true;

        // si c'est un ajout d'un nouveau label pour un hook
        if (!$isUpdate) {
            $query = 'INSERT INTO '._DB_PREFIX_.'hook (`name`, `title`, `description`, `position`) VALUES (\''.pSQL(Tools::getValue('label')). '\', \''.pSQL(Tools::getValue('label')). '\', \'custom hook\', \'1\')';
            if (Db::getInstance()->execute($query) == false) {
                return 'Error : Parameters not saved';
            } else {
                $idHook = Db::getInstance()->Insert_ID();
            }
            $query2 = 'UPDATE '._DB_PREFIX_.'hook SET `description`="<div class=\'displayHookCustomBlocks_'.(int)$idHook.'\'>{hook h=\'displayHookCustomBlocks\' idHookCustomblocks = \''.(int)$idHook.'\'}</div>" WHERE `id_hook`=\''.(int)$idHook.'\'';
            if (Db::getInstance()->execute($query2) == false) {
                return 'Error : Parameters not saved';
            }
            $query3 = 'INSERT INTO '._DB_PREFIX_.'hook_module (`id_module`, `id_shop`, `id_hook`, `position`) VALUES (\''.(int)$idModule.'\', \''.(int)$idShop.'\', \''.(int)$idHook.'\', \'1\')';
            if (Db::getInstance()->execute($query3) == false) {
                return 'Error : Parameters not saved';
            }
        } else {
            $query = 'UPDATE '._DB_PREFIX_.'hook SET `name`=\''.pSQL(Tools::getValue('label')). '\',`title`=\''.pSQL(Tools::getValue('label')). '\',`description`="<div class=\'displayHookCustomBlocks_'.(int)$idHook.'\'>{hook h=\'displayHookCustomBlocks\' idHookCustomblocks = \''.(int)$idHook.'\'}</div>" WHERE `id_hook`=\''.(int)$idHook.'\'';
            if (Db::getInstance()->execute($query) == false) {
                return 'Error : Parameters not saved';
            }
        }

        if ($enregistrementOk) {
            return 'Parameters saved';
        }
        return 'Error : Parameters not saved';
    }
    
    // récupère les valeurs lorsqu'on clique sur "modifier" dans la liste des hooks personnalisés
    public static function getCustomblocksValuesHook()
    {
        $idHook = Tools::getValue('id_hook');

        $dbquery = new DbQuery();
        $dbquery->select('BRLH.name');
        $dbquery->from('hook', 'BRLH');
        $dbquery->where('BRLH.id_hook = ' . (int) $idHook);
        $customblocksValueHooks = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($dbquery->build());
        
        $fields_value = array();
        if (!empty($customblocksValueHooks)) {
            $fields_value['label'] = $customblocksValueHooks[0]['name'];
        } else {
            $fields_value['label'] = '';
        }

        return $fields_value;
    }

    public static function deleteHookCustomblocks()
    {
        $idHook = Tools::getValue('id_hook');
        $idShop = (int)Shop::getContextShopID();
        $query_select = 'SELECT brlc.id_brlcustomblocks
                    FROM '._DB_PREFIX_.'hook brlh
                    INNER JOIN '._DB_PREFIX_.'brlcustomblocks brlc ON brlc.id_hook = brlh.id_hook
                    WHERE brlc.id_hook = '.(int)$idHook.' AND brlc.id_shop = '.(int)$idShop;
        $results = Db::getInstance()->executeS($query_select);
        
        if (isset($idHook) && ! empty($idHook)) {
            $query="DELETE FROM "._DB_PREFIX_."hook WHERE id_hook = " .(int) $idHook;
            if (Db::getInstance()->execute($query) == false) {
                return 'Error: deletion';
            }
            
            $query1="DELETE FROM "._DB_PREFIX_."hook_module WHERE id_hook = " .(int) $idHook;
            if (Db::getInstance()->execute($query1) == false) {
                return 'Error: deletion';
            }
            foreach ($results as $result) {
                $query2="DELETE FROM "._DB_PREFIX_."brlcustomblocks WHERE id_brlcustomblocks = " .(int)$result['id_brlcustomblocks'] ." AND id_hook = " .(int) $idHook;
                if (Db::getInstance()->execute($query2) == false) {
                    return 'Error: deletion';
                }
                
                $query3="DELETE FROM "._DB_PREFIX_."brlcustomblocks_lang WHERE id_brlcustomblocks = " .(int)$result['id_brlcustomblocks'];
                if (Db::getInstance()->execute($query3) == false) {
                    return 'Error: deletion';
                }
            }
            
            return 'Deleted item';
        }
    }

    public static function getContentText($idHookCustomblocks)
    {
        $idLang = Context::getContext()->language->id;
        $idShop = (int)Shop::getContextShopID();
        $query = 'SELECT brlcl.content_text, brlc.id_group, brlc.date_start, brlc.date_end
                    FROM '._DB_PREFIX_.'brlcustomblocks brlc
                    LEFT JOIN ' . _DB_PREFIX_ . 'brlcustomblocks_lang brlcl ON brlc.id_brlcustomblocks = brlcl.id_brlcustomblocks
                    WHERE brlc.id_hook = '.(int)$idHookCustomblocks.' AND brlcl.id_lang = '.(int)$idLang.' AND brlc.is_active = 1 AND brlc.id_shop = '.(int)$idShop.'
                    ORDER BY brlc.position';
        return Db::getInstance()->executeS($query);
    }

    // récupère la liste des hooks qui ont ce nom en param
    public static function getBlockHookName($nameHook)
    {
        $id_lang = Context::getContext()->language->id;
        $idShop = (int)Shop::getContextShopID();
        return Db::getInstance()->ExecuteS('SELECT brlcl.content_text, brlc.id_group, brlc.date_start, brlc.date_end, brlc.id_hook
                    FROM ' . _DB_PREFIX_ . 'brlcustomblocks_lang brlcl
                    LEFT JOIN ' . _DB_PREFIX_ . 'brlcustomblocks brlc ON brlc.id_brlcustomblocks = brlcl.id_brlcustomblocks
                    LEFT JOIN ' . _DB_PREFIX_ . 'hook brlh ON brlc.id_hook = brlh.id_hook
                    WHERE brlcl.id_lang = '.(int) $id_lang.' AND brlc.is_active = 1 AND brlh.name = \''.pSQL($nameHook).'\' AND brlc.id_shop = '.(int)$idShop.'
                    ORDER BY brlc.position;');
    }

    // fonction pour afficher le template hook si toutes les conditions sont réunies
    public static function displayTplCustomblocks($nameHook)
    {
        $idCustomer = Context::getContext()->customer->id;
        $lstGroupCustomer = Customer::getGroupsStatic($idCustomer);
        $lstBlocks = self::getBlockHookName($nameHook);
        $dateduJour = date("Y-m-d");
        $key = "";
        $contentText = "";
        if (!empty($lstBlocks)) {
            // pour chaque block qui a le hook donné en param
            foreach ($lstBlocks as $block) {
                // SI l'id du groupe est le même que le client, ou s'il est égal à 0, ET si la date est OK ou vide, AFFICHE le template du hook
                if (((($key = array_search($block['id_group'], $lstGroupCustomer)) !== false)  || $block['id_group'] == 0) && (($dateduJour >= $block['date_start'] && $dateduJour <= $block['date_end']) || ((empty($block['date_start']) && $dateduJour <= $block['date_end'])) || ($dateduJour >= $block['date_start'] && (empty($block['date_end']))) || (empty($block['date_start']) && empty($block['date_end'])))) {
                    // echo html_entity_decode($block['content_text']);
                    $contentText .= html_entity_decode($block['content_text']);
                }
            }
            Context::getContext()->smarty->assign('content_text', $contentText);
            return Context::getContext()->smarty->fetch(_PS_ROOT_DIR_.'/modules/brlcustomblocks/views/templates/front/displayCustomBlocks.tpl');
        } else {
            return false;
        }
    }
}
