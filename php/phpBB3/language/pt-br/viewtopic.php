<?php
/** 
*
* viewtopic [Portuguese]
*
* @package language
* @version $Id: viewtopic.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ATTACHMENT'						=> 'Anexo',
	'ATTACHMENT_FUNCTIONALITY_DISABLED'	=> 'As opções de Anexos foram desativadas.',

	'BOOKMARK_ADDED'		=> 'Tópico adicionado aos favoritos com sucesso.',
	'BOOKMARK_REMOVED'		=> 'Tópico removido dos favoritos com sucesso.',
	'BOOKMARK_TOPIC'		=> 'Adicionar aos Favoritos',
	'BOOKMARK_TOPIC_REMOVE'	=> 'Remover dos Favoritos',
	'BUMPED_BY'				=> 'Ressuscitado pela última vez por %1$s em %2$s.',
	'BUMP_TOPIC'			=> 'Ressuscitar Tópico',

	'CODE'					=> 'Código',

	'DELETE_TOPIC'			=> 'Excluir Tópico',
	'DOWNLOAD_NOTICE'		=> 'Você não tem permissão para ver os arquivos anexados nesta mensagem.',

	'EDITED_TIMES_TOTAL'	=> 'Editado pela última vez por %1$s em %2$s, no total de %3$d vezes.',
	'EDITED_TIME_TOTAL'		=> 'Editado pela última vez por %1$s em %2$s, no total de %3$d vez.',
	'EMAIL_TOPIC'			=> 'Enviar Email',
	'ERROR_NO_ATTACHMENT'	=> 'O Anexo selecionao não existe.',

	'FILE_NOT_FOUND_404'	=> 'O arquivo <strong>%s</strong> não existe.',
	'FORK_TOPIC'			=> 'Copiar Tópico',

	'LINKAGE_FORBIDDEN'		=> 'Você não esta autorizado a ver, baixar, ou criar links de/para este site.',
	'LOGIN_NOTIFY_TOPIC'	=> 'Você foi notificado sobre este tópico, faça o login para vê-lo.',
	'LOGIN_VIEWTOPIC'		=> 'O Administrador exige que você esteja registrado e logado para ver este tópico.',

	'MAKE_ANNOUNCE'				=> 'Alterar para “Anúncio”',
	'MAKE_GLOBAL'				=> 'Alterar para “Global”',
	'MAKE_NORMAL'				=> 'Alterar para “Tópico Simples”',
	'MAKE_STICKY'				=> 'Alterar para “Fixo”',
	'MAX_OPTIONS_SELECT'		=> 'Você pode selecionar até <strong>%d</strong> opções',
	'MAX_OPTION_SELECT'			=> 'Você pode selecionar somente <strong>1</strong> opção',
	'MISSING_INLINE_ATTACHMENT'	=> 'O anexo <strong>%s</strong> não está mais disponível',
	'MOVE_TOPIC'				=> 'Mover Tópico',

	'NO_ATTACHMENT_SELECTED'=> 'Você não selecionou nenhum anexo para baixar ou ver.',
	'NO_NEWER_TOPICS'		=> 'Não existem tópicos novos neste fórum.',
	'NO_OLDER_TOPICS'		=> 'Não existem tópicos antigos neste fórum.',
	'NO_UNREAD_POSTS'		=> 'Não há novas mensagens não lidas neste tópico.',
	'NO_VOTE_OPTION'		=> 'Você precisa selecionar uma opção para votar.',
	'NO_VOTES'				=> 'Sem votos',

	'POLL_ENDED_AT'			=> 'Votação encerrada em %s',
	'POLL_RUN_TILL'			=> 'A votação será encerrada em %s',
	'POLL_VOTED_OPTION'		=> 'Você votou nesta opção',
	'PRINT_TOPIC'			=> 'Versão para impressão',

	'QUICK_MOD'				=> 'Ferramentas Rápidas',
	'QUOTE'					=> 'Citar',

	'REPLY_TO_TOPIC'		=> 'Responder a este Tópico',
	'RETURN_POST'			=> '%sVoltar a mensagem%s',

	'SUBMIT_VOTE'			=> 'Votar',

	'TOTAL_VOTES'			=> 'Total de votos',

	'UNLOCK_TOPIC'			=> 'Destrancar Tópico',

	'VIEW_INFO'				=> 'Detalhes da Mensagem',
	'VIEW_NEXT_TOPIC'		=> 'Próximo Tópico',
	'VIEW_PREVIOUS_TOPIC'	=> 'Tópico Anterior',
	'VIEW_RESULTS'			=> 'Ver Resultado',
	'VIEW_TOPIC_POST'		=> '1 mensagem',
	'VIEW_TOPIC_POSTS'		=> '%d mensagens',
	'VIEW_UNREAD_POST'		=> 'Primera mensagem não lida',
	'VISIT_WEBSITE'			=> 'WWW',
	'VOTE_SUBMITTED'		=> 'O seu Voto foi registrado.',

	'WROTE'					=> 'escrito',
));

?>
