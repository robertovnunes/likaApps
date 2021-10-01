<?php
/** 
*
* memberlist [Portuguese]
*
* @package language
* @version $Id: memberlist.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ABOUT_USER'			=> 'Perfil',
	'ACTIVE_IN_FORUM'		=> 'Fórum mais ativo',
	'ACTIVE_IN_TOPIC'		=> 'Tópico mais ativo',
	'ADD_FOE'				=> 'Adicionar como inimigo',
	'ADD_FRIEND'			=> 'Adicionar como amigo',
	'AFTER'					=> 'Depois',	

	'ALL'					=> 'Todos',

	'BEFORE'				=> 'Antes',

	'CC_EMAIL'				=> 'Enviar uma cópia deste email para mim.',
	'CONTACT_USER'			=> 'Contato',

	'DEST_LANG'				=> 'Linguagem',
	'DEST_LANG_EXPLAIN'		=> 'Selecione a linguagem apropriada (se habilitada) para o destinatário desta mensagem.',

	'EMAIL_BODY_EXPLAIN'	=> 'Esta mensagem será enviada como texto puro, não inclua qualquer cdigo HTML ou BBCODE. O endereo de retorno desta mensagem será o seu endereço de email.',
	'EMAIL_DISABLED'		=> 'Todas as funções de email foram desativadas.',
	'EMAIL_SENT'			=> 'O email foi enviado.',
	'EMAIL_TOPIC_EXPLAIN'	=> 'Esta mensagem será enviada como texto puro, não inclua qualquer cdigo HTML ou BBCODE. As informações daquele tópico serão inclusas na mensagem. O endereo de retorno desta mensagem será o seu endereço de email.',
	'EMPTY_ADDRESS_EMAIL'	=> 'Você precisa informar um endereço de email válido como destinatário.',
	'EMPTY_MESSAGE_EMAIL'	=> 'Você precisa informar uma mensagem para ser enviada no e-mail.',
	'EMPTY_NAME_EMAIL'		=> 'Você precisa informar o nome real do destinatário.',
	'EMPTY_SUBJECT_EMAIL'	=> 'O Ttulo do email deve ser escrito.',
	'EQUAL_TO'				=> 'Igual a',

	'FIND_USERNAME_EXPLAIN'	=> 'Utilize este formulário para procurar membros especificos. Você não precisa preenxer todos os campos. Para dados parciais utilize * como curinga. Se informar uma data, use o formato <kbd>YYYY-MM-DD</kbd> ex. <samp>2004-02-29</samp>. Selecione as caixas de seleção para selecionar um ou mais nomes de usuário (podem ser aceitos vários usuários)Use this form to search for specific members. You do not need to fill out all fields. To match partial data use * as a wildcard. When entering dates use the format <kbd>YYYY-MM-DD</kbd>, e.g. <samp>2004-02-29</samp>. Use the mark checkboxes to select one or more usernames (several usernames may be accepted depending on the form itself) and click the Select Marked button to return to the previous form.',
	'FLOOD_EMAIL_LIMIT'		=> 'Você não pode enviar outro email tão rapidamente. Por Favor, tente novamente mais tarde.',

	'GROUP_LEADER'			=> 'Líder do Grupo',

	'HIDE_MEMBER_SEARCH'	=> 'Ocultar as opções de busca de membros',

	'IM_ADD_CONTACT'		=> 'Adicionar contato',
	'IM_AIM'				=> 'Você precisa ter o AOL Instant Messenger instalado para usar esta opção.',
	'IM_AIM_EXPRESS'		=> 'AIM Express',
	'IM_DOWNLOAD_APP'		=> 'Baixar Aplicativo',
	'IM_ICQ'				=> 'Os usuários podem ter selecionado não receber mensagens instantâneas não solicitadas.',
	'IM_JABBER'				=> 'Os usuários podem ter selecionado não receber mensagens instantâneas não solicitadas.',
	'IM_JABBER_SUBJECT'		=> 'Esta é uma mensagem automática, por favor, não responda! Mensagem enviada pelo usuário %1$s em %2$s.',
	'IM_MESSAGE'			=> 'Sua mensagem',
	'IM_MSNM'				=> 'Você precisa ter o Windows Messanger instalado para usar essa opção.',
	'IM_MSNM_BROWSER'		=> 'Seu navegador não suporte isto.',
	'IM_MSNM_CONNECT'		=> 'O MSNM não está conectado.\nVocê deve conectar seu MSNM para continuar.',		
	'IM_NAME'				=> 'Seu nome',
	'IM_NO_JABBER'			=> 'Enviar mensagem do Jabber não é suportado por este servidor. Você precisa ter um cliente Jabber instalado no seu sistema para contatar o destinatário.',
	'IM_RECIPIENT'			=> 'Destinatário',
	'IM_SEND'				=> 'Enviar Mensagem',
	'IM_SEND_MESSAGE'		=> 'Enviar Mensagem',
	'IM_SENT_JABBER'		=> 'Sua mensagem para %1$s foi enviada com sucesso.',
	'IM_USER'				=> 'Enviar uma mensagem instantânea',
	
	'LAST_ACTIVE'				=> 'Último ativo',
	'LESS_THAN'					=> 'Menor que',
	'LIST_USER'					=> '1 usuário',
	'LIST_USERS'				=> '%d usuários',
	'LOGIN_EXPLAIN_LEADERS'		=> 'O administrador exige que você esteja registrado e logado para ver os membros da equipe.',
	'LOGIN_EXPLAIN_MEMBERLIST'	=> 'O administrador exige que você esteja registrado e logado para acessar a lista de membros.',
	'LOGIN_EXPLAIN_SEARCHUSER'	=> 'O administrador exige que você esteja registrado e logado para pesquisar por usuários.',
	'LOGIN_EXPLAIN_VIEWPROFILE'	=> 'O administrador exige que você esteja registrado e logado para ver perfis.',

	'MORE_THAN'				=> 'Maior que',

	'NO_EMAIL'				=> 'Voc no est autorizado a enviar email a este usuário.',
	'NO_VIEW_USERS'			=> 'Você não está autorizado a ver a lista de membros ou perfis.',

	'ORDER'					=> 'Ordenar',
	'OTHER'					=> 'Outro',

	'POST_IP'				=> 'Enviado do IP/domínio',

	'RANK'					=> 'Rank',
	'REAL_NAME'				=> 'Nome do destinatário',
	'RECIPIENT'				=> 'Destinatário',
	'REMOVE_FOE'			=> 'Remover dos inimigos',
	'REMOVE_FRIEND'			=> 'Remover dos amigos',

	'SEARCH_USER_POSTS'		=> 'Pesquisar mensagens do usuário',
	'SELECT_MARKED'			=> 'Selecionar marcados',
	'SELECT_SORT_METHOD'	=> 'Selecionar método de ordenação',
	'SEND_AIM_MESSAGE'		=> 'Enviar mensagem AIM',
	'SEND_ICQ_MESSAGE'		=> 'Enviar mensagem ICQ',	
	'SEND_IM'				=> 'Enviando mensagem instantânea',
	'SEND_JABBER_MESSAGE'	=> 'Enviar mensagem Jabber',
	'SEND_MESSAGE'			=> 'Mensagem',
	'SEND_MSNM_MESSAGE'		=> 'Enviar mensagem MSNM/WLM',
	'SEND_YIM_MESSAGE'		=> 'Enviar mensagem YIM',		
	'SORT_EMAIL'			=> 'Email',
	'SORT_LAST_ACTIVE'		=> 'Último ativo',
	'SORT_POST_COUNT'		=> 'Número de mensagens',

	'USERNAME_BEGINS_WITH'	=> 'Nome de usuários que comecem com',
	'USER_ADMIN'			=> 'Administrar usuário',
	'USER_FORUM'			=> 'Estatísticas do usuário',
	'USER_ONLINE'			=> 'Online',
	'USER_PRESENCE'			=> 'Presença no Forum',

	'VIEWING_PROFILE'		=> 'Vendo perfil - %s',
	'VISITED'				=> 'Última Visita',

	'WWW'					=> 'Website',
));

?>
