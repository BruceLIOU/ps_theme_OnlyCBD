<script type="text/javascript">id_language = {$default_language|intval};</script>

<form action="{$base_config_url|atm_nofilter}" method="post" id="formElement_{$module_name|escape:'htmlall':'UTF-8'}" name="formElement_{$module_name|escape:'htmlall':'UTF-8'}" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div id="blocElementForm">
        {if $ObjAdvancedTopMenuElementClass}
            <input type="hidden" name="id_element" value="{$ObjAdvancedTopMenuElementClass->id|intval}" />
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
                <select name="id_menu" id="id_menu_select" class="fixed-width-xxl">
                    {if isset($menus) && is_array($menus) && count($menus) > 1}
                        <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
                    {/if}
                    {foreach from=$menus item=menu}
                        <option value="{$menu.id_menu|intval}"{if $ObjAdvancedTopMenuElementClass && AdvancedTopMenuColumnClass::getIdMenuByIdColumn($ObjAdvancedTopMenuElementClass->id_column) == $menu.id_menu} selected="selected"{/if}>{module->getAdminOutputNameValue row=$menu withExtra=false}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group" id="column_select">
            <label class="control-label col-lg-3">{l s='Parent group' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                {if Validate::isLoadedObject($ObjAdvancedTopMenuElementClass)}
                    {module->outputSelectColumns id_menu=AdvancedTopMenuColumnClass::getIdMenuByIdColumn($ObjAdvancedTopMenuElementClass->id_column) column_selected=$ObjAdvancedTopMenuElementClass->id_column}
                {elseif !Validate::isLoadedObject($ObjAdvancedTopMenuElementClass) && isset($menus) && is_array($menus) && count($menus) == 1}
                    {module->outputSelectColumns id_menu=$menus[0]['id_menu']}
                {else}
                    <div class="error inline-alert">
                        <strong><u>{l s='Please select a parent tab!' mod='pm_advancedtopmenu'}</u></strong>
                    </div>
                    <script type="text/javascript">
                    $(document).ready(function() {
                        $('input[name="submitElement"]').attr('disabled', 'disabled').prop('disabled', true);
                    });
                    </script>
                {/if}
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#id_menu_select").change(function() {
                    showColumnSelect($(this));
                });
            });
        </script>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Type' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="type" id="type_element" class="fixed-width-xxl">
                    <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
                    <option value="1"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 1} selected="selected"{/if}>{l s='CMS' mod='pm_advancedtopmenu'}</option>
                    <option value="10"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 10} selected="selected"{/if}>{l s='CMS category' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 2} selected="selected"{/if}>{l s='Link' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 3} selected="selected"{/if}>{l s='Category' mod='pm_advancedtopmenu'}</option>
                    <option value="4"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 4} selected="selected"{/if}>{l s='Manufacturer' mod='pm_advancedtopmenu'}</option>
                    <option value="5"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 5} selected="selected"{/if}>{l s='Supplier' mod='pm_advancedtopmenu'}</option>
                    <option value="6"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 6} selected="selected"{/if}>{l s='Search' mod='pm_advancedtopmenu'}</option>
                    <option value="7"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 7} selected="selected"{/if}>{l s='Only image or icon' mod='pm_advancedtopmenu'}</option>
                    <option value="9"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 9} selected="selected"{/if}>{l s='Specific page' mod='pm_advancedtopmenu'}</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
        $(document).ready(function() {
            $("#type_element").change(function() {
                showMenuType($(this),"element");
            });
        });
        </script>

        <div class="add_category menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 3}{else} style="display:none;"{/if}>
            {module->outputCategoriesSelect object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_cms menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 1}{else} style="display:none;"{/if}>
            {module->outputCmsSelect cms=$cms object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_cms_category menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 10}{else} style="display:none;"{/if}>
            {module->outputCmsCategoriesSelect cmsCategories=$cmsCategories object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_manufacturer menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 4}{else} style="display:none;"{/if}>
            {module->outputManufacturerSelect manufacturers=$manufacturer object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_supplier menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 5}{else} style="display:none;"{/if}>
            {module->outputSupplierSelect suppliers=$supplier object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_specific_page menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 9}{else} style="display:none;"{/if}>
            {module->outputSpecificPageSelect object=$ObjAdvancedTopMenuElementClass}
        </div>

        <div class="add_link menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type != 2} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Link' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="elementlink_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            <input size="20" type="text" name="link_{$language.id_lang|intval}" class="adtmInputLink" value="{if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->link[$language['id_lang']])}{$ObjAdvancedTopMenuElementClass->link[$language['id_lang']]|escape:'htmlall':'UTF-8'}{/if}" maxlength="255" />
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='elementlink' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Prevent click on link' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <input type="checkbox" name="clickable" id="element_clickable" value="1" {if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->link[$default_language] == '#'} checked="checked"}{/if} />
                <small>{l s='add a # in the link field, do not remove' mod='pm_advancedtopmenu'}</small>
            </div>
        </div>
        <script type="text/javascript">
        $("#element_clickable").click(function() {
            setUnclickable($(this));
        });
        </script>

        {module->outputTargetSelect object=$ObjAdvancedTopMenuElementClass}

        <div class="add_title menu_element"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->type == 7} style="display:none;"{/if}>
            <div class="form-group">
                <label class="control-label col-lg-3">{l s='Title' mod='pm_advancedtopmenu'}</label>
                <div class="col-lg-9">
                    {foreach from=$languages item=language}
                        <div id="elementname_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            <textarea cols="20" rows="2" name="name_{$language.id_lang|intval}" maxlength="255">{if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->name[$language['id_lang']])}{$ObjAdvancedTopMenuElementClass->name[$language['id_lang']]|atm_nofilter}{/if}</textarea>
                            <p class="help-block">{l s='(if filled, will replace original title)' mod='pm_advancedtopmenu'}</p>
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='elementname' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_element" id="element_active_on" value="1"{if !$ObjAdvancedTopMenuElementClass || ($ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->active)} checked="checked"{/if} />
                    <label for="element_active_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_element" id="element_active_off" value="0"{if $ObjAdvancedTopMenuElementClass && !$ObjAdvancedTopMenuElementClass->active} checked="checked"{/if} />
                    <label for="element_active_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on desktop' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_desktop_element" id="element_active_desktop_on" value="1"{if !$ObjAdvancedTopMenuElementClass || ($ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->active_desktop)} checked="checked"{/if} />
                    <label for="element_active_desktop_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_desktop_element" id="element_active_desktop_off" value="0"{if $ObjAdvancedTopMenuElementClass && !$ObjAdvancedTopMenuElementClass->active_desktop} checked="checked"{/if} />
                    <label for="element_active_desktop_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Active on mobile' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="active_mobile_element" id="element_active_mobile_on" value="1"{if !$ObjAdvancedTopMenuElementClass || ($ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->active_mobile)} checked="checked"{/if} />
                    <label for="element_active_mobile_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="active_mobile_element" id="element_active_mobile_off" value="0"{if $ObjAdvancedTopMenuElementClass && !$ObjAdvancedTopMenuElementClass->active_mobile} checked="checked"{/if} />
                    <label for="element_active_mobile_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Privacy Options' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <select name="privacy" class="fixed-width-xxl">
                    <option value="0"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->privacy == 0} selected="selected"{/if}>{l s='For all' mod='pm_advancedtopmenu'}</option>
                    <option value="1"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->privacy == 1} selected="selected"{/if}>{l s='Only for visitors' mod='pm_advancedtopmenu'}</option>
                    <option value="2"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->privacy == 2} selected="selected"{/if}>{l s='Only for registered users' mod='pm_advancedtopmenu'}</option>
                    <option value="3"{if $ObjAdvancedTopMenuElementClass && $ObjAdvancedTopMenuElementClass->privacy == 3} selected="selected"{/if}>{l s='Only for groups of customers' mod='pm_advancedtopmenu'}</option>
                </select>
            </div>
        </div>

        {module->outputChosenGroups object=$ObjAdvancedTopMenuElementClass}

        {if !$imgIconElementDirIsWritable}
            <div class="warning warn clear">{l s='To upload an icon, please assign CHMOD 777 to the directory:' mod='pm_advancedtopmenu'} {$moduleRootDirectory|escape:'htmlall':'UTF-8'}/element_icons</div>
        {/if}

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Icon or image' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9 iconPickerContainer">
                <span class="iconPickingButtonWrapper">
                    {foreach from=$languages item=language}
                        <div id="iconPickingButton_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if};">
                            {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
                                {if $ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']] == 'i-mi'}
                                    <i class="zmdi {$ObjAdvancedTopMenuElementClass->image_class[$language['id_lang']]}"></i>
                                {else}
                                    <i class="{$ObjAdvancedTopMenuElementClass->image_class[$language['id_lang']]}"></i>
                                {/if}
                            {else}
                                <i></i>
                            {/if}
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#elementIconPickingModal" data-id-lang="{$language.id_lang|intval}" data-empty-label="{l s='Pick an icon' mod='pm_advancedtopmenu'}" data-picked-label="{l s='Edit' mod='pm_advancedtopmenu'}">
                                {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
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
                        <div id="elementimage_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                            <input type="file" name="icon_{$language.id_lang|intval}" size="20"{if !$imgIconElementDirIsWritable} disabled="disabled"{/if} />

                            {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && !in_array($ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))}
                                <input type="hidden" name="have_icon_{$language.id_lang|intval}" value="{$ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]|intval}" /><br />
                                <img class="img-responsive" src="{$module_path|atm_nofilter}element_icons/{$ObjAdvancedTopMenuElementClass->id|intval}-{$language.iso_code|escape:'htmlall':'UTF-8'}.{if isset($ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']])}{$ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']]|escape:'htmlall':'UTF-8'}{else}jpg{/if}?{uniqid()}" /><br />
                                <input type="checkbox" name="unlink_icon_{$language.id_lang|intval}" value="1" /> &nbsp; {l s='Delete this image' mod='pm_advancedtopmenu'}
                            {/if}

                            <p class="help-block">({', '|implode:$allowedImageFileExtension}})</p>
                        </div>
                    {/foreach}

                    {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='elementimage' return=true}
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Image legend' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                {foreach from=$languages item=language}
                    <div id="elementimagelegend_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
                        <input type="text" maxlength="255" name="image_legend_{$language.id_lang|intval}" value="{if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->image_legend[$language['id_lang']])}{$ObjAdvancedTopMenuElementClass->image_legend[$language['id_lang']]|escape:'htmlall':'UTF-8'}{/if}" />
                        <p class="help-block">{l s='(if empty, title will be used)' mod='pm_advancedtopmenu'}</p>
                    </div>
                {/foreach}

                {module->displayFlags languages=$languages default_language=$default_language ids=$ids_lang id='elementimagelegend' return=true}
                <div class="clear"></div>
            </div>
        </div>

        <div class="form-group submitButtonContainer">
            <button type="submit" value="1" name="submitElement" class="btn btn-default pull-right">
                <i class="process-icon-save"></i> {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>

        <div class="modal fade iconModal" id="elementIconPickingModal" tabindex="-1" role="dialog" aria-labelledby="elementIconPickingModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="elementIconPickingModalLabel">{l s='Pick an icon' mod='pm_advancedtopmenu'}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        {foreach from=$languages item=language}
                            <div class="iconSelectorContainer iconSelector_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if};">
                                <input class="hiddenIconInput" type="hidden" name="lib_icon_{$language.id_lang|intval}" {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && in_array($ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']], array('i-fa', 'i-mi'))} value="{$ObjAdvancedTopMenuElementClass->image_class[$language['id_lang']]}"{/if} />
                                <div class="form-group">
                                    <label class="control-label col-lg-3">{l s='Icon library' mod='pm_advancedtopmenu'}</label>
                                    <div class="col-lg-9">
                                        <select class="fixed-width-xxl iconLibrary" name="iconLibrary_{$language.id_lang|intval}">
                                            <option value="fa" {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']] == 'i-fa'}selected{/if}>Font Awesome</option>
                                            <option value="mi" {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']] == 'i-mi'}selected{/if}>Material Icons</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group faSelector" {if $ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && $ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']] == 'i-mi'}style="display: none;"{/if}>
                                    <label class="control-label col-lg-3">{l s='Picked icon' mod='pm_advancedtopmenu'}</label>
                                    <div class="col-lg-9">
                                        <button data-id-lang="{$language.id_lang|intval}" type="button" class="btn btn-secondary pmFaIconPicker" role="iconpicker"></button>
                                    </div>
                                </div>
                                <div class="form-group miSelector" {if empty($ObjAdvancedTopMenuElementClass) || ($ObjAdvancedTopMenuElementClass && isset($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']]) && (($ObjAdvancedTopMenuElementClass->have_icon[$language['id_lang']] && $ObjAdvancedTopMenuElementClass->image_type[$language['id_lang']] == 'i-fa') || empty($ObjAdvancedTopMenuElementClass->image_class[$language['id_lang']])))}style="display: none;"{/if}>
                                    <label class="control-label col-lg-3">{l s='Picked icon' mod='pm_advancedtopmenu'}</label>
                                    <div class="col-lg-9">
                                        <button data-id-lang="{$language.id_lang|intval}" type="button" class="btn btn-secondary pmMiIconPicker" role="iconpicker"></button>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">{l s='Save' mod='pm_advancedtopmenu'}</button>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- #blocElementForm -->
</form>
{if $ObjAdvancedTopMenuElementClass}
    <script type="text/javascript">
    $(function(){
        showMenuType($("#type_element"), "element");
    });
    </script>
{/if}
