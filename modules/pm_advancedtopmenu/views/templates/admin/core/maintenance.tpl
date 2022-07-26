<form action="{$base_config_url|atm_nofilter}" method="post" id="maintenance_{$module_name|escape:'htmlall':'UTF-8'}" name="maintenance_{$module_name|escape:'htmlall':'UTF-8'}" method="post" enctype="multipart/form-data" class="form-horizontal">
    <fieldset>
        <h2>{l s='Maintenance mode' mod='pm_advancedtopmenu'}</h2>
        <div class="form-group">
            <label class="control-label col-lg-3">{l s='Enable Maintenance mode?' mod='pm_advancedtopmenu'}</label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="activeMaintenance" id="maintenance_on" value="1" {if $pm_maintenance} checked="checked" {/if}/>
                    <label for="maintenance_on"> {l s='Yes' mod='pm_advancedtopmenu'}</label>

                    <input type="radio" name="activeMaintenance" id="maintenance_off" value="0" {if !$pm_maintenance} checked="checked" {/if} />
                    <label for="maintenance_off"> {l s='No' mod='pm_advancedtopmenu'}</label>

                    <a class="slide-button btn"></a>
                </span>
                <p class="help-block">
                    {l s='In Maintenance mode, only the IP addresses registered in the maintenance mode of PrestaShop will see the module.' mod='pm_advancedtopmenu'}
                    {l s='You can add IPs here:' mod='pm_advancedtopmenu'}
                    <a href="{$maintenanceTabUrl|atm_nofilter}" style="text-decoration:underline;">
                        {l s='Preferences Panel.' mod='pm_advancedtopmenu'}
                    </a>
                </p>
            </div>
        </div>

        <div class="form-group submitButtonContainer">
            <button type="submit" class="btn btn-default pull-right">
                <i class="process-icon-save"></i>
                {l s='   Save   ' mod='pm_advancedtopmenu'}
            </button>
        </div>
    </fieldset>
</form>
