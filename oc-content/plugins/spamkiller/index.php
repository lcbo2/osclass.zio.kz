<?php
/*
Plugin Name: SpamKiller
Plugin URI: http://www.osclass.org/
Description: Block the ad automatically based on the filter words.
Version: 2.0
Author: RajaSekar
Author URI: http://www.trickfree.com/
Short Name: SpamKiller
*/

require_once( osc_plugins_path() . 'spamkiller/ModelSpamKiller.php' ) ;

function spamkiller_install() {
	osc_set_preference('stopwords', 'alcohol,drug','SpamKiller','STRING');
	osc_set_preference('enableon', '1','SpamKiller','STRING');
}

function spamkiller_uninstall() {
		osc_delete_preference('stopwords','SpamKiller');
		osc_delete_preference('enableon','SpamKiller');
}
	

function getStopWords() {
    return(osc_get_preference('stopwords', 'SpamKiller')) ;
}

function getEnableOn() {
    return(osc_get_preference('enableon', 'SpamKiller')) ;
}

function spamkiller_admin_menu() {
?>
<h3><a href="#">SpamKiller</a></h3>
    <ul>
        <li><a href="<?php echo osc_admin_base_url(true).'?page=items&iDisplayLength=10&sort=date&direction=desc&b_spam=1'; ?>">&raquo; <?php echo __('Spam Items', 'SpamKiller'); ?></a></li>
        <li><a href="<?php echo osc_admin_base_url(true).'?page=comments&showAll=off'; ?>">&raquo; <?php echo __('Spam Comments', 'SpamKiller'); ?></a></li>
        <li><a href="<?php echo osc_admin_render_plugin_url("spamkiller/settings.php"); ?>">&raquo; <?php echo __('Settings', 'SpamKiller'); ?></a></li>
        <li><a href="<?php echo osc_admin_render_plugin_url("spamkiller/help.php"); ?>">&raquo; <?php echo  __('F.A.Q. / Help', 'SpamKiller'); ?></a></li>
    </ul>';
<?Php
}

function spamkiller_admin_head() {
	?>
    <style>
    .ico-SpamKiller{
        background-image: url('<?php echo osc_base_url().'oc-content/plugins/spamkiller/spamkiller-thumb.png'; ?>') !important;
    }
    body.compact .ico-SpamKiller{
        background-image: url('<?php echo osc_base_url().'oc-content/plugins/spamkiller/spamkiller-thumb.png'; ?>') !important;
        background-size: 35px, 35px;
    }
	</style>
    <?php
}

function after_item_posted($item) {
if( getEnableOn() == 1 || getEnableOn() == 2 ){
  $arrstopword= getStopWords();
  $exparrstopword= explode(",", $arrstopword);
  foreach ($exparrstopword as $expstopword) {
    if (preg_match("/" . $expstopword. "/i", $item[s_title]) || preg_match("/" . $expstopword. "/i", $item[s_description])) {
	ModelSpamKiller::newInstance()->blockItem($item[pk_i_id]);
	}
  }
  }
}

function after_comment_posted($id) {
if( getEnableOn() == 1 || getEnableOn() == 3 ){
  $arrstopword= getStopWords();
  $exparrstopword= explode(",", $arrstopword);
  $comment= ModelSpamKiller::newInstance()->getCommentById($id);
  foreach ($exparrstopword as $expstopword) {
  if (preg_match("/" . $expstopword. "/i", $comment[s_title]) || preg_match("/" . $expstopword. "/i", $comment[s_body])) {
	ModelSpamKiller::newInstance()->blockComment($id);
	}
}
}
}

if(osc_version() <= 241) {
	osc_add_hook('admin_menu', 'spamkiller_admin_menu');
} else {
		osc_add_admin_menu_page(__('SpamKiller', 'SpamKiller'), '#', 'SpamKiller');
		osc_add_admin_submenu_page('SpamKiller', __('Spam Items','SpamKiller'), osc_admin_base_url(true).'?page=items&iDisplayLength=10&sort=date&direction=desc&b_spam=1', 'SpamKiller_BlockedItem');
		osc_add_admin_submenu_page('SpamKiller', __('Spam Comments','SpamKiller'), osc_admin_base_url(true).'?page=comments&showAll=off', 'SpamKiller_BlockedComment');
		osc_add_admin_submenu_page('SpamKiller', __('Settings','SpamKiller'), osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/settings.php'), 'SpamKiller_Settings');
		osc_add_admin_submenu_page('SpamKiller', __('F.A.Q. / Help','SpamKiller'), osc_admin_render_plugin_url(osc_plugin_path(dirname(__FILE__)) . '/help.php'), 'SpamKiller_Help');
}

osc_add_hook('posted_item', 'after_item_posted');
osc_add_hook('add_comment', 'after_comment_posted');
osc_add_hook('admin_header', 'spamkiller_admin_head');
osc_register_plugin(osc_plugin_path(__FILE__), 'spamkiller_install');
osc_add_hook(osc_plugin_path(__FILE__)."_uninstall", 'spamkiller_uninstall');
function spamkiller_admin() {
osc_admin_render_plugin(osc_plugin_path(dirname(__FILE__)) . '/settings.php') ;
}
osc_add_hook(osc_plugin_path(__FILE__) . "_configure", 'spamkiller_admin');
 
?>