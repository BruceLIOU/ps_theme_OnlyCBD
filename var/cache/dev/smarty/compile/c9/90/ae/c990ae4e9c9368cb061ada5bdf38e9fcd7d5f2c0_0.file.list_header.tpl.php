<?php
/* Smarty version 3.1.43, created on 2022-07-20 13:35:17
  from '/Applications/MAMP/htdocs/onlycbd.fr/admin456gk9jee/themes/default/template/controllers/attributes_groups/helpers/list/list_header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62d7e8759df928_28241084',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c990ae4e9c9368cb061ada5bdf38e9fcd7d5f2c0' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/admin456gk9jee/themes/default/template/controllers/attributes_groups/helpers/list/list_header.tpl',
      1 => 1658235179,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62d7e8759df928_28241084 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_60026091462d7e8759dd7d0_33245551', 'leadin');
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "helpers/list/list_header.tpl");
}
/* {block 'leadin'} */
class Block_60026091462d7e8759dd7d0_33245551 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'leadin' => 
  array (
    0 => 'Block_60026091462d7e8759dd7d0_33245551',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<?php echo '<script'; ?>
 type="text/javascript">
		$(document).ready(function() {
			$(location.hash).click();
		});
	<?php echo '</script'; ?>
>
<?php
}
}
/* {/block 'leadin'} */
}
