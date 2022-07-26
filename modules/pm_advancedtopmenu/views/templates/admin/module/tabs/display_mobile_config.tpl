{if $shopFeatureActive}
    <div class="info">
        <p>{l s='This configuration can be made by shop.' mod='pm_advancedtopmenu'}</p>
    </div>
{/if}
<form action="{$base_config_url|atm_nofilter}#config-3" id="formMobileGlobal_{$module_name|escape:'htmlall':'UTF-8'}" name="form_mobile_{$module_name|escape:'htmlall':'UTF-8'}" method="post" class="form-horizontal" enctype="multipart/form-data">
    <fieldset>
        <h2>{l s='Responsive design settings' mod='pm_advancedtopmenu'}</h2>
        {foreach from=$fieldsOptions item=field key=key}
            {if $key == 'ATM_RESP_TOGGLE_ENABLED' && $ps_major_version >= '17'}
                <h2>{l s='Menu toggle settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_RESP_TOGGLE_HEIGHT' && $ps_major_version == '16'}
                <h2>{l s='Menu toggle settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_RESP_ENABLE_STICKY'}
                <h2 class="mobile_sticky">{l s='Navigation bar settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATM_RESP_MENU_PADDING'}
                <h2>{l s='Tabs settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATMR_SUBMENU_BGCOLOR'}
                <h2>{l s='Submenus settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATMR_COLUMNWRAP_PADDING'}
                <h2>{l s='Columns settings' mod='pm_advancedtopmenu'}</h2>
            {elseif $key == 'ATMR_COLUMN_PADDING'}
                <h2>{l s='Items group settings' mod='pm_advancedtopmenu'}</h2>
                <h4>{l s='Container settings' mod='pm_advancedtopmenu'}</h4>
            {elseif $key == 'ATMR_COLUMNTITLE_PADDING'}
                <h4>{l s='Title settings' mod='pm_advancedtopmenu'}</h4>
            {elseif $key == 'ATMR_COLUMN_ITEM_PADDING'}
                <h2>{l s='Items settings' mod='pm_advancedtopmenu'}</h2>
            {/if}
            {module->outputFormItem key=$key field=$field}
        {/foreach}

        <div class="form-group submitButtonContainer">
            <button type="submit" name="submitATMMobileOptions" class="btn btn-default pull-right">
                <i class="process-icon-save"></i> {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </fieldset>
</form>
