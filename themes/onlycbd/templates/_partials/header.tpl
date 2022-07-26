{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container-fluid">
      <div class="row">
        <div class="hidden-sm-down">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
            {hook h='displayNav1'}
          </div>
        </div>
        <div class="hidden-md-up text-sm-center mobile">
          <div class="float-xs-left" id="menu-icon">
            <i class="material-icons d-inline">&#xE5D2;</i>
          </div>
          <div class="float-xs-right" id="_mobile_cart"></div>
          <div class="float-xs-right" id="_mobile_user_info"></div>
          <div class="top-logo" id="_mobile_logo"></div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-2 col-md-2 col-xl-2 col-sm-12 hidden-sm-down" id="_desktop_logo">
          {if $shop.logo_details}
            {if $page.page_name == 'index'}
              <h1>
                {renderLogo}
              </h1>
            {else}
              {renderLogo}
            {/if}
          {/if}
        </div>
        <div class="col-lg-3 col-md-3 col-xl-3 col-sm-12 headerFilter">
          <div class="containerLinkCBDCateg">
            <span id="headerLinkCDBCateg">
              {l s='CBD Par Type' d='Shop.Theme.Global'}
              <i class="material-icons">keyboard_arrow_down</i>
            </span>
            <div class="outLinerMenuActive"></div>
          </div>

          <div class="containerLinkCDBBrands">
            <span id="headerLinkCDBBrands">
              {l s='CBD Par Brands' d='Shop.Theme.Global'}
              <i class="material-icons">keyboard_arrow_down</i>
            </span>
            <div class="outLinerMenuActive"></div>
          </div>

        </div>

        <div class="header-top-left col-lg-7 col-md-7 col-xl-7 col-sm-12 position-static">
          {hook h='displayTop'}
        </div>



      </div>
      <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
    </div>
  </div>



  {hook h='displayNavFullWidth'}


  {assign var='childCategories' value=Category::getChildren(10, 1, true, false)}
  <div class="row dropdownMenuCateg">
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12">
      <div class="containerDropdownMenu">
        {foreach $childCategories as $category}
          <div class="divThumbnail">
            <a href="{$link->getCategoryLink($category.id_category)}">
              <img class="replace-2x" src="{$urls.base_url}img/tmp/category_{$category.id_category}-thumb.jpg"
                alt="{$category.name|escape:'html':'UTF-8'}" />
              {$category.name}
            </a>
          </div>
        {/foreach}
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12 hidden-sm-down">
      <div class='displayHookCustomBlocks_851'>{hook h='displayHookCustomBlocks' idHookCustomblocks = '851'}</div>
    </div>
  </div>

  {assign var='manufactures' value=Manufacturer::getManufacturers(true, 1, true)}
  <div class="row dropdownMenuBrands">
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12">
      <div class="containerDropdownMenu">
        {foreach $manufactures as $manufacture}
          <div class="divThumbnail">
            <a href="{$link->getManufacturerLink($manufacture.id_manufacturer)}">
              <img src="{$link->getManufacturerImageLink($manufacture.id_manufacturer, 'small_default')}"
                alt="{$manufacture.manufacturer_name|escape:html:'UTF-8'}">
              {$manufacture.name}
            </a>
          </div>
        {/foreach}
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12 hidden-sm-down">
      <div class='displayHookCustomBlocks_851'>{hook h='displayHookCustomBlocks' idHookCustomblocks = '851'}</div>
    </div>
  </div>

{/block}