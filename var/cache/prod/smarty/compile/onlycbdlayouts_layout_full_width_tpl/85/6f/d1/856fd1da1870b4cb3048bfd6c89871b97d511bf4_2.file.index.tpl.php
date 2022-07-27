<?php
/* Smarty version 3.1.43, created on 2022-07-27 09:53:12
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e0eee8cbd400_61572652',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '856fd1da1870b4cb3048bfd6c89871b97d511bf4' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/index.tpl',
      1 => 1658739396,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62e0eee8cbd400_61572652 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_49353253762e0eee8cb3494_41581443', 'page_content_container');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_150655415862e0eee8cb43e5_58383746 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_22992962762e0eee8cb6688_81719149 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

                <?php echo $_smarty_tpl->tpl_vars['HOOK_HOME']->value;?>

        <div class='displayHookCustomBlocks_853'><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayHookCustomBlocks','idHookCustomblocks'=>'853'),$_smarty_tpl ) );?>
</div>
      <?php
}
}
/* {/block 'hook_home'} */
/* {block 'page_content'} */
class Block_206759782962e0eee8cb58e9_00500386 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_22992962762e0eee8cb6688_81719149', 'hook_home', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_49353253762e0eee8cb3494_41581443 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_49353253762e0eee8cb3494_41581443',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_150655415862e0eee8cb43e5_58383746',
  ),
  'page_content' => 
  array (
    0 => 'Block_206759782962e0eee8cb58e9_00500386',
  ),
  'hook_home' => 
  array (
    0 => 'Block_22992962762e0eee8cb6688_81719149',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <section id="content" class="page-home">
    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_150655415862e0eee8cb43e5_58383746', 'page_content_top', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_206759782962e0eee8cb58e9_00500386', 'page_content', $this->tplIndex);
?>

  </section>
<?php
}
}
/* {/block 'page_content_container'} */
}
