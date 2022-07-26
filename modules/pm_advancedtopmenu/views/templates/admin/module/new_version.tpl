{$css_js_assets|atm_nofilter}

<fieldset class="panel">
    <p class="newVersionContainer alert alert-info">
        <span>{l s='We have detected that you installed a new version of the module on your shop' mod='pm_advancedtopmenu'}</span>
        <a href="{$base_config_url|atm_nofilter}&makeUpdate=1" class="btn btn-info">
            {l s='Please click here in order to finish the installation process' mod='pm_advancedtopmenu'}
        </a>
    </p>

    {module->displaySupport}
</fieldset>
