<?php
/* Smarty version 3.1.43, created on 2022-07-25 20:40:18
  from '/Applications/MAMP/htdocs/onlycbd.fr/modules/brlcustomblocks/views/templates/admin/brlfooter.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dee3927997e0_83740011',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8014b3252889bbbee0e44741c87caa54e47330c8' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/modules/brlcustomblocks/views/templates/admin/brlfooter.tpl',
      1 => 1658331070,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62dee3927997e0_83740011 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="panel panelFooterBrl">
    <div class="row">
        <?php if ((!empty(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_id_product']->value,'htmlall','UTF-8' ))))) {?>
        <div class="col-md-4">
        <?php } else { ?>
        <div class="col-md-6">
        <?php }?>
            <?php if ((version_compare(_PS_VERSION_,'1.7.0.0','<'))) {?>
            <h3 class="brlFooterIconAlign brlFooterH3"><strong>Informations</strong></h3>
            <?php } else { ?>
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons brlFooterIcon">info_outline</i><strong>Informations</strong></h3>
            <?php }?>
            <p>
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Module version','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
 : <strong><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_module_version']->value,'htmlall','UTF-8' ));?>
</strong><br>
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Prestashop version','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
 : <strong><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_ps_version']->value,'htmlall','UTF-8' ));?>
</strong><br>
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'PHP version','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
 : <strong><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_php_version']->value,'htmlall','UTF-8' ));?>
</strong>
            </p><br><br>
        </div>
        <?php if ((!empty(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_id_product']->value,'htmlall','UTF-8' ))))) {?>
        <div class="col-md-4">
            <?php if ((version_compare(_PS_VERSION_,'1.7.0.0','<'))) {?>
            <h3 class="brlFooterIconAlign brlFooterH3"><strong>Support</strong></h3> 
            <?php } else { ?>
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons mi-chat brlFooterIcon">chat</i><strong>Support</strong></h3> 
            <?php }?>
            <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'https://addons.prestashop.com/en/contact-us?id_product=','mod'=>'brlcustomblocks'),$_smarty_tpl ) );
echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_id_product']->value,'htmlall','UTF-8' ));?>
" target="_blank" class="brlFooterLinkColor">&raquo; <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Contact the after-sales service','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</a><br><br><br>
        </div>
        <?php }?>
        <?php if ((!empty(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['brl_id_product']->value,'htmlall','UTF-8' ))))) {?>
        <div class="col-md-4">
        <?php } else { ?>
        <div class="col-md-6">
        <?php }?>
            <?php if ((version_compare(_PS_VERSION_,'1.7.0.0','<'))) {?>
            <h3 class="brlFooterIconAlign brlFooterH3"><strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Add-on','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</strong></h3> 
            <?php } else { ?>
            <h3 class="brlFooterIconAlign brlFooterH3"><i class="material-icons brlFooterIcon">extension</i><strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Add-on','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</strong></h3>
            <?php }?>
            <p><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'With our module','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
 : <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'https://addons.prestashop.com/en/page-customization/42174-custom-css-and-js.html','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
" target="_blank"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Custom CSS and JS','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</a><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>', you can add custom CSS styles to your blocks.','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</p><br><br>
        </div>
    </div>
</div><?php }
}
