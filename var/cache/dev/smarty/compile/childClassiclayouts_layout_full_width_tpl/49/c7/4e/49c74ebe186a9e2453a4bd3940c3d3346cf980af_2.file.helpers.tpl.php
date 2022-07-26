<?php
/* Smarty version 3.1.43, created on 2022-07-20 17:27:38
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/childClassic/templates/_partials/helpers.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62d81eeaee5f97_50788641',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '49c74ebe186a9e2453a4bd3940c3d3346cf980af' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/childClassic/templates/_partials/helpers.tpl',
      1 => 1658243268,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62d81eeaee5f97_50788641 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->smarty->ext->_tplFunction->registerTplFunctions($_smarty_tpl, array (
  'renderLogo' => 
  array (
    'compiled_filepath' => '/Applications/MAMP/htdocs/onlycbd.fr/var/cache/dev/smarty/compile/childClassiclayouts_layout_full_width_tpl/49/c7/4e/49c74ebe186a9e2453a4bd3940c3d3346cf980af_2.file.helpers.tpl.php',
    'uid' => '49c74ebe186a9e2453a4bd3940c3d3346cf980af',
    'call_name' => 'smarty_template_function_renderLogo_167678713862d81eeaedb0e6_36577518',
  ),
));
?> 

<?php }
/* smarty_template_function_renderLogo_167678713862d81eeaedb0e6_36577518 */
if (!function_exists('smarty_template_function_renderLogo_167678713862d81eeaedb0e6_36577518')) {
function smarty_template_function_renderLogo_167678713862d81eeaedb0e6_36577518(Smarty_Internal_Template $_smarty_tpl,$params) {
foreach ($params as $key => $value) {
$_smarty_tpl->tpl_vars[$key] = new Smarty_Variable($value, $_smarty_tpl->isRenderingCache);
}
?>

  <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['index'], ENT_QUOTES, 'UTF-8');?>
">
    <img
      class="logo img-fluid"
      src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['src'], ENT_QUOTES, 'UTF-8');?>
"
      alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['name'], ENT_QUOTES, 'UTF-8');?>
"
      width="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['width'], ENT_QUOTES, 'UTF-8');?>
"
      height="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['shop']->value['logo_details']['height'], ENT_QUOTES, 'UTF-8');?>
">
  </a>
<?php
}}
/*/ smarty_template_function_renderLogo_167678713862d81eeaedb0e6_36577518 */
}
