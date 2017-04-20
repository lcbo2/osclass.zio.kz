<?php
/*
Plugin Name: user_sidbar
Plugin URI: http://www.osclass.org/
Description: Add a WYSIWYG editor when publishing an ad
Version: 1.1.2
Author: OSClass
Author URI: http://www.osclass.org/
Short Name: user_sidbar
Plugin update URI: user-sidbar
*/

function user_sidbar_install()
{
   
}

function user_sidbar_uninstall()
{
  
}

function user_sidbar_load_js()
{
  
}

function user_sidbar_admin_menu() {
    echo '<h3><a href="#">' . __('Rich edit options', 'user_sidbar') . '</a></h3>
    <ul>
        <li><a href="' . osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/conf.php') . '">&raquo; ' . __('Settings', 'user_sidbar') . '</a></li>
    </ul>';
}

function user_sidbar_init_admin_menu()
{
    osc_add_admin_submenu_divider('plugins', 'user_sidbar plugin', 'moreedit_divider', 'administrator');
    osc_add_admin_submenu_page('plugins', __('user_sidbar options', 'user_sidbar'), osc_admin_render_plugin_url(osc_plugin_folder(__FILE__) . 'admin/conf.php'), 'user_sidbar_settings', 'administrator');
}


if(!function_exists('do_not_clean_items')) {
    function do_not_clean_items($item) {
        $catID  = $item['fk_i_category_id'];
        $itemID = $item['pk_i_id'];

        $title       = Params::getParam('title', false, false) ;
        $description = Params::getParam('description', false, false) ;
        $locale      = osc_current_user_locale() ;

        $mItems = Item::newInstance() ;
        $mItems->updateLocaleForce($itemID, $locale, $title[$locale], $description[$locale]) ;
    }
}


/**
 * ADD HOOKS
 */
osc_register_plugin(osc_plugin_path(__FILE__), 'user_sidbar_install');
osc_add_hook(osc_plugin_path(__FILE__)."_uninstall", 'user_sidbar_uninstall');

if(osc_version()<310) {
    osc_add_hook('admin_menu', 'user_sidbar_admin_menu');
} else {
    osc_add_hook('admin_menu_init', 'user_sidbar_init_admin_menu');
}

function user_sidbar_init() {
    
}
 function user_sidebar_show(){
      
     $user_id = osc_user_id();
      $user=osc_user();
    
      render('index.php');
    
     
     
 }
 function render($file){
     return require_once 'views/'.$file;
 }
osc_add_hook('init', 'user_sidbar_init');
osc_add_hook('posted_item', 'do_not_clean_items');
osc_add_hook('edited_item', 'do_not_clean_items');

?>
