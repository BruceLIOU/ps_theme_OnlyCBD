<div class="form-group">
    <label class="control-label col-lg-3">{l s='CMS category' mod='pm_advancedtopmenu'}</label>
    <div class="col-lg-9">
        <select name="id_cms_category" class="fixed-width-xxl">
            <option value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
            {foreach from=$cmsCategoriesList item=cmsCategory}
                <option value="{$cmsCategory.id_cms_category|intval}"{if $selected == $cmsCategory.id_cms_category} selected="selected"{/if}>
                    {str_repeat('- ', $cmsCategory.level_depth - 1)|escape:'htmlall':'UTF-8'} {$cmsCategory.name|escape:'htmlall':'UTF-8'}
                </option>
            {/foreach}
        </select>
    </div>
</div>
