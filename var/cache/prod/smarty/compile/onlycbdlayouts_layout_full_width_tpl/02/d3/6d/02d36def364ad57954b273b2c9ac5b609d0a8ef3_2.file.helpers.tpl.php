<?php
/* Smarty version 3.1.43, created on 2022-07-27 09:53:41
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/helpers.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e0ef0540f1e7_27635948',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '02d36def364ad57954b273b2c9ac5b609d0a8ef3' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/helpers.tpl',
      1 => 1658388333,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62e0ef0540f1e7_27635948 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->smarty->ext->_tplFunction->registerTplFunctions($_smarty_tpl, array (
  'renderLogo' => 
  array (
    'compiled_filepath' => '/Applications/MAMP/htdocs/onlycbd.fr/var/cache/prod/smarty/compile/onlycbdlayouts_layout_full_width_tpl/02/d3/6d/02d36def364ad57954b273b2c9ac5b609d0a8ef3_2.file.helpers.tpl.php',
    'uid' => '02d36def364ad57954b273b2c9ac5b609d0a8ef3',
    'call_name' => 'smarty_template_function_renderLogo_75616096962e0ef053fe571_63296410',
  ),
  'renderLogoWhite' => 
  array (
    'compiled_filepath' => '/Applications/MAMP/htdocs/onlycbd.fr/var/cache/prod/smarty/compile/onlycbdlayouts_layout_full_width_tpl/02/d3/6d/02d36def364ad57954b273b2c9ac5b609d0a8ef3_2.file.helpers.tpl.php',
    'uid' => '02d36def364ad57954b273b2c9ac5b609d0a8ef3',
    'call_name' => 'smarty_template_function_renderLogoWhite_75616096962e0ef053fe571_63296410',
  ),
));
?>

<?php }
/* smarty_template_function_renderLogo_75616096962e0ef053fe571_63296410 */
if (!function_exists('smarty_template_function_renderLogo_75616096962e0ef053fe571_63296410')) {
function smarty_template_function_renderLogo_75616096962e0ef053fe571_63296410(Smarty_Internal_Template $_smarty_tpl,$params) {
foreach ($params as $key => $value) {
$_smarty_tpl->tpl_vars[$key] = new Smarty_Variable($value, $_smarty_tpl->isRenderingCache);
}
?>

  <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['index'], ENT_QUOTES, 'UTF-8');?>
">
    <img class="logo img-fluid" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['src'], ENT_QUOTES, 'UTF-8');?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['name'], ENT_QUOTES, 'UTF-8');?>
" width="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['width'], ENT_QUOTES, 'UTF-8');?>
"
      height="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['height'], ENT_QUOTES, 'UTF-8');?>
">
  </a>
<?php
}}
/*/ smarty_template_function_renderLogo_75616096962e0ef053fe571_63296410 */
/* smarty_template_function_renderLogoWhite_75616096962e0ef053fe571_63296410 */
if (!function_exists('smarty_template_function_renderLogoWhite_75616096962e0ef053fe571_63296410')) {
function smarty_template_function_renderLogoWhite_75616096962e0ef053fe571_63296410(Smarty_Internal_Template $_smarty_tpl,$params) {
foreach ($params as $key => $value) {
$_smarty_tpl->tpl_vars[$key] = new Smarty_Variable($value, $_smarty_tpl->isRenderingCache);
}
?>

  <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['index'], ENT_QUOTES, 'UTF-8');?>
">
    <img class="logo img-fluid" src="./img/logo-white.png" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['name'], ENT_QUOTES, 'UTF-8');?>
" width="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['width'], ENT_QUOTES, 'UTF-8');?>
"
      height="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['height'], ENT_QUOTES, 'UTF-8');?>
">
  </a>
<?php
}}
/*/ smarty_template_function_renderLogoWhite_75616096962e0ef053fe571_63296410 */
}
