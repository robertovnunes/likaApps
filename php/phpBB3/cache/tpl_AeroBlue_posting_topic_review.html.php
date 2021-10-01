<?php if (!defined('IN_PHPBB')) exit; ?><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/tr.png" width="18" height="18" alt="" /></td>
  </tr>
  <tr>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/ml.png');"></td>
    <td>
<table width="100%" cellpadding="0" cellspacing="0" class="tablebg">
<tr>
	<th align="center"><?php echo ((isset($this->_rootref['L_TOPIC_REVIEW'])) ? $this->_rootref['L_TOPIC_REVIEW'] : ((isset($user->lang['TOPIC_REVIEW'])) ? $user->lang['TOPIC_REVIEW'] : '{ TOPIC_REVIEW }')); ?> - <?php echo (isset($this->_rootref['TOPIC_TITLE'])) ? $this->_rootref['TOPIC_TITLE'] : ''; ?></th>
</tr>
<tr>
	<td class="row1"><div style="overflow: auto; width: 100%; height: 300px;">
      <table class="tablebg" width="100%" cellspacing="0">
        <?php $_topic_review_row_count = (isset($this->_tpldata['topic_review_row'])) ? sizeof($this->_tpldata['topic_review_row']) : 0;if ($_topic_review_row_count) {for ($_topic_review_row_i = 0; $_topic_review_row_i < $_topic_review_row_count; ++$_topic_review_row_i){$_topic_review_row_val = &$this->_tpldata['topic_review_row'][$_topic_review_row_i]; if (!($_topic_review_row_val['S_ROW_COUNT'] & 1)  ) {  ?>
        <tr class="row1">
          <?php } else { ?>
        </tr>
        <tr class="row2">
          <?php } if ($_topic_review_row_val['S_IGNORE_POST']) {  ?>
				<td colspan="2"><?php echo $_topic_review_row_val['L_IGNORE_POST']; ?></td>
				<?php } else { ?>
          <td rowspan="2" align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_BEGIN'])) ? $this->_rootref['S_CONTENT_FLOW_BEGIN'] : ''; ?>" valign="top"><a id="pr<?php echo $_topic_review_row_val['POST_ID']; ?>"></a>
              <table width="100" cellspacing="0">
                <tr>
                  <td align="center"><b class="postauthor"<?php if ($_topic_review_row_val['POST_AUTHOR_COLOUR']) {  ?> style="color: <?php echo $_topic_review_row_val['POST_AUTHOR_COLOUR']; ?>"<?php } ?>><?php echo $_topic_review_row_val['POST_AUTHOR']; ?></b></td>
                </tr>
            </table></td>
          <td width="100%"><table width="100%" cellspacing="0">
              <tr>
                <td valign="top" nowrap="nowrap" class="gensmall">
					<?php if ($this->_rootref['S_IS_BOT']) {  ?>
                  <?php echo $_topic_review_row_val['MINI_POST_IMG']; ?>
                    <?php } else { ?>
                    <a href="<?php echo $_topic_review_row_val['U_MINI_POST']; ?>"><?php echo $_topic_review_row_val['MINI_POST_IMG']; ?></a>
                    <?php } ?>
<b><?php echo ((isset($this->_rootref['L_POSTED'])) ? $this->_rootref['L_POSTED'] : ((isset($user->lang['POSTED'])) ? $user->lang['POSTED'] : '{ POSTED }')); ?>:</b> <?php echo $_topic_review_row_val['POST_DATE']; ?></td>
                <td valign="top" nowrap="nowrap">
				<div class="review-icons">
                  <?php if ($_topic_review_row_val['POSTER_QUOTE'] && $_topic_review_row_val['DECODED_MESSAGE']) {  ?>
                  <div class="quote-icon"><a href="#" onclick="addquote(<?php echo $_topic_review_row_val['POST_ID']; ?>,'<?php echo $_topic_review_row_val['POSTER_QUOTE']; ?>'); return false;"><span><?php echo ((isset($this->_rootref['L_REPLY_WITH_QUOTE'])) ? $this->_rootref['L_REPLY_WITH_QUOTE'] : ((isset($user->lang['REPLY_WITH_QUOTE'])) ? $user->lang['REPLY_WITH_QUOTE'] : '{ REPLY_WITH_QUOTE }')); ?></span></a></div>
				  <?php } ?>
                </div></td>
              </tr>
          </table></td>
        </tr>
        <?php if (!($_topic_review_row_val['S_ROW_COUNT'] & 1)  ) {  ?>
        <tr class="row1">
          <?php } else { ?>
        </tr>
        <tr class="row2">
          <?php } ?>
          <td valign="top"><table width="100%" cellspacing="0">
              <tr>
                <td valign="top"><table width="100%" cellspacing="0" cellpadding="2">
                    <tr>
                      <td><div class="postbody"><?php echo $_topic_review_row_val['MESSAGE']; ?></div>
                          <?php if ($_topic_review_row_val['S_HAS_ATTACHMENTS']) {  ?>
                          <br clear="all" />
                        <br />
                          <table class="attachbg" width="100%" cellspacing="1">
                            <tr>
                              <td class="attachrow"><b class="genmed"><?php echo ((isset($this->_rootref['L_ATTACHMENTS'])) ? $this->_rootref['L_ATTACHMENTS'] : ((isset($user->lang['ATTACHMENTS'])) ? $user->lang['ATTACHMENTS'] : '{ ATTACHMENTS }')); ?>: </b></td>
                            </tr>
                            <?php $_attachment_count = (isset($_topic_review_row_val['attachment'])) ? sizeof($_topic_review_row_val['attachment']) : 0;if ($_attachment_count) {for ($_attachment_i = 0; $_attachment_i < $_attachment_count; ++$_attachment_i){$_attachment_val = &$_topic_review_row_val['attachment'][$_attachment_i]; ?>
                            <tr>
                              <?php if (!($_attachment_val['S_ROW_COUNT'] & 1)  ) {  ?>
                              <td class="row1"><?php } else { ?></td>
                              <td class="row1"><?php } ?>
                                <?php echo $_attachment_val['DISPLAY_ATTACHMENT']; ?></td>
                            </tr>
                            <?php }} ?>
                          </table>
                        <?php } if ($_topic_review_row_val['POSTER_QUOTE'] && $_topic_review_row_val['DECODED_MESSAGE']) {  ?>
                          <div id="message_<?php echo $_topic_review_row_val['POST_ID']; ?>" style="display: none;"><?php echo $_topic_review_row_val['DECODED_MESSAGE']; ?></div>
                        <?php } ?>                      </td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" cellspacing="0">
					<?php if ($_topic_review_row_val['U_MCP_DETAILS']) {  ?>                    
					<tr>
                      <td valign="top" height="15" width="100%" align="<?php echo (isset($this->_rootref['S_CONTENT_FLOW_BEGIN'])) ? $this->_rootref['S_CONTENT_FLOW_BEGIN'] : ''; ?>"><span class="gensmall">
                        [ <a href="<?php echo $_topic_review_row_val['U_MCP_DETAILS']; ?>"><?php echo ((isset($this->_rootref['L_POST_DETAILS'])) ? $this->_rootref['L_POST_DETAILS'] : ((isset($user->lang['POST_DETAILS'])) ? $user->lang['POST_DETAILS'] : '{ POST_DETAILS }')); ?></a> ]
                      </span></td>
                    </tr>
   					<?php } ?>
                </table></td>
              </tr>
          </table></td>
          <?php } ?>
        </tr>
        <tr>
          <td class="spacer" colspan="2"><img src="images/spacer.gif" alt="" width="1" height="1" /></td>
        </tr>
        <?php }} ?>
      </table>
	  </div></td>
</tr>
</table>
</td>
    <td width="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/mr.png');"></td>
  </tr>
  <tr>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bl.png" width="18" height="18" alt="" /></td>
    <td height="18" style="background:url('<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/bm.png');"></td>
    <td width="18" height="18"><img src="<?php echo (isset($this->_rootref['T_THEME_PATH'])) ? $this->_rootref['T_THEME_PATH'] : ''; ?>/images/br.png" width="18" height="18" alt="" /></td>
  </tr>
</table>
<br clear="all" />