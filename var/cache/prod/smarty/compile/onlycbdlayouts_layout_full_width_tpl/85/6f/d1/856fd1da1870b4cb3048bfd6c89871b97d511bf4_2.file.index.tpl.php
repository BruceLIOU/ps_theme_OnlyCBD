<?php
/* Smarty version 3.1.43, created on 2022-07-26 14:09:04
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dfd9607009c2_86755434',
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
function content_62dfd9607009c2_86755434 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_102693549462dfd9606f8f85_84024098', 'page_content_container');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'page.tpl');
}
/* {block 'page_content_top'} */
class Block_121914298062dfd9606fa225_09534639 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'hook_home'} */
class Block_209164336162dfd9606fc4c1_04474337 extends Smarty_Internal_Block
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
class Block_65080301462dfd9606fb817_98298524 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_209164336162dfd9606fc4c1_04474337', 'hook_home', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_102693549462dfd9606f8f85_84024098 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page_content_container' => 
  array (
    0 => 'Block_102693549462dfd9606f8f85_84024098',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_121914298062dfd9606fa225_09534639',
  ),
  'page_content' => 
  array (
    0 => 'Block_65080301462dfd9606fb817_98298524',
  ),
  'hook_home' => 
  array (
    0 => 'Block_209164336162dfd9606fc4c1_04474337',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <section id="content" class="page-home">
    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_121914298062dfd9606fa225_09534639', 'page_content_top', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_65080301462dfd9606fb817_98298524', 'page_content', $this->tplIndex);
?>

  </section>
<?php
}
}
/* {/block 'page_content_container'} */
}