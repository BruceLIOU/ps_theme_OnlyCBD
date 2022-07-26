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
{assign var='childCategories' value=Category::getChildren(10, 1, true, false)}
{* <div class="titleCustomContainer">
    <div class="titleCustom">
        <div class="titleH2Container">
            <h2>Titre de test</h2>
        </div>
    </div>
</div> *}

<div class="rowCustomText">
    <div class="col-sm-12 customCategoryHomePage">
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
<div class="linkCustom">
    <a href="10-cbd">
        Voir nos catégories de CDB
        <span class="material-icons">arrow_forward</span>
    </a>
</div>