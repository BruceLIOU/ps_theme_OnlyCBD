<span class="pmIconContainer"><i class="{if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}icon-AdminParentCustomer">{else}material-icons">account_circle{/if}</i></span>
{if !$privacy}
 {l s='For all' mod='pm_advancedtopmenu'}
{elseif $privacy == 1}
 {l s='Only for visitors' mod='pm_advancedtopmenu'}
{elseif $privacy == 2}
 {l s='Only for registered users' mod='pm_advancedtopmenu'}
{elseif $privacy == 3}
 {l s='Only for groups of customers' mod='pm_advancedtopmenu'}
{/if}
