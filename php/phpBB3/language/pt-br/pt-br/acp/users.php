<?php 
/** 
* 
* acp_users [Portuguese] 
* 
* @package language 
* @version $Id: users.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

$lang = array_merge($lang, array( 
	'ADMIN_SIG_PREVIEW'		=> 'Pré-visualização da Assinatura', 
	'AT_LEAST_ONE_FOUNDER'	=> 'Você não pode mudar este fundador para um usuário normal. É necessário ter no mínimo um fundador para este Fórum. Se você quer mudar a situação deste fundador, promova outro usuário para a condição de fundador primeiro.', 

	'BAN_ALREADY_ENTERED'	=> 'O banimento já havia sido previamente informado. A lista de banisdos não foi atualizada.',
	'BAN_SUCCESSFUL'		=> 'Banido com sucesso!.', 
	
	'CANNOT_BAN_FOUNDER'			=> 'Você não pode banir contas de fundador.',
	'CANNOT_BAN_YOURSELF'			=> 'Você não pode banir a si próprio.', 
	'CANNOT_DEACTIVATE_BOT'			=> 'Você não pode desativar contas de bots. Desative o bot ao invés disso.',
	'CANNOT_DEACTIVATE_FOUNDER'		=> 'Você não pode desativer contas de fundador.',	
	'CANNOT_DEACTIVATE_YOURSELF'	=> 'Você não pode desativar sua própria conta.', 
	'CANNOT_FORCE_REACT_BOT'		=> 'Você não pode forçar a re-ativação de contas de bots. Desative o bot ao invés disso.',
	'CANNOT_FORCE_REACT_FOUNDER'	=> 'Você não pode forçar a re-ativação de uma conta de fundador.',		
	'CANNOT_FORCE_REACT_YOURSELF'	=> 'Você não pode forçar a reativação da sua própria conta.', 
	'CANNOT_REMOVE_ANONYMOUS'		=> 'Você não pode remover a conta do usuário convidado.', 
	'CANNOT_REMOVE_YOURSELF'		=> 'Você não pode remover sua própria conta.', 
	'CANNOT_SET_FOUNDER_BOT'		=> 'Você não pode promover os usuários ignorados para serem os fundadores.',
	'CANNOT_SET_FOUNDER_INACTIVE'	=> 'Você precisa ativar os usuários antes de você os promover a fundadores, somente usuários ativos podem ser promovido.',	
	'CONFIRM_EMAIL_EXPLAIN'			=> 'Você só deve especificar isto se você estiver mudando o endereço de email dos usuários.', 
	 
	'DELETE_POSTS'			=> 'Exclui Postagem', 
	'DELETE_USER'			=> 'Exclui Usuário', 
	'DELETE_USER_EXPLAIN'	=> 'Atenção: a exclusão de um usuário é definitiva! Não há como recuperá-lo posteriormente.',

	'FORCE_REACTIVATION_SUCCESS'	=> 'A Reativação foi forçada com sucesso.',
	'FOUNDER'						=> 'Fundador', 
	'FOUNDER_EXPLAIN'				=> 'Fundadores jamais poderão ser banidos, excludos ou alterados por membros não-fundadores.',

	'GROUP_APPROVE'					=> 'Aprovar Membro',
	'GROUP_DEFAULT'					=> 'Padrão', 
	'GROUP_DELETE'					=> 'Exclui', 
	'GROUP_DEMOTE'					=> 'Rebaixa', 
	'GROUP_PROMOTE'					=> 'Promove', 

	'IP_WHOIS_FOR'			=> 'Quem é o IP para %s', 

	'LAST_ACTIVE'			=> 'Último ativos', 

	'MOVE_POSTS_EXPLAIN'	=> 'Selecione o fórum para o qual você deseja mover todas as postagens que este usuário fez.', 

	'NO_SPECIAL_RANK'		=> 'Sem atribuição de colocação (rank) especial', 
	'NOT_MANAGE_FOUNDER'	=> 'Você tentou gerenciar um usuário Fundador do Fórum. Apenas Fundadores podem gerenciar outros Fundadores.', 

	'QUICK_TOOLS'			=> 'Ferramentas Rápidas', 

	'REGISTERED'			=> 'Registrado', 
	'REGISTERED_IP'			=> 'Registrado do IP', 
	'RETAIN_POSTS'			=> 'Mantém postagens', 

	'SELECT_FORM'			=> 'Seleciona formulário', 
	'SELECT_USER'			=> 'Seleciona Usuário', 

	'USER_ADMIN'					=> 'Administração de Usuário', 
	'USER_ADMIN_ACTIVATE'			=> 'Ativa conta', 
	'USER_ADMIN_ACTIVATED'			=> 'Usuário ativado com sucesso.', 
	'USER_ADMIN_AVATAR_REMOVED'		=> 'O avatar foi removido com sucesso da conta do usuário.', 
	'USER_ADMIN_BAN_EMAIL'			=> 'Banido pelo email', 
	'USER_ADMIN_BAN_EMAIL_REASON'	=> 'Endereço de email banido via gerenciador de usuário.',
	'USER_ADMIN_BAN_IP'				=> 'Banido pelo IP', 
	'USER_ADMIN_BAN_IP_REASON'		=> 'IP banido via gerenciador de usuário', 
	'USER_ADMIN_BAN_NAME_REASON'	=> 'Nome de usuário banido via gerenciador de usuário', 
	'USER_ADMIN_BAN_USER'			=> 'Banido pelo nome de usuário', 
	'USER_ADMIN_DEACTIVATE'			=> 'Desativa conta', 
	'USER_ADMIN_DEACTIVED'			=> 'Usuário desativado com sucesso.', 
	'USER_ADMIN_DEL_ATTACH'			=> 'Exclui todos os anexos', 
	'USER_ADMIN_DEL_AVATAR'			=> 'Exclui avatar', 
	'USER_ADMIN_DEL_POSTS'			=> 'Exclui todas as postagens', 
	'USER_ADMIN_DEL_SIG'			=> 'Exclui assinatura', 
	'USER_ADMIN_EXPLAIN'			=> 'Aqui você pode alterar as informações dos seus usuário. Pra modificar as permissões dos usuários por favor use o sistema de permissões de usuários e grupos.', 
	'USER_ADMIN_FORCE'				=> 'Forçar a Reativação',
	'USER_ADMIN_MOVE_POSTS'			=> 'Move todas as postagens', 
	'USER_ADMIN_SIG_REMOVED'		=> 'Assinatura removida com sucesso da conta do usuário.', 
	'USER_ATTACHMENTS_REMOVED'		=> 'Todos os Anexos feitos por este usuário foram removidos com sucesso.', 
	'USER_AVATAR_UPDATED'			=> 'Detalhes dos avatares do usuário  foram atualizados com sucesso.', 
	'USER_CUSTOM_PROFILE_FIELDS'	=> 'Campos de Perfil Customisados', 
	'USER_DELETED'					=> 'Usuário excluído com sucesso.', 
	'USER_GROUP_ADD'				=> 'Adiciona usuário ao grupo', 
	'USER_GROUP_NORMAL'				=> 'Grupos de usuários Normal é um membro de', 
	'USER_GROUP_PENDING'			=> 'Grupos de usuários está no modo pendente', 
	'USER_GROUP_SPECIAL'			=> 'Grupos de usuários Especial é um membro de', 
	'USER_OVERVIEW_UPDATED'			=> 'Detalhes do Usuário atualizados.', 
	'USER_POSTS_DELETED'			=> 'Todas as postagens feitas por este usuário fora removidas com sucesso.', 
	'USER_POSTS_MOVED'				=> 'As postagens dos usuários para o fórum alvo foram feitas com sucesso.', 
	'USER_PREFS_UPDATED'			=> 'As preferências do usuário foram atualizadas.', 
	'USER_PROFILE'					=> 'Perfil do Usuário', 
	'USER_PROFILE_UPDATED'			=> 'O perfil do usuário foi atualizado com sucesso.', 
	'USER_RANK'						=> 'Colocação do Usuário (rank)', 
	'USER_RANK_UPDATED'				=> 'Colocação do usuário atualizada.', 
	'USER_SIG_UPDATED'				=> 'A assinatura do usuário foi atualizada com sucesso.', 
	'USER_TOOLS'					=> 'Ferramentas Básicas', 
)); 

?>
