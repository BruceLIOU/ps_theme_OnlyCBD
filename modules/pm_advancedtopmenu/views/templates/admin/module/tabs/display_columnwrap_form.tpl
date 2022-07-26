<script type="text/javascript">id_language = {$default_language|intval};</script>

<form action="{$base_config_url|atm_nofilter}" method="post" id="formColumn_{$module_name|escape:'htmlall':'UTF-8'}" name="form_{$module_name|escape:'htmlall':'UTF-8'}" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div id="blocColumnWrapForm">
        {if $ObjAdvancedTopMenuColumnWrapClass}
            <input type="hidden" name="id_wrap" value="{$ObjAdvancedTopMenuColumnWrapClass->id|intval}" />
            <br />
            <a class="pmIconContainer backButton" href="{$base_config_url|atm_nofilter}">
                <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-chevron-left">{else}material-icons">keyboard_arrow_left{/if}</i>
                {l s='Back' mod='pm_advancedtopmenu'}
            </a>
        {/if}
        <h4>{l s='General settings' mod='pm_advancedtopmenu'}</h4>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Parent tab' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="id_menu" class="fixed-width-xxl">
                    <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
                    {foreach from=$menus item=menu}
                        <option value="{$menu.id_menu|intval}"{if $ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->id_menu == $menu.id_menu} selected="selected"{/if}>{module->getAdminOutputNameValue row=$menu withExtra=false}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Title (is not displayed in front office)' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <input size="20" type="text" class="fixed-width-xxl" name="internal_name" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->internal_name|escape:'htmlall':'UTF-8'}{/if}" maxlength="255" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_menu" id="columnwrap_active_on" value="1"{if !$ObjAdvancedTopMenuColumnWrapClass || ($ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->active)} checked="checked"{/if} />
                    <label for="columnwrap_active_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_menu" id="columnwrap_active_off" value="0"{if $ObjAdvancedTopMenuColumnWrapClass && !$ObjAdvancedTopMenuColumnWrapClass->active} checked="checked"{/if} />
                    <label for="columnwrap_active_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on desktop' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_desktop_menu" id="columnwrap_active_desktop_on" value="1"{if !$ObjAdvancedTopMenuColumnWrapClass || ($ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->active_desktop)} checked="checked"{/if} />
                    <label for="columnwrap_active_desktop_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_desktop_menu" id="columnwrap_active_desktop_off" value="0"{if $ObjAdvancedTopMenuColumnWrapClass && !$ObjAdvancedTopMenuColumnWrapClass->active_desktop} checked="checked"{/if} />
                    <label for="columnwrap_active_desktop_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on mobile' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_mobile_menu" id="columnwrap_active_mobile_on" value="1"{if !$ObjAdvancedTopMenuColumnWrapClass || ($ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->active_mobile)} checked="checked"{/if} />
                    <label for="columnwrap_active_mobile_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_mobile_menu" id="columnwrap_active_mobile_off" value="0"{if $ObjAdvancedTopMenuColumnWrapClass && !$ObjAdvancedTopMenuColumnWrapClass->active_mobile} checked="checked"{/if} />
                    <label for="columnwrap_active_mobile_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Privacy Options' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="privacy" class="fixed-width-xxl">
                    <option value="0"{if $ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->privacy == 0} selected="selected"{/if}>{l s='For all' mod='pm_advancedtopmenu'}</option>
                    <option value="1"{if $ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->privacy == 1} selected="selected"{/if}>{l s='Only for visitors' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->privacy == 2} selected="selected"{/if}>{l s='Only for registered users' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuColumnWrapClass && $ObjAdvancedTopMenuColumnWrapClass->privacy == 3} selected="selected"{/if}>{l s='Only for groups of customers' mod='pm_advancedtopmenu'}</option>
                </select>
            </div>
        </div>

        {module->outputChosenGroups object=$ObjAdvancedTopMenuColumnWrapClass}

        <h3>{l s='Style settings' mod='pm_advancedtopmenu'} <small>({l s='if empty, the global styles are used' mod='pm_advancedtopmenu'})</small></h3>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Width' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group fixed-width-xs">
                    <input size="20" type="text" class="fixed-width-xs" name="width" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->width|escape:'htmlall':'UTF-8'}{/if}" />
                    <span class="input-group-addon">px</span>
                </div>
                <p class="help-block">({l s='Put 0 for automatic width' mod='pm_advancedtopmenu'})</p>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Background color' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 colorPickerContainer">
                <div class="input-group col-lg-2"><input data-hex="true" size="20" type="color" name="bg_color[0]" id="bg_color_0" class="color mColorPicker" value="{if  $bg_color_color1}{$bg_color_color1|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <div class="input-group col-lg-2" {if isset($bg_color_color2) && $bg_color_color2}{else} style="display:none"{/if} id="bg_color_gradient"><input data-hex="true" size="20" type="color" class="color mColorPicker" name="bg_color[1]" id="bg_color_1" value="{if !isset($bg_color_color2) || ! $bg_color_color2}{else}{$bg_color_color2|escape:'htmlall':'UTF-8'}{/if}" size="20" /></div>
                &nbsp; <input type="checkbox" name="bg_color_gradient" value="1"{if isset($bg_color_color2) && $bg_color_color2} checked="checked"{/if} /> &nbsp; {l s='Make a gradient' mod='pm_advancedtopmenu'}
            </div>
        </div>
        <script type="text/javascript">
        $("input[name=bg_color_gradient]").click(function() {
            showSpanIfChecked($(this), "#bg_color_gradient");
        });
        </script>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Text color group' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="txt_color_column" class="color mColorPicker" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->txt_color_column|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Text color group over' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="txt_color_column_over" class="color mColorPicker" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->txt_color_column_over|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Text color items' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="txt_color_element" class="color mColorPicker" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->txt_color_element|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Text color items over' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="input-group col-lg-2">
                    <input data-hex="true" size="20" type="color" name="txt_color_element_over" class="color mColorPicker" value="{if $ObjAdvancedTopMenuColumnWrapClass}{$ObjAdvancedTopMenuColumnWrapClass->txt_color_element_over|escape:'htmlall':'UTF-8'}{/if}" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Show additionnal text settings' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="tinymce_container_toggle_menu" id="tinymce_columnwrap_container_toggle_on" value="1"{if $hasAdditionnalText} checked="checked"{/if} />
                    <label for="tinymce_columnwrap_container_toggle_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="tinymce_container_toggle_menu" id="tinymce_columnwrap_container_toggle_off" value="0"{if !$hasAdditionnalText} checked="checked"{/if} />
                    <label for="tinymce_columnwrap_container_toggle_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="tinymce_container"{if $hasAdditionnalText} style="display: block"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text displayed above column' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="columnwrap_value_over_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            {* HTML *}<textarea class="rte" cols="100" rows="10" name="value_over_{$language.id_lang|intval}">{if $ObjAdvancedTopMenuColumnWrapClass && isset($ObjAdvancedTopMenuColumnWrapClass->value_over[$language['id_lang']])}{htmlentities(Tools::stripslashes($ObjAdvancedTopMenuColumnWrapClass->value_over[$language['id_lang']]), $smarty.const.ENT_COMPAT, 'UTF-8')}{/if}</textarea>
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='columnwrap_value_over' return=true}
                    <div class="clear"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Text displayed below column' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="columnwrap_value_under_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            {* HTML *}<textarea class="rte" cols="100" rows="10"  name="value_under_{$language.id_lang|intval}">{if $ObjAdvancedTopMenuColumnWrapClass && isset($ObjAdvancedTopMenuColumnWrapClass->value_under[$language['id_lang']])}{htmlentities(Tools::stripslashes($ObjAdvancedTopMenuColumnWrapClass->value_under[$language['id_lang']]), $smarty.const.ENT_COMPAT, 'UTF-8')}{/if}</textarea>
                        </div>
                    {/foreach}
                </div>
            </div>

            {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='columnwrap_value_under' return=true}
            <div class="clear"></div>
        </div><!-- .tinymce_container -->

        <div class="form-group submitButtonContainer">
            <button type="submit" name="submitColumnWrap" class="btn btn-default pull-right">
                <i class="process-icon-save"></i>
                {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </div><!-- #blocColumnWrapForm -->
</form>
