<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group{if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-3">
        {if isset($field.suffix)}
            <div class="input-group fixed-width-md">
                <input type="text" name="{$key|escape:'htmlall':'UTF-8'}" value="{if $val === false && isset($field.default) && $field.default}{$field.default|atm_nofilter}{else}{$val|atm_nofilter}{/if}" size="20" />
                <span class="input-group-addon">{$field.suffix|atm_nofilter}</span>
            </div>
        {else}
            <input {if !empty($field.short)}class="fixed-width-md"{/if} type="text" name="{$key|escape:'htmlall':'UTF-8'}" value="{if $val === false && isset($field.default) && $field.default}{$field.default|atm_nofilter}{else}{$val|atm_nofilter}{/if}" size="20" />
        {/if}
        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
