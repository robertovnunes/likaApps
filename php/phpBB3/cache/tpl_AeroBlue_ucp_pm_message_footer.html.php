<?php if (!defined('IN_PHPBB')) exit; if (! $this->_rootref['S_VIEW_MESSAGE']) {  ?>
	<?php echo (isset($this->_rootref['S_FORM_TOKEN'])) ? $this->_rootref['S_FORM_TOKEN'] : ''; ?>
	</form>
<?php } if (! $this->_rootref['S_VIEW_MESSAGE']) {  ?>
<div class="tbspace">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr><td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>">
<b class="gensmall"><a href="#" onclick="marklist('viewfolder', 'marked_msg_id', true); return false;"><?php echo ((isset($this->_rootref['L_MARK_ALL'])) ? $this->_rootref['L_MARK_ALL'] : ((isset($user->lang['MARK_ALL'])) ? $user->lang['MARK_ALL'] : '{ MARK_ALL }')); ?></a> :: <a href="#" onclick="marklist('viewfolder', 'marked_msg_id', false); return false;"><?php echo ((isset($this->_rootref['L_UNMARK_ALL'])) ? $this->_rootref['L_UNMARK_ALL'] : ((isset($user->lang['UNMARK_ALL'])) ? $user->lang['UNMARK_ALL'] : '{ UNMARK_ALL }')); ?></a></b>
</td></tr>
</table>
</div>
<?php } ?>

<div class="tbspace">
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
	<td>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_BEGIN'])) ? $this->_rootref['S_CONTENT_FLOW_BEGIN'] : ''; ?>" nowrap="nowrap">
				<?php if ($this->_rootref['S_VIEW_MESSAGE']) {  if (! $this->_rootref['S_SPECIAL_FOLDER']) {  ?>
						<form name="movepm" method="post" action="<?php echo (isset($this->_rootref['S_PM_ACTION'])) ? $this->_rootref['S_PM_ACTION'] : ''; ?>" style="margin:0px">
							<input type="hidden" name="marked_msg_id[]" value="<?php echo (isset($this->_rootref['MSG_ID'])) ? $this->_rootref['MSG_ID'] : ''; ?>" />
							<input type="hidden" name="cur_folder_id" value="<?php echo (isset($this->_rootref['CUR_FOLDER_ID'])) ? $this->_rootref['CUR_FOLDER_ID'] : ''; ?>" />
							<input type="hidden" name="p" value="<?php echo (isset($this->_rootref['MSG_ID'])) ? $this->_rootref['MSG_ID'] : ''; ?>" />
							<select name="dest_folder"><?php echo (isset($this->_rootref['S_TO_FOLDER_OPTIONS'])) ? $this->_rootref['S_TO_FOLDER_OPTIONS'] : ''; ?></select>&nbsp;<input class="btnlite" type="submit" name="move_pm" value="<?php echo ((isset($this->_rootref['L_MOVE_TO_FOLDER'])) ? $this->_rootref['L_MOVE_TO_FOLDER'] : ((isset($user->lang['MOVE_TO_FOLDER'])) ? $user->lang['MOVE_TO_FOLDER'] : '{ MOVE_TO_FOLDER }')); ?>" />
						<?php echo (isset($this->_rootref['S_FORM_TOKEN'])) ? $this->_rootref['S_FORM_TOKEN'] : ''; ?>
						</form>
					<?php } } ?>
			</td>
			<td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>"><?php $this->_tpl_include('pagination.html'); ?></td>
		</tr>
		</table>
	</td>
</tr>
</table>
</div>