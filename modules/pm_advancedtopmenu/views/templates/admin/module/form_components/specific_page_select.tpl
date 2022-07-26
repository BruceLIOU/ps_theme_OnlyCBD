<div class="form-group">
    <label class="control-label col-lg-3">{l s='Specific page' mod='pm_advancedtopmenu'}</label>
    <div class="col-lg-9">
        <select name="id_specific_page" class="fixed-width-xxl">
            <option {if empty($selected)}selected="selected"{/if} value="">-- {l s='Choose' mod='pm_advancedtopmenu'} --</option>
            {foreach from=$pagesList item=page}
                <option value="{$page.page|escape:'htmlall':'UTF-8'}"{if !empty($selected) && $selected == $page.page} selected="selected"{/if}>
                    {if !empty($page.title)}{$page.title|escape:'htmlall':'UTF-8'}{else}{$page.page|escape:'htmlall':'UTF-8'}{/if}
                </option>
            {/foreach}
        </select>
    </div>
</div>
