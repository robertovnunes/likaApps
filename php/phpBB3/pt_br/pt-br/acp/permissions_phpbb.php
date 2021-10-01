<?php 
/** 
* acp_permissions (phpBB Permission Set) [Portuguese] 
* 
* @package language 
* @version $Id: permissions_phpbb.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

/** 
*	MODDERS PLEASE NOTE 
*	 
*	You are able to put your permission sets into a separate file too by 
*	prefixing the new file with permissions_ and putting it into the acp 
*	language folder. 
* 
*	An example of how the file could look like: 
* 
*	<code> 
* 
*	if (empty($lang) || !is_array($lang)) 
*	{ 
*		$lang = array(); 
*	} 
* 
*	// Adding new category 
*	$lang['permission_cat']['bugs'] = 'Bugs'; 
* 
*	// Adding new permission set 
*	$lang['permission_type']['bug_'] = 'Bug Permissions'; 
* 
*	// Adding the permissions 
*	$lang = array_merge($lang, array( 
*		'acl_bug_view'		=> array('lang' => 'Can view bug reports', 'cat' => 'bugs'), 
*		'acl_bug_post'		=> array('lang' => 'Can post bugs', 'cat' => 'post'), // Using a phpBB category here 
*	)); 
* 
*	</code> 
*/ 

// Define categories and permission types 
$lang = array_merge($lang, array( 
	'permission_cat'	=> array( 
		'actions'		=> 'Ações', 
		'content'		=> 'Contentamento', 
		'forums'		=> 'Seções', 
		'misc'			=> 'Diversas', 
		'permissions'	=> 'Permissões', 
		'pm'			=> 'Mensagens Particulares', 
		'polls'			=> 'Enquetes', 
		'post'			=> 'Mensagem', 
		'post_actions'	=> 'Ações de Mensagem', 
		'posting'		=> 'Enviando', 
		'profile'		=> 'Perfil', 
		'settings'		=> 'Configurações', 
		'topic_actions'	=> 'Ações de Tópico', 
		'user_group'	=> 'Usuários &amp; Grupos',
	  'articles' => 'Artigos',		
	), 

	'permission_type'	=> array( 
		'u_'			=> 'Permissões de Usuários', 
		'a_'			=> 'Permissões de Administrador', 
		'm_'			=> 'Permissões de Moderador', 
		'f_'			=> 'Permissões de Seção', 
	), 
)); 

