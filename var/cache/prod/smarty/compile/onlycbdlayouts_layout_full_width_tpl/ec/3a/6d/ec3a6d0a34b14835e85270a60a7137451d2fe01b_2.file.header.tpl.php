<?php
/* Smarty version 3.1.43, created on 2022-07-27 14:28:30
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62e12f6ec84ba3_40465286',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ec3a6d0a34b14835e85270a60a7137451d2fe01b' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/header.tpl',
      1 => 1658856595,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62e12f6ec84ba3_40465286 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_180170338862e12f6ec3bf59_90808484', 'header_banner');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_157041054262e12f6ec40a20_40515887', 'header_nav');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_64035896562e12f6ec43fd9_62510658', 'header_top');
}
/* {block 'header_banner'} */
class Block_180170338862e12f6ec3bf59_90808484 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_banner' => 
  array (
    0 => 'Block_180170338862e12f6ec3bf59_90808484',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <div class="header-banner">
    <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayBanner'),$_smarty_tpl ) );?>

  </div>
<?php
}
}
/* {/block 'header_banner'} */
/* {block 'header_nav'} */
class Block_157041054262e12f6ec40a20_40515887 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_nav' => 
  array (
    0 => 'Block_157041054262e12f6ec40a20_40515887',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <nav class="header-nav">
    <div class="container-fluid">
      <div class="row">
        <div class="hidden-sm-down">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNav1'),$_smarty_tpl ) );?>

          </div>
        </div>
        <div class="hidden-md-up text-sm-center mobile">
          <div class="float-xs-left" id="menu-icon">
            <i class="material-icons d-inline">&#xE5D2;</i>
          </div>
          <div class="float-xs-right" id="_mobile_cart"></div>
          <div class="float-xs-right" id="_mobile_user_info"></div>
          <div class="top-logo" id="_mobile_logo"></div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </nav>
<?php
}
}
/* {/block 'header_nav'} */
/* {block 'header_top'} */
class Block_64035896562e12f6ec43fd9_62510658 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'header_top' => 
  array (
    0 => 'Block_64035896562e12f6ec43fd9_62510658',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

  <div class="header-top">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-2 col-md-2 col-xl-2 col-sm-12 hidden-sm-down" id="_desktop_logo">
          <?php if ($_smarty_tpl->tpl_vars['shop']->value['logo_details']) {?>
            <?php if ($_smarty_tpl->tpl_vars['page']->value['page_name'] == 'index') {?>
              <h1>
                <?php $_smarty_tpl->smarty->ext->_tplFunction->callTemplateFunction($_smarty_tpl, 'renderLogo', array(), true);?>

              </h1>
            <?php } else { ?>
              <?php $_smarty_tpl->smarty->ext->_tplFunction->callTemplateFunction($_smarty_tpl, 'renderLogo', array(), true);?>

            <?php }?>
          <?php }?>
        </div>
        <div class="col-lg-2 col-md-2 col-xl-2 col-sm-12 headerFilter">
          <div class="containerLinkCBDCateg">
            <span id="headerLinkCDBCateg">
              <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'CBD Par Type','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>

              <i class="material-icons">keyboard_arrow_down</i>
            </span>
            <div class="outLinerMenuActive"></div>
          </div>

          <div class="containerLinkCDBBrands">
            <span id="headerLinkCDBBrands">
              <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['l'][0], array( array('s'=>'CBD Par Brands','d'=>'Shop.Theme.Global'),$_smarty_tpl ) );?>

              <i class="material-icons">keyboard_arrow_down</i>
            </span>
            <div class="outLinerMenuActive"></div>
          </div>

        </div>

        <div class="header-top-left col-lg-8 col-md-8 col-xl-8 col-sm-12 position-static">
          <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayTop'),$_smarty_tpl ) );?>

        </div>



      </div>
      <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
    </div>
  </div>



  <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayNavFullWidth'),$_smarty_tpl ) );?>



  <?php $_smarty_tpl->_assignInScope('childCategories', Category::getChildren(10,1,true,false));?>
  <div class="row dropdownMenuCateg">
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12">
      <div class="containerDropdownMenu">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['childCategories']->value, 'category');
$_smarty_tpl->tpl_vars['category']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['category']->value) {
$_smarty_tpl->tpl_vars['category']->do_else = false;
?>
          <div class="divThumbnail">
            <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getCategoryLink($_smarty_tpl->tpl_vars['category']->value['id_category']), ENT_QUOTES, 'UTF-8');?>
">
              <img class="replace-2x" src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['base_url'], ENT_QUOTES, 'UTF-8');?>
img/tmp/category_<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['category']->value['id_category'], ENT_QUOTES, 'UTF-8');?>
-thumb.jpg"
                alt="<?php echo htmlspecialchars(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['category']->value['name'],'html','UTF-8' )), ENT_QUOTES, 'UTF-8');?>
" />
              <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['category']->value['name'], ENT_QUOTES, 'UTF-8');?>

            </a>
          </div>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12 hidden-sm-down">
      <div class='displayHookCustomBlocks_851'><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayHookCustomBlocks','idHookCustomblocks'=>'851'),$_smarty_tpl ) );?>
</div>
    </div>
  </div>

  <?php $_smarty_tpl->_assignInScope('manufactures', Manufacturer::getManufacturers(true,1,true));?>
  <div class="row dropdownMenuBrands">
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12">
      <div class="containerDropdownMenu">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['manufactures']->value, 'manufacture');
$_smarty_tpl->tpl_vars['manufacture']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['manufacture']->value) {
$_smarty_tpl->tpl_vars['manufacture']->do_else = false;
?>
          <div class="divThumbnail">
            <a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getManufacturerLink($_smarty_tpl->tpl_vars['manufacture']->value['id_manufacturer']), ENT_QUOTES, 'UTF-8');?>
">
              <img src="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getManufacturerImageLink($_smarty_tpl->tpl_vars['manufacture']->value['id_manufacturer'],'small_default'), ENT_QUOTES, 'UTF-8');?>
"
                alt="<?php echo htmlspecialchars(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['manufacture']->value['manufacturer_name'],'html','UTF-8' )), ENT_QUOTES, 'UTF-8');?>
">
              <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['manufacture']->value['name'], ENT_QUOTES, 'UTF-8');?>

            </a>
          </div>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-xl-6 col-sm-12 hidden-sm-down">
      <div class='displayHookCustomBlocks_851'><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0], array( array('h'=>'displayHookCustomBlocks','idHookCustomblocks'=>'851'),$_smarty_tpl ) );?>
</div>
    </div>
  </div>

<?php
}
}
/* {/block 'header_top'} */
}
