<?php 
/** 
* 
* acp_groups [Portuguese] 
* 
* @package language 
* @version $Id: groups.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ACP_GROUPS_MANAGE_EXPLAIN'		=> 'Aqui você pode administrar todos os seus Grupos de Usuários, adicionando, editando e excluindo grupos existentes. Você deve selecionar lderes, especificar status do grupo para Aberto/Fechado e escrever o Nome e a Descrição do grupo.',
	'ADD_USERS'						=> 'Adicionar Usuários', 
	'ADD_USERS_EXPLAIN'				=> 'Aqui você pode adicionar novos usuários ao seu grupo. Você deve selecionar whether this group becomes the new default for the selected users. Você pode também selecionar eles como Líderes do Grupo. Por Favor, escreva cada Usuário em uma linha separada.', 

	'COPY_PERMISSIONS'				=> 'Copiar permissões de', 
	'COPY_PERMISSIONS_EXPLAIN'		=> 'Uma vez criadas, o grupo terá as mesmas permissões que as que você selecionar aqui.', 
	'CREATE_GROUP'					=> 'Criar um Grupo', 

	'GROUPS_NO_MEMBERS'				=> 'O Grupo selecionado não possui Membros', 
	'GROUPS_NO_MODS'				=> 'O Líder do Grupo não foi selecionado', 
	'GROUP_APPROVE'					=> 'Aprovar Membros', 
	'GROUP_APPROVED'				=> 'Membros Aprovados', 
	'GROUP_AVATAR'					=> 'Avatar do Grupo', 
	'GROUP_AVATAR_EXPLAIN'			=> 'Esta imagem será exibida no Painel de Grupos.', 
	'GROUP_CLOSED'					=> 'Fechado', 
	'GROUP_COLOR'					=> 'Cor do Grupo', 
	'GROUP_COLOR_EXPLAIN'			=> 'Aqui você pode selecionar a cor dos usuários do grupo. Deixe em branco se não desejar ativar esta opção.', 
	'GROUP_CREATED'					=> 'O Grupo selecionado foi criado com sucesso.', 
	'GROUP_DEFAULT'					=> 'Make group default for member', 
	'GROUP_DEFS_UPDATED'			=> 'Default group set for all selected members.', 
	'GROUP_DELETE'					=> 'Excluir Membro do Grupo', 
	'GROUP_DELETED'					=> 'Group deleted and user default groups set successfully.', 
	'GROUP_DEMOTE'					=> 'Demitir Líder do Grupo', 
	'GROUP_DESC'					=> 'Descrição do Grupo', 
	'GROUP_DETAILS'					=> 'Informação do Grupo', 
	'GROUP_EDIT_EXPLAIN'			=> 'Aqui você pode editar qualquer grupo existente. Você pode alterar o seu nome, descrição e estado (aberto, fechado, etc.). Você pode também especificar outras opções como a sua coloração, rank, etc. As alterações feitas aqui afetarão aos usuários pertencentes ao grupo. Por Favor, note que os membros do grupo podem alterar seus avatares a menos que você selecione as permissões de usuários apropriadas.', 
	'GROUP_ERR_USERS_EXIST'			=> 'Os Usuários selecionados já são Membros deste Grupo.', 
	'GROUP_FOUNDER_MANAGE'			=> 'Apenas Gerenciar Descobridor', 
	'GROUP_FOUNDER_MANAGE_EXPLAIN'	=> 'Restringir gerenciamento de grupos para este grupo apenas por fundadores. Os Usurios que possuem as permisses de grupo apropriadas, tm permisso para visualizar este grupo bem como os seus membros.',
	'GROUP_HIDDEN'					=> 'Invisível', 
	'GROUP_LANG'					=> 'Língua do Grupo', 
	'GROUP_LEAD'					=> 'Líderes do Grupo', 
	'GROUP_LEADERS_ADDED'			=> 'Os novos Líderes foram adicionados com sucesso.', 
	'GROUP_LEGEND'					=> 'Exibir Grupo na Legenda', 
	'GROUP_LIST'					=> 'Membros com Direção Geral', 
	'GROUP_LIST_EXPLAIN'			=> 'Esta é uma lista completa de todos os atuais membros com direção geral neste grupo. Você pode excluir usuários (exceto em certos grupos especiais) ou adicionar novos como você pode ver.', 
	'GROUP_MEMBERS'					=> 'Membros do Grupo', 
	'GROUP_MEMBERS_EXPLAIN'			=> 'Aqui está uma Lista Completa de todos os usuários pertencentes a este grupo. Isto inclue seções separadas para líderes, pendentes e membros existentes. Através deste painel você pode gerenciar todos os aspectos sobre quem possue direção geral neste grupo e o que eles realizam. Para excluir um Líder sem retirá-lo do grupo, use Demote rather como deletar. Similarmente, use Promover para tornar um membro existente um líder.', 
	'GROUP_MESSAGE_LIMIT'			=> 'Limite de Mensagens Particulares do Grupo por Pasta', 
	'GROUP_MESSAGE_LIMIT_EXPLAIN'	=> 'Esta configuração substitui o limite da pasta de mensagem por usuário. Um valor como 0 significa que the user default limit será utilizado.', 
	'GROUP_MODS_ADDED'				=> 'Os Moderadores do grupo foram adicionados com sucesso.', 
	'GROUP_MODS_DEMOTED'			=> 'Os Líderes selecionados foram demitidos com sucesso.', 
	'GROUP_MODS_PROMOTED'			=> 'Os Membros selecionados foram promovidos com sucesso.', 
	'GROUP_NAME'					=> 'Nome do Grupo', 
  	'GROUP_NAME_TAKEN'				=> 'O nome do grupo informado já está em uso, informe um alternativo.',
	'GROUP_OPEN'					=> 'Aberto', 
	'GROUP_PENDING'					=> 'Membros Pendentes', 
	'GROUP_PROMOTE'					=> 'Promover para Líder do Grupo', 
	'GROUP_RANK'					=> 'Rank do Grupo', 
	'GROUP_RECEIVE_PM'				=> 'Grupo permitido para receber Mensagens Particulares', 
	'GROUP_RECEIVE_PM_EXPLAIN'		=> 'Os grupos ocultos não podem receber mensagens, mesemo selecionando esta opção.',	
	'GROUP_REQUEST'					=> 'Inscrição', 
	'GROUP_SETTINGS'				=> 'Escrever Preferências dos Usuários', 
	'GROUP_SETTINGS_EXPLAIN'		=> 'Aqui você pode forçar alterações nas preferências atuais dos usuárioss. Por Favor, note estas configurações não são salvas para o grupo. Elas são apenas um método rápido para alterar as configurações de todos os usuários do grupo.', 
	'GROUP_SETTINGS_SAVE'			=> 'Configuraes de Groupwide',
	'GROUP_TIMEZONE'				=> 'Group timezone', 
	'GROUP_TYPE'					=> 'Estado do Grupo', 
	'GROUP_TYPE_EXPLAIN'			=> 'Isto determina quais usuários podem entrar ou ver este grupo.', 
	'GROUP_UPDATED'					=> 'O Grupo foi atualizado com sucesso.', 
	'GROUP_USERS_ADDED'				=> 'Novos Usuários adicionados ao grupo com sucesso.', 
	'GROUP_USERS_EXIST'				=> 'Os Usuários selecionados já são Membros do Grupo.', 
	'GROUP_USERS_REMOVE'			=> 'Os Usuários selecionados foram excluídos com sucesso.', 

	'MAKE_DEFAULT_FOR_ALL'	=> 'Make default group for every member', 
	'MEMBERS'				=> 'Membros', 

	'NO_GROUP'					=> 'O Grupo não foi especificado.', 
	'NO_GROUPS_CREATED'			=> 'Este Forum ainda não possui Grupos.', 
	'NO_PERMISSIONS'			=> 'Não Copiar Permissões', 
	'NO_USERS'					=> 'Você não especificou nenhum usuário.', 

	'SPECIAL_GROUPS'			=> 'Grupos pre-definidos', 
	'SPECIAL_GROUPS_EXPLAIN'	=> 'Grupos pre-definidos são grupos especiais, eles não podem ser excluídos ou diretamente modificados. Porém, você ainda pode adicionar membros e alterar configurações básicas.',

	'TOTAL_MEMBERS'				=> 'Membros', 

	'USERS_APPROVED'				=> 'Os Usuários selecionados foram aprovados com sucesso.', 
	'USER_DEFAULT'					=> 'User default', 
	'USER_DEF_GROUPS'				=> 'User defined groups', 
	'USER_DEF_GROUPS_EXPLAIN'		=> 'Estes são Grupo criados por você ou outro administrador deste forum. Você pode gerenciar as condições de membros muito bem como editando as propriedades do grupo ou mesmo excluindo o grupo.',
	'USER_GROUP_DEFAULT'			=> 'Especificar como Default Group', 
	'USER_GROUP_DEFAULT_EXPLAIN'	=> 'Selecionando SIM aqui você especificará este grupo como o grupo padro para os usuários adicionados.',
	'USER_GROUP_LEADER'				=> 'Especificar como Líder do Grupo', 
)); 

?>
