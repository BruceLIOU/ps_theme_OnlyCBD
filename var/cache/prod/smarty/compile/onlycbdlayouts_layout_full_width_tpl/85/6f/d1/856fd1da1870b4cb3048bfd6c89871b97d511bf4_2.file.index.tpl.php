<?php
/* Smarty version 3.1.43, created on 2022-07-27 09:19:30
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e0e702641177_83519629',
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
function content_62e0e702641177_83519629 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_97852103062e0e702639f35_64394477', 'page_content_container');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_2681523962e0e70263b581_41015068 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_67073079462e0e70263d437_57313646 extends Smarty_Internal_Block
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
class Block_168507682662e0e70263c898_56395313 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_67073079462e0e70263d437_57313646', 'hook_home', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_97852103062e0e702639f35_64394477 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_97852103062e0e702639f35_64394477',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_2681523962e0e70263b581_41015068',
  ),
  'page_content' => 
  array (
    0 => 'Block_168507682662e0e70263c898_56395313',
  ),
  'hook_home' => 
  array (
    0 => 'Block_67073079462e0e70263d437_57313646',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <section id="content" class="page-home">
    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_2681523962e0e70263b581_41015068', 'page_content_top', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_168507682662e0e70263c898_56395313', 'page_content', $this->tplIndex);
?>

  </section>
<?php
}
}
/* {/block 'page_content_container'} */
}
