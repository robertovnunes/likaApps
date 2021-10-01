<?php if (!defined('IN_PHPBB')) exit; ?><div class="forumbar">
<table width="100%" cellspacing="0" border="0">
<tr>
	<td align="left"><?php if (! $this->_rootref['S_IS_BOT'] && $this->_rootref['U_MARK_FORUMS']) {  ?><span class="gensmall"><a href="<?php echo (isset($this->_rootref['U_MARK_FORUMS'])) ? $this->_rootref['U_MARK_FORUMS'] : ''; ?>"><?php echo ((isset($this->_rootref['L_MARK_FORUMS_READ'])) ? $this->_rootref['L_MARK_FORUMS_READ'] : ((isset($user->lang['MARK_FORUMS_READ'])) ? $user->lang['MARK_FORUMS_READ'] : '{ MARK_FORUMS_READ }')); ?></a></span><?php } ?></td>
</tr>
</table>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tr.png" width="18" height="18" alt="" /></td>
  </tr>
  <tr>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/ml.png');"></td>
    <td>

<?php $_forumrow_count = (isset($this->_tpldata['forumrow'])) ? sizeof($this->_tpldata['forumrow']) : 0;if ($_forumrow_count) {for ($_forumrow_i = 0; $_forumrow_i < $_forumrow_count; ++$_forumrow_i){$_forumrow_val = &$this->_tpldata['forumrow'][$_forumrow_i]; if (( $_forumrow_val['S_IS_CAT'] && ! $_forumrow_val['S_FIRST_ROW'] ) || $_forumrow_val['S_NO_CAT']) {  ?>
		</table>
        </div>

</td>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/mr.png');"></td>
  </tr>
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/br.png" width="18" height="18" alt="" /></td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tr.png" width="18" height="18" alt="" /></td>
  </tr>
  <tr>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/ml.png');"></td>
    <td>
	<?php } if ($_forumrow_val['S_IS_CAT'] || $_forumrow_val['S_FIRST_ROW'] || $_forumrow_val['S_NO_CAT']) {  ?>
    	<table width="100%" cellspacing="0">
		<tr>
			<td class="cat" align="left" height="24"><?php if ($_forumrow_val['S_IS_CAT']) {  ?><h4><a class="genmedw" href="<?php echo $_forumrow_val['U_VIEWFORUM']; ?>"><?php echo $_forumrow_val['FORUM_NAME']; ?></a></h4><?php } else { ?><h4><?php echo ((isset($this->_rootref['L_FORUM'])) ? $this->_rootref['L_FORUM'] : ((isset($user->lang['FORUM'])) ? $user->lang['FORUM'] : '{ FORUM }')); ?></h4><?php } ?></td>
            <td class="cat" width="14" height="24"><a href="#" onclick="layerTest('expand<?php echo $_forumrow_val['FORUM_ID']; ?>')"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/expand.gif" width="17" height="16" alt="" /></a></td>
		</tr>
		</table>
        <div id="expand<?php echo $_forumrow_val['FORUM_ID']; ?>">
		<table class="forums" cellspacing="0" width="100%">
		<tr>
			<td class="row3h" colspan="2">&nbsp;<?php echo ((isset($this->_rootref['L_FORUM'])) ? $this->_rootref['L_FORUM'] : ((isset($user->lang['FORUM'])) ? $user->lang['FORUM'] : '{ FORUM }')); ?>&nbsp;</td>
			<td class="row3h" align="center" width="50">&nbsp;<?php echo ((isset($this->_rootref['L_TOPICS'])) ? $this->_rootref['L_TOPICS'] : ((isset($user->lang['TOPICS'])) ? $user->lang['TOPICS'] : '{ TOPICS }')); ?>&nbsp;</td>
			<td class="row3h" align="center" width="50">&nbsp;<?php echo ((isset($this->_rootref['L_POSTS'])) ? $this->_rootref['L_POSTS'] : ((isset($user->lang['POSTS'])) ? $user->lang['POSTS'] : '{ POSTS }')); ?>&nbsp;</td>
			<td class="row3h" align="center" width="175">&nbsp;<?php echo ((isset($this->_rootref['L_LAST_POST'])) ? $this->_rootref['L_LAST_POST'] : ((isset($user->lang['LAST_POST'])) ? $user->lang['LAST_POST'] : '{ LAST_POST }')); ?>&nbsp;</td>
		</tr>
	<?php } if (! $_forumrow_val['S_IS_CAT']) {  if ($_forumrow_val['S_IS_LINK']) {  ?>
			<tr>
				<td class="forumrow" width="31" align="center"><?php echo $_forumrow_val['FORUM_FOLDER_IMG']; ?></td>
				<td class="row1h">
					<?php if ($_forumrow_val['FORUM_IMAGE']) {  ?>
						<table border="0" cellspacing="0" cellpadding="0" width="100%"><tr><td align="middle" style="padding-<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>: 5px;"><?php echo $_forumrow_val['FORUM_IMAGE']; ?></td><td width="100%" valign="middle">
					<?php } ?>
					<a class="forumlink" href="<?php echo $_forumrow_val['U_VIEWFORUM']; ?>"><?php echo $_forumrow_val['FORUM_NAME']; ?></a>
					<p class="forumdesc"><?php echo $_forumrow_val['FORUM_DESC']; ?></p>
					<?php if ($_forumrow_val['FORUM_IMAGE']) {  ?></td></tr></table><?php } ?>
				</td>
				<?php if ($_forumrow_val['CLICKS']) {  ?>
					<td class="forumrow" colspan="3" align="center"><span class="genmed"><?php echo ((isset($this->_rootref['L_REDIRECTS'])) ? $this->_rootref['L_REDIRECTS'] : ((isset($user->lang['REDIRECTS'])) ? $user->lang['REDIRECTS'] : '{ REDIRECTS }')); ?>: <?php echo $_forumrow_val['CLICKS']; ?></span></td>
				<?php } else { ?>
					<td class="forumrow" colspan="3" align="center">&nbsp;</td>
				<?php } ?>
			</tr>
		<?php } else { ?>
		<tr>
			<td class="forumrow" width="31" align="center"><?php echo $_forumrow_val['FORUM_FOLDER_IMG']; ?></td>
			<td class="row1h" width="70%">
				<?php if ($_forumrow_val['FORUM_IMAGE']) {  ?>
					<table border="0" cellspacing="0" cellpadding="0" width="100%"><tr><td align="middle" style="padding-<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>: 5px;"><?php echo $_forumrow_val['FORUM_IMAGE']; ?></td><td width="100%" valign="middle">
				<?php } ?>
				<a class="forumlink<?php if ($_forumrow_val['S_UNREAD_FORUM']) {  ?> link-new<?php } ?>" href="<?php echo $_forumrow_val['U_VIEWFORUM']; ?>"><?php echo $_forumrow_val['FORUM_NAME']; ?></a>
				<p class="forumdesc"><?php echo $_forumrow_val['FORUM_DESC']; ?></p>
				<?php if ($_forumrow_val['MODERATORS']) {  ?>
					<p class="gensmall"><strong><?php echo $_forumrow_val['L_MODERATOR_STR']; ?>:</strong> <?php echo $_forumrow_val['MODERATORS']; ?></p>
				<?php } if ($_forumrow_val['SUBFORUMS'] && $_forumrow_val['S_LIST_SUBFORUMS']) {  ?>
					<p class="gensmall"><strong><?php echo $_forumrow_val['L_SUBFORUM_STR']; ?></strong> <?php echo $_forumrow_val['SUBFORUMS']; ?></p>
				<?php } if ($_forumrow_val['FORUM_IMAGE']) {  ?></td></tr></table><?php } ?>
			</td>
			<td class="forumrow" width="5%" align="center"><p class="topicdetails"><?php echo $_forumrow_val['TOPICS']; ?></p></td>
			<td class="forumrow" width="5%" align="center"><p class="topicdetails"><?php echo $_forumrow_val['POSTS']; ?></p></td>
			<td class="forumrow" width="20%" align="center" nowrap="nowrap">
				<?php if ($_forumrow_val['LAST_POST_TIME']) {  ?>
					<p class="topicdetails"><?php if ($_forumrow_val['U_UNAPPROVED_TOPICS']) {  ?><a href="<?php echo $_forumrow_val['U_UNAPPROVED_TOPICS']; ?>"><?php echo (isset($this->_rootref['UNAPPROVED_IMG'])) ? $this->_rootref['UNAPPROVED_IMG'] : ''; ?></a>&nbsp;<?php } echo $_forumrow_val['LAST_POST_TIME']; ?></p>
					<p class="topicdetails"><?php echo $_forumrow_val['LAST_POSTER_FULL']; ?>
						<?php if (! $this->_rootref['S_IS_BOT']) {  ?><a href="<?php echo $_forumrow_val['U_LAST_POST']; ?>"><?php echo (isset($this->_rootref['LAST_POST_IMG'])) ? $this->_rootref['LAST_POST_IMG'] : ''; ?></a><?php } ?>
					</p>
				<?php } else { ?>
					<p class="topicdetails"><?php echo ((isset($this->_rootref['L_NO_POSTS'])) ? $this->_rootref['L_NO_POSTS'] : ((isset($user->lang['NO_POSTS'])) ? $user->lang['NO_POSTS'] : '{ NO_POSTS }')); ?></p>
				<?php } ?>
			</td>
		</tr>
		<?php } } if ($_forumrow_val['S_LAST_ROW']) {  ?>
		</table>
        </div>
	<?php } }} else { ?>

<table class="tablebg" cellspacing="0" width="100%">
<tr>
	<td class="row1" colspan="5" align="center" style="padding: 25px 5px;"><p class="gensmall"><?php echo ((isset($this->_rootref['L_NO_FORUMS'])) ? $this->_rootref['L_NO_FORUMS'] : ((isset($user->lang['NO_FORUMS'])) ? $user->lang['NO_FORUMS'] : '{ NO_FORUMS }')); ?></p></td>
</tr>
</table>
<?php } ?>

</td>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/mr.png');"></td>
  </tr>
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/br.png" width="18" height="18" alt="" /></td>
  </tr>
</table>