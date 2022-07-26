<div class="form-group">
    <label class="control-label col-lg-3">{l s='CMS' mod='pm_advancedtopmenu'}</label>
    <div class="col-lg-9">
        <select name="id_cms" class="fixed-width-xxl">
            <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
            {foreach from=$cmsList item=cms}
                <option value="{$cms.id_cms|intval}"{if $selected == $cms.id_cms} selected="selected"{/if}>
                    {$cms.meta_title|escape:'htmlall':'UTF-8'}
                </option>
            {/foreach}
        </select>
    </div>
</div>
