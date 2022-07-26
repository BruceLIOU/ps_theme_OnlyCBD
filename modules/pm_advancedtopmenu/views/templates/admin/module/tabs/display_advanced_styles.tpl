<form action="{$base_config_url|atm_nofilter}#config-4" id="formAdvancedStyles_{$module_name|escape:'htmlall':'UTF-8'}" name="formAdvancedStyles_{$module_name|escape:'htmlall':'UTF-8'}" method="post" class="form-horizontal">
    <fieldset>
        <h2>{l s='Advanced styles' mod='pm_advancedtopmenu'}</h2>
        {foreach from=$fieldsOptions item=field key=key}
            {module->outputFormItem key=$key field=$field}
            {if $key == 'ATM_CONT_CLASSES' && version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '>=')}
            <p class="col-lg-offset-3 col-lg-9">
                <small>
                    <em>{l s='Recommended value when using displayTop hook:' mod='pm_advancedtopmenu'}</em> <code>col-lg-8 col-md-7</code><br />
                    <em>{l s='Recommended value when using displayNavFullWidth hook:' mod='pm_advancedtopmenu'}</em> <code>container</code><br /><br />
                </small>
            </p>
            {/if}
        {/foreach}
        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Custom CSS rules' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <div class="dynamicTextarea">
                    <textarea name="advancedConfig" id="advancedConfig" cols="120" rows="30">{$advancedStylesContent|atm_nofilter}</textarea>
                </div>
            </div>
        </div>
        <br />

        <div class="form-group submitButtonContainer">
            <button type="submit" name="submitAdvancedConfig" class="btn btn-default pull-right">
                <i class="process-icon-save"></i>
                {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </fieldset>
</form>
<script type="text/javascript">
    $(document).on('click', 'a[href="#config-5"]', function () {
        // Check if it's not already defined
        if ($('.CodeMirror').length <= 0) {
            var editor = CodeMirror.fromTextArea(document.getElementById("advancedConfig"), {
                lineNumbers: true,
                autofocus: false,
            });
        }
    });
</script>
