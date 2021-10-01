<?php
/**
*
* recaptcha [English]
*
* @package language
* @version $Id: captcha_recaptcha.php 9933 2009-08-06 09:12:21Z marshalrusty $
* @copyright (c) 2009 phpBB Group
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*
*/

/**
* DO NOT CHANGE
*/
if (!defined('IN_PHPBB'))
{
	exit;
}

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
	'RECAPTCHA_LANG'				=> 'en',
	'RECAPTCHA_NOT_AVAILABLE'		=> 'Para poder usar reCaptcha, voce deve criar uma conta de usu&aacute;rio em <a href="http://recaptcha.net">reCaptcha.net</a>.',
	'CAPTCHA_RECAPTCHA'				=> 'reCaptcha',
	'RECAPTCHA_INCORRECT'			=> 'O c&oacute;digo de confirma&ccedil;&atilde;o visual enviado est&aacute; incorreto',

	'RECAPTCHA_PUBLIC'				=> 'Chave P&uacute;blica do reCaptcha',
	'RECAPTCHA_PUBLIC_EXPLAIN'		=> 'Sua chave p&uacute;blica do reCaptcha. Chaves podem ser obtidas em <a href="http://recaptcha.net">reCaptcha.net</a>.',
	'RECAPTCHA_PRIVATE'				=> 'Chave Particular de reCaptcha',
	'RECAPTCHA_PRIVATE_EXPLAIN'		=> 'Sua chave particular do reCaptcha. Chaves podem ser obtidas em <a href="http://recaptcha.net">reCaptcha.net</a>.',

	'RECAPTCHA_EXPLAIN'				=> 'No esfor&ccedil;o para previnir cadastros autom&aacute;ticos, n&oaacute;s exigimos que voce entre com as duas palavras mostradas acima no campo de texto abaixo.',
));

?>