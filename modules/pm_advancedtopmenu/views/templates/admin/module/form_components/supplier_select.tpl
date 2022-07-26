<div class="form-group">
    <label class="control-label col-lg-3">{l s='Supplier' mod='pm_advancedtopmenu'}</label>
    <div class="col-lg-9">
        <select name="id_supplier" class="fixed-width-xxl">
            <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
            {foreach from=$supplierList item=supplier}
                <option value="{$supplier.id_supplier|intval}"{if $selected == $supplier.id_supplier} selected="selected"{/if}>
                    {$supplier.name|escape:'htmlall':'UTF-8'}
                </option>
            {/foreach}
        </select>
    </div>
</div>