// User Permissions 
$lang = array_merge($lang, array( 
	'acl_u_viewprofile'	=> array('lang' => 'Pode Visualizar Perfil', 'cat' => 'profile'), 
	'acl_u_chgname'		=> array('lang' => 'Pode Editar Usuário', 'cat' => 'profile'), 
	'acl_u_chgpasswd'	=> array('lang' => 'Pode Editar Senha', 'cat' => 'profile'), 
	'acl_u_chgemail'	=> array('lang' => 'Pode Editar endereço de email', 'cat' => 'profile'), 
	'acl_u_chgavatar'	=> array('lang' => 'Pode Editar Avatar', 'cat' => 'profile'), 
	'acl_u_chggrp'		=> array('lang' => 'Pode Editar Grupo Oficial', 'cat' => 'profile'), 

	'acl_u_attach'		=> array('lang' => 'Pode Anexar Arquivos', 'cat' => 'post'), 
	'acl_u_download'	=> array('lang' => 'Pode Baixar Arquivos', 'cat' => 'post'), 
	'acl_u_savedrafts'	=> array('lang' => 'Pode Salvar Rascunho', 'cat' => 'post'), 
	'acl_u_chgcensors'	=> array('lang' => 'Pode Desativar Censura de Palavras', 'cat' => 'post'), 
	'acl_u_sig'			=> array('lang' => 'Pode Usar Assinatura', 'cat' => 'post'), 

	'acl_u_sendpm'		=> array('lang' => 'Pode Enviar Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_masspm'		=> array('lang' => 'Pode Enviar MPs para diversos Usuários e Grupos', 'cat' => 'pm'), 
	'acl_u_readpm'		=> array('lang' => 'Pode Ler Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_edit'		=> array('lang' => 'Pode Editar as próprias Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_delete'	=> array('lang' => 'Pode Excluir Mensagens Particulares de sua pasta', 'cat' => 'pm'), 
	'acl_u_pm_forward'	=> array('lang' => 'Pode Expedir Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_emailpm'	=> array('lang' => 'Pode email Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_printpm'	=> array('lang' => 'Pode Imprimir Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_attach'	=> array('lang' => 'Pode Anexar Arquivos em Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_download'	=> array('lang' => 'Pode Baixar Arquivos em Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_bbcode'	=> array('lang' => 'Pode Usar BBCodes em Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_smilies'	=> array('lang' => 'Pode Usar Smylies em Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_img'		=> array('lang' => 'Pode Usar Imagens em Mensagens Particulares', 'cat' => 'pm'), 
	'acl_u_pm_flash'	=> array('lang' => 'Pode Usar Boletim em Mensagens Particulares', 'cat' => 'pm'), 

	'acl_u_sendemail'	=> array('lang' => 'Pode Enviar emails', 'cat' => 'misc'), 
	'acl_u_sendim'		=> array('lang' => 'Pode Enviar Mensagens Urgentes', 'cat' => 'misc'), 
	'acl_u_ignoreflood'	=> array('lang' => 'Pode Ignorar Limite de Flood', 'cat' => 'misc'), 
	'acl_u_hideonline'	=> array('lang' => 'Pode ficar Invisível', 'cat' => 'misc'), 
	'acl_u_viewonline'	=> array('lang' => 'Pode Ver Todos os Usuários Online', 'cat' => 'misc'), 
	'acl_u_search'		=> array('lang' => 'Pode Pesquisar no Forum', 'cat' => 'misc'), 
)); 

// Forum Permissions 
$lang = array_merge($lang, array( 
	'acl_f_list'		=> array('lang' => 'Pode Ver Seção', 'cat' => 'post'), 
	'acl_f_read'		=> array('lang' => 'Pode Ler Seção', 'cat' => 'post'), 
	'acl_f_post'		=> array('lang' => 'Pode Enviar Mensagens Novas', 'cat' => 'post'), 
	'acl_f_reply'		=> array('lang' => 'Pode Responder Mensagens', 'cat' => 'post'), 
	'acl_f_icons'		=> array('lang' => 'Pode utilizar Ícones de Mensagem', 'cat' => 'post'), 
	'acl_f_announce'	=> array('lang' => 'Pode Enviar Anúncios', 'cat' => 'post'), 
	'acl_f_sticky'		=> array('lang' => 'Pode Enviar Tópicos Fixos', 'cat' => 'post'), 

	'acl_f_poll'		=> array('lang' => 'Pode Criar Enquetes', 'cat' => 'polls'), 
	'acl_f_vote'		=> array('lang' => 'Pode Votar em Enquetes', 'cat' => 'polls'), 
	'acl_f_votechg'		=> array('lang' => 'Pode modificar Votação em Curso', 'cat' => 'polls'), 

	'acl_f_attach'		=> array('lang' => 'Pode Anexar Arquivos', 'cat' => 'content'), 
	'acl_f_download'	=> array('lang' => 'Pode Baixar Arquivos', 'cat' => 'content'), 
	'acl_f_sigs'		=> array('lang' => 'Pode Usar Assinaturas', 'cat' => 'content'), 
	'acl_f_bbcode'		=> array('lang' => 'Pode Usar BBCode', 'cat' => 'content'), 
	'acl_f_smilies'		=> array('lang' => 'Pode Usar Smylies', 'cat' => 'content'), 
	'acl_f_img'			=> array('lang' => 'Pode Usar Imagens', 'cat' => 'content'), 
	'acl_f_flash'		=> array('lang' => 'Pode Usar Boletim', 'cat' => 'content'), 

	'acl_f_edit'		=> array('lang' => 'Pode Editar as Próprias Mensagens', 'cat' => 'actions'), 
	'acl_f_delete'		=> array('lang' => 'Pode Excluir as Próprias Mensagens', 'cat' => 'actions'), 
	'acl_f_user_lock'	=> array('lang' => 'Pode Trancar os Próprios Tópicos', 'cat' => 'actions'), 
	'acl_f_bump'		=> array('lang' => 'Pode bump Tópicos', 'cat' => 'actions'), 
	'acl_f_report'		=> array('lang' => 'Pode Denunciar Mensagens', 'cat' => 'actions'), 
	'acl_f_subscribe'	=> array('lang' => 'Pode Aprovar Seções', 'cat' => 'actions'), 
	'acl_f_print'		=> array('lang' => 'Pode Imprimir Tópicos', 'cat' => 'actions'), 
	'acl_f_email'		=> array('lang' => 'Pode email Tópicos', 'cat' => 'actions'), 

	'acl_f_search'		=> array('lang' => 'Pode Pesquisar no forum', 'cat' => 'misc'), 
	'acl_f_ignoreflood' => array('lang' => 'Pode Ignorar o limite de flood', 'cat' => 'misc'), 
	'acl_f_postcount'	=> array('lang' => 'Incrementar o contador de mensagens<br /><em>Por Favor, note que esta configuração apenas afeta mensagens novas.</em>', 'cat' => 'misc'), 
	'acl_f_noapprove'	=> array('lang' => 'Pode Enviar sem Aprovação', 'cat' => 'misc'), 
)); 

// Moderator Permissions 
$lang = array_merge($lang, array( 
	'acl_m_edit'		=> array('lang' => 'Pode Editar Mensagens', 'cat' => 'post_actions'), 
	'acl_m_delete'		=> array('lang' => 'Pode Excluir Mensagens', 'cat' => 'post_actions'), 
	'acl_m_approve'		=> array('lang' => 'Pode Aprovar Mensagens', 'cat' => 'post_actions'), 
	'acl_m_report'		=> array('lang' => 'Pode Fechar e Excluir Denúncias', 'cat' => 'post_actions'), 
	'acl_m_chgposter'	=> array('lang' => 'Pode alterar Autor da Mensagem', 'cat' => 'post_actions'), 

	'acl_m_move'	=> array('lang' => 'Pode Mover Tópicos', 'cat' => 'topic_actions'), 
	'acl_m_lock'	=> array('lang' => 'Pode Trancar Tópicos', 'cat' => 'topic_actions'), 
	'acl_m_split'	=> array('lang' => 'Pode Subdividir Tópicos', 'cat' => 'topic_actions'), 
	'acl_m_merge'	=> array('lang' => 'Pode merge Tópicos', 'cat' => 'topic_actions'), 

	'acl_m_info'	=> array('lang' => 'Pode Ver detalhes da mensagem', 'cat' => 'misc'), 
	'acl_m_warn'	=> array('lang' => 'Pode dar Advertências', 'cat' => 'misc'), 
	'acl_m_ban'		=> array('lang' => 'Pode Gerenciar Banimentos', 'cat' => 'misc'), // This moderator setting is only global (and not local) 
)); 

// Admin Permissions 
$lang = array_merge($lang, array( 
	'acl_a_board'		=> array('lang' => 'Pode alterar configurações/verificar para atualizações', 'cat' => 'settings'), 
	'acl_a_server'		=> array('lang' => 'Pode alter servidor/configurações de comunicação', 'cat' => 'settings'), 
	'acl_a_jabber'		=> array('lang' => 'Pode alterar Jabber configurações', 'cat' => 'settings'), 
	'acl_a_phpinfo'		=> array('lang' => 'Pode Visualizar configurações do PHP', 'cat' => 'settings'), 

	'acl_a_forum'		=> array('lang' => 'Pode Gerenciar Seções', 'cat' => 'forums'), 
	'acl_a_forumadd'	=> array('lang' => 'Pode Adicionar Seções', 'cat' => 'forums'), 
	'acl_a_forumdel'	=> array('lang' => 'Pode Excluir Seções', 'cat' => 'forums'), 
	'acl_a_prune'		=> array('lang' => 'Pode realizar a Limpeza', 'cat' => 'forums'), 

	'acl_a_icons'		=> array('lang' => 'Pode alterar Ícones de tópicos e Smylies', 'cat' => 'posting'), 
	'acl_a_words'		=> array('lang' => 'Pode alterar Censura de Palavras', 'cat' => 'posting'), 
	'acl_a_bbcode'		=> array('lang' => 'Pode definir BBCode TAGs', 'cat' => 'posting'), 
	'acl_a_attach'		=> array('lang' => 'Pode alterar Configurações de Anexos', 'cat' => 'posting'), 

	'acl_a_user'		=> array('lang' => 'Pode Gerenciar Usuários', 'cat' => 'user_group'), 
	'acl_a_userdel'		=> array('lang' => 'Pode Excluir/Limpar Usuários', 'cat' => 'user_group'), 
	'acl_a_group'		=> array('lang' => 'Pode Gerenciar Grupos', 'cat' => 'user_group'), 
	'acl_a_groupadd'	=> array('lang' => 'Pode Adicionar Grupos', 'cat' => 'user_group'), 
	'acl_a_groupdel'	=> array('lang' => 'Pode Excluir Grupos', 'cat' => 'user_group'), 
	'acl_a_ranks'		=> array('lang' => 'Pode Gerenciar Ranks', 'cat' => 'user_group'), 
	'acl_a_profile'		=> array('lang' => 'Pode Gerenciar Campos do Perfil', 'cat' => 'user_group'), 
	'acl_a_names'		=> array('lang' => 'Pode Gerenciar Nomes Proibidos', 'cat' => 'user_group'), 
	'acl_a_ban'			=> array('lang' => 'Pode Gerenciar Banimentos', 'cat' => 'user_group'), 

	'acl_a_viewauth'	=> array('lang' => 'Pode ver Permissões mascaradas', 'cat' => 'permissions'), 
	'acl_a_authgroups'	=> array('lang' => 'Pode alterar permissões para Grupos individuais', 'cat' => 'permissions'), 
	'acl_a_authusers'	=> array('lang' => 'Pode alterar permissões para Usuários individuais', 'cat' => 'permissions'), 
	'acl_a_fauth'		=> array('lang' => 'Pode alterar Categorias de Permissões de Seções', 'cat' => 'permissions'), 
	'acl_a_mauth'		=> array('lang' => 'Pode alterar Categorias de Permissões de Moderadores', 'cat' => 'permissions'), 
	'acl_a_aauth'		=> array('lang' => 'Pode alterar Categorias de Permissões de Administradores', 'cat' => 'permissions'), 
	'acl_a_uauth'		=> array('lang' => 'Pode alterar Categorias de Permissões de Usuários', 'cat' => 'permissions'), 
	'acl_a_roles'		=> array('lang' => 'Pode gerenciar funções', 'cat' => 'permissions'), 
	'acl_a_switchperm'	=> array('lang' => 'Pode utilizar Outras Permissões', 'cat' => 'permissions'), 

	'acl_a_styles'		=> array('lang' => 'Pode Gerenciar Templates', 'cat' => 'misc'), 
	'acl_a_viewlogs'	=> array('lang' => 'Pode Ver registros', 'cat' => 'misc'), 
	'acl_a_clearlogs'	=> array('lang' => 'Pode Limpar registros', 'cat' => 'misc'), 
	'acl_a_modules'		=> array('lang' => 'Pode Gerenciar Módulos', 'cat' => 'misc'), 
	'acl_a_language'	=> array('lang' => 'Pode Gerenciar Pacotes de Línguas', 'cat' => 'misc'), 
	'acl_a_email'		=> array('lang' => 'Pode Enviar email em massa', 'cat' => 'misc'), 
	'acl_a_bots'		=> array('lang' => 'Pode Gerenciar BOTs', 'cat' => 'misc'), 
	'acl_a_reasons'		=> array('lang' => 'Pode Gerenciar motivos de denúncias/negações', 'cat' => 'misc'), 
	'acl_a_backup'		=> array('lang' => 'Pode Copiar/Restaurar Banco de Dados', 'cat' => 'misc'), 
	'acl_a_search'		=> array('lang' => 'Pode Gerenciar backends de pesquisas e Configurações', 'cat' => 'misc'), 
)); 

?>