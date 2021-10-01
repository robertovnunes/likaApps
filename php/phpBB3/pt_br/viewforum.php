<?php
/** 
*
* viewforum [Portuguese]
*
* @package language
* @version $Id: viewforum.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
* @copyright (c) 2007 Suporte phpBB
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
* @Traduzido por:
* @Suporte phpBB - <http://www.suportephpbb.org/>
* 
*/ 

/**
* DO NOT CHANGE
*/
if (empty($lang) || !is_array($lang))
{
	$lang = array();
}

// DEVELOPERS PLEASE NOTE
//
// All language files should use UTF-8 as their encoding and the files must not contain a BOM.
//
// Placeholders can now contain order information, e.g. instead of
// 'Page %s of %s' you can (and should) write 'Page %1$s of %2$s', this allows
// translators to re-order the output of data while ensuring it remains correct
//
// You do not need this where single placeholders are used, e.g. 'Message %d' is fine
// equally where a string contains only two placeholders which are used to wrap text
// in a url you again do not need to specify an order e.g., 'Click %sHERE%s' is fine

$lang = array_merge($lang, array(
	'ACTIVE_TOPICS'			=> 'Tópicos ativos',
	'ANNOUNCEMENTS'			=> 'Anpuncios',

	'FORUM_PERMISSIONS'		=> 'Permissões do fórum',

	'ICON_ANNOUNCEMENT'		=> 'Anúncio',
	'ICON_STICKY'			=> 'Fixo',

	'LOGIN_NOTIFY_FORUM'	=> 'Você foi notificado sobre este fórum, faça o login para vê-lo.',

	'MARK_TOPICS_READ'		=> 'Marcar tópicos como lidos',

	'NEW_POSTS_HOT'			=> 'Novas Mensagens [ Popular ]',
	'NEW_POSTS_LOCKED'		=> 'Novas Mensagens [ Trancado ]',
	'NO_NEW_POSTS_HOT'		=> 'Sem Novas Mensagens [ Popular ]',
	'NO_NEW_POSTS_LOCKED'	=> 'Sem Novas Mensagens [ Trancado ]',
	'NO_READ_ACCESS'		=> 'Você não têm as permissões necessárias para ler um tópico neste fórum.',

	'POST_FORUM_LOCKED'		=> 'Fórum Trancado',

	'TOPICS_MARKED'			=> 'Os Tópicos deste fórum foram marcados como Lidos.',

	'VIEW_FORUM'			=> 'Ver fórum',
	'VIEW_FORUM_TOPIC'		=> '1 tópico',
	'VIEW_FORUM_TOPICS'		=> '%d tópicos',
));

?>
