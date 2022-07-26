{*
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
*}

<div class="panel panelFooterBrl">
    <div class="row">
        {if (!empty($brl_id_product|escape:'htmlall':'UTF-8'))}
        <div class="col-md-4">
        {else}
        <div class="col-md-6">
        {/if}
            {if (version_compare(_PS_VERSION_, '1.7.0.0', '<'))}
            <h3 class="brlFooterIconAlign brlFooterH3"><strong>Informations</strong></h3>
            {else}
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons brlFooterIcon">info_outline</i><strong>Informations</strong></h3>
            {/if}
            <p>
                {l s='Module version' mod='brlcustomblocks'} : <strong>{$brl_module_version|escape:'htmlall':'UTF-8'}</strong><br>
                {l s='Prestashop version' mod='brlcustomblocks'} : <strong>{$brl_ps_version|escape:'htmlall':'UTF-8'}</strong><br>
                {l s='PHP version' mod='brlcustomblocks'} : <strong>{$brl_php_version|escape:'htmlall':'UTF-8'}</strong>
            </p><br><br>
        </div>
        {if (!empty($brl_id_product|escape:'htmlall':'UTF-8'))}
        <div class="col-md-4">
            {if (version_compare(_PS_VERSION_, '1.7.0.0', '<'))}
            <h3 class="brlFooterIconAlign brlFooterH3"><strong>Support</strong></h3> 
            {else}
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons mi-chat brlFooterIcon">chat</i><strong>Support</strong></h3> 
            {/if}
            <a href="{l s='https://addons.prestashop.com/en/contact-us?id_product=' mod='brlcustomblocks'}{$brl_id_product|escape:'htmlall':'UTF-8'}" target="_blank" class="brlFooterLinkColor">&raquo; {l s='Contact the after-sales service' mod='brlcustomblocks'}</a><br><br><br>
        </div>
        {/if}
        {if (!empty($brl_id_product|escape:'htmlall':'UTF-8'))}
        <div class="col-md-4">
        {else}
        <div class="col-md-6">
        {/if}
            {if (version_compare(_PS_VERSION_, '1.7.0.0', '<'))}
            <h3 class="brlFooterIconAlign brlFooterH3"><strong>{l s='Add-on' mod='brlcustomblocks'}</strong></h3> 
            {else}
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons brlFooterIcon">extension</i><strong>{l s='Add-on' mod='brlcustomblocks'}</strong></h3>
            {/if}
            <p>{l s='With our module' mod='brlcustomblocks'} : <a href="{l s='https://addons.prestashop.com/en/page-customization/42174-custom-css-and-js.html' mod='brlcustomblocks'}" target="_blank">{l s='Custom CSS and JS' mod='brlcustomblocks'}</a>{l s=', you can add custom CSS styles to your blocks.' mod='brlcustomblocks'}</p><br><br>
        </div>
    </div>
</div>