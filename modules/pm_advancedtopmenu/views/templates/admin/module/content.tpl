{$css_js_assets|atm_nofilter}

<div id="pm_backoffice_wrapper" class="pm_bo_ps_{$ps_major_version|escape:'htmlall':'UTF-8'}">
    <fieldset class="panel">
        {$rating_invite|atm_nofilter}

        <div id="wrapConfigTab">
            <ul class="nav nav-tabs" id="configTab">
                <li class="active"><a href="#config-1" data-toggle="tab">{l s='Menu configuration' mod='pm_advancedtopmenu'}</a></li>
                <li><a href="#config-2" data-toggle="tab">{l s='General settings' mod='pm_advancedtopmenu'}</a></li>
                <li><a href="#config-3" data-toggle="tab">{l s='Mobile settings' mod='pm_advancedtopmenu'}</a></li>
                <li><a href="#config-4" data-toggle="tab">{l s='Maintenance' mod='pm_advancedtopmenu'}</a></li>
                <li><a href="#config-5" data-toggle="tab">{l s='Advanced styles' mod='pm_advancedtopmenu'}</a></li>
            </ul>
            <div class="tab-content panel">
                <div class="tab-pane active" id="config-1">{$display_form|atm_nofilter}</div>
                <div class="tab-pane" id="config-2">{$display_config|atm_nofilter}</div>
                <div class="tab-pane" id="config-3">{$display_mobile_config|atm_nofilter}</div>
                <div class="tab-pane" id="config-4">{$display_maintenance|atm_nofilter}</div>
                <div class="tab-pane" id="config-5">{$display_advanced_styles|atm_nofilter}</div>
            </div>
        </div>

        {module->displaySupport}
    </fieldset>
</div>

{* Init color picker *}
<script type="text/javascript">
$(document).ready(function() {
    var currentColorPicker = false;
    $('input[class="pm_colorpicker"]').ColorPicker({
        onSubmit: function(hsb, hex, rgb, el) {
            $(el).val("#"+hex);
            $(el).ColorPickerHide();
        },
        onBeforeShow: function () {
            currentColorPicker = $(this);
            $(this).ColorPickerSetColor(this.value);
        },
        onChange: function (hsb, hex, rgb) {
            $(currentColorPicker).val("#"+hex);
            $(currentColorPicker).css('borderLeft', '5px solid #'+hex);
        }
    }).bind("keyup", function(){
        $(this).ColorPickerSetColor(this.value);
    });

    $('.pm_colorpicker').each(function (i,e) {
        if ($(e).val().length > 0) {
            $(e).css('borderLeft', '5px solid '+$(e).val());
        }
    });
});
</script>
