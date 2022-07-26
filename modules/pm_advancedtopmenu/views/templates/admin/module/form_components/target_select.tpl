<div class="form-group">
    <label class="control-label col-lg-3">{l s='Target' mod='pm_advancedtopmenu'}</label>
    <div class="col-lg-9">
        <select name="target" class="fixed-width-xxl">
        {foreach from=$link_targets key=target item=value}
            <option value="{$target|escape:'htmlall':'UTF-8'}"{if $selected === $target} selected="selected"{/if}>{$value|escape:'htmlall':'UTF-8'}</option>
        {/foreach}
        </select>
    </div>
</div>
