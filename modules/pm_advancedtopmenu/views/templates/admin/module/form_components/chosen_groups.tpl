<div class="privacy chosen_groups"{if $object && $object->privacy == 3}{else} style="display:none;"{/if}>
    <div class="form-group">
        <label class="control-label col-lg-3">{l s='Groups' mod='pm_advancedtopmenu'}</label>
        <div class="col-lg-9">
            {foreach from=$groups item=group}
                <input type="checkbox" name="chosen_groups[]" value="{$group.id_group|intval}" {if $object && is_array($object->chosen_groups) && in_array((int)$group['id_group'], $object->chosen_groups)} checked="checked"{/if} />&nbsp;{$group.name|escape:'htmlall':'UTF-8'}
                <br/>
            {/foreach}
        </div>
    </div>
</div>
