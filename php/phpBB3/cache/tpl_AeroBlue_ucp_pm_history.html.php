<?php if (!defined('IN_PHPBB')) exit; ?><table class="row4" width="100%" cellspacing="0">
<tr>
	<th align="center"><?php echo ((isset($this->_rootref['L_MESSAGE_HISTORY'])) ? $this->_rootref['L_MESSAGE_HISTORY'] : ((isset($user->lang['MESSAGE_HISTORY'])) ? $user->lang['MESSAGE_HISTORY'] : '{ MESSAGE_HISTORY }')); ?></th>
</tr>
<tr>
	<td><div style="overflow: auto; width: 100%; height: 300px;">

		<table class="tablebg" width="100%" cellspacing="0" cellpadding="0">
	<?php $_history_row_count = (isset($this->_tpldata['history_row'])) ? sizeof($this->_tpldata['history_row']) : 0;if ($_history_row_count) {for ($_history_row_i = 0; $_history_row_i < $_history_row_count; ++$_history_row_i){$_history_row_val = &$this->_tpldata['history_row'][$_history_row_i]; if (!($_history_row_val['S_ROW_COUNT'] & 1)  ) {  ?><tr class="row1"><?php } else { ?><tr class="row2"><?php } ?>
			<td rowspan="2" align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_BEGIN'])) ? $this->_rootref['S_CONTENT_FLOW_BEGIN'] : ''; ?>" valign="top"><a name="<?php echo $_history_row_val['MSG_ID']; ?>"></a>
				<table width="100" cellspacing="0">
				<tr>
					<td height="20" align="center"><span class="postauthor"><?php echo $_history_row_val['MESSAGE_AUTHOR_FULL']; ?></span></td>
				</tr>
				</table>
			</td>
			<td width="100%" height="20">
				<span class="gensmall"><b><?php echo ((isset($this->_rootref['L_PM_SUBJECT'])) ? $this->_rootref['L_PM_SUBJECT'] : ((isset($user->lang['PM_SUBJECT'])) ? $user->lang['PM_SUBJECT'] : '{ PM_SUBJECT }')); ?>:</b>&nbsp;<?php echo $_history_row_val['SUBJECT']; ?>&nbsp;&nbsp;<b><?php echo ((isset($this->_rootref['L_SENT_AT'])) ? $this->_rootref['L_SENT_AT'] : ((isset($user->lang['SENT_AT'])) ? $user->lang['SENT_AT'] : '{ SENT_AT }')); ?>:</b>&nbsp;<?php echo $_history_row_val['SENT_DATE']; ?></span>
			</td>
		</tr>

		<?php if (!($_history_row_val['S_ROW_COUNT'] & 1)  ) {  ?><tr class="row1"><?php } else { ?><tr class="row2"><?php } ?>
			<td valign="top">
				<table width="100%" cellspacing="0">
				<tr>
					<td valign="top">
						<table width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td><div class="postbody"><?php echo $_history_row_val['MESSAGE']; ?></div><div id="message_<?php echo $_history_row_val['MSG_ID']; ?>" style="display: none;"><?php echo $_history_row_val['DECODED_MESSAGE']; ?></div></td>
						</tr>
						</table>
					</td>
				</tr>
				</table>
			</td>
		</tr>

		<?php if (!($_history_row_val['S_ROW_COUNT'] & 1)  ) {  ?><tr class="row1"><?php } else { ?><tr class="row2"><?php } ?>
			<td align="center" class="gensmall"><a href="<?php echo $_history_row_val['U_VIEW_MESSAGE']; ?>"><?php echo ((isset($this->_rootref['L_VIEW_PM'])) ? $this->_rootref['L_VIEW_PM'] : ((isset($user->lang['VIEW_PM'])) ? $user->lang['VIEW_PM'] : '{ VIEW_PM }')); ?></a></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="spacer" colspan="2"><img src="images/spacer.gif" alt="" width="1" height="1" /></td>
		</tr>
	<?php }} ?>
		</table>
	</div></td>
</tr>
</table>

<br clear="all" />