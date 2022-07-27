<?php
/* Smarty version 3.1.43, created on 2022-07-27 09:53:41
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/page.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e0ef053aa737_75149092',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ce01b722f81579749cbf130d22af66a9797e2ca2' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/page.tpl',
      1 => 1658673234,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62e0ef053aa737_75149092 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_4377137862e0ef0539e475_87040525', 'content');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, $_smarty_tpl->tpl_vars['layout']->value);
}
/* {block 'page_title'} */
class Block_213549671262e0ef053a0593_96106537 extends Smarty_Internal_Block
{
public $callsChild = 'true';
public $hide = 'true';
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

        <header class="page-header">
          <h1><?php 
$_smarty_tpl->inheritance->callChild($_smarty_tpl, $this);
?>
</h1>
        </header>
      <?php
}
}
/* {/block 'page_title'} */
/* {block 'page_header_container'} */
class Block_192607534462e0ef0539f1f7_44032900 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_213549671262e0ef053a0593_96106537', 'page_title', $this->tplIndex);
?>

    <?php
}
}
/* {/block 'page_header_container'} */
/* {block 'page_content_top'} */
class Block_79225498662e0ef053a54d1_09620351 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'page_content_top'} */
/* {block 'page_content'} */
class Block_162337598962e0ef053a65b6_34311738 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

          <!-- Page content -->
        <?php
}
}
/* {/block 'page_content'} */
/* {block 'page_content_container'} */
class Block_10703138862e0ef053a4817_31328946 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <div id="content" class="page-content card card-block">
        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_79225498662e0ef053a54d1_09620351', 'page_content_top', $this->tplIndex);
?>

        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_162337598962e0ef053a65b6_34311738', 'page_content', $this->tplIndex);
?>

      </div>
    <?php
}
}
/* {/block 'page_content_container'} */
/* {block 'page_footer'} */
class Block_84930218462e0ef053a8ad5_56539736 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

          <!-- Footer content -->
        <?php
}
}
/* {/block 'page_footer'} */
/* {block 'page_footer_container'} */
class Block_18350665362e0ef053a7f90_50929205 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

      <footer class="page-footer">
        <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_84930218462e0ef053a8ad5_56539736', 'page_footer', $this->tplIndex);
?>

      </footer>
    <?php
}
}
/* {/block 'page_footer_container'} */
/* {block 'content'} */
class Block_4377137862e0ef0539e475_87040525 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_4377137862e0ef0539e475_87040525',
  ),
  'page_header_container' => 
  array (
    0 => 'Block_192607534462e0ef0539f1f7_44032900',
  ),
  'page_title' => 
  array (
    0 => 'Block_213549671262e0ef053a0593_96106537',
  ),
  'page_content_container' => 
  array (
    0 => 'Block_10703138862e0ef053a4817_31328946',
  ),
  'page_content_top' => 
  array (
    0 => 'Block_79225498662e0ef053a54d1_09620351',
  ),
  'page_content' => 
  array (
    0 => 'Block_162337598962e0ef053a65b6_34311738',
  ),
  'page_footer_container' => 
  array (
    0 => 'Block_18350665362e0ef053a7f90_50929205',
  ),
  'page_footer' => 
  array (
    0 => 'Block_84930218462e0ef053a8ad5_56539736',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


  <section id="main">

    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_192607534462e0ef0539f1f7_44032900', 'page_header_container', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_10703138862e0ef053a4817_31328946', 'page_content_container', $this->tplIndex);
?>


    <?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_18350665362e0ef053a7f90_50929205', 'page_footer_container', $this->tplIndex);
?>


  </section>

<?php
}
}
/* {/block 'content'} */
}
