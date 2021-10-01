<?php if (!defined('IN_PHPBB')) exit; ?><div class="tbspace">
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
	<td>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_BEGIN'])) ? $this->_rootref['S_CONTENT_FLOW_BEGIN'] : ''; ?>">
			<?php if ($this->_rootref['TOTAL_MESSAGES']) {  ?>
				<table width="100%" cellspacing="0">
				<tr>
					<td class="nav" valign="middle" nowrap="nowrap"><?php echo (isset($this->_rootref['PAGE_NUMBER'])) ? $this->_rootref['PAGE_NUMBER'] : ''; ?><br /></td>
					<?php if ($this->_rootref['FOLDER_MAX_MESSAGES'] != 0) {  ?>
						<td class="gensmall" nowrap="nowrap" width="100%">&nbsp;[ <b><?php echo (isset($this->_rootref['FOLDER_CUR_MESSAGES'])) ? $this->_rootref['FOLDER_CUR_MESSAGES'] : ''; ?></b>/<?php echo (isset($this->_rootref['FOLDER_MAX_MESSAGES'])) ? $this->_rootref['FOLDER_MAX_MESSAGES'] : ''; ?> <?php echo ((isset($this->_rootref['L_MESSAGES'])) ? $this->_rootref['L_MESSAGES'] : ((isset($user->lang['MESSAGES'])) ? $user->lang['MESSAGES'] : '{ MESSAGES }')); ?> (<?php echo (isset($this->_rootref['FOLDER_PERCENT'])) ? $this->_rootref['FOLDER_PERCENT'] : ''; ?>%) ]&nbsp;</td>
					<?php } else { ?>
						<td class="gensmall" nowrap="nowrap" width="100%">&nbsp;[ <b><?php echo (isset($this->_rootref['FOLDER_CUR_MESSAGES'])) ? $this->_rootref['FOLDER_CUR_MESSAGES'] : ''; ?></b> <?php echo ((isset($this->_rootref['L_MESSAGES'])) ? $this->_rootref['L_MESSAGES'] : ((isset($user->lang['MESSAGES'])) ? $user->lang['MESSAGES'] : '{ MESSAGES }')); ?> ]&nbsp;</td>					
					<?php } ?>
				</tr>
				</table>
			<?php } if ($this->_rootref['S_VIEW_MESSAGE']) {  ?>
				<span class="gensmall">
				<?php if ($this->_rootref['S_DISPLAY_HISTORY']) {  if ($this->_rootref['U_VIEW_PREVIOUS_HISTORY']) {  ?><a href="<?php echo (isset($this->_rootref['U_VIEW_PREVIOUS_HISTORY'])) ? $this->_rootref['U_VIEW_PREVIOUS_HISTORY'] : ''; ?>"><?php echo ((isset($this->_rootref['L_VIEW_PREVIOUS_HISTORY'])) ? $this->_rootref['L_VIEW_PREVIOUS_HISTORY'] : ((isset($user->lang['VIEW_PREVIOUS_HISTORY'])) ? $user->lang['VIEW_PREVIOUS_HISTORY'] : '{ VIEW_PREVIOUS_HISTORY }')); ?></a> | <?php } if ($this->_rootref['U_VIEW_NEXT_HISTORY']) {  ?><a href="<?php echo (isset($this->_rootref['U_VIEW_NEXT_HISTORY'])) ? $this->_rootref['U_VIEW_NEXT_HISTORY'] : ''; ?>"><?php echo ((isset($this->_rootref['L_VIEW_NEXT_HISTORY'])) ? $this->_rootref['L_VIEW_NEXT_HISTORY'] : ((isset($user->lang['VIEW_NEXT_HISTORY'])) ? $user->lang['VIEW_NEXT_HISTORY'] : '{ VIEW_NEXT_HISTORY }')); ?></a> | <?php } } ?><a href="<?php echo (isset($this->_rootref['U_PREVIOUS_PM'])) ? $this->_rootref['U_PREVIOUS_PM'] : ''; ?>"><?php echo ((isset($this->_rootref['L_VIEW_PREVIOUS_PM'])) ? $this->_rootref['L_VIEW_PREVIOUS_PM'] : ((isset($user->lang['VIEW_PREVIOUS_PM'])) ? $user->lang['VIEW_PREVIOUS_PM'] : '{ VIEW_PREVIOUS_PM }')); ?></a> | <a href="<?php echo (isset($this->_rootref['U_NEXT_PM'])) ? $this->_rootref['U_NEXT_PM'] : ''; ?>"><?php echo ((isset($this->_rootref['L_VIEW_NEXT_PM'])) ? $this->_rootref['L_VIEW_NEXT_PM'] : ((isset($user->lang['VIEW_NEXT_PM'])) ? $user->lang['VIEW_NEXT_PM'] : '{ VIEW_NEXT_PM }')); ?></a>&nbsp;
				</span>
			<?php } ?>
			</td>
			<td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>">
