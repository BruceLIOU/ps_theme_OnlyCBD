{if count($menus)}
    <div id="menu-tab">
        <ul>
        {foreach from=$menus item=menu}
            <li unique-id="{$menu.id_menu|intval}" class="{if $menu.id_menu == $current_id_menu}ui-state-focus ui-tabs-active ui-state-active{/if}">
                <span class="menu-dragHandler pmIconContainer">
                {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}
                    <i class="pmIcon icon-ellipsis-v"></i>
                {else}
                    <i class="pmIcon material-icons">more_vert</i>
                {/if}
                </span>
                <a href="#menu-tab-{$menu.id_menu|intval}">
                    {module->getAdminOutputNameValue row=$menu withExtra=false}
                </a>
            </li>
        {/foreach}
        </ul>

    {foreach from=$menus item=menu}
        <div id="menu-tab-{$menu.id_menu|intval}">
            <p>
                <strong>{module->getAdminOutputNameValue row=$menu withExtra=true type='menu'}</strong> | {module->getAdminOutputPrivacyValue privacy=$menu.privacy}
                | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&editMenu=1&id_menu={$menu.id_menu|intval}#wrapFormTab" title="{l s='Edit' mod='pm_advancedtopmenu'}"><i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-pencil">{else}material-icons">mode_edit{/if}</i></a>
                | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&deleteMenu=1&id_menu={$menu.id_menu|intval}" onclick="return confirm('{{l s='Delete item #' mod='pm_advancedtopmenu'}|addcslashes:"'"}{$menu.id_menu|intval} ?');" title="{l s='Delete' mod='pm_advancedtopmenu'}"><i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-trash">{else}material-icons">delete{/if}</i></a>
                | {l s='Displayed:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeMenu=1&id_menu={$menu.id_menu|intval}" class="ajax_script_load pmIconContainer" title="{if $menu.active}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                    <i id="imgActiveMenu{$menu.id_menu|intval}" class="pmIcon pmStatusIcon {if $menu.active}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $menu.active}icon-check{else}icon-remove{/if}">{else}material-icons">{if $menu.active}check{else}clear{/if}{/if}</i>
                </a>
                | {l s='Displayed on desktop:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeDesktopMenu=1&id_menu={$menu.id_menu|intval}" class="ajax_script_load pmIconContainer" title="{if $menu.active_desktop}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                    <i id="imgActiveDesktopMenu{$menu.id_menu|intval}" class="pmIcon pmStatusIcon {if $menu.active_desktop}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $menu.active_desktop}icon-check{else}icon-remove{/if}">{else}material-icons">{if $menu.active_desktop}check{else}clear{/if}{/if}</i>
                </a>
                | {l s='Displayed on mobile:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeMobileMenu=1&id_menu={$menu.id_menu|intval}" class="ajax_script_load pmIconContainer" title="{if $menu.active_mobile}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                    <i id="imgActiveMobileMenu{$menu.id_menu|intval}" class="pmIcon pmStatusIcon {if $menu.active_mobile}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $menu.active_mobile}icon-check{else}icon-remove{/if}">{else}material-icons">{if $menu.active_mobile}check{else}clear{/if}{/if}</i>
                </a>
            </p>
            <div class="columnWrapSort">
            {if count($menu.columnsWrap)}
                {foreach from=$menu.columnsWrap item=columnWrap}
                    <div class="menuColumnWrap" unique-id="{$columnWrap.id_wrap|intval}" data-id="{$columnWrap.id_wrap|intval}">
                        <p>
                            <span class="dragWrap">
                                <span class="pmIconContainer">
                                    <i title="{l s='Move' mod='pm_advancedtopmenu'}" class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-move">{else}material-icons">open_with{/if}</i>
                                </span>
                                <b>{$columnWrap.internal_name|escape:'htmlall':'UTF-8'}</b>
                            </span>
                            | {module->getAdminOutputPrivacyValue privacy=$columnWrap.privacy}
                            {if $columnWrap.width}
                            | {l s='Width:' mod='pm_advancedtopmenu'} {$columnWrap.width|intval}px
                            {/if}
                            | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&editColumnWrap=1&id_wrap={$columnWrap.id_wrap|intval}&id_menu={$menu.id_menu|intval}#wrapFormTab" title="{l s='Edit' mod='pm_advancedtopmenu'}">
                                <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-pencil">{else}material-icons">mode_edit{/if}</i>
                            </a>
                            | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&deleteColumnWrap=1&id_wrap={$columnWrap.id_wrap|intval}&id_menu={$menu.id_menu|intval}" onclick="return confirm('{{l s='Delete item #' mod='pm_advancedtopmenu'}|addcslashes:"'"}{$columnWrap.id_menu|intval} ?');" title="{l s='Delete' mod='pm_advancedtopmenu'}">
                                <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-trash">{else}material-icons">delete{/if}</i>
                            </a>
                            | {l s='Displayed:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeColumnWrap=1&id_wrap={$columnWrap.id_wrap|intval}" class="ajax_script_load pmIconContainer" title="{if $columnWrap.active}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                <i id="imgActiveColumnWrap{$columnWrap.id_wrap|intval}" class="pmIcon pmStatusIcon {if $columnWrap.active}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnWrap.active}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnWrap.active}check{else}clear{/if}{/if}</i>
                            </a>
                            | {l s='Displayed on desktop:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeDesktopColumnWrap=1&id_wrap={$columnWrap.id_wrap|intval}" class="ajax_script_load pmIconContainer" title="{if $columnWrap.active_desktop}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                <i id="imgActiveDesktopColumnWrap{$columnWrap.id_wrap|intval}" class="pmIcon pmStatusIcon {if $columnWrap.active_desktop}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnWrap.active_desktop}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnWrap.active_desktop}check{else}clear{/if}{/if}</i>
                            </a>
                            | {l s='Displayed on mobile:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeMobileColumnWrap=1&id_wrap={$columnWrap.id_wrap|intval}" class="ajax_script_load pmIconContainer" title="{if $columnWrap.active_mobile}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                <i id="imgActiveMobileColumnWrap{$columnWrap.id_wrap|intval}" class="pmIcon pmStatusIcon {if $columnWrap.active_mobile}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnWrap.active_mobile}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnWrap.active_mobile}check{else}clear{/if}{/if}</i>
                            </a>
                        </p>

                        <div class="columnSort columnSort-{$columnWrap.id_wrap|intval}" data-id="{$columnWrap.id_wrap|intval}">
                        {if count($columnWrap.columns)}
                            {foreach from=$columnWrap.columns item=column}
                                <div class="menuColumn" id="{$column.id_column|intval}" data-id="{$column.id_column|intval}" data-column-wrap-id="{$columnWrap.id_wrap|intval}">
                                    <span class="dragColumn">
                                        <span class="pmIconContainer">
                                            <i title="{l s='Move' mod='pm_advancedtopmenu'}" class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-move">{else}material-icons">open_with{/if}</i>
                                        </span>
                                        {if $column.type != 8}
                                            <strong>{module->getAdminOutputNameValue row=$column withExtra=true type='column'}</strong>
                                        {elseif $column.type == 8 && isset($column.productObj) && Validate::isLoadedObject($column.productObj)}
                                            <strong>{l s='Product:' mod='pm_advancedtopmenu'} {$column.productObj->name|escape:'htmlall':'UTF-8'}</strong> <em>(ID: {$column.productObj->id|intval})</em>
                                        {/if}
                                    </span>
                                    | {module->getAdminOutputPrivacyValue privacy=$column.privacy}
                                 | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&editColumn=1&id_column={$column.id_column|intval}&id_menu={$menu.id_menu|intval}#wrapFormTab" title="{l s='Edit' mod='pm_advancedtopmenu'}">
                                    <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-pencil">{else}material-icons">mode_edit{/if}</i>
                                </a>
                                 | <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&deleteColumn=1&id_column={$column.id_column|intval}&id_menu={$menu.id_menu|intval}" onclick="return confirm('{{l s='Delete item #' mod='pm_advancedtopmenu'}|addcslashes:"'"}{$column.id_column|intval} ?');" title="{l s='Delete' mod='pm_advancedtopmenu'}">
                                    <i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-trash">{else}material-icons">delete{/if}</i>
                                </a>
                                | {l s='Displayed:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeColumn=1&id_column={$column.id_column|intval}" class="ajax_script_load pmIconContainer" title="{if $column.active}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                    <i id="imgActiveColumn{$column.id_column|intval}" class="pmIcon pmStatusIcon {if $column.active}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $column.active}icon-check{else}icon-remove{/if}">{else}material-icons">{if $column.active}check{else}clear{/if}{/if}</i>
                                </a>
                                | {l s='Displayed on desktop:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeDesktopColumn=1&id_column={$column.id_column|intval}" class="ajax_script_load pmIconContainer" title="{if $column.active_desktop}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                    <i id="imgActiveDesktopColumn{$column.id_column|intval}" class="pmIcon pmStatusIcon {if $column.active_desktop}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $column.active_desktop}icon-check{else}icon-remove{/if}">{else}material-icons">{if $column.active_desktop}check{else}clear{/if}{/if}</i>
                                </a>
                                | {l s='Displayed on mobile:' mod='pm_advancedtopmenu'} <a href="{$base_config_url|atm_nofilter}&activeMobileColumn=1&id_column={$column.id_column|intval}" class="ajax_script_load pmIconContainer" title="{if $column.active_mobile}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}">
                                    <i id="imgActiveMobileColumn{$column.id_column|intval}" class="pmIcon pmStatusIcon {if $column.active_mobile}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $column.active_mobile}icon-check{else}icon-remove{/if}">{else}material-icons">{if $column.active_mobile}check{else}clear{/if}{/if}</i>
                                </a>
                                {if count($column.columnElements)}
                                    {if $column.type != 8}
                                        <br /><br />
                                        <table cellspacing="0" cellpadding="0" class="table table_sort" style="width:100%">
                                            <tbody class="elementsContainer">
                                                <tr class="nodrag nodrop">
                                                    <th width="50"></th>
                                                    <th width="50">{l s='ID' mod='pm_advancedtopmenu'}</th>
                                                    <th width="100">{l s='Type' mod='pm_advancedtopmenu'}</th>
                                                    <th width="150">{l s='Permit' mod='pm_advancedtopmenu'}</th>
                                                    <th>{l s='Value' mod='pm_advancedtopmenu'}</th>
                                                    <th class="pmTextCenter" width="100">{l s='Actions' mod='pm_advancedtopmenu'}</th>
                                                    <th class="pmTextCenter" width="100">{l s='Displayed' mod='pm_advancedtopmenu'}</th>
                                                    <th class="pmTextCenter" width="150">{l s='Displayed on desktop' mod='pm_advancedtopmenu'}</th>
                                                    <th class="pmTextCenter" width="150">{l s='Displayed on mobile' mod='pm_advancedtopmenu'}</th>
                                                </tr>
                                                {foreach from=$column.columnElements item=columnElement}
                                                    <tr id="{$columnElement.id_element|intval}" data-id="{$columnElement.id_element|intval}" data-id-column="{$column.id_column|intval}" class="draggable">
                                                        <td class="dragWrap"><span class="pmIconContainer"><i title="{l s='Move' mod='pm_advancedtopmenu'}" class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-move">{else}material-icons">open_with{/if}</i></span></td>
                                                        <td>{$columnElement.id_element|intval}</td>
                                                        <td>{module->getType type=$columnElement.type}</td>
                                                        <td>{module->getAdminOutputPrivacyValue privacy=$columnElement.privacy}</td>
                                                        <td>{module->getAdminOutputNameValue row=$columnElement withExtra=true type='element'}</td>
                                                        <td class="pmTextCenter" > <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&editElement=1&id_element={$columnElement.id_element|intval}&id_menu={$menu.id_menu|intval}#wrapFormTab" title="{l s='Edit' mod='pm_advancedtopmenu'}"><i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-pencil">{else}material-icons">mode_edit{/if}</i></a> <a class="pmIconContainer" href="{$base_config_url|atm_nofilter}&deleteElement=1&id_element={$columnElement.id_element|intval}&id_menu={$menu.id_menu|intval}" onclick="return confirm('{{l s='Delete item #' mod='pm_advancedtopmenu'}|addcslashes:"'"}{$columnElement.id_element|intval} ?');" title="{l s='Delete' mod='pm_advancedtopmenu'}"><i class="pmIcon {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-trash">{else}material-icons">delete{/if}</i></a></td>
                                                        <td class="pmTextCenter" > <a href="{$base_config_url|atm_nofilter}&activeElement=1&id_element={$columnElement.id_element|intval}" class="ajax_script_load pmIconContainer" title="{if $columnElement.active}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}"><i id="imgActiveElement{$columnElement.id_element|intval}" class="pmIcon pmStatusIcon {if $columnElement.active}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnElement.active}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnElement.active}check{else}clear{/if}{/if}</i></a></td>
                                                        <td class="pmTextCenter" > <a href="{$base_config_url|atm_nofilter}&activeDesktopElement=1&id_element={$columnElement.id_element|intval}" class="ajax_script_load pmIconContainer" title="{if $columnElement.active_desktop}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}"><i id="imgActiveDesktopElement{$columnElement.id_element|intval}" class="pmIcon pmStatusIcon {if $columnElement.active_desktop}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnElement.active_desktop}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnElement.active_desktop}check{else}clear{/if}{/if}</i></a></td>
                                                        <td class="pmTextCenter" > <a href="{$base_config_url|atm_nofilter}&activeMobileElement=1&id_element={$columnElement.id_element|intval}" class="ajax_script_load pmIconContainer" title="{if $columnElement.active_mobile}{l s='Yes' mod='pm_advancedtopmenu'}{else}{l s='No' mod='pm_advancedtopmenu'}{/if}"><i id="imgActiveMobileElement{$columnElement.id_element|intval}" class="pmIcon pmStatusIcon {if $columnElement.active_mobile}active{/if} {if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}{if $columnElement.active_mobile}icon-check{else}icon-remove{/if}">{else}material-icons">{if $columnElement.active_mobile}check{else}clear{/if}{/if}</i></a></td>
                                                    </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    {/if}
                                {else}
                                    <p class="noElementMessage">{l s='No element' mod='pm_advancedtopmenu'}</p>
                                {/if}
                                </div><!-- {$column.id_column|intval} -->
                            {/foreach}
                        {else}
                            <p style="text-align:center;">{l s='No group' mod='pm_advancedtopmenu'}</p>
                        {/if}
                        </div><!-- .columnSort-{$columnWrap.id_wrap|intval} -->
                        <script stype="text/javascript">
                            $(".columnSort-{$columnWrap.id_wrap|intval}").sortable({
                                placeholder: "ui-state-highlight",
                                delay: 300,
                                handle : ".dragColumn",
                                connectWith: ".columnSort",
                                update: function(event, ui) {
                                    // Verify that the container hasn't changed to only trigger an order change,
                                    // otherwise it will be handled by receive as its a column change
                                    if ($(ui.item).parents('.menuColumnWrap').data('id') == $(ui.item).data('column-wrap-id')) {
                                        var orderColumn = $(this).sortable("toArray");
                                        saveOrderColumn(orderColumn.join(","));
                                    }
                                },
                                receive: function(event, ui) {
                                    var newColumnId = parseInt($(event.target).data('id'));
                                    var columnWrapId = parseInt($(ui.item).data('id'));
                                    var orderColumn = $(this).sortable("toArray").join(",");
                                    saveGroupChange(columnWrapId, newColumnId, orderColumn, function () {
                                        $(ui.item).data('column-wrap-id', newColumnId);
                                    });
                                }
                            });
                        </script>
                    </div><!-- #{$columnWrap.id_wrap|intval} -->
                {/foreach}
            {else}
                <p style="text-align:center;">{l s='No column' mod='pm_advancedtopmenu'}</p>
            {/if}
            </div>
        </div><!-- #cont_{$menu.id_menu|intval} -->
    {/foreach}
    </div><!-- #tabsetMenu -->
{else}
    <p style="text-align:center;">{l s='No tab' mod='pm_advancedtopmenu'}</p>
{/if}
<hr />
<div id="wrapFormTab">
    <ul class="nav nav-tabs" id="formTab">
        {if $displayTabElement}
            <li {if $editMenu || (!$editElement && !$editColumn && !$editGroup)} class="active"{/if}>
                <a href="#editMenuFormContainer" data-toggle="tab">
                    <span><i class="atm-icon-tabs"></i>
                    {if $editMenu}{l s='Edit tab' mod='pm_advancedtopmenu'}{else}{l s='Add tab' mod='pm_advancedtopmenu'}{/if}</span>
                </a>
            </li>
        {/if}
        {if isset($menus) && is_array($menus) && count($menus)}
            {if $displayColumnElement}
                <li {if $editColumn} class="active"{/if}>
                    <a href="#editColumnWrapContainer" data-toggle="tab">
                        <span><i class="atm-icon-columns"></i>
                        {if $editColumn}{l s='Edit column' mod='pm_advancedtopmenu'}{else}{l s='Add column' mod='pm_advancedtopmenu'}{/if}</span>
                    </a>
                </li>
            {/if}
            {if $displayGroupElement}
                <li {if $editGroup} class="active"{/if}>
                    <a href="#editColumnContainer" data-toggle="tab">
                        <span><i class="atm-icon-groups"></i>
                        {if $editGroup}{l s='Edit item group' mod='pm_advancedtopmenu'}{else}{l s='Add item group' mod='pm_advancedtopmenu'}{/if}</span>
                    </a>
                </li>
            {/if}
            {if $displayItemElement}
                <li {if $editElement} class="active"{/if}>
                    <a href="#editElementContainer" data-toggle="tab">
                        <span><i class="atm-icon-elements"></i>
                        {if $editElement}{l s='Edit item' mod='pm_advancedtopmenu'}{else}{l s='Add item' mod='pm_advancedtopmenu'}{/if}</span>
                    </a>
                </li>
            {/if}
        {/if}
    </ul>

    <div class="tab-content panel">
        {if $displayTabElement}
            <div id="editMenuFormContainer" class="tab-pane {if $editMenu || (!$editElement && !$editColumn && !$editGroup)}active{/if}">
                {module->outputMenuForm obj=$ObjAdvancedTopMenuClass}
            </div>
        {/if}
        {if isset($menus) && is_array($menus) && count($menus)}
            {if $displayColumnElement}
                <div id="editColumnWrapContainer" class="tab-pane {if $editColumn}active{/if}">
                    {module->outputColumnWrapForm menus=$menus obj=$ObjAdvancedTopMenuColumnWrapClass}
                </div>
            {/if}
            {if $displayGroupElement}
                <div id="editColumnContainer" class="tab-pane {if $editGroup}active{/if}">
                    {module->outputColumnForm menus=$menus cms=$cms manufacturer=$manufacturer supplier=$supplier obj_column=$ObjAdvancedTopMenuColumnClass obj_product=$ObjAdvancedTopMenuProductColumnClass}
                </div>
            {/if}
            {if $displayItemElement}
                <div id="editElementContainer" class="tab-pane {if $editElement}active{/if}">
                    {module->outputElementForm menus=$menus cms=$cms manufacturer=$manufacturer supplier=$supplier obj=$ObjAdvancedTopMenuElementsClass}
                </div>
            {/if}
        {/if}
    </div>
</div>
