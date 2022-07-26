<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group{if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-9">
        <div class="input-group col-lg-2">
            <input data-hex="true" type="color" name="{$key|escape:'htmlall':'UTF-8'}" value="{if $val === false && isset($field.default) && $field.default}{$field.default|atm_nofilter}{else}{$val|atm_nofilter}{/if}" size="20" class="color mColorPicker" />{if isset($field.suffix)}{$field.suffix|atm_nofilter}{/if}
        </div>

        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
