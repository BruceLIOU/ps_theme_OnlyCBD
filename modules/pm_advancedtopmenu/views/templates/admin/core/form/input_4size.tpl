<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group{if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-9 fourSizeContainer">
        <span>{l s='top' mod='pm_advancedtopmenu'}</span> <input size="3" type="text" name="{$key|escape:'htmlall':'UTF-8'}[]" value="{if isset($borders_size_tab) && is_array($borders_size_tab)}{$borders_size_tab.0|intval}{else}0{/if}" /> &nbsp;
        <span>{l s='right' mod='pm_advancedtopmenu'}</span> <input size="3" type="text" name="{$key|escape:'htmlall':'UTF-8'}[]" value="{if isset($borders_size_tab) && is_array($borders_size_tab)}{$borders_size_tab.1|intval}{else}0{/if}" /> &nbsp;
        <span>{l s='bottom' mod='pm_advancedtopmenu'}</span> <input size="3" type="text" name="{$key|escape:'htmlall':'UTF-8'}[]" value="{if isset($borders_size_tab) && is_array($borders_size_tab)}{$borders_size_tab.2|intval}{else}0{/if}" /> &nbsp;
        <span>{l s='left' mod='pm_advancedtopmenu'}</span> <input size="3" type="text" name="{$key|escape:'htmlall':'UTF-8'}[]" value="{if isset($borders_size_tab) && is_array($borders_size_tab)}{$borders_size_tab.3|intval}{else}0{/if}" />

        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
