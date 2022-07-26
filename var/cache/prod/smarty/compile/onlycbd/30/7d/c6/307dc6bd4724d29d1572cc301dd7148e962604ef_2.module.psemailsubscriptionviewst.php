<?php
/* Smarty version 3.1.43, created on 2022-07-26 14:09:06
  from 'module:psemailsubscriptionviewst' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dfd9626529d0_26802718',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '307dc6bd4724d29d1572cc301dd7148e962604ef' => 
    array (
      0 => 'module:psemailsubscriptionviewst',
      1 => 1658569048,
      2 => 'module',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62dfd9626529d0_26802718 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="block_newsletter col-lg-8 col-md-12 col-sm-12" id="blockEmailSubscription_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hookName']->value, ENT_QUOTES, 'UTF-8');?>
">
  <div class="row containerNewsletter">
    <p id="block-newsletter-label" class="col-md-7 col-xs-12">
      <span class="label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>"S'inscrire à notre newletter",'d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</span>
      <span id="block-newsletter-label-description">
        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>"Soyez prévenu de nos dernières offres.",'d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>
</span>
    </p>
    <div class="col-md-5 col-xs-12">
      <form action="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['current_url'], ENT_QUOTES, 'UTF-8');?>
#blockEmailSubscription_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hookName']->value, ENT_QUOTES, 'UTF-8');?>
" method="post">
        <div class="">
          <div class="col-xs-12">
                                    <div class="input-wrapper">
              <input name="email" type="email" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['value']->value, ENT_QUOTES, 'UTF-8');?>
"
                placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'Your email address','d'=>'Shop.Forms.Labels'),$_smarty_tpl ) );?>
" aria-labelledby="block-newsletter-label"
                required>
              <button name="submitNewsletter" type="submit"><i class="material-icons">mail</i></button>
            </div>
            <input type="hidden" name="blockHookName" value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['hookName']->value, ENT_QUOTES, 'UTF-8');?>
" />
            <input type="hidden" name="action" value="0">
            <div class="clearfix"></div>
          </div>
          <div class="col-xs-12">
            <?php if ($_smarty_tpl->tpl_vars['conditions']->value) {?>
              <p><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['conditions']->value, ENT_QUOTES, 'UTF-8');?>
</p>
            <?php }?>
            <?php if ($_smarty_tpl->tpl_vars['msg']->value) {?>
              <p class="alert <?php if ($_smarty_tpl->tpl_vars['nw_error']->value) {?>alert-danger<?php } else { ?>alert-success<?php }?>">
                <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['msg']->value, ENT_QUOTES, 'UTF-8');?>

              </p>
            <?php }?>
            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNewsletterRegistration'),$_smarty_tpl ) );?>

            <?php if ((isset($_smarty_tpl->tpl_vars['id_module']->value))) {?>
              <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayGDPRConsent','id_module'=>$_smarty_tpl->tpl_vars['id_module']->value),$_smarty_tpl ) );?>

            <?php }?>
          </div>
        </div>
      </form>
    </div>
  </div>
</div><?php }
}
