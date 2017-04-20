<link href="<?php echo osc_base_url().'oc-content/plugins/spamkiller/spamkilleradminstyle.css'; ?>" rel="stylesheet" type="text/css" />
<?php
if(Params::getParam('stopwords') != '') {
$stopwords = Params::getParam('stopwords');
} else {
$stopwords = (getStopWords() != '') ? getStopWords(): '' ;
}
if(Params::getParam('enableon') != '') {
$enableon = Params::getParam('enableon');
} else {
$enableon = (getEnableOn() != '') ? getEnableOn(): '' ;
}
if( Params::getParam('option') == 'stepone' ) {
$dao_preference = new Preference();
$dao_preference->update(array("s_value" => $stopwords), array("s_section" =>"SpamKiller", "s_name" => "stopwords")) ;
$dao_preference->update(array("s_value" => $enableon), array("s_section" =>"SpamKiller", "s_name" => "enableon")) ;
?>
<div class="SpamKillersuccess">
<?php echo __('Settings Saved','SpamKiller'); ?>
</div>
<?php
}
unset($dao_preference) ;
?>
<div id="spamkillermenu">
<ul>
<li><a href="<?php echo osc_admin_base_url(true).'?page=items&iDisplayLength=10&sort=date&direction=desc&b_spam=1'; ?>"><?php echo __('Spam Items', 'SpamKiller'); ?></a></li>
<li><a href="<?php echo osc_admin_base_url(true).'?page=comments&showAll=off'; ?>"><?php echo __('Spam Comments', 'SpamKiller'); ?></a></li>
<li class="current"><a href="#"><?php echo __('Settings', 'SpamKiller'); ?></a></li>
<li><a href="<?php echo osc_admin_render_plugin_url("spamkiller/help.php"); ?>"><?php echo __('F.A.Q. / Help', 'SpamKiller'); ?></a></li>
</ul>
</div>

<h2 class="render-title ">Settings</h2>
<form method="post" action="<?php osc_admin_base_url(true); ?>">
<input type="hidden" name="page" value="plugins" />
<input type="hidden" name="action" value="renderplugin" />
<input type="hidden" name="file" value="spamkiller/settings.php" />
<input type="hidden" name="option" value="stepone" />
  <fieldset>
        <div class="form-horizontal">
            <div class="form-row">
                <div class="form-label"><?php _e('Stop Words', 'SpamKiller'); ?></div>
                <div class="form-controls">
				<textarea rows="10" name="stopwords" style="width: 400px;"><?php echo $stopwords; ?></textarea>
				</div>
            </div>
			<div class="form-row">
                <div class="form-label">&nbsp;</div>
                <div class="form-controls" style="color:red;">
					<b>Note:</b>
					</br>
					Each stop words are seperated by comma.
					</br>
					Stop words ending with comma blocks all ads.
				</div>
            </div>			
			<div class="form-row">
                <div class="form-label"><?php _e('Enable On', 'SpamKiller'); ?></div>
                <div class="form-controls">
                 <select name="enableon">
				 	<option <?php if($enableon ==1){echo 'selected="selected"';}?> value='1'><?php _e('Both Section', 'SpamKiller'); ?></option>
					<option <?php if($enableon ==2){echo 'selected="selected"';}?> value='2'><?php _e('Item Section', 'SpamKiller'); ?></option>
					<option <?php if($enableon ==3){echo 'selected="selected"';}?> value='3'><?php _e('Comment Section', 'SpamKiller'); ?></option>
					<option <?php if($enableon ==0){echo 'selected="selected"';}?> value='0'><?php _e('Disable', 'SpamKiller'); ?></option>
				</select> 
				</div>
            </div>
            <div class="form-actions">
                <input type="submit" class="btn btn-submit" value="Save changes" />
            </div>
        </div>
    </fieldset>
</form>