<?php
/**
 * @copyright	Copyright (C) 2011 Simplify Your Web, Inc. All rights reserved.
 * @license		GNU General Public License version 3 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php');
require_once (dirname(__FILE__).DS.'image.php');

jimport('joomla.filesystem.file');

class modLatestNewsEnhancedHelper
{
	static function getList(&$module_id, &$params)
	{
		global $mainframe;
		
		$db			=& JFactory::getDBO();
		$user		=& JFactory::getUser();
		$userId		= (int) $user->get('id');
		
		$count		= (int) $params->get('count', 5);
		$catid		= trim( $params->get('catid') );
		$secid		= trim( $params->get('secid') );
		$show_front	= $params->get('show_front', 1);
		$aid		= $user->get('aid', 0);	
		
		$head_type = $params->get('head_type', 'none');
		$postdate = $params->get('post_date', 'published');
		$text_type = $params->get('text', 1);
		$letter_count = $params->get('letter_count');
		$keep_tags = $params->get('keep_tags');

		$show_author = $params->get('show_author', 1);
		$author_name = $params->get('author_name', 'full');
		$show_date = $params->get('show_date', 'none');
		
		$strip_tags = $params->get('strip_tags', 1);
		$crop_picture = $params->get('crop_picture', 0);
		$head_width = trim($params->get('head_w', '64'));
		$head_height = trim($params->get('head_h', '64'));
		$clear_cache = $params->get('clear_cache', 0);
		
		$tmp_path = $params->get('thumb_path', 'tmp/');
		
		$contentConfig = &JComponentHelper::getParams( 'com_content' );
		$access		= !$contentConfig->get('show_noauth');
		
		$nullDate	= $db->getNullDate();
		
		$date =& JFactory::getDate();
		$now = $date->toMySQL();
		
		$where		= 'a.state = 1'
		. ' AND ( a.publish_up = '.$db->Quote($nullDate).' OR a.publish_up <= '.$db->Quote($now).' )'
		. ' AND ( a.publish_down = '.$db->Quote($nullDate).' OR a.publish_down >= '.$db->Quote($now).' )'
		;
		
		// User Filter
		switch ($params->get( 'user_id' ))
		{
			case 'by_me':
				$where .= ' AND (created_by = ' . (int) $userId . ' OR modified_by = ' . (int) $userId . ')';
				break;
			case 'not_me':
				$where .= ' AND (created_by <> ' . (int) $userId . ' AND modified_by <> ' . (int) $userId . ')';
				break;
		}
		
		// Ordering
		switch ($params->get( 'ordering' ))
		{
			case 'o_asc': $ordering = 'a.ordering ASC'; break;
			case 'o_dsc': $ordering = 'a.ordering DESC'; break;
			case 'p_asc': $ordering = 'a.publish_up ASC'; break;
			case 'p_dsc': $ordering = 'a.publish_up DESC'; break;
			case 'm_asc': $ordering = 'a.modified ASC, a.created ASC'; break;
			case 'm_dsc': $ordering = 'a.modified DESC, a.created DESC'; break;
			case 'c_asc': $ordering = 'a.created ASC'; break;
			case 'c_dsc':
			default:
				$ordering = 'a.created DESC';
				break;
		}
		
		if ($catid)
		{
			$ids = explode( ',', $catid );
			JArrayHelper::toInteger( $ids );
			$catCondition = ' AND (cc.id=' . implode( ' OR cc.id=', $ids ) . ')';
		}
		if ($secid)
		{
			$ids = explode( ',', $secid );
			JArrayHelper::toInteger( $ids );
			$secCondition = ' AND (s.id=' . implode( ' OR s.id=', $ids ) . ')';
		}
		
		// Content Items only
		$query = 'SELECT a.*, ' .
					' CASE WHEN CHAR_LENGTH(a.alias) THEN CONCAT_WS(":", a.id, a.alias) ELSE a.id END as slug,'.
					' CASE WHEN CHAR_LENGTH(cc.alias) THEN CONCAT_WS(":", cc.id, cc.alias) ELSE cc.id END as catslug'.
					' FROM #__content AS a' .
		($show_front == '0' ? ' LEFT JOIN #__content_frontpage AS f ON f.content_id = a.id' : '') .
					' INNER JOIN #__categories AS cc ON cc.id = a.catid' .
					' INNER JOIN #__sections AS s ON s.id = a.sectionid' .
					' WHERE '. $where .' AND s.id > 0' .
		($access ? ' AND a.access <= ' .(int) $aid. ' AND cc.access <= ' .(int) $aid. ' AND s.access <= ' .(int) $aid : '').
		($catid ? $catCondition : '').
		($secid ? $secCondition : '').
		($show_front == '0' ? ' AND f.content_id IS NULL ' : '').
					' AND s.published = 1' .
					' AND cc.published = 1' .
					' ORDER BY '. $ordering;
		$db->setQuery($query, 0, $count);
		$rows = $db->loadObjectList();
		
		$i		= 0;
		$lists	= array();
		foreach ( $rows as $row )
		{
			if($row->access <= $aid)
			{
				$lists[$i]->link = JRoute::_(ContentHelperRoute::getArticleRoute($row->slug, $row->catslug, $row->sectionid));
				$lists[$i]->catlink = JRoute::_(ContentHelperRoute::getCategoryRoute($row->catslug, $row->sectionid));
			} else {
				$lists[$i]->link = JRoute::_('index.php?option=com_user&view=login');
				$lists[$i]->catlink = $lists[$i]->link;
			}
			
			$lists[$i]->title = htmlspecialchars( $row->title );
			
			// author
			if ($show_author) {
				$user =& JFactory::getUser($row->created_by);			
				switch ($author_name) {
					case 'full':
						$lists[$i]->author = htmlspecialchars($user->name);
						break;
					case 'alias':
						$lists[$i]->author = htmlspecialchars($row->created_by_alias);
						break;
					default:
						$lists[$i]->author = htmlspecialchars($user->username);
					break;
				}
			}			
			
			// image
			if ($head_type == "image") {
				$lists[$i]->imagetag = '';
				
				preg_match_all('#<img[^>]*>#i', $row->introtext, $result); // finds all images in the introtext
				if (empty($result[0][0])) { // maybe there are images in the fulltext...
					// missing fulltext from articles.php so get fulltext from an other query
					$db->setQuery('SELECT a.fulltext FROM #__content AS a WHERE a.id ='.$row->id);
					$fulltext = $db->loadResult();
					preg_match_all('#<img[^>]*>#i', $fulltext, $result); // finds all images in the fulltext
				}
				
				if (!empty($result[0][0])) { // $result[0][0] is the first image							
					$img = array();	

					preg_match_all('/(src)=("[^"]*")/i',$result[0][0], $img[$result[0][0]]); // get the src attribute
					foreach ($img as $ii => $value) { // loops only once
						$extensions = get_loaded_extensions();						
						if (!in_array('gd', $extensions)) {
							// missing gd library
							//$item->imagetag = '<span>'.JText::_('MOD_LATESTNEWSENHANCED_GD_NOTLOADED').'</span>';
									
							// loops only once
							$lists[$i]->imagetag = '<img ';
							foreach ($img[$ii][0] as $jj => $value) {
								$lists[$i]->imagetag .= ($img[$ii][0][$jj]).' ';
							}
							$lists[$i]->imagetag .= '/>';
						} else {
							//ini_set('gd.jpeg_ignore_warning', 1);
							
							foreach ($img[$ii][0] as $jj => $value) {							
								$imagesrc = trim($img[$ii][2][$jj], '"'); // works with 'allow url fopen'					
								
								$imageext = explode('.', $imagesrc);
								$imageext = $imageext[count($imageext) - 1];
								$imageext = strtolower($imageext);
								
								$filename = $tmp_path.'thumb_'.$module_id.'_'.$row->id.'.'.$imageext;
								$imageheight = 0;
								if (is_file($filename) && !$clear_cache) { // thumbnail already exists								
									$imagesize = getimagesize($filename);
									$imageheight = $imagesize[1];
								} else { // create the thumbnail									
									$image = new thumbnail;
									$image->setImage($imagesrc, $imageext);
									$image->createThumb($head_width, $head_height, $crop_picture);
									$image->renderImage($filename);								
									$imageheight = $image->getHeight();
								}
								$top = ($head_height - $imageheight) / 2;
								$lists[$i]->imagetag = '<img src="'.$filename.'" style="position:relative;top:'.$top.'px" />';
							}
						}
					}
				}
			}
			
			// date
			$lists[$i]->date = $row->publish_up;
			if ($postdate == 'created') {
				$lists[$i]->date = $row->created;
			} else if ($postdate == 'modified') {
				$lists[$i]->date = $row->modified;
			}
			
			if ($show_date == 'ago') {
				// before PHP 5.2
				$date_time = strtotime(date("Y-m-d", strtotime($lists[$i]->date)));
				$today_time = strtotime(date("Y-m-d"));				
				$nbr_days = round(abs($today_time-$date_time)/60/60/24);
				$lists[$i]->ago = $nbr_days;
			}
			
			$temp = '';
			
			if (trim($letter_count) == '') { // take everything
				if ($text_type) { // take introtext
					if ($strip_tags) {
						$temp = strip_tags($row->introtext);
					} else {
						if (trim($keep_tags) == '') {
							$temp = $row->introtext;
						} else {
							$temp = strip_tags($row->introtext, $keep_tags);
						}
					}
				} else { // take metadescription
					$temp = $row->metadesc;
				}
			} else if ((int)$letter_count > 0) {
				if ($text_type) { // take introtext
					//if ($strip_tags) {
						$temp = strip_tags($row->introtext);
					//} else {
						//$temp = $row->introtext;
					//}
				} else { // take metadescription
					$temp = $row->metadesc;		
				}
					
				$lenTemp = strlen($temp);				
				if ($lenTemp > $letter_count) {
					$temp = substr($temp, 0, $letter_count);
					$temp .= '...';
				}
			}
			
			$lists[$i]->text = $temp;
			
			$i++;
		}
		
		return $lists;
	}
}