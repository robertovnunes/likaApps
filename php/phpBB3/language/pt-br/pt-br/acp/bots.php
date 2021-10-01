<?php 
/** 
* 
* acp_bots [Portuguese] 
* 
* @package language 
* @version $Id: bots.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'BOTS'				=> 'Gerencia de Bots', 
	'BOTS_EXPLAIN'		=> 'Bots são agentes automatos usados pelos motores de busca para actualizar os banco de dados do motor automaticamente. Estes podem assim fazer uma visão menos correta das estatísticas de número de visitantes no Fórum aumentando assim a carga deste. Aqui você pode definir um tipo especial de usuário para superar estes problemas.', 
	'BOT_ACTIVATE'		=> 'Ativado',
	'BOT_ACTIVE'		=> 'Bot Ativo',
	'BOT_ADD'			=> 'Adicionar bot',
	'BOT_ADDED'			=> 'Novo bot adicionado com sucesso.',
	'BOT_AGENT'			=> 'Agente de partida',
	'BOT_AGENT_EXPLAIN'	=> 'm fio que emparelha o agente de browser de bots, são permitidas partidas parciais.',
	'BOT_DEACTIVATE'	=> 'Desativado',
	'BOT_DELETED'		=> 'Bot removido com sucesso.',
	'BOT_EDIT'			=> 'Editar bot',
	'BOT_EDIT_EXPLAIN'	=> 'Aqui você pode editar ou adicionar novos bot. Você pode definir ao bot uma expressão e/ou um ou mais IP (ou range de endereços) para coincidir. Cuidado ao definir um parâmetro ou um endereço. Pode especificar também um estilo ou uma linguagem para o bot ver o seu fórum. Isto pode permitir a você reduzir o tráfego do seu site usando um estilo simples para bots. Não esqueça de marcar permissões para para o grupo especial de bots.', 
	'BOT_LANG'			=> 'Idioma do Bot', 
	'BOT_LANG_EXPLAIN'	=> 'O idioma presente no bot quando ele navega.', 
	'BOT_LAST_VISIT'	=> 'Ultima visita', 
	'BOT_IP'			=> 'IP do Bot', 
	'BOT_IP_EXPLAIN'	=> 'Nomes parciais são permitidos desde que separados por virgulas (,).', 
	'BOT_NAME'			=> 'Nome do Bot', 
	'BOT_NAME_EXPLAIN'	=> 'Usado apenas para informação sua.', 
	'BOT_NEVER'			=> 'Nunca', 
	'BOT_STYLE'			=> 'Estilo do Bot', 
	'BOT_STYLE_EXPLAIN'	=> 'O estilo usado para o Fórum pelo bot.', 
	'BOT_UPDATED'		=> 'Bot existente actualizado com sucesso.', 
	'BOT_VIS'			=> 'Bot visivel', 
	'BOT_VIS_EXPLAIN'	=> 'Permitir que o bot seja visto por todos os usuários como estando online.', 

	'ERR_BOT_AGENT_MATCHES_UA'	=> 'O agente de bot que você proveu é semelhante ao que você está usando atualmente. Por favor ajuste o agente para este bot.',
	'ERR_BOT_NO_IP'			=> 'O IP que você forneceu é inválido ou o hostname não pode ser resolvido.', 
	'ERR_BOT_NO_MATCHES'	=> 'Tem que indicar pelo menos uma descrição do navegador ou um IP para o parâmetro.', 

	'NO_BOT'	=> 'Não foi encontrado nenhum bot com o ID especificado.', 
	'NO_BOT_GROUP'	=> 'Incapaz de achar grupo de bot especial.',
)); 

?>