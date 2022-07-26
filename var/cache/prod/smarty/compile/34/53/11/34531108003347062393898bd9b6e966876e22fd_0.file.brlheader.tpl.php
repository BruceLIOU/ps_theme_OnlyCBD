<?php
/* Smarty version 3.1.43, created on 2022-07-26 14:36:49
  from '/Applications/MAMP/htdocs/onlycbd.fr/modules/brlcustomblocks/views/templates/admin/brlheader.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dfdfe1cf5072_41045747',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '34531108003347062393898bd9b6e966876e22fd' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/modules/brlcustomblocks/views/templates/admin/brlheader.tpl',
      1 => 1658331070,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62dfdfe1cf5072_41045747 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="panel fondBrlDegrade">
    <div class="row brlHeader">
        <div class="col-md-6 brlHeaderColWidth">
            <div class="brlHeaderCenterDoc">
                <a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['module_dir']->value,'htmlall','UTF-8' ));
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'readme_en','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
.pdf" target="_blank" class="brlHeaderLink"><img src="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['module_dir']->value,'htmlall','UTF-8' ));?>
views/img/readme.png" class="brlHeaderDoc"><br>
                <strong class="brlHeaderReadMe"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'READ ME','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</strong></a>
            </div>
        </div>
        <div class="col-md-6 brlHeaderAlign">
            <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'https://addons.prestashop.com/en/2_community-developer?contributor=217031','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
" target="_blank" class="brlHeaderLogoStyle"><img class="brlHeaderLogo" src="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['module_dir']->value,'htmlall','UTF-8' ));?>
views/img/logo-autour-du-digital-addons-ps-blanc.png"></a>
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'https://addons.prestashop.com/en/2_community-developer?contributor=217031','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
" target="_blank" class="brlHeaderLinkModulesStyle">
            <?php if ((version_compare(_PS_VERSION_,'1.7.0.0','<'))) {?>
				<i class="icon-AdminParentModules" style="font-size: 45px;"></i><br>
            <?php } else { ?>
				<i class="material-icons brlHeaderIconModulesStyle">view_module</i><br>
            <?php }?>
                <strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Our modules','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</strong>
			</a>
        </div>
    </div>
</div>

<div class="panel">
    <h3><i class="icon icon-tags"></i> <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Presentation','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>
</h3>
    <p>
        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'This module allows you to create your own blocks and place them wherever you want.','mod'=>'brlcustomblocks'),$_smarty_tpl ) );?>

    </p>
</div><?php }
}
