{if $shopFeatureActive}
    <div class="info">
        <p>{l s='This configuration can be made by shop.' mod='pm_advancedtopmenu'}</p>
    </div>
{/if}
<form action="{$base_config_url|atm_nofilter}#config-2" id="formGlobal_{$module_name|escape:'htmlall':'UTF-8'}" name="form_{$module_name|escape:'htmlall':'UTF-8'}" method="post" class="form-horizontal" enctype="multipart/form-data">
    <fieldset>
        <h2>{l s='General settings' mod='pm_advancedtopmenu'}</h2>
        {foreach from=$fieldsOptions item=field key=key}
            {if $key == 'ATM_MENU_CONT_PADDING'}
                <h2>{l s='Menu container settings' mod='pm_advancedtopmenu'} <small>(#adtm_menu)</small></h2>
            {elseif $key == 'ATM_MENU_GLOBAL_ACTIF'}
                <h2>{l s='Navigation bar settings' mod='pm_advancedtopmenu'} <small>(#adtm_menu_inner)</small></h2>
            {elseif $key == 'ATM_MENU_CENTER_TABS'}
                <h2>{l s='Tabs settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_SUBMENU_WIDTH'}
                <h2>{l s='Submenus settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_COLUMNWRAP_PADDING'}
                <h2>{l s='Columns settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_COLUMN_PADDING'}
                <h2>{l s='Items group settings' mod='pm_advancedtopmenu'}</h2>
                <h4>{l s='Container settings' mod='pm_advancedtopmenu'}</h4>
            {elseif $key == 'ATM_COLUMNTITLE_PADDING'}
                <h4>{l s='Title settings' mod='pm_advancedtopmenu'}</h4>
            {elseif $key == 'ATM_COLUMN_ITEM_PADDING'}
                <h2>{l s='Items settings' mod='pm_advancedtopmenu'}</h2>
            {/if}
            {module->outputFormItem key=$key field=$field}
        {/foreach}

        <div class="form-group submitButtonContainer">
            <button type="submit" name="submitATMOptions" class="btn btn-default pull-right">
                <i class="process-icon-save"></i> {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </fieldset>
</form>
