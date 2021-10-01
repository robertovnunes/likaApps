<?php
/**
 * @copyright	Copyright (C) 2011 Simplify Your Web, Inc. All rights reserved.
 * @license		GNU General Public License version 3 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

class JElementGDTest extends JElement {
		
	var $_name = 'GDTest';

	function fetchElement($name, $value, &$node, $control_name) {
		
		$error_msg_tmpl = '<div style="font-weight: bold; border: 3px solid red; background-color: #FFCCCC; font-size: 120%; margin: 10px 0 20px 0; padding: 3px; text-align: center">%error%</div>';
				
		$html = '';		
		
		$extensions = get_loaded_extensions();
		
		if( !in_array( 'gd', $extensions ) ) {
			return $html .= str_replace('%error%', JText::_('MOD_LATESTNEWSENHANCED_GD_NOTLOADED'), $error_msg_tmpl);
		} else {
			$html .= '<p>'.JText::_('MOD_LATESTNEWSENHANCED_GD_LOADED').'</p>';			
			
			$html .= '<table width="100%" cellpading="0" cellspacing="0" style="margin-bottom: 20px">';
			$html .= '<tr><td width="20px"></td><td>GD Version</td><td>';
			$html .= GD_VERSION;
			$html .= '</td></tr>';
			$html .= '<tr><td width="20px"></td><td>GIF Support</td><td>';			
			if (imagetypes() & IMG_GIF) : $html .= JText::_('MOD_LATESTNEWSENHANCED_ENABLED'); else : $html .= JText::_('MOD_LATESTNEWSENHANCED_DISABLED'); endif;
			$html .= '</td></tr>';
			$html .= '<tr><td width="20px"></td><td>JPG Support</td><td>';
			if (imagetypes() & IMG_JPG) : $html .= JText::_('MOD_LATESTNEWSENHANCED_ENABLED'); else : $html .= JText::_('MOD_LATESTNEWSENHANCED_DISABLED'); endif;
			$html .= '</td></tr>';
			$html .= '<tr><td width="20px"></td><td>PNG Support</td><td>';
			if (imagetypes() & IMG_PNG) : $html .= JText::_('MOD_LATESTNEWSENHANCED_ENABLED'); else : $html .= JText::_('MOD_LATESTNEWSENHANCED_DISABLED'); endif;
			$html .= '</td></tr>';
			$html .= '<tr><td width="20px"></td><td>WBMP Support</td><td>';
			if (imagetypes() & IMG_WBMP) : $html .= JText::_('MOD_LATESTNEWSENHANCED_ENABLED'); else : $html .= JText::_('MOD_LATESTNEWSENHANCED_DISABLED'); endif;
			$html .= '</td></tr>';
			$html .= '</table>';			
		}
		
		return $html;
	}

}
?>