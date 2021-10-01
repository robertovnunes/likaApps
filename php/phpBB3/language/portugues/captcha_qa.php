<?php
/**
*
* captcha_qa [English]
*
* @package language
* @version $Id: captcha_qa.php 9966 2009-08-12 15:12:03Z Kellanved $
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
	'CAPTCHA_QA'				=> 'Q&amp;A CAPTCHA',
	'CONFIRM_QUESTION_EXPLAIN'	=> 'Esta quest&atilde;o &eacute; um meio de previnir registros autom&aacute;ticos a comunidade.',
	'CONFIRM_QUESTION_WRONG'	=> 'Você respondeu errada a quest&atilde;o de confirma&ccedil;&atilde;o.',

	'QUESTION_ANSWERS'			=> 'Respostas',
	'ANSWERS_EXPLAIN'			=> 'Favor entrar com uma resposta v&aacute;lida, uma por linha.',
	'CONFIRM_QUESTION'			=> 'Pergunta',

	'ANSWER'					=> 'Resposta',
	'EDIT_QUESTION'				=> 'Editar Pergunta',
	'QUESTIONS'					=> 'Perguntas',
	'QUESTIONS_EXPLAIN'			=> 'Durante o cadastro, o usu&aacute;rio ser&aacute; perguntado por uma das quest&otilde;es especificadas aqui. Para usar este plugin, pelo menos uma pergunta dever&aacute; ser no idioma padr&atilde;o. Estas perguntas dever&atilde;o ser f&aacute;ceis para os usu&aacute;rios responderem, mas dentro da capacidade de um bot utilizando o Google poder responder. Usando v&aacute;rias perguntas e direcionadas ir&aacute; trazer uma seguran&ccedil;a melhor. Exija que a resposta seja precisa caso a resposta tenha pontua&ccedil;&atilde;o ou minusculas e maiusculas.',
	'QUESTION_DELETED'			=> 'Pergunta removida',
	'QUESTION_LANG'				=> 'Idioma',
	'QUESTION_LANG_EXPLAIN'		=> 'O idioma que esta pergunta e resposta foram escritos.',
	'QUESTION_STRICT'			=> 'Checagem estrita',
	'QUESTION_STRICT_EXPLAIN'	=> 'Se habilitado, letras diferenciadas e espa&ccedil;os em braco ser&atilde;o levados em conta.',

	'QUESTION_TEXT'				=> 'Pergunta',
	'QUESTION_TEXT_EXPLAIN'		=> 'A pergunta que ser&aacute; mostrada ao usu&aacute;rio no cadastro.',

	'QA_ERROR_MSG'				=> 'Favor preencher todos os campos e responder pelo menos uma pergunta.',
	'QA_LAST_QUESTION'			=> 'Voc&ecirc; n&atilde;o pode deletar as perguntas enquanto o plugin estiver ativo.',
));

?>