<?php if ($this->_rootref['S_VIEW_MESSAGE']) {  ?>
					<span class="gensmall">
						<?php if ($this->_rootref['U_PRINT_PM']) {  ?><a href="<?php echo (isset($this->_rootref['U_PRINT_PM'])) ? $this->_rootref['U_PRINT_PM'] : ''; ?>" title="<?php echo ((isset($this->_rootref['L_PRINT_PM'])) ? $this->_rootref['L_PRINT_PM'] : ((isset($user->lang['PRINT_PM'])) ? $user->lang['PRINT_PM'] : '{ PRINT_PM }')); ?>"><?php echo ((isset($this->_rootref['L_PRINT_PM'])) ? $this->_rootref['L_PRINT_PM'] : ((isset($user->lang['PRINT_PM'])) ? $user->lang['PRINT_PM'] : '{ PRINT_PM }')); ?></a><?php if ($this->_rootref['U_FORWARD_PM']) {  ?> | <?php } } if ($this->_rootref['U_FORWARD_PM']) {  ?><a href="<?php echo (isset($this->_rootref['U_FORWARD_PM'])) ? $this->_rootref['U_FORWARD_PM'] : ''; ?>" title="<?php echo ((isset($this->_rootref['L_FORWARD_PM'])) ? $this->_rootref['L_FORWARD_PM'] : ((isset($user->lang['FORWARD_PM'])) ? $user->lang['FORWARD_PM'] : '{ FORWARD_PM }')); ?>"><?php echo ((isset($this->_rootref['L_FORWARD_PM'])) ? $this->_rootref['L_FORWARD_PM'] : ((isset($user->lang['FORWARD_PM'])) ? $user->lang['FORWARD_PM'] : '{ FORWARD_PM }')); ?></a><?php } ?>
					</span>
<?php } ?>
</td>
</tr>
<tr>
<td align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_END'])) ? $this->_rootref['S_CONTENT_FLOW_END'] : ''; ?>"><?php $this->_tpl_include('pagination.html'); ?></td>
</tr>
<?php if (! $this->_rootref['S_VIEW_MESSAGE']) {  ?>
<tr><td height="5"></td></tr>
<tr><td>
<form name="sortmsg" method="post" action="<?php echo (isset($this->_rootref['S_PM_ACTION'])) ? $this->_rootref['S_PM_ACTION'] : ''; ?>" style="margin:0px">
<span class="gensmall"><?php echo ((isset($this->_rootref['L_DISPLAY_MESSAGES'])) ? $this->_rootref['L_DISPLAY_MESSAGES'] : ((isset($user->lang['DISPLAY_MESSAGES'])) ? $user->lang['DISPLAY_MESSAGES'] : '{ DISPLAY_MESSAGES }')); ?>:</span> <?php echo (isset($this->_rootref['S_SELECT_SORT_DAYS'])) ? $this->_rootref['S_SELECT_SORT_DAYS'] : ''; ?> <span class="gensmall"><?php echo ((isset($this->_rootref['L_SORT_BY'])) ? $this->_rootref['L_SORT_BY'] : ((isset($user->lang['SORT_BY'])) ? $user->lang['SORT_BY'] : '{ SORT_BY }')); ?></span> <?php echo (isset($this->_rootref['S_SELECT_SORT_KEY'])) ? $this->_rootref['S_SELECT_SORT_KEY'] : ''; ?> <?php echo (isset($this->_rootref['S_SELECT_SORT_DIR'])) ? $this->_rootref['S_SELECT_SORT_DIR'] : ''; ?> <input class="btnlite" type="submit" name="sort" value="<?php echo ((isset($this->_rootref['L_GO'])) ? $this->_rootref['L_GO'] : ((isset($user->lang['GO'])) ? $user->lang['GO'] : '{ GO }')); ?>" />
<?php echo (isset($this->_rootref['S_FORM_TOKEN'])) ? $this->_rootref['S_FORM_TOKEN'] : ''; ?>
</form>
</td></tr>
<?php } ?>
		</table>
	</td>
</tr>
</table>
</div>