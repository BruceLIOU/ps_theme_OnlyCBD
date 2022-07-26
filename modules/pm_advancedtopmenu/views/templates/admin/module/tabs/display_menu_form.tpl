<script type="text/javascript">id_language = {$default_language|intval};</script>

<form action="{$base_config_url|atm_nofilter}" method="post" id="menuform_{$module_name|escape:'htmlall':'UTF-8'}" name="menuform_{$module_name|escape:'htmlall':'UTF-8'}" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div id="blocMenuForm">
        {if $ObjAdvancedTopMenuClass}
            <input type="hidden" name="id_menu" value="{$ObjAdvancedTopMenuClass->id|intval}" />
            <br />
            <a class="pmIconContainer backButton" href="{$base_config_url|atm_nofilter}">
                <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-chevron-left">{else}material-icons">keyboard_arrow_left{/if}</i>
                {l s='Back' mod='pm_advancedtopmenu'}
            </a>
        {/if}

        <h4>{l s='General settings' mod='pm_advancedtopmenu'}</h4>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Type' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="type" id="type_menu" class="fixed-width-xxl">
                    <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
                    <option value="1"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 1} selected="selected"{/if}>{l s='CMS' mod='pm_advancedtopmenu'}</option>
                    <option value="10"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 10} selected="selected"{/if}>{l s='CMS category' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 2} selected="selected"{/if}>{l s='Link' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 3} selected="selected"{/if}>{l s='Category' mod='pm_advancedtopmenu'}</option>
                    <option value="4"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 4} selected="selected"{/if}>{l s='Manufacturer' mod='pm_advancedtopmenu'}</option>
                    <option value="5"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 5} selected="selected"{/if}>{l s='Supplier' mod='pm_advancedtopmenu'}</option>
                    <option value="6"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 6} selected="selected"{/if}>{l s='Search' mod='pm_advancedtopmenu'}</option>
                    <option value="7"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 7} selected="selected"{/if}>{l s='Only image or icon' mod='pm_advancedtopmenu'}</option>
                    <option value="9"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 9} selected="selected"{/if}>{l s='Specific page' mod='pm_advancedtopmenu'}</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
        $(document).ready(function() {
            $("#type_menu").change(function() {
                showMenuType($(this),"menu");
            });
        });
        </script>

        {if $ObjAdvancedTopMenuClass && in_array($ObjAdvancedTopMenuClass->type, $rebuildable_type)}
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Rebuild tree' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="rebuild" id="rebuild_on" value="1" />
                        <label for="rebuild_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                        <input type="radio" name="rebuild" id="rebuild_off" value="0" checked />
                        <label for="rebuild_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
        {/if}

        <div class="add_category menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 3}{else} style="display:none;"{/if}>
            {module->outputCategoriesSelect object=$ObjAdvancedTopMenuClass}
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Include Subcategories' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="include_subs" id="menu_subcats_on" value="1" {if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 3 && $haveDepend} checked="checked"{/if}/>
                        <label for="menu_subcats_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                        <input type="radio" name="include_subs" id="menu_subcats_off" value="0" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass->type == 3 && !$haveDepend)} checked="checked"{/if} />
                        <label for="menu_subcats_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>

            <script type="text/javascript">
                $("#menu_subcats_on").on('click', function () {
                    $('#nbColumnsToCreateContainer').slideDown('fast');
                });
                $("#menu_subcats_off").on('click', function () {
                    $('#nbColumnsToCreateContainer').slideUp('fast');
                });
            </script>

            <div class="form-group" id="nbColumnsToCreateContainer" style="display: none;">
                <label class="control-label col-lg-3">{l s='Number of columns to create' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <input class="form-control fixed-width-xs" type="text" name="nbColumnsToCreate" id="nbColumnsToCreate" value="1" />
                    <p class="help-block">{l s='Elements contained in these columns will equally be distributed when possible during the generation' mod='pm_advancedtopmenu'}
                </div>
            </div>
        </div>

        <div class="add_cms menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 1}{else} style="display:none;"{/if}>
            {module->outputCmsSelect cms=$cms object=$ObjAdvancedTopMenuClass}
        </div>

        <div class="add_cms_category menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 10}{else} style="display:none;"{/if}>
            {module->outputCmsCategoriesSelect cmsCategories=$cmsCategories object=$ObjAdvancedTopMenuClass}
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Include CMS pages' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="include_subs_cms" id="include_subs_cms_on" value="1" {if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 10 && $haveDepend} checked="checked"{/if}/>
                        <label for="include_subs_cms_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                        <input type="radio" name="include_subs_cms" id="include_subs_cms_off" value="0" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass->type == 10 && !$haveDepend)} checked="checked"{/if} />
                        <label for="include_subs_cms_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
        </div>

        <div class="add_manufacturer menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 4}{else} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='All manufacturers' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-3">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="include_subs_manu" id="menu_submenu_on" value="1" {if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 4 && $haveDepend} checked="checked"{/if}/>
                        <label for="menu_submenu_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                        <input type="radio" name="include_subs_manu" id="menu_submenu_off" value="0" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass->type == 4 && !$haveDepend)} checked="checked"{/if} />
                        <label for="menu_submenu_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <script type="text/javascript">
                $("#menu_submenu_on, #menu_submenu_off").click(function() {
                    hideNextIfTrue($(this));
                });
                $("#menu_submenu_on").on('click', function () {
                    $('#nbManufacturersColumnsToCreateContainer').slideDown('fast');
                });
                $("#menu_submenu_off").on('click', function () {
                    $('#nbManufacturersColumnsToCreateContainer').slideUp('fast');
                });
            </script>

            <div id="nbManufacturersColumnsToCreateContainer" class="form-group" style="display: none;">
                <label class="control-label col-lg-3">{l s='Number of columns to create' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <input class="form-control fixed-width-xs" type="text" name="nbManufacturersColumnsToCreate" id="nbManufacturersColumnsToCreate" value="1" />
                    <p class="help-block">{l s='Elements contained in these columns will equally be distributed when possible during the generation' mod='pm_advancedtopmenu'}
                </div>
            </div>

            <div class="hideNextIfTrue"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 4 && $haveDepend} style="display:none"{/if}>
                {module->outputManufacturerSelect manufacturers=$manufacturer object=$ObjAdvancedTopMenuClass}
            </div>
        </div>

        <div class="add_supplier menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 5}{else} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='All suppliers' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="include_subs_suppl" id="menu_subsuppl_on" value="1" {if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 5 && $haveDepend} checked="checked"{/if}/>
                        <label for="menu_subsuppl_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                        <input type="radio" name="include_subs_suppl" id="menu_subsuppl_off" value="0" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass->type == 5 && !$haveDepend)} checked="checked"{/if} />
                        <label for="menu_subsuppl_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <script type="text/javascript">
                $("#menu_subsuppl_on, #menu_subsuppl_off").click(function() {
                    hideNextIfTrue($(this));
                });
                $("#menu_subsuppl_on").on('click', function () {
                    $('#nbSuppliersColumnsToCreateContainer').slideDown('fast');
                });
                $("#menu_subsuppl_off").on('click', function () {
                    $('#nbSuppliersColumnsToCreateContainer').slideUp('fast');
                });
            </script>

            <div id="nbSuppliersColumnsToCreateContainer" class="form-group" style="display: none;">
                <label class="control-label col-lg-3">{l s='Number of columns to create' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <input class="form-control fixed-width-xs" type="text" name="nbSuppliersColumnsToCreate" id="nbSuppliersColumnsToCreate" value="1" />
                    <p class="help-block">{l s='Elements contained in these columns will equally be distributed when possible during the generation' mod='pm_advancedtopmenu'}
                </div>
            </div>

            <div class="hideNextIfTrue"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 5 && $haveDepend} style="display:none"{/if}>
                {module->outputSupplierSelect suppliers=$supplier object=$ObjAdvancedTopMenuClass}
            </div>
        </div>

        <div class="add_specific_page menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 9}{else} style="display:none;"{/if}>
            {module->outputSpecificPageSelect object=$ObjAdvancedTopMenuClass}
        </div>

        <div class="add_link menu_element"{if $ObjAdvancedTopMenuClass && ($ObjAdvancedTopMenuClass->type != 2 || $ObjAdvancedTopMenuClass->type != 7)} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Link' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="menulink_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            <input size="20" type="text" name="link_{$language.id_lang|intval}" class="adtmInputLink" value="{if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->link[$language['id_lang']])}{$ObjAdvancedTopMenuClass->link[$language['id_lang']]|escape:'htmlall':'UTF-8'}{/if}" maxlength="255" />
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menulink' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Prevent click on link' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <input type="checkbox" name="clickable" id="menu_clickable" value="1" {if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->link[$default_language] == '#'} checked="checked"}{/if} />
                <small>{l s='add a # in the link field, do not remove' mod='pm_advancedtopmenu'}</small>
            </div>
        </div>
        <script type="text/javascript">
        $("#menu_clickable").click(function() {
            setUnclickable($(this));
        });
        </script>

        {module->outputTargetSelect object=$ObjAdvancedTopMenuClass}

        <div class="add_title menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 7} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Title' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                    <div id="menuname_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                        <textarea cols="20" rows="2" name="name_{$language.id_lang|intval}" maxlength="255">{if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->name[$language['id_lang']])}{$ObjAdvancedTopMenuClass->name[$language['id_lang']]|atm_nofilter}{/if}</textarea>
                        <p class="help-block">{l s='(if filled, will replace original title)' mod='pm_advancedtopmenu'}</p>
                    </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menuname' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_menu" id="menu_active_on" value="1" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->active)} checked="checked"{/if}/>
                    <label for="menu_active_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_menu" id="menu_active_off" value="0" {if $ObjAdvancedTopMenuClass && !$ObjAdvancedTopMenuClass->active} checked="checked"{/if} />
                    <label for="menu_active_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on desktop' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_desktop_menu" id="menu_active_desktop_on" value="1" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->active_desktop)} checked="checked"{/if}/>
                    <label for="menu_active_desktop_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_desktop_menu" id="menu_active_desktop_off" value="0" {if $ObjAdvancedTopMenuClass && !$ObjAdvancedTopMenuClass->active_desktop} checked="checked"{/if} />
                    <label for="menu_active_desktop_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on mobile' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_mobile_menu" id="menu_active_mobile_on" value="1" {if !$ObjAdvancedTopMenuClass || ($ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->active_mobile)} checked="checked"{/if}/>
                    <label for="menu_active_mobile_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_mobile_menu" id="menu_active_mobile_off" value="0" {if $ObjAdvancedTopMenuClass && !$ObjAdvancedTopMenuClass->active_mobile} checked="checked"{/if} />
                    <label for="menu_active_mobile_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Privacy Options' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="privacy" class="fixed-width-xxl">
                    <option value="0"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->privacy == 0} selected="selected"{/if}>{l s='For all' mod='pm_advancedtopmenu'}</option>
                    <option value="1"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->privacy == 1} selected="selected"{/if}>{l s='Only for visitors' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->privacy == 2} selected="selected"{/if}>{l s='Only for registered users' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->privacy == 3} selected="selected"{/if}>{l s='Only for groups of customers' mod='pm_advancedtopmenu'}</option>
                </select>
            </div>
        </div>

        {module->outputChosenGroups object=$ObjAdvancedTopMenuClass}

        {if !$imgIconMenuDirIsWritable}
            <div class="warning warn clear">{l s='To upload an icon, please assign CHMOD 777 to the directory:' mod='pm_advancedtopmenu'} {$moduleRootDirectory|escape:'htmlall':'UTF-8'}/menu_icons</div>
        {/if}

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Icon or image' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 iconPickerContainer">
                <span class="iconPickingButtonWrapper">
                    {foreach from=$languages item=language}
                        <div id="iconPickingButton_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if};">
                            {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
                                {if $ObjAdvancedTopMenuClass->image_type[$language['id_lang']] == 'i-mi'}
                                    <i class="zmdi {$ObjAdvancedTopMenuClass->image_class[$language['id_lang']]}"></i>
                                {else}
                                    <i class="{$ObjAdvancedTopMenuClass->image_class[$language['id_lang']]}"></i>
                                {/if}
                            {else}
                                <i></i>
                            {/if}
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#iconPickingModal" data-id-lang="{$language.id_lang|intval}" data-empty-label="{l s='Pick an icon' mod='pm_advancedtopmenu'}" data-picked-label="{l s='Edit' mod='pm_advancedtopmenu'}">
                                {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
                                    <span>{l s='Edit' mod='pm_advancedtopmenu'}</span>
                                {else}
                                    <span>{l s='Pick an icon' mod='pm_advancedtopmenu'}</span>
                                {/if}
                            </button>
                        </div>
                    {/foreach}

                {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='iconPickingButton' return=true}
                </span>

                <span>{l s='OR' mod='pm_advancedtopmenu'}</span>
                <div>
                    {foreach from=$languages item=language}
                        <div id="menuimage_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            <input type="file" name="icon_{$language.id_lang|intval}" size="20"{if !$imgIconMenuDirIsWritable} disabled="disabled"{/if} />
                            {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && !in_array($ObjAdvancedTopMenuClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
                                <input type="hidden" name="have_icon_{$language.id_lang|intval}" value="{$ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]|intval}" /><br />
                                <img class="img-responsive" src="{$module_path|atm_nofilter}menu_icons/{$ObjAdvancedTopMenuClass->id|intval}-{$language.iso_code|escape:'htmlall':'UTF-8'}.{if isset($ObjAdvancedTopMenuClass->image_type[$language['id_lang']])}{$ObjAdvancedTopMenuClass->image_type[$language['id_lang']]|escape:'htmlall':'UTF-8'}{else}jpg{/if}?{uniqid()}" /><br />
                                <input type="checkbox" name="unlink_icon_{$language.id_lang|intval}" value="1" /> &nbsp; {l s='Delete this image' mod='pm_advancedtopmenu'}
                            {/if}
                            <small>({', '|implode:$allowedImageFileExtension})</small>
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menuimage' return=true}
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Image legend' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                {foreach from=$languages item=language}
                    <div id="menuimagelegend_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                        <input type="text" maxlength="255" name="image_legend_{$language.id_lang|intval}" value="{if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->image_legend[$language['id_lang']])}{$ObjAdvancedTopMenuClass->image_legend[$language['id_lang']]|escape:'htmlall':'UTF-8'}{/if}" />
                        <p class="help-block">{l s='(if empty, title will be used)' mod='pm_advancedtopmenu'}</p>
                    </div>
                {/foreach}

                {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menuimagelegend' return=true}
                <div class="clear"></div>
            </div>
        </div>

        <h3>{l s='Style settings' mod='pm_advancedtopmenu'} <small>({l s='if empty, the global styles are used' mod='pm_advancedtopmenu'})</small></h3>

        <div class="add_title menu_element"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->type == 7} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text color' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <div class="input-group col-lg-2">
                        <input data-hex="true" size="20" type="color" name="txt_color_menu_tab" class="color mColorPicker" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->txt_color_menu_tab|escape:'htmlall':'UTF-8'}{/if}" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text color over' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    <div class="input-group col-lg-2">
                        <input data-hex="true" size="20" type="color" name="txt_color_menu_tab_hover" class="color mColorPicker" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->txt_color_menu_tab_hover|escape:'htmlall':'UTF-8'}{/if}" />
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Background color' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 colorPickerContainer">
                <div class="input-group col-lg-2"><input data-hex="true" size="20" type="color" name="fnd_color_menu_tab[0]" id="fnd_color_menu_tab_0" class="color mColorPicker" value="{if  $fnd_color_menu_tab_color1}{$fnd_color_menu_tab_color1|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <div class="input-group col-lg-2" {if isset($fnd_color_menu_tab_color2) && $fnd_color_menu_tab_color2}{else} style="display:none"{/if} id="fnd_color_menu_tab_gradient"><input data-hex="true" size="20" type="color" class="color mColorPicker" name="fnd_color_menu_tab[1]" id="fnd_color_menu_tab_1" value="{if !isset($fnd_color_menu_tab_color2) || ! $fnd_color_menu_tab_color2}{else}{$fnd_color_menu_tab_color2|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <input type="checkbox" name="fnd_color_menu_tab_gradient" value="1"{if isset($fnd_color_menu_tab_color2) && $fnd_color_menu_tab_color2} checked="checked"{/if} /> &nbsp; {l s='Make a gradient' mod='pm_advancedtopmenu'}
            </div>
        </div>
        <script type="text/javascript">
        $("input[name=fnd_color_menu_tab_gradient]").click(function() {
            showSpanIfChecked($(this), "#fnd_color_menu_tab_gradient");
        });
        </script>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Background color over' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 colorPickerContainer">
                <div class="input-group col-lg-2"><input data-hex="true" size="20" type="color" name="fnd_color_menu_tab_over[0]" id="fnd_color_menu_tab_over_0" class="color mColorPicker" value="{if  $fnd_color_menu_tab_over_color1}{$fnd_color_menu_tab_over_color1|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <div class="input-group col-lg-2" {if isset($fnd_color_menu_tab_over_color2) && $fnd_color_menu_tab_over_color2}{else} style="display:none"{/if} id="fnd_color_menu_tab_over_gradient"><input data-hex="true" size="20" type="color" class="color mColorPicker" name="fnd_color_menu_tab_over[1]" id="fnd_color_menu_tab_over_1" value="{if !isset($fnd_color_menu_tab_over_color2) || ! $fnd_color_menu_tab_over_color2}{else}{$fnd_color_menu_tab_over_color2|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <input type="checkbox" name="fnd_color_menu_tab_over_gradient" value="1"{if isset($fnd_color_menu_tab_over_color2) && $fnd_color_menu_tab_over_color2} checked="checked"{/if} /> &nbsp; {l s='Make a gradient' mod='pm_advancedtopmenu'}
            </div>
        </div>
        <script type="text/javascript">
        $("input[name=fnd_color_menu_tab_over_gradient]").click(function() {
            showSpanIfChecked($(this), "#fnd_color_menu_tab_over_gradient");
        });
        </script>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Border size' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 fourSizeContainer">
                {l s='top' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_tab[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_tab !== '0' && isset($borders_size_tab[0])}{$borders_size_tab.0|intval}{/if}" /> &nbsp;
                {l s='right' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_tab[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_tab !== '0' && isset($borders_size_tab[1])}{$borders_size_tab.1|intval}{/if}" /> &nbsp;
                {l s='bottom' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_tab[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_tab !== '0' && isset($borders_size_tab[2])}{$borders_size_tab.2|intval}{/if}" /> &nbsp;
                {l s='left' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_tab[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_tab !== '0' && isset($borders_size_tab[3])}{$borders_size_tab.3|intval}{/if}" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Border color' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="border_color_tab" class="color mColorPicker" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->border_color_tab|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>

        <h4>{l s='Submenu settings' mod='pm_advancedtopmenu'}</h4>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Width' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group fixed-width-xs">
                    <input size="20" type="text" name="width_submenu" class="fixed-width-xs" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->width_submenu|escape:'htmlall':'UTF-8'}{/if}" />
                    <span class="input-group-addon">px</span>
                </div>
                <p class="help-block">({l s='Put 0 for automatic width' mod='pm_advancedtopmenu'})</p>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Minimal height' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group fixed-width-xs">
                    <input size="20" type="text" name="minheight_submenu" class="fixed-width-xs" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->minheight_submenu|escape:'htmlall':'UTF-8'}{/if}" />
                    <span class="input-group-addon">px</span>
                </div>
                <p class="help-block">({l s='Put 0 for automatic height' mod='pm_advancedtopmenu'})</p>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Position' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="position_submenu" class="fixed-width-xxl">
                    <option value=""{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->position_submenu == 0} selected="selected"{/if}>{l s='Use global styles' mod='pm_advancedtopmenu'}</option>
                    <option value="1"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->position_submenu == 1} selected="selected"{/if}>{l s='Left-aligned current menu' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->position_submenu == 3} selected="selected"{/if}>{l s='Right-aligned current menu' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->position_submenu == 2} selected="selected"{/if}>{l s='Left-aligned global menu' mod='pm_advancedtopmenu'}</option>
                </select> &nbsp; <span></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Background color' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 colorPickerContainer">
                <div class="input-group col-lg-2"><input data-hex="true" size="20" type="color" name="fnd_color_submenu[0]" id="fnd_color_submenu_0" class="color mColorPicker" value="{if  $fnd_color_submenu_color1}{$fnd_color_submenu_color1|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <div class="input-group col-lg-2" {if isset($fnd_color_submenu_color2) && $fnd_color_submenu_color2}{else} style="display:none"{/if} id="fnd_color_submenu_gradient"><input data-hex="true" size="20" type="color" class="color mColorPicker" name="fnd_color_submenu[1]" id="fnd_color_submenu_1" value="{if !isset($fnd_color_submenu_color2) || ! $fnd_color_submenu_color2}{else}{$fnd_color_submenu_color2|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <input type="checkbox" name="fnd_color_submenu_gradient" value="1"{if isset($fnd_color_submenu_color2) && $fnd_color_submenu_color2} checked="checked"{/if} /> &nbsp; {l s='Make a gradient' mod='pm_advancedtopmenu'}
            </div>
        </div>
        <script type="text/javascript">
        $("input[name=fnd_color_submenu_gradient]").click(function() {
            showSpanIfChecked($(this),"#fnd_color_submenu_gradient");
        });
        </script>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Border size' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 fourSizeContainer">
                {l s='top' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_submenu[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_submenu !== '0' && isset($borders_size_submenu[0])}{$borders_size_submenu.0|intval}{/if}" /> &nbsp;
                {l s='right' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_submenu[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_submenu !== '0' && isset($borders_size_submenu[1])}{$borders_size_submenu.1|intval}{/if}" /> &nbsp;
                {l s='bottom' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_submenu[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_submenu !== '0' && isset($borders_size_submenu[2])}{$borders_size_submenu.2|intval}{/if}" /> &nbsp;
                {l s='left' mod='pm_advancedtopmenu'} <input size="3" type="text" name="border_size_submenu[]" value="{if $ObjAdvancedTopMenuClass && $ObjAdvancedTopMenuClass->border_size_submenu !== '0' && isset($borders_size_submenu[3])}{$borders_size_submenu.3|intval}{/if}" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Border color' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="border_color_submenu" class="color mColorPicker" value="{if $ObjAdvancedTopMenuClass}{$ObjAdvancedTopMenuClass->border_color_submenu|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Show additionnal text settings' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="tinymce_container_toggle_menu" id="tinymce_menu_container_toggle_on" value="1" {if $hasAdditionnalText} checked="checked"{/if}/>
                    <label for="tinymce_menu_container_toggle_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="tinymce_container_toggle_menu" id="tinymce_menu_container_toggle_off" value="0" {if !$hasAdditionnalText} checked="checked"{/if} />
                    <label for="tinymce_menu_container_toggle_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="tinymce_container"{if $hasAdditionnalText} style="display: block"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text displayed above columns' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="menu_value_over_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            {* HTML *}<textarea class="rte" cols="100" rows="10" name="value_over_{$language.id_lang|intval}">{if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->value_over[$language['id_lang']])}{htmlentities(Tools::stripslashes($ObjAdvancedTopMenuClass->value_over[$language['id_lang']]), $smarty.const.ENT_COMPAT, 'UTF-8')}{/if}</textarea>
                        </div>
                    {/foreach}
                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menu_value_over' return=true}
                    <div class="clear"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text displayed below columns' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="menu_value_under_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            {* HTML *}<textarea class="rte" cols="100" rows="10"  name="value_under_{$language.id_lang|intval}">{if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->value_under[$language['id_lang']])}{htmlentities(Tools::stripslashes($ObjAdvancedTopMenuClass->value_under[$language['id_lang']]), $smarty.const.ENT_COMPAT, 'UTF-8')}{/if}</textarea>
                        </div>
                    {/foreach}
                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='menu_value_under' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div><!-- .tinymce_container -->

        <div class="form-group submitButtonContainer">
            <button type="submit" value="1" name="submitMenu" class="btn btn-default pull-right">
                <i class="process-icon-save"></i> {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </div><!-- #blocMenuForm -->

    <div class="modal fade iconModal" id="iconPickingModal" tabindex="-1" role="dialog" aria-labelledby="iconPickingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="iconPickingModalLabel">{l s='Pick an icon' mod='pm_advancedtopmenu'}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {foreach from=$languages item=language}
                        <div class="iconSelectorContainer iconSelector_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if};">
                            <input class="hiddenIconInput" type="hidden" name="lib_icon_{$language.id_lang|intval}" {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))} value="{$ObjAdvancedTopMenuClass->image_class[$language['id_lang']]}"{/if} />
                            <div class="form-group">
                                <label class="control-label col-lg-3">{l s='Icon library' mod='pm_advancedtopmenu'}</label>
                                <div class="col-lg-9">
                                    <select class="fixed-width-xxl iconLibrary" name="iconLibrary_{$language.id_lang|intval}">
                                        <option value="fa" {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuClass->image_type[$language['id_lang']] == 'i-fa'}selected{/if}>Font Awesome</option>
                                        <option value="mi" {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuClass->image_type[$language['id_lang']] == 'i-mi'}selected{/if}>Material Icons</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group faSelector" {if $ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuClass->image_type[$language['id_lang']] == 'i-mi'}style="display: none;"{/if}>
                                <label class="control-label col-lg-3">{l s='Picked icon' mod='pm_advancedtopmenu'}</label>
                                <div class="col-lg-9">
                                    <button data-id-lang="{$language.id_lang|intval}" type="button" class="btn btn-secondary pmFaIconPicker" role="iconpicker"></button>
                                </div>
                            </div>
                            <div class="form-group miSelector" {if empty($ObjAdvancedTopMenuClass) || ($ObjAdvancedTopMenuClass && isset($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']]) && (($ObjAdvancedTopMenuClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuClass->image_type[$language['id_lang']] == 'i-fa') || empty($ObjAdvancedTopMenuClass->image_class[$language['id_lang']])))}style="display: none;"{/if}>
                                <label class="control-label col-lg-3">{l s='Picked icon' mod='pm_advancedtopmenu'}</label>
                                <div class="col-lg-9">
                                    <button data-id-lang="{$language.id_lang|intval}" type="button" class="btn btn-secondary pmMiIconPicker" role="iconpicker"></button>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</form>
{if $ObjAdvancedTopMenuClass}
    <script type="text/javascript">
    $(function(){
        showMenuType($("#type_menu"), "menu");
    });
    </script>
{/if}
