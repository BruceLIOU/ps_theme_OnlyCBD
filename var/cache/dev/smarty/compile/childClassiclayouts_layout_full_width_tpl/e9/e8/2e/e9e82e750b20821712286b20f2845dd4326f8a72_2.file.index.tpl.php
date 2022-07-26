<?php
/* Smarty version 3.1.43, created on 2022-07-20 17:27:36
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/childClassic/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62d81ee877f0d8_91553078',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e9e82e750b20821712286b20f2845dd4326f8a72' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/childClassic/templates/index.tpl',
      1 => 1658316652,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62d81ee877f0d8_91553078 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_53723965262d81ee8779c04_90788736', 'page_content_container');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_195790630562d81ee877a8d4_41296611 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_47508503362d81ee877c688_05484949 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

        <?php echo $_smarty_tpl->tpl_vars['HOOK_HOME']->value;?>

      <?php
}
}
/* {/block 'hook_home'} */
/* {block 'page_content'} */
class Block_22584178962d81ee877bb14_56658515 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_47508503362d81ee877c688_05484949', 'hook_home', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_53723965262d81ee8779c04_90788736 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_53723965262d81ee8779c04_90788736',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_195790630562d81ee877a8d4_41296611',
  ),
  'page_content' => 
  array (
    0 => 'Block_22584178962d81ee877bb14_56658515',
  ),
  'hook_home' => 
  array (
    0 => 'Block_47508503362d81ee877c688_05484949',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <section id="content" class="page-home">
    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_195790630562d81ee877a8d4_41296611', 'page_content_top', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_22584178962d81ee877bb14_56658515', 'page_content', $this->tplIndex);
?>

  </section>
<?php
}
}
/* {/block 'page_content_container'} */
}
