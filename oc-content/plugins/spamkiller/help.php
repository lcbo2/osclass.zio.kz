<link href="<?php echo osc_base_url().'oc-content/plugins/spamkiller/spamkilleradminstyle.css'; ?>" rel="stylesheet" type="text/css" />
<div id="spamkillermenu">
<ul>
<li><a href="<?php echo osc_admin_base_url(true).'?page=items&iDisplayLength=10&sort=date&direction=desc&b_spam=1'; ?>"><?php echo __('Spam Items', 'SpamKiller'); ?></a></li>
<li><a href="<?php echo osc_admin_base_url(true).'?page=comments&showAll=off'; ?>"><?php echo __('Spam Comments', 'SpamKiller'); ?></a></li>
<li class="current"><a href="#"><?php echo __('Settings', 'SpamKiller'); ?></a></li>
<li><a href="<?php echo osc_admin_render_plugin_url("spamkiller/help.php"); ?>"><?php echo __('F.A.Q. / Help', 'SpamKiller'); ?></a></li>
</ul>
</div>

<h2 class="render-title"><?php _e('OSC SpamKiller Help', 'SpamKiller'); ?></h2>
<h3><?php _e('What is SpamKiller Plugin?', 'SpamKiller'); ?></h3>
<p><?php _e('Block the ad automatically based on the filter words.', 'SpamKiller'); ?></p>
<h3><?php _e('How does SpamKiller Plugin work?', 'SpamKiller'); ?></h3>
<p><?php _e('SpamKiller Plugin uses the php preg_match function to match the filter words to Block the ad automatically.', 'SpamKiller'); ?></p>