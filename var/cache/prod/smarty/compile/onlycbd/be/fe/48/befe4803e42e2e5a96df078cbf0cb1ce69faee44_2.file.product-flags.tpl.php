<?php
/* Smarty version 3.1.43, created on 2022-07-26 14:09:04
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/catalog/_partials/product-flags.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dfd9605cd0e3_15134434',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'befe4803e42e2e5a96df078cbf0cb1ce69faee44' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/catalog/_partials/product-flags.tpl',
      1 => 1658591503,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62dfd9605cd0e3_15134434 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_21504752362dfd9605c6b39_88875340', 'product_flags');
}
/* {block 'product_flags'} */
class Block_21504752362dfd9605c6b39_88875340 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'product_flags' => 
  array (
    0 => 'Block_21504752362dfd9605c6b39_88875340',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

    <ul class="product-flags js-product-flags">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['product']->value['price'], 'price');
$_smarty_tpl->tpl_vars['price']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['price']->value) {
$_smarty_tpl->tpl_vars['price']->do_else = false;
?>
            <li class="product-flag price <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['flag']->value['type'], ENT_QUOTES, 'UTF-8');?>
"><span class="ribbonPrice"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['price'], ENT_QUOTES, 'UTF-8');?>
</span></li>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </ul>
<?php
}
}
/* {/block 'product_flags'} */
}
