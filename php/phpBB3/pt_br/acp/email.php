<?php 
/** 
* 
* acp_email [Portuguese] 
* 
* @package language 
* @version $Id: email.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
// Placeholders can now contain order information, e.g. instead of 
// 'Page %s of %s' you can (and should) write 'Page %1$s of %2$s', this allows 
// translators to re-order the output of data while ensuring it remains correct 
// 
// You do not need this where single placeholders are used, e.g. 'Message %d' is fine 
// equally where a string contains only two placeholders which are used to wrap text 
// in a url you again do not need to specify an order e.g., 'Click %sHERE%s' is fine 

// Bot settings 
$lang = array_merge($lang, array( 
	'ACP_MASS_EMAIL_EXPLAIN'		=> 'Aqui você pode enviar uma mensagem àtodos os seus usuários ou a todos os usuários de um grupo específico, caso tenha a opo de receber emails em massa ativada. Para isso, uma mensagem será enviado ao endereço de email administrativo informado, com uma copia a todos usuários. A configurao padro apenas inclui 50 recipientes por mensagens, sendo que para mais recipientes mais emails sero enviados. Se você está enviando mensagens a um grande grupo de usuários, por favor, seja paciente e não pare a página durante o envio. É normal que o envio em massa de mensagens leve um grande tempo, e você será avisado quando o processo for terminado.',
	'ALL_USERS'						=> 'Todos os usuários', 

	'COMPOSE'				=> 'Compor', 

	'EMAIL_SEND_ERROR'		=> 'Ocorreu um ou mais erros enquanto enviava o email. Por Favor, confira %sLOG do Erro%s para uma mensagem de erro detalhada.',
	'EMAIL_SENT'			=> 'Sua mensagem foi enviada.', 
	'EMAIL_SENT_QUEUE'		=> 'Sua mensagem foi colocada na fila de envio.', 

	'LOG_SESSION'			=> 'Registra sessão de postagem para registro crítico', 

	'SEND_IMMEDIATELY'		=> 'Enviar imediatamente',
	'SEND_TO_GROUP'			=> 'Enviar para Grupo', 
	'SEND_TO_USERS'			=> 'Enviar para Usuários', 
	'SEND_TO_USERS_EXPLAIN'	=> 'Digitando nomes aqui, voce sobrescreve qualquer grupo selecionado acima. Digite cada nome de usuário numa linha nova.', 

	'MAIL_HIGH_PRIORITY'	=> 'Alta',
	'MAIL_LOW_PRIORITY'		=> 'Baixa',
	'MAIL_NORMAL_PRIORITY'	=> 'Normal',
	'MAIL_PRIORITY'			=> 'Prioridade do E-mail',
	'MASS_MESSAGE'			=> 'Sua Mensagem',
	'MASS_MESSAGE_EXPLAIN'	=> 'Somente insira na mensagem texto puro. Qualquer exceção será removida ao enviar.',	

	'NO_EMAIL_MESSAGE'		=> 'Você precisa informar uma mensagem.',
	'NO_EMAIL_SUBJECT'		=> 'Você precisa informar um assunto para a sua mensagem.',			
)); 

?>
