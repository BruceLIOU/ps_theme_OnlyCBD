<div id="{$key|strtolower|escape:'htmlall':'UTF-8'}-field" class="form-group{if isset($field.class) && $field.class} {$field.class|escape:'htmlall':'UTF-8'}{/if}">
    <label class="control-label col-lg-3">{$field.title|escape:'htmlall':'UTF-8'}</label>
    <div class="col-lg-9">
        {foreach from=$languages item=language}
            <div id="{$key|escape:'htmlall':'UTF-8'}_{$language.id_lang|intval}" style="display: {if $language.id_lang == $default_language}block{else}none{/if}; float: left;">
              <input size="{$field.size|intval}" type="text" name="{$key|escape:'htmlall':'UTF-8'}_{$language.id_lang|intval}" value="{$lang_values[intval($language.id_lang)]|atm_nofilter}" />
            </div>
        {/foreach}
        {module->displayFlags languages=$languages default_language=$default_language ids={$key|escape:'htmlall':'UTF-8'} id={$key|escape:'htmlall':'UTF-8'} return=true}
        <div class="clear"></div>

        {if isset($field.desc) && !empty($field.desc)}
            <p class="help-block">
                {$field.desc}
            </p>
        {/if}
    </div>
</div>
