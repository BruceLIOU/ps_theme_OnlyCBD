<?php
/* Smarty version 3.1.43, created on 2022-07-27 11:35:42
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e106eee78d03_00049905',
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
function content_62e106eee78d03_00049905 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_3123497362e106eee6a297_66582407', 'page_content_container');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_33222392362e106eee6b0d2_85586278 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_193696187962e106eee6dc49_16802189 extends Smarty_Internal_Block
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
class Block_60371161562e106eee6c504_06346597 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_193696187962e106eee6dc49_16802189', 'hook_home', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_3123497362e106eee6a297_66582407 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_3123497362e106eee6a297_66582407',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_33222392362e106eee6b0d2_85586278',
  ),
  'page_content' => 
  array (
    0 => 'Block_60371161562e106eee6c504_06346597',
  ),
  'hook_home' => 
  array (
    0 => 'Block_193696187962e106eee6dc49_16802189',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <section id="content" class="page-home">
    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_33222392362e106eee6b0d2_85586278', 'page_content_top', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_60371161562e106eee6c504_06346597', 'page_content', $this->tplIndex);
?>

  </section>
<?php
}
}
/* {/block 'page_content_container'} */
}
