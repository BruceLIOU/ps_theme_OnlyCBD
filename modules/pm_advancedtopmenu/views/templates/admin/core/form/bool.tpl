<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group {if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-9">
        <span class="switch prestashop-switch fixed-width-lg">
            <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}" id="{$key|escape:'htmlall':'UTF-8'}_on" value="1"{if $val} checked="checked"{/if}{if isset($field.disable) && $field.disable} disabled="disabled"{/if} />
            <label for="{$key|escape:'htmlall':'UTF-8'}_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

            <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}" id="{$key|escape:'htmlall':'UTF-8'}_off" value="0"{if !$val} checked="checked"{/if}{if isset($field.disable) && $field.disable} disabled="disabled"{/if} />
            <label for="{$key|escape:'htmlall':'UTF-8'}_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

            <a class="slide-button btn"></a>
        </span>

        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
