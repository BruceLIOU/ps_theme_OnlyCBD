<?php
/* Smarty version 3.1.43, created on 2022-07-26 14:40:33
  from '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/categoryHome.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.43',
  'unifunc' => 'content_62dfe0c19d04e4_35051770',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '478c725810ac6a25c5fb53be554032b4f5234d3b' => 
    array (
      0 => '/Applications/MAMP/htdocs/onlycbd.fr/themes/onlycbd/templates/_partials/categoryHome.tpl',
      1 => 1658760286,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62dfe0c19d04e4_35051770 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('childCategories', Category::getChildren(10,1,true,false));?>

<div class="rowCustomText">
    <div class="col-sm-12 customCategoryHomePage">
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
<div class="linkCustom">
    <a href="10-cbd">
        Voir nos catégories de CDB
        <span class="material-icons">arrow_forward</span>
    </a>
</div><?php }
}
