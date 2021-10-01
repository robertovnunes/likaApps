<?php 
/** 
* 
* acp_prune [Portuguese] 
* 
* @package language 
* @version $Id: prune.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

// User pruning 
$lang = array_merge($lang, array( 
	'ACP_PRUNE_USERS_EXPLAIN'	=> 'Aqui você pode excluir (ou desativar) usuários de seu forum. Isto pode ser feito de diversas maneiras: pelo seu contador de mensagens, última atividade, etc. Cada um desses critérios podem ser combinados, i.e. você pode Limpar as últimas atividades dos usuários antes de 2002-01-01 com menos de 10 mensagens. Alternativamente, você pode escrever uma Lista de Usuários diretamente dentro da caixa de texto, qualquer critério escrito será ignorado. Cuidado com esta facilidade! Se o usuário foi excluído, não poderá ser recuperado.', 

	'DEACTIVATE_DELETE'			=> 'Desativar ou Excluir', 
	'DEACTIVATE_DELETE_EXPLAIN'	=> 'Escolha whether to deactivate users ou exclua eles entirely, note there is no undo!', 
	'DELETE_USERS'				=> 'Excluir', 
	'DELETE_USER_POSTS'			=> 'Excluir Mensagens Limpas', 
	'DELETE_USER_POSTS_EXPLAIN' => 'Excluir mensagens de Usuários deletados, não tem efeito se os usuários estiverem desativados.', 

	'JOINED_EXPLAIN'			=> 'Escrever uma Data em formato <kbd>YYYY-MM-DD</kbd>.', 

	'LAST_ACTIVE_EXPLAIN'		=> 'Escrever uma Data em formato <kbd>YYYY-MM-DD</kbd>.', 

	'PRUNE_USERS_LIST'				=> 'Limpeza automatica dee usuários',
	'PRUNE_USERS_LIST_DELETE'		=> 'Se selecionar este critério, os usuários terão as suas contas removidas.',
	'PRUNE_USERS_LIST_DEACTIVATE'	=> 'Se selecionar este critério, os usuários terão as suas contas desativadas.',

	'SELECT_USERS_EXPLAIN'		=> 'Escrever Usuários específicos aqui, eles serão utilizados em Preferência para os critérios acima.', 

	'USER_DEACTIVATE_SUCCESS'	=> 'Os Usuários selecionados foram desativados com sucesso.', 
	'USER_DELETE_SUCCESS'		=> 'Os Usuários selecionados foram excluídos com sucesso.',
	'USER_PRUNE_FAILURE'		=> 'Nenhum usuário se ajustou a estes critérios.',

	'WRONG_ACTIVE_JOINED_DATE'	=> 'A data informada está incorreta, o formato esperado é <kbd>YYYY-MM-DD</kbd>.',	
)); 

// Forum Pruning 
$lang = array_merge($lang, array( 
	'ACP_PRUNE_FORUMS_EXPLAIN'	=> 'Aqui você pode excluir qualquer tópico que não tenha sido respondido ou visualizado dentro do número de dias selecionado. Se você não escrever um número, então todos os tópicos serão deletados. Note que esta operação não excluirá tópicos com Votações em Curso ou Tópicos Fixos e Anúncios.', 

	'FORUM_PRUNE'		=> 'Limpeza', 

	'NO_PRUNE'			=> 'Sem Seções Limpas.',

	'SELECTED_FORUM'	=> 'Seção Selecionada', 
	'SELECTED_FORUMS'	=> 'Seções Selecionadas', 

	'POSTS_PRUNED'					=> 'Mensagens Limpas', 
	'PRUNE_ANNOUNCEMENTS'			=> 'Limpar Anúncios', 
	'PRUNE_FINISHED_POLLS'			=> 'Limpas Votações Encerradas', 
	'PRUNE_FINISHED_POLLS_EXPLAIN'	=> 'Excluir Tópicos em que Enquetes tenham iniciado.', 
	'PRUNE_FORUM_CONFIRM'			=> 'Você tem certeza quee deseja ativar a limpeza automatica nos foruns selecionados com as configurações especificadas? Se removidos, os tópicos e mensagens não poderão ser mais recuperados.',
	'PRUNE_NOT_POSTED'				=> 'Dias desde o último enviado', 
	'PRUNE_NOT_VIEWED'				=> 'Dias since o último visualizado', 
	'PRUNE_OLD_POLLS'				=> 'Limpar Enquetes Antigas', 
	'PRUNE_OLD_POLLS_EXPLAIN'		=> 'Excluir tópicos em que enquetes não tenha sido votadas dentro dos dias selecionados.', 
	'PRUNE_STICKY'					=> 'Limpar Tópicos Fixos', 
	'PRUNE_SUCCESS'					=> 'A Limpeza foi executada com sucesso.', 

	'TOPICS_PRUNED'		=> 'Tópicos Limpos', 
)); 

?>
