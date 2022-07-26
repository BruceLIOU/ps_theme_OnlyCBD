<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group{if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-9">
        <select class="fixed-width-xxl" id="{$key|escape:'htmlall':'UTF-8'}" name="{$key|escape:'htmlall':'UTF-8'}"{if isset($field.onchange) && $field.onchange} onchange="{$field.onchange|atm_nofilter}"{/if}>
        {foreach from=$field.list item=value}
            <option value="{$value[$field.identifier]|escape:'htmlall':'UTF-8'}"{if $value.is_selected} selected="selected"{/if}>{$value.name|escape:'htmlall':'UTF-8'}</option>
        {/foreach}
        </select>
        {if isset($field['onchange']) && $field['onchange']}
        <script type="text/javascript">
        $(document).ready(function() {
            $("select#{$key|escape:'htmlall':'UTF-8'}").trigger("change");
        });
        </script>
        {/if}

        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
