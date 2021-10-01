<?php 
/** 
* 
* acp common [Portuguese] 
* 
* @package language 
* @version $Id: common.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

// Common 
$lang = array_merge($lang, array( 
	'ACP_ADMINISTRATORS'		=> 'Administradores', 
	'ACP_ADMIN_LOGS'			=> 'Log do Administrador', 
	'ACP_ADMIN_ROLES'			=> 'Tarefas do Administrador', 
	'ACP_ATTACHMENTS'			=> 'Anexos', 
	'ACP_ATTACHMENT_SETTINGS'	=> 'Configurações de Anexos', 
	'ACP_AUTH_SETTINGS'			=> 'Autenticação', 
	'ACP_AUTOMATION'			=> 'Automação', 
	'ACP_AVATAR_SETTINGS'		=> 'Configurações de Avatar',
	 
	'ACP_BACKUP'				=> 'Backup', 
	'ACP_BAN'					=> 'Banimento', 
	'ACP_BAN_EMAILS'			=> 'Banir emails', 
	'ACP_BAN_IPS'				=> 'Banir IPs', 
	'ACP_BAN_USERNAMES'			=> 'Banir Nomes de Usuários', 
	'ACP_BBCODES'				=> 'BBCodes', 
	'ACP_BOARD_CONFIGURATION'	=> 'Configuração do Forum', 
	'ACP_BOARD_FEATURES'		=> 'Características do Forum', 
	'ACP_BOARD_MANAGEMENT'		=> 'Gerenciamento do Forum', 
	'ACP_BOARD_SETTINGS'		=> 'Configurações do Forum', 
	'ACP_BOTS'					=> 'Aranhas/Robôs', 

	'ACP_CAPTCHA'				=> 'CAPTCHA', 

	'ACP_CAT_DATABASE'			=> 'Banco de Dados', 
	'ACP_CAT_DOT_MODS'			=> 'MODs',
	'ACP_CAT_FORUMS'			=> 'Seções', 
	'ACP_CAT_GENERAL'			=> 'Geral', 
	'ACP_CAT_MAINTENANCE'		=> 'Manutenção', 
	'ACP_CAT_PERMISSIONS'		=> 'Permissões', 
	'ACP_CAT_POSTING'			=> 'Mensagem', 
	'ACP_CAT_STYLES'			=> 'Templates', 
	'ACP_CAT_SYSTEM'			=> 'Sistema', 
	'ACP_CAT_USERGROUP'			=> 'Usuários e Grupos', 
	'ACP_CAT_USERS'				=> 'Usuários', 
	'ACP_CLIENT_COMMUNICATION'	=> 'Comunicação do Cliente', 
	'ACP_COOKIE_SETTINGS'		=> 'Configurações de Cookie', 
	'ACP_CRITICAL_LOGS'			=> 'Log do Erro', 
	'ACP_CUSTOM_PROFILE_FIELDS'	=> 'Personalizar Perfil', 

	'ACP_DATABASE'				=> 'Gerenciamento do Banco de Dados', 
	'ACP_DISALLOW'				=> 'Desativar', 
	'ACP_DISALLOW_USERNAMES'	=> 'Nomes Desativados', 

	'ACP_EMAIL_SETTINGS'		=> 'Configurações de email', 
	'ACP_EXTENSION_GROUPS'		=> 'Gerenciar Grupos de Extensões', 

	'ACP_FORUM_BASED_PERMISSIONS'	=> 'Permissões Básicas do Forum', 
	'ACP_FORUM_LOGS'				=> 'Logs do Forum', 
	'ACP_FORUM_MANAGEMENT'			=> 'Gerenciamento do Forum', 
	'ACP_FORUM_MODERATORS'			=> 'Moderadores', 
	'ACP_FORUM_PERMISSIONS'			=> 'Permissões', 
	'ACP_FORUM_ROLES'				=> 'Tarefas do Forum', 

	'ACP_GENERAL_CONFIGURATION'		=> 'Configuração Geral', 
	'ACP_GENERAL_TASKS'				=> 'Tarefas Gerais', 
	'ACP_GLOBAL_MODERATORS'			=> 'Moderadores Globais', 
	'ACP_GLOBAL_PERMISSIONS'		=> 'Permissões Globais', 
	'ACP_GROUPS'					=> 'Grupos', 
	'ACP_GROUPS_FORUM_PERMISSIONS'	=> 'Permissões de Seções e Grupos', 
	'ACP_GROUPS_MANAGE'				=> 'Gerenciar Grupos', 
	'ACP_GROUPS_MANAGEMENT'			=> 'Gerenciamento de Grupos', 
	'ACP_GROUPS_PERMISSIONS'		=> 'Permissões do Grupo', 

	'ACP_ICONS'						=> 'Ícones', 
	'ACP_ICONS_SMILIES'				=> 'Ícones/Smileys', 
	'ACP_IMAGESETS'					=> 'Conjunto de Imagens', 
	'ACP_INACTIVE_USERS'			=> 'Usuários Inativos', 
	'ACP_INDEX'						=> 'Índice de Administração', 

	'ACP_JABBER_SETTINGS'			=> 'Configurações de Jabber', 

	'ACP_LANGUAGE'					=> 'Gerenciamento de Línguas', 
	'ACP_LANGUAGE_PACKS'			=> 'Pacotes de Línguas', 
	'ACP_LOAD_SETTINGS'				=> 'Configurações de Carga', 
	'ACP_LOGGING'					=> 'Conectando', 

	'ACP_MAIN'						=> 'Índice de Administração', 
	'ACP_MANAGE_EXTENSIONS'			=> 'Gerenciar Extensões', 
	'ACP_MANAGE_FORUMS'				=> 'Gerenciar Seções', 
	'ACP_MANAGE_RANKS'				=> 'Gerenciar Ranks', 
	'ACP_MANAGE_REASONS'			=> 'Gerenciar Razões de Denúncias/Negações', 
	'ACP_MANAGE_USERS'				=> 'Gerenciar Usuários', 
	'ACP_MASS_EMAIL'				=> 'Email em Massa', 
	'ACP_MESSAGES'					=> 'Mensagens', 
	'ACP_MESSAGE_SETTINGS'			=> 'Configurações de Mensagem Particular', 
	'ACP_MODULE_MANAGEMENT'			=> 'Gerenciamento de Módulos', 
	'ACP_MOD_LOGS'					=> 'Log do Moderador', 
	'ACP_MOD_ROLES'					=> 'Tarefas do Moderador', 

	'ACP_ORPHAN_ATTACHMENTS'	=> 'Anexos Órfãos', 

	'ACP_PERMISSIONS'			=> 'Permissões', 
	'ACP_PERMISSION_MASKS'		=> 'Permission masks', 
	'ACP_PERMISSION_ROLES'		=> 'Permission roles', 
	'ACP_PERMISSION_TRACE'		=> 'Cópia de Configuração', 
	'ACP_PHP_INFO'				=> 'Informação PHP', 
	'ACP_POST_SETTINGS'			=> 'Configuração de Mensagens', 
	'ACP_PRUNE_FORUMS'			=> 'Limpeza de Seções', 
	'ACP_PRUNE_USERS'			=> 'Limpeza de Usuários', 
	'ACP_PRUNING'				=> 'Limpando', 

	'ACP_QUICK_ACCESS'			=> 'Acesso Rápido', 

	'ACP_RANKS'					=> 'Ranks', 
	'ACP_REASONS'				=> 'Razões de Denúncia/Negação', 
	'ACP_REGISTER_SETTINGS'		=> 'Configuração de Registro', 

	'ACP_RESTORE'				=> 'Restaurar', 

	'ACP_SEARCH'				=> 'Configuração da Pesquisa', 
	'ACP_SEARCH_INDEX'			=> 'Índice da Pesquisa', 
	'ACP_SEARCH_SETTINGS'		=> 'Configurações de Pesquisa', 

	'ACP_SECURITY_SETTINGS'		=> 'Configurações de Segurança', 
	'ACP_SERVER_CONFIGURATION'	=> 'Configurações do Servidor', 
	'ACP_SERVER_SETTINGS'		=> 'Configurações do Servidor', 
	'ACP_SIGNATURE_SETTINGS'	=> 'Configurações de Assinatura', 
	'ACP_SMILIES'				=> 'Smileys', 
	'ACP_STYLE_COMPONENTS'		=> 'Componentes do Estilo', 
	'ACP_STYLE_MANAGEMENT'		=> 'Gerenciamento de Templates', 
	'ACP_STYLES'				=> 'Templates', 

	'ACP_TEMPLATES'				=> 'Templates', 
	'ACP_THEMES'				=> 'Temas', 

	'ACP_UPDATE'					=> 'Atualizando', 
	'ACP_USERS_FORUM_PERMISSIONS'	=> 'Permissões de Seções e Usuários', 
	'ACP_USERS_LOGS'				=> 'Log do Usuário', 
	'ACP_USERS_PERMISSIONS'			=> 'Permissões do Usuário', 
	'ACP_USER_ATTACH'				=> 'Anexos', 
	'ACP_USER_AVATAR'				=> 'Avatar', 
	'ACP_USER_FEEDBACK'				=> 'Feedback', 
	'ACP_USER_GROUPS'				=> 'Grupos', 
	'ACP_USER_MANAGEMENT'			=> 'Gerenciamento de Usuários', 
	'ACP_USER_OVERVIEW'				=> 'Revisão', 
	'ACP_USER_PERM'					=> 'Permissões', 
	'ACP_USER_PREFS'				=> 'Preferências', 
	'ACP_USER_PROFILE'				=> 'Perfil', 
	'ACP_USER_RANK'					=> 'Rank', 
	'ACP_USER_ROLES'				=> 'Tarefas do Usuário', 
	'ACP_USER_SECURITY'				=> 'Segurança do Usuário', 
	'ACP_USER_SIG'					=> 'Assinatura', 

	'ACP_VC_SETTINGS'					=> 'Configurações da Confirmação Visual', 
	'ACP_VC_CAPTCHA_DISPLAY'			=> 'Previsão da Imagem CAPTCHA', 
	'ACP_VERSION_CHECK'					=> 'Verificar Atualizações', 
	'ACP_VIEW_ADMIN_PERMISSIONS'		=> 'Ver Permissões Administrativas', 
	'ACP_VIEW_FORUM_MOD_PERMISSIONS'	=> 'Ver Permissões de Moderação', 
	'ACP_VIEW_FORUM_PERMISSIONS'		=> 'Ver Permissões Básicas', 
	'ACP_VIEW_GLOBAL_MOD_PERMISSIONS'	=> 'Ver Permissões Globais', 
	'ACP_VIEW_USER_PERMISSIONS'			=> 'Ver Permissões do Usuário', 

	'ACP_WORDS'					=> 'Censura de Palavras', 

	'ACTION'				=> 'Ação', 
	'ACTIONS'				=> 'Ações', 
	'ACTIVATE'				=> 'Ativo', 
	'ADD'					=> 'Adicionar', 
	'ADMIN'					=> 'Administração', 
	'ADMIN_INDEX'			=> 'Índice de Administração', 
	'ADMIN_PANEL'			=> 'Painel de Administração', 

	'BACK'					=> 'Voltar', 

	'COLOUR_SWATCH'			=> 'Web-safe colour swatch', 
	'CONFIG_UPDATED'		=> 'Configuração atualizada com sucesso.', 

	'DEACTIVATE'				=> 'Desativar', 
	'DIRECTORY_DOES_NOT_EXIST'	=> 'A Pasta selecionada não existe.', 
	'DIRECTORY_NOT_DIR'			=> 'A Pasta selecionada não é um diretório.', 
	'DIRECTORY_NOT_WRITABLE'	=> 'A Pasta selecionada não pode ser escrita.', 
	'DISABLE'					=> 'Desativar', 
	'DOWNLOAD'					=> 'Baixar', 
	'DOWNLOAD_AS'				=> 'Baixar como', 
	'DOWNLOAD_STORE'			=> 'Baixar ou Salvar Arquivo', 
	'DOWNLOAD_STORE_EXPLAIN'	=> 'Você deve baixar diretamente o arquivo ou salvá-lo em seu diretório.', 

	'EDIT'					=> 'Editar', 
	'ENABLE'				=> 'Ativar', 
	'EXPORT_DOWNLOAD'		=> 'Download', 
	'EXPORT_STORE'			=> 'Salvar', 

	'GENERAL_OPTIONS'		=> 'Opções Gerais', 
	'GENERAL_SETTINGS'		=> 'Configurações Gerais', 
	'GLOBAL_MASK'			=> 'Global permission mask', 

	'INSTALL'				=> 'Instalar', 
	'IP'					=> 'IP do Usuário', 
	'IP_HOSTNAME'			=> 'Endereço de IP ou hostnames', 

	'LOGGED_IN_AS'			=> 'Você está logado como:', 
	'LOGIN_ADMIN'			=> 'Para administrar o forum, você precisa ser um usuário autenticado.', 
	'LOGIN_ADMIN_CONFIRM'	=> 'Para administrar o forum, você precisa reautenticar o seu registro.', 
	'LOGIN_ADMIN_SUCCESS'	=> 'O seu registro foi autenticado com sucesso e agora você será redirecionado ao Painel de Administração.',
	'LOOK_UP_FORUM'			=> 'Selecione uma Seção', 
	'LOOK_UP_FORUMS_EXPLAIN'=> 'Você pode selecionar mais de um forum.',

	'MANAGE'				=> 'Gerenciar',
	'MENU_TOGGLE'			=> 'Ocultar ou mostrar o menu lateral',	
	'MOVE_DOWN'				=> 'Mover - Baixo', 
	'MOVE_UP'				=> 'Mover - Cima', 

	'NOTIFY'				=> 'Aviso', 
	'NO_ADMIN'				=> 'Você não está autorizado a administrar este painel.', 
	'NO_EMAILS_DEFINED'		=> 'Sem endereços de email válidos encontrados.',
	'NO_PASSWORD_SUPPLIED'	=> 'Você precisa informar a sua senha para acessar o Painel de Administração.',	

	'OFF'					=> 'Desativado',
	'ON'					=> 'Ativado',

	'PARSE_BBCODE'						=> 'Parse BBCode', 
	'PARSE_SMILIES'						=> 'Parse smilies', 
	'PARSE_URLS'						=> 'Parse links', 
	'PERMISSIONS_TRANSFERRED'			=> 'Permissões Transferidas', 
	'PERMISSIONS_TRANSFERRED_EXPLAIN'	=> 'Você está atualmente possuindo as permissões de %1$s. Você pode navegar pelo forum com as permissões de usuário, mas não acessar o painel de administração desde que possua as devidas permissões. Você pode <a href="%2$s"><strong>reverter suas permissões</strong></a> a qualquer momento.', 
	'PIXEL'							=> 'px', 
	'PROCEED_TO_ACP'					=> '%sIr ao Painel de Administração%s', 

	'REMIND'							=> 'Lembrar', 
	'RESYNC'							=> 'Re-Sincronizar', 
	'RETURN_TO'							=> 'Voltar a', 

	'SELECT_ANONYMOUS'		=> 'Selecionar Usuário Anônimo', 
	'SELECT_OPTION'			=> 'Selecionar Opção', 

	'UCP'					=> 'Painel de Usuários', 
	'USERNAMES_EXPLAIN'		=> 'Insira cada usuário em uma linha separada.', 
	'USER_CONTROL_PANEL'	=> 'Painel de Usuários', 

	'WARNING'				=> 'Advertência', 
)); 

// PHP info 
$lang = array_merge($lang, array( 
	'ACP_PHP_INFO_EXPLAIN'	=> 'Esta página lista as informações da Versão do PHP instalado neste servidor. Isto inclui detalhes de módulos carregados, variáveis disponíveis configurações padrão. Esta informação pode ser necessária quando erros forem detectados. Por Favor, fique atento que alguns servidores irão limitar quais informações serão exibidas aqui por medidas de segurança. Você está alertado a não entregar qualquer detalhes nesta página exceto quando perguntado por <a href="http://www.phpbb.com/about/">Official Team Members</a> no forum de suporte.', 

	'NO_PHPINFO_AVAILABLE'	=> 'As informações PHP não podem ser determinadas. O Phpinfo() foi desativado por medidas de segurança.', 
)); 

// Logs 
$lang = array_merge($lang, array( 
	'ACP_ADMIN_LOGS_EXPLAIN'	=> 'Isto lista todas as ações realizadas pelos administradores. Você pode classificar por usuário, data, IP ou ação. Se você tiver as permissões necessárias, você pode limpar operações individuais ou o log como um todo.', 
	'ACP_CRITICAL_LOGS_EXPLAIN'	=> 'Isto lista todas as ações realizadas pelo forum em si. Estes LOGs provem com informações de que você pode solucionar problemas específicos, por exemplo a falha no envio de emails. Você pode classificar por usuário, data, IP ou ação. Se você tiver as permissões necessárias, você pode limpar operações individuais ou o log como um todo.',
	'ACP_MOD_LOGS_EXPLAIN'		=> 'Isto lista todas as ações realizadas pelos moderadores do forum, então selecione uma seção da lista. Você pode classificar por usuário, data, IP ou ação. Se você tiver as permissões necessárias, você pode limpar operações individuais ou o log como um todo.', 
	'ACP_USERS_LOGS_EXPLAIN'	=> 'Isto lista todas as ações realizadas pelos usuários do forum.', 
	'ALL_ENTRIES'				=> 'Todas as Entradas',

	'DISPLAY_LOG'	=> 'Exibir entries de anteriores', 

	'NO_ENTRIES'	=> 'Sem LOGs para este Período.',

	'SORT_IP'		=> 'Endereço de IP', 
	'SORT_DATE'		=> 'Data', 
	'SORT_ACTION'	=> 'Ação do Log', 
)); 

// Index page 
$lang = array_merge($lang, array( 
	'ADMIN_INTRO'				=> 'Obrigado por escolher o phpBB como seu forum. Aqui você poderá visualizar as estatísticas gerais de seu forum. Os Links no painel esquerdo lhe dão acesso a diversas ferramentas administrativas para o seu phpBB, sendo que cada um possui instruções de como utilizá-lo.', 
	'ADMIN_LOG'					=> 'Log das Ações dos Administradores', 
	'ADMIN_LOG_INDEX_EXPLAIN'	=> 'Aqui você terá uma revisão das cinco últimas ações realizadas pelos administradores. Uma cópia completa do log pode ser visualizada através do item apropriado no Menu ou seguindo o link acima/abaixo.', 
	'AVATAR_DIR_SIZE'			=> 'Tamanho do Diretório do Avatar', 

	'BOARD_STARTED'		=> 'Início do Forum', 

	'DATABASE_SERVER_INFO'	=> 'Servidor do Banco de Dados', 
	'DATABASE_SIZE'			=> 'Tamanho do Banco de Dados', 

	'FILES_PER_DAY'		=> 'Anexos / Dia', 
	'FORUM_STATS'		=> 'Estatísticas do Forum', 

	'GZIP_COMPRESSION'	=> 'Compressão Gzip', 

	'NOT_AVAILABLE'		=> 'Não Disponível', 
	'NUMBER_FILES'		=> 'Número de Anexos', 
	'NUMBER_POSTS'		=> 'Número de Mensagens', 
	'NUMBER_TOPICS'		=> 'Número de Tópicos', 
	'NUMBER_USERS'		=> 'Número de Usuários', 
	'NUMBER_ORPHAN'		=> 'Anexos Órfãos', 

	'POSTS_PER_DAY'		=> 'Mensagens / Dia', 

	'PURGE_CACHE'			=> 'Depurar o cache',
	'PURGE_CACHE_CONFIRM'	=> 'Você tem certeza que deseja depurar o cache?',
	'PURGE_CACHE_EXPLAIN'	=> 'Depurar todos os itens relacionados ao cache, isto inclui qualquer arquivo de cache de templates ou de solicitações ao banco de dados.',

	'RESET_DATE'					=> 'Resetar Data', 
	'RESET_DATE_CONFIRM'			=> 'Você tem certeza que deseja resetar a data de inicio do painel?',
	'RESET_ONLINE'					=> 'Resetar Online', 
	'RESET_ONLINE_CONFIRM'			=> 'Você tem certeza que deseja resetar o contador de recorde de usuários online?',	
	'RESYNC_POSTCOUNTS'				=> 'Re-Sincronizar Contagem de Mensagens', 
	'RESYNC_POSTCOUNTS_EXPLAIN'		=> 'Seomente mensagens que existem serão consideradas. Mensagens apagadas não serão contadas.',
	'RESYNC_POSTCOUNTS_CONFIRM'		=> 'Você tem certeza que deseja re-sincronizar o contador de mensagens?',			
	'RESYNC_POST_MARKING'			=> 'Re-Sincronizar Tópicos Recentes', 
	'RESYNC_POST_MARKING_CONFIRM'	=> 'Você tem certeza que deseja re-sincronizar os tópicos recentes?',
	'RESYNC_POST_MARKING_EXPLAIN'	=> 'Primeiro, desmarca todos os tópicos e depois marca corretamente todos os tópicos que tiveram alguma atividade nos últimos seis meses.',	
	'RESYNC_STATS'					=> 'Re-Sincronizar Estatísticas', 
	'RESYNC_STATS_CONFIRM'			=> 'Você tem certeza que desjea re-sincronizar as estatísticas?',
	'RESYNC_STATS_EXPLAIN'			=> 'Recalcular os totais de números de mensagens, tópicos, usuários e arquivos.',
	'RUN'							=> 'Rodar agora',

	'STATISTIC'					=> 'Estatísticas', 
	'STATISTIC_RESYNC_OPTIONS'	=> 'Re-Sincronizar ou resetar as estatísticas',

	'TOPICS_PER_DAY'	=> 'Tópicos / Dia', 

	'UPLOAD_DIR_SIZE'	=> 'Tamanho dos Anexos Enviados', 
	'USERS_PER_DAY'		=> 'Usuários / Dia', 

	'VALUE'					=> 'Valor', 
	'VIEW_ADMIN_LOG'		=> 'Ver Log do Administrador', 
	'VIEW_INACTIVE_USERS'	=> 'Ver Usuários Inativos', 

	'WELCOME_PHPBB'			=> 'Bem-Vindo ao phpBB', 
)); 

// Inactive Users 
$lang = array_merge($lang, array( 
	'INACTIVE_DATE'					=> 'Data Inativa', 
	'INACTIVE_REASON'				=> 'Razão', 
	'INACTIVE_REASON_MANUAL'		=> 'Registro Desativado pelo Administrador', 
	'INACTIVE_REASON_PROFILE'		=> 'Detalhes do Perfil Alterados', 
	'INACTIVE_REASON_REGISTER'		=> 'Registros Recentes', 
	'INACTIVE_REASON_REMIND'		=> 'Forçar Reativação de Registro do Usuário', 
	'INACTIVE_REASON_UNKNOWN'		=> 'Desconhecido', 
	'INACTIVE_USERS'				=> 'Usuários Inativos', 
	'INACTIVE_USERS_EXPLAIN'		=> 'Isto é uma lista de usuários que se registraram, mas seus registros estão inativos. Você pode ativar, excluir ou alertando (enviando um email) estes usuários se você desejar.', 
	'INACTIVE_USERS_EXPLAIN_INDEX'	=> 'Isto é uma lista dos 10 usuários recentemente registrados que possuem os seus registros inativos. Uma lista completa está disponível pelo item apropriado do Menu ou clicando no link abaixo/acima através de onde você pode ativar, excluir ou alertar (enviando um email) estes usuários se você desejar.', 

	'NO_INACTIVE_USERS'	=> 'Sem Usuários Inativos', 

	'SORT_INACTIVE'		=> 'Data Inativa', 
	'SORT_LAST_VISIT'	=> 'Última Visita', 
	'SORT_REASON'		=> 'Razão', 
	'SORT_REG_DATE'		=> 'Data de Registro', 

	'USER_IS_INACTIVE'		=> 'Usuário está Inativo', 
)); 

// Log Entries 
$lang = array_merge($lang, array( 
	'LOG_ACL_ADD_USER_GLOBAL_U_'		=> '<strong>Permissões de Usuários a Usuários Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_GROUP_GLOBAL_U_'		=> '<strong>Permissões de Usuários a Grupos Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_USER_GLOBAL_M_'		=> '<strong>Permissões Globais a Usuários Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_GROUP_GLOBAL_M_'		=> '<strong>Permissões Globais a Grupos Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_USER_GLOBAL_A_'		=> '<strong>Permissões Administrativas a Usuários Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_GROUP_GLOBAL_A_'		=> '<strong>Permissões Administrativas a Grupos Adicionados ou Editados</strong><br />» %s', 

	'LOG_ACL_ADD_ADMIN_GLOBAL_A_'		=> '<strong>Administradores Adicionados ou Editados</strong><br />» %s', 
	'LOG_ACL_ADD_MOD_GLOBAL_M_'			=> '<strong>Moderadores Globais Adicionados ou Editados</strong><br />» %s', 

	'LOG_ACL_ADD_USER_LOCAL_F_'			=> '<strong>Acessos do Forum a Usuários Adicionados ou Editados</strong> from %1$s<br />» %2$s', 
	'LOG_ACL_ADD_USER_LOCAL_M_'			=> '<strong>Acessos de Moderadores a Usuários Adicionados ou Editados</strong> from %1$s<br />» %2$s', 
	'LOG_ACL_ADD_GROUP_LOCAL_F_'		=> '<strong>Acessos do Forum a Grupos Adicionados ou Editados</strong> from %1$s<br />» %2$s', 
	'LOG_ACL_ADD_GROUP_LOCAL_M_'		=> '<strong>Acessos de Moderadores a Grupos Adicionados ou Editados</strong> from %1$s<br />» %2$s', 

	'LOG_ACL_ADD_MOD_LOCAL_M_'			=> '<strong>Moderadores Adicionados ou Editados</strong> from %1$s<br />» %2$s', 
	'LOG_ACL_ADD_FORUM_LOCAL_F_'		=> '<strong>Permissões de Seções Adicionadas ou Editadas</strong> from %1$s<br />» %2$s', 

	'LOG_ACL_DEL_ADMIN_GLOBAL_A_'		=> '<strong>Administradores Excluídos</strong><br />» %s', 
	'LOG_ACL_DEL_MOD_GLOBAL_M_'			=> '<strong>Moderadores Globais Excluídos</strong><br />» %s', 
	'LOG_ACL_DEL_MOD_LOCAL_M_'			=> '<strong>Moderadores Excluídos</strong> from %1$s<br />» %2$s', 
	'LOG_ACL_DEL_FORUM_LOCAL_F_'		=> '<strong>Permissões de Seções a Usuários/Grupos Excluídos</strong> from %1$s<br />» %2$s', 

	'LOG_ACL_TRANSFER_PERMISSIONS'		=> '<strong>Permissões Transferidas de</strong><br />» %s', 
	'LOG_ACL_RESTORE_PERMISSIONS'		=> '<strong>Próprias Permissões restauradas depois de utilizar as permissões de</strong><br />» %s', 

	'LOG_ADMIN_AUTH_FAIL'		=> '<strong>Tentativas de Login Falhas</strong>', 
	'LOG_ADMIN_AUTH_SUCCESS'	=> '<strong>Tentaticas de Login bem-sucedidas</strong>', 

	'LOG_ATTACH_EXT_ADD'		=> '<strong>Extensão de Anexos Adicionada ou Editada</strong><br />» %s', 
	'LOG_ATTACH_EXT_DEL'		=> '<strong>Extensão de Anexos Excluída</strong><br />» %s', 
	'LOG_ATTACH_EXT_UPDATE'		=> '<strong>Extensão de Anexos Atualizadas</strong><br />» %s', 
	'LOG_ATTACH_EXTGROUP_ADD'	=> '<strong>Grupo de Extensões Adicionado</strong><br />» %s', 
	'LOG_ATTACH_EXTGROUP_EDIT'	=> '<strong>Grupo de Extensões Editado</strong><br />» %s', 
	'LOG_ATTACH_EXTGROUP_DEL'	=> '<strong>Grupo de Extensões Excluído</strong><br />» %s', 
	'LOG_ATTACH_FILEUPLOAD'		=> '<strong>Arquivo Órfão anexo a Mensagem</strong><br />» ID %1$d - %2$s', 
	'LOG_ATTACH_ORPHAN_DEL'		=> '<strong>Arquivo Órfão Excluído</strong><br />» %s', 

	'LOG_BAN_EXCLUDE_USER'	=> '<strong>Usuário excluído por Banimento</strong> for reason "<em>%1$s</em>"<br />» %2$s ', 
	'LOG_BAN_EXCLUDE_IP'	=> '<strong>Endereço de IP excluído por Banimento</strong> for reason "<em>%1$s</em>"<br />» %2$s ', 
	'LOG_BAN_EXCLUDE_EMAIL' => '<strong>Endereço de Email excluído por Banimento</strong> for reason "<em>%1$s</em>"<br />» %2$s ', 
	'LOG_BAN_USER'			=> '<strong>Usuário Banido</strong> for reason "<em>%1$s</em>"<br />» %2$s ', 
	'LOG_BAN_IP'			=> '<strong>Endereço de IP Banido</strong> for reason "<em>%1$s</em>"<br />» %2$s', 
	'LOG_BAN_EMAIL'			=> '<strong>Endereço de email Banido</strong> for reason "<em>%1$s</em>"<br />» %2$s', 
	'LOG_UNBAN_USER'		=> '<strong>Usuário Desbanido</strong><br />» %s', 
	'LOG_UNBAN_IP'			=> '<strong>Endereço de IP Desbanido</strong><br />» %s', 
	'LOG_UNBAN_EMAIL'		=> '<strong>Endereço de email Desbanido</strong><br />» %s', 

	'LOG_BBCODE_ADD'		=> '<strong>BBCode Adicionado</strong><br />» %s', 
	'LOG_BBCODE_EDIT'		=> '<strong>BBCode Editado</strong><br />» %s', 
	'LOG_BBCODE_DELETE'		=> '<strong>BBCode Excluído</strong><br />» %s', 

	'LOG_BOT_ADDED'		=> '<strong>BOT Adicionado</strong><br />» %s', 
	'LOG_BOT_DELETE'	=> '<strong>BOT Excluído</strong><br />» %s', 
	'LOG_BOT_UPDATED'	=> '<strong>BOT Atualizado</strong><br />» %s', 

	'LOG_CLEAR_ADMIN'		=> '<strong>Log Administrativo Limpo</strong>', 
	'LOG_CLEAR_CRITICAL'	=> '<strong>Log de Erro Limpo</strong>', 
	'LOG_CLEAR_MOD'			=> '<strong>Log Moderativo Limpo</strong>', 
	'LOG_CLEAR_USER'		=> '<strong>Log de Usuário Limpo</strong><br />» %s', 
	'LOG_CLEAR_USERS'		=> '<strong>Log de Usuários Limpos</strong>', 

	'LOG_CONFIG_ATTACH'			=> '<strong>Configurações de Anexos Alteradas</strong>', 
	'LOG_CONFIG_AUTH'			=> '<strong>Configurações de Autenticação Alteradas</strong>', 
	'LOG_CONFIG_AVATAR'			=> '<strong>Configurações de Avatar Alteradas</strong>', 
	'LOG_CONFIG_COOKIE'			=> '<strong>Configurações de Cookie Alteradas</strong>', 
	'LOG_CONFIG_EMAIL'			=> '<strong>Configurações de emails Alteradas</strong>', 
	'LOG_CONFIG_FEATURES'		=> '<strong>Características do Forum Alteradas</strong>', 
	'LOG_CONFIG_LOAD'			=> '<strong>Configurações de Carga Alteradas</strong>', 
	'LOG_CONFIG_MESSAGE'		=> '<strong>Configurações de Mensagem Particular Alteradas</strong>', 
	'LOG_CONFIG_POST'			=> '<strong>Configurações de Mensagem Alteradas</strong>', 
	'LOG_CONFIG_REGISTRATION'	=> '<strong>Configurações de Registro Alteradas</strong>', 
	'LOG_CONFIG_SEARCH'			=> '<strong>Configurações de Pesquisa Alteradas</strong>', 
	'LOG_CONFIG_SECURITY'		=> '<strong>Configurações de Segurança Alteradas</strong>', 
	'LOG_CONFIG_SERVER'			=> '<strong>Configurações do Servidor Alteradas</strong>', 
	'LOG_CONFIG_SETTINGS'		=> '<strong>Configurações do Forum Alteradas</strong>', 
	'LOG_CONFIG_SIGNATURE'		=> '<strong>Configurações de Assinatura Alteradas</strong>', 
	'LOG_CONFIG_VISUAL'			=> '<strong>Configurações de Confirmação Visual Alteradas</strong>', 

	'LOG_APPROVE_TOPIC'			=> '<strong>Tópico Aprovado</strong><br />» %s', 
	'LOG_BUMP_TOPIC'			=> '<strong>User bumped topic</strong><br />» %s', 
	'LOG_DELETE_POST'			=> '<strong>Mensagem Excluída</strong><br />» %s', 
	'LOG_DELETE_TOPIC'			=> '<strong>Tópico Excluído</strong><br />» %s', 
	'LOG_FORK'					=> '<strong>Tópico Copiado</strong><br />» from %s', 
	'LOG_LOCK'					=> '<strong>Tópico Trancado</strong><br />» %s', 
	'LOG_LOCK_POST'				=> '<strong>Mensagem Trancada</strong><br />» %s', 
	'LOG_MERGE'					=> '<strong>Merged posts</strong> into topic<br />» %s', 
	'LOG_MOVE'					=> '<strong>Tópico Movido</strong><br />» from %s', 
	'LOG_POST_APPROVED'			=> '<strong>Mensagem Aprovada</strong><br />» %s',
	'LOG_POST_DISAPPROVED'		=> '<strong>Mensagem Desaprovada “%1$s” pelo seguinte motivo</strong><br />%2$s',
	'LOG_POST_EDITED'			=> '<strong>Mensagem Editada “%1$s” por “%3$s”</strong><br />» Link para a mensagem: %2$s',
	'LOG_REPORT_CLOSED'			=> '<strong>Denúncia Trancada</strong><br />» %s',
	'LOG_REPORT_DELETED'		=> '<strong>Denúncia Excluida</strong><br />» %s',
	'LOG_SPLIT_DESTINATION'		=> '<strong>Tópico Subdividido</strong><br />» to %s', 
	'LOG_SPLIT_SOURCE'			=> '<strong>Mensagens Subdivididas</strong><br />» from %s', 

	'LOG_TOPIC_DELETED'			=> '<strong>Tópico Excluído</strong><br />» %s', 
	'LOG_TOPIC_APPROVED'		=> '<strong>Tópido Aprovado</strong><br />» %s',
	'LOG_TOPIC_DISAPPROVED'		=> '<strong>Tópico Desaprovado “%1$s” pelo seguinte motivo</strong><br />%2$s',
	'LOG_TOPIC_RESYNC'			=> '<strong>Contadores de Tópico Re-Sincronizado</strong><br />» %s', 
	'LOG_TOPIC_TYPE_CHANGED'	=> '<strong>Tipo de Tópico Alterado</strong><br />» %s', 
	'LOG_UNLOCK'				=> '<strong>Tópico Destrancado</strong><br />» %s', 
	'LOG_UNLOCK_POST'			=> '<strong>Mensagem Destrancada</strong><br />» %s', 

	'LOG_DISALLOW_ADD'		=> '<strong>Nome Proibido Adicionado</strong><br />» %s', 
	'LOG_DISALLOW_DELETE'	=> '<strong>Nome Proibido Excluído</strong>', 

	'LOG_DB_BACKUP'			=> '<strong>Copiar Banco de Dados</strong>', 
	'LOG_DB_DELETE'			=> '<strong>Backup do Banco de Dados Excluído</strong>',
	'LOG_DB_RESTORE'		=> '<strong>Restaurar Banco de Dados</strong>', 

	'LOG_DOWNLOAD_EXCLUDE_IP'	=> '<strong>Endereço de IP/hostname excluído da Lista de Download</strong><br />» %s', 
	'LOG_DOWNLOAD_IP'			=> '<strong>Endereço de IP/hostname adicionado à Lista de Download</strong><br />» %s', 
	'LOG_DOWNLOAD_REMOVE_IP'	=> '<strong>Endereço de IP/hostname excluído da Lista de Download</strong><br />» %s', 

	'LOG_ERROR_JABBER'		=> '<strong>Erro de Jabber</strong><br />» %s', 
	'LOG_ERROR_EMAIL'		=> '<strong>Erro no email</strong><br />» %s', 

	'LOG_FORUM_ADD'							=> '<strong>Criar nova Seção</strong><br />» %s', 
	'LOG_FORUM_DEL_FORUM'					=> '<strong>Seção Excluída</strong><br />» %s', 
	'LOG_FORUM_DEL_FORUMS'					=> '<strong>Seção e SubSeções Excluídas</strong><br />» %s', 
	'LOG_FORUM_DEL_MOVE_FORUMS'				=> '<strong>Seção Excluída e SubSeções Movidas</strong> to %1$s<br />» %2$s', 
	'LOG_FORUM_DEL_MOVE_POSTS'				=> '<strong>Seção Excluída e Mensagens Movidas</strong> to %1$s<br />» %2$s', 
	'LOG_FORUM_DEL_MOVE_POSTS_FORUMS'		=> '<strong>Seção e SubSeções Excluídas, Mensagens Movidas</strong> to %1$s<br />» %2$s', 
	'LOG_FORUM_DEL_MOVE_POSTS_MOVE_FORUMS'	=> '<strong>Seção Excluída, Mensagens Movidas</strong> to %1$s <strong>and subforums</strong> to %2$s<br />» %3$s', 
	'LOG_FORUM_DEL_POSTS'					=> '<strong>Seção e Mensagens Excluídas</strong><br />» %s', 
	'LOG_FORUM_DEL_POSTS_FORUMS'			=> '<strong>Seção, SubSeções e Mensagens Excluídas</strong><br />» %s', 
	'LOG_FORUM_DEL_POSTS_MOVE_FORUMS'		=> '<strong>Seções e Mensagens Excluídas, SubSeções Movidas</strong> to %1$s<br />» %2$s', 
	'LOG_FORUM_EDIT'						=> '<strong>Detalhes da Seção Editadas</strong><br />» %s', 
	'LOG_FORUM_MOVE_DOWN'					=> '<strong>Seção Movida</strong> %1$s <strong>abaixo/acima</strong> %2$s', 
	'LOG_FORUM_MOVE_UP'						=> '<strong>Seção Movida</strong> %1$s <strong>acima/abaixo</strong> %2$s', 
	'LOG_FORUM_SYNC'						=> '<strong>Seção Re-Sincronizada</strong><br />» %s', 

	'LOG_GROUP_CREATED'		=> '<strong>Novo Grupo Criado</strong><br />» %s', 
	'LOG_GROUP_DEFAULTS'	=> '<strong>Grupo Padrão para Membros</strong><br />» %s', 
	'LOG_GROUP_DELETE'		=> '<strong>Grupo Excluído</strong><br />» %s', 
	'LOG_GROUP_DEMOTED'		=> '<strong>Líderes Demitidos do Grupo</strong> %1$s<br />» %2$s', 
	'LOG_GROUP_PROMOTED'	=> '<strong>Membros Promovidos a Líderes do Grupo</strong> %1$s<br />» %2$s', 
	'LOG_GROUP_REMOVE'		=> '<strong>Membros Excluídos do Grupo</strong> %1$s<br />» %2$s', 
	'LOG_GROUP_UPDATED'		=> '<strong>Detalhes do Grupo Atualizados</strong><br />» %s', 
	'LOG_MODS_ADDED'		=> '<strong>Novos Líderes Adicionados ao Grupo</strong> %1$s<br />» %2$s', 
	'LOG_USERS_APPROVED'	=> '<strong>Membros Aprovados ao Grupo</strong> %1$s<br />» %2$s', 
	'LOG_USERS_ADDED'		=> '<strong>Novos Membros Adicionados ao Grupo</strong> %1$s<br />» %2$s', 

	'LOG_IMAGESET_ADD_DB'			=> '<strong>Novas Imagens Adicionadas ao Banco de Dados</strong><br />» %s', 
	'LOG_IMAGESET_ADD_FS'			=> '<strong>Adicionar novas Imagens no Sistema</strong><br />» %s', 
	'LOG_IMAGESET_DELETE'			=> '<strong>Imagens Excluídas</strong><br />» %s', 
	'LOG_IMAGESET_EDIT_DETAILS'		=> '<strong>Detalhes da Imagem Editados</strong><br />» %s', 
	'LOG_IMAGESET_EDIT'				=> '<strong>Imagem Editada</strong><br />» %s', 
	'LOG_IMAGESET_EXPORT'			=> '<strong>Imagem Exportada</strong><br />» %s', 
	'LOG_IMAGESET_LANG_REFRESHED'	=> '<strong>Atualizado a localização do set de imagens “%2$s”</strong><br />» %1$s',
	'LOG_IMAGESET_REFRESHED'		=> '<strong>Imagem Atualizada</strong><br />» %s', 

	'LOG_INACTIVE_ACTIVATE'	=> '<strong>Usuários Inativos Ativados</strong><br />» %s', 
	'LOG_INACTIVE_DELETE'	=> '<strong>Usuários Inativos Excluídos</strong><br />» %s', 
	'LOG_INACTIVE_REMIND'	=> '<strong>Enviar emails de alerta a Usuários Inativos</strong><br />» %s', 
	'LOG_INSTALL_CONVERTED'	=> '<strong>Atualizado de %1$s para o phpBB %2$s</strong>', 
	'LOG_INSTALL_INSTALLED'	=> '<strong>Versão do phpBB instalada %s</strong>', 

	'LOG_IP_BROWSER_FORWARDED_CHECK'	=> '<strong>Seção de IP/navegador/X_FORWARDED_FOR check failed</strong><br />»User IP "<em>%1$s</em>" checked against session IP "<em>%2$s</em>", user browser string "<em>%3$s</em>" checked against session browser string "<em>%4$s</em>" and user X_FORWARDED_FOR string "<em>%5$s</em>" checked against session X_FORWARDED_FOR string "<em>%6$s</em>".', 

	'LOG_JAB_CHANGED'			=> '<strong>Registro de Jabber Alterado</strong>', 
	'LOG_JAB_PASSCHG'			=> '<strong>Senha de Jabber Alterada</strong>', 
	'LOG_JAB_REGISTER'			=> '<strong>Jabber Registrado</strong>', 
	'LOG_JAB_SETTINGS_CHANGED'	=> '<strong>Configurações de Jabber alteradas</strong>', 

	'LOG_LANGUAGE_PACK_DELETED'		=> '<strong>Pacotes de Línguas excluídos</strong><br />» %s', 
	'LOG_LANGUAGE_PACK_INSTALLED'	=> '<strong>Pacotes de Línguas Instalados</strong><br />» %s', 
	'LOG_LANGUAGE_PACK_UPDATED'		=> '<strong>Detalhes do Pacote de Línguas Atualizados</strong><br />» %s', 
	'LOG_LANGUAGE_FILE_REPLACED'	=> '<strong>Arquivos de Linguagem substituidos</strong><br />» %s', 
	'LOG_LANGUAGE_FILE_SUBMITTED'	=> '<strong>Arquivo de Linguagem enviado e armazenado na pasta store</strong><br />» %s',

	'LOG_MASS_EMAIL'		=> '<strong>Enviar Email em Massa</strong><br />» %s', 

	'LOG_MCP_CHANGE_POSTER'	=> '<strong>Autor alterado no Tópico "%1$s"</strong><br />» from %2$s to %3$s', 

	'LOG_MODULE_DISABLE'	=> '<strong>Módulo Desativado</strong>', 
	'LOG_MODULE_ENABLE'		=> '<strong>Módulo Ativado</strong>', 
	'LOG_MODULE_MOVE_DOWN'	=> '<strong>Módulo Movido - Baixo</strong><br />» %s', 
	'LOG_MODULE_MOVE_UP'	=> '<strong>Módulo Movido - Cima</strong><br />» %s', 
	'LOG_MODULE_REMOVED'	=> '<strong>Módulo Excluído</strong><br />» %s', 
	'LOG_MODULE_ADD'		=> '<strong>Módulo Adicionado</strong><br />» %s', 
	'LOG_MODULE_EDIT'		=> '<strong>Módulo Editado</strong><br />» %s', 

	'LOG_A_ROLE_ADD'		=> '<strong>Tarefa Administrativa Adicionada</strong><br />» %s', 
	'LOG_A_ROLE_EDIT'		=> '<strong>Tarefa Administrativa Editada</strong><br />» %s', 
	'LOG_A_ROLE_REMOVED'	=> '<strong>Tarefa Administrativa Excluída</strong><br />» %s', 
	'LOG_F_ROLE_ADD'		=> '<strong>Tarefa do Forum Adicionada</strong><br />» %s', 
	'LOG_F_ROLE_EDIT'		=> '<strong>Tarefa do Forum Editada</strong><br />» %s', 
	'LOG_F_ROLE_REMOVED'	=> '<strong>Tarefa do Forum Excluída</strong><br />» %s', 
	'LOG_M_ROLE_ADD'		=> '<strong>Tarefa Moderativa Adicionada</strong><br />» %s', 
	'LOG_M_ROLE_EDIT'		=> '<strong>Tarefa Moderativa Editada</strong><br />» %s', 
	'LOG_M_ROLE_REMOVED'	=> '<strong>Tarefa Moderativa Excluída</strong><br />» %s', 
	'LOG_U_ROLE_ADD'		=> '<strong>Tarefa do Usuário Adicionada</strong><br />» %s', 
	'LOG_U_ROLE_EDIT'		=> '<strong>Tarefa do Usuário Editada</strong><br />» %s', 
	'LOG_U_ROLE_REMOVED'	=> '<strong>Tarefa do Usuário Excluída</strong><br />» %s', 

	'LOG_PROFILE_FIELD_ACTIVATE'	=> '<strong>Campo do Perfil Ativado</strong><br />» %s', 
	'LOG_PROFILE_FIELD_CREATE'		=> '<strong>Campo do Perfil Adicionado</strong><br />» %s', 
	'LOG_PROFILE_FIELD_DEACTIVATE'	=> '<strong>Campo do Perfil Desativado</strong><br />» %s', 
	'LOG_PROFILE_FIELD_EDIT'		=> '<strong>Campo do Perfil Editado</strong><br />» %s', 
	'LOG_PROFILE_FIELD_REMOVED'		=> '<strong>Campo do Perfil Excluído</strong><br />» %s', 

	'LOG_PRUNE'					=> '<strong>Seções Limpas</strong><br />» %s', 
	'LOG_AUTO_PRUNE'			=> '<strong>Seções Automaticamente Limpas</strong><br />» %s', 
	'LOG_PRUNE_USER_DEAC'		=> '<strong>Usuários Desativados</strong><br />» %s', 
	'LOG_PRUNE_USER_DEL_DEL'	=> '<strong>Usuários Limpos e Mensagens Excluídas</strong><br />» %s', 
	'LOG_PRUNE_USER_DEL_ANON'	=> '<strong>Usuários Limpos e Mensagens Salvas</strong><br />» %s', 

	'LOG_PURGE_CACHE'			=> '<strong>Cache Depurado</strong>',

	'LOG_RANK_ADDED'		=> '<strong>Rank Adicionado</strong><br />» %s', 
	'LOG_RANK_REMOVED'		=> '<strong>Rank Excluído</strong><br />» %s', 
	'LOG_RANK_UPDATED'		=> '<strong>Rank Atualizado</strong><br />» %s', 

	'LOG_REASON_ADDED'		=> '<strong>Razão de Denúncia/Negação Adicionada</strong><br />» %s', 
	'LOG_REASON_REMOVED'	=> '<strong>Razão de Denúncia/Negação Excluída</strong><br />» %s', 
	'LOG_REASON_UPDATED'	=> '<strong>Razão de Denúncia/Negação Atualizada</strong><br />» %s', 

	'LOG_RESET_DATE'			=> '<strong>Resetar Início do Forum</strong>', 
	'LOG_RESET_ONLINE'			=> '<strong>Resetar Usuários Mais Ativos</strong>', 
	'LOG_RESYNC_POSTCOUNTS'		=> '<strong>Contagem de Mensagens Re-Sincronizadas</strong>', 
	'LOG_RESYNC_POST_MARKING'	=> '<strong>Tópicos Pontilhados Re-Sincronizados</strong>', 
	'LOG_RESYNC_STATS'			=> '<strong>Estatísticas de Usuários, Tópicos e Mensagens Re-Sincronizadas</strong>', 

	'LOG_SEARCH_INDEX_CREATED'	=> '<strong>Índice de busca criado por</strong><br />» %s',
	'LOG_SEARCH_INDEX_REMOVED'	=> '<strong>Índice de busca excluido por</strong><br />» %s',
	'LOG_STYLE_ADD'				=> '<strong>Template Adicionada</strong><br />» %s', 
	'LOG_STYLE_DELETE'			=> '<strong>Template Excluída</strong><br />» %s', 
	'LOG_STYLE_EDIT_DETAILS'	=> '<strong>Template Editada</strong><br />» %s', 
	'LOG_STYLE_EXPORT'			=> '<strong>Template Exportada</strong><br />» %s', 

	'LOG_TEMPLATE_ADD_DB'			=> '<strong>Nova Template Adicionada no Banco de Dados</strong><br />» %s', 
	'LOG_TEMPLATE_ADD_FS'			=> '<strong>Adicionar nova Template no Sistema</strong><br />» %s', 
	'LOG_TEMPLATE_CACHE_CLEARED'	=> '<strong>Versões do cache dos arquivos da template excluídos <em>%1$s</em></strong><br />» %2$s', 
	'LOG_TEMPLATE_DELETE'			=> '<strong>Template Excluída</strong><br />» %s', 
	'LOG_TEMPLATE_EDIT'				=> '<strong>Template Editada <em>%1$s</em></strong><br />» %2$s', 
	'LOG_TEMPLATE_EDIT_DETAILS'		=> '<strong>Detalhes da Template Editados</strong><br />» %s', 
	'LOG_TEMPLATE_EXPORT'			=> '<strong>Template Exportada</strong><br />» %s', 
	'LOG_TEMPLATE_REFRESHED'		=> '<strong>Template Atualizada</strong><br />» %s', 

	'LOG_THEME_ADD_DB'			=> '<strong>Novo Tema adicionado ao Banco de Dados</strong><br />» %s', 
	'LOG_THEME_ADD_FS'			=> '<strong>Novo Tema adicionado no Sistema</strong><br />» %s', 
	'LOG_THEME_DELETE'			=> '<strong>Tema Excluído</strong><br />» %s', 
	'LOG_THEME_EDIT_DETAILS'	=> '<strong>Detalhes do Tema Editados</strong><br />» %s', 
	'LOG_THEME_EDIT'			=> '<strong>Tema Editado <em>%1$s</em></strong><br />» Categoria Editada <em>%2$s</em>', 
	'LOG_THEME_EDIT_FILE'		=> '<strong>Tema Editado <em>%1$s</em></strong><br />» Arquivo Modificado <em>%2$s</em>',
	'LOG_THEME_EXPORT'			=> '<strong>Tema Exportado</strong><br />» %s', 
	'LOG_THEME_REFRESHED'		=> '<strong>Tema Atualizado</strong><br />» %s', 

	'LOG_UPDATE_DATABASE'	=> '<strong>O Banco de Dados foi atualizado da Versão %1$s para a Versão %2$s</strong>', 
	'LOG_UPDATE_PHPBB'		=> '<strong>O phpBB foi atualizado da Versão %1$s para a Versão %2$s</strong>', 

	'LOG_USER_ACTIVE'		=> '<strong>Usuário Ativado</strong><br />» %s', 
	'LOG_USER_BAN_USER'		=> '<strong>Usuário Banido pelo Gerenciamento de Usuários</strong> for reason "<em>%1$s</em>"<br />» %2$s', 
	'LOG_USER_BAN_IP'		=> '<strong>Endereço de IP Banido pelo Gerenciamento de Usuários</strong> for reason "<em>%1$s</em>"<br />» %2$s', 
	'LOG_USER_BAN_EMAIL'	=> '<strong>Endereço de email Banido pelo Gerenciamento de Usuários</strong> for reason "<em>%1$s</em>"<br />» %2$s', 
	'LOG_USER_DELETED'		=> '<strong>Usuário Excluído</strong><br />» %s', 
	'LOG_USER_DEL_ATTACH'	=> '<strong>Todos os Anexos do Usuário Excluídos</strong><br />» %s', 
	'LOG_USER_DEL_AVATAR'	=> '<strong>Avatar do Usuário Excluído</strong><br />» %s', 
	'LOG_USER_DEL_POSTS'	=> '<strong>Todas as Mensagens do Usuário Excluídas</strong><br />» %s', 
	'LOG_USER_DEL_SIG'		=> '<strong>Assinatura do Usuário Excluída</strong><br />» %s', 
	'LOG_USER_INACTIVE'		=> '<strong>Usuário Desativado</strong><br />» %s', 
	'LOG_USER_MOVE_POSTS'	=> '<strong>Mensagens do Usuário Movidas</strong><br />» posts by "%1$s" to forum "%2$s"', 
	'LOG_USER_NEW_PASSWORD'	=> '<strong>Senha do Usuário Alterada</strong><br />» %s', 
	'LOG_USER_REACTIVATE'	=> '<strong>Reativação de Registro do Usuário Forçada</strong><br />» %s', 
	'LOG_USER_UPDATE_EMAIL'	=> '<strong>Endereço de email do Usuário "%1$s" alterado</strong><br />» from "%2$s" to "%3$s"', 
	'LOG_USER_UPDATE_NAME'	=> '<strong>Nome de Usuário Alterado</strong><br />» from "%1$s" to "%2$s"', 
	'LOG_USER_USER_UPDATE'	=> '<strong>Detalhes do Usuário Atualizados</strong><br />» %s', 

	'LOG_USER_ACTIVE_USER'		=> '<strong>Registro de Usuário Ativado</strong>', 
	'LOG_USER_DEL_AVATAR_USER'	=> '<strong>Avatar do Usuário Excluído</strong>', 
	'LOG_USER_DEL_SIG_USER'		=> '<strong>Assinatura do Usuário Excluída</strong>', 
	'LOG_USER_FEEDBACK'			=> '<strong>Usuário adicionado ao Feedback</strong><br />» %s', 
	'LOG_USER_GENERAL'			=> '%s', 
	'LOG_USER_INACTIVE_USER'	=> '<strong>Registro de Usuário Reativado</strong>', 
	'LOG_USER_LOCK'				=> '<strong>Tópicos Trancados pelo próprio Usuário</strong><br />» %s', 
	'LOG_USER_MOVE_POSTS_USER'	=> '<strong>Todas as Mensagens Movidas à seção "%s"</strong>', 
	'LOG_USER_REACTIVATE_USER'	=> '<strong>Reativação de Registro Forçada</strong>', 
	'LOG_USER_UNLOCK'			=> '<strong>Tópicos Destrancados pelo próprio Usuário</strong><br />» %s', 
	'LOG_USER_WARNING'			=> '<strong>Advertência Adicionada</strong><br />» %s', 
	'LOG_USER_WARNING_BODY'		=> '<strong>A Advertência seguinte foi dada a este Usuário</strong><br />» %s', 

	'LOG_USER_GROUP_CHANGE'			=> '<strong>Grupo Padrão Editado</strong><br />» %s', 
	'LOG_USER_GROUP_DEMOTE'			=> '<strong>Usuários Demitidos como Líderes no Grupo</strong><br />» %s', 
	'LOG_USER_GROUP_JOIN'			=> '<strong>Inscrição do Usuário no Grupo</strong><br />» %s', 
	'LOG_USER_GROUP_JOIN_PENDING'	=> '<strong>O Usuário se Inscreveu no Grupo e precisa ser Aprovado</strong><br />» %s', 
	'LOG_USER_GROUP_RESIGN'			=> '<strong>Usuário resignado do Grupo</strong><br />» %s', 

	'LOG_WORD_ADD'			=> '<strong>Palavra Censurada Adicionada</strong><br />» %s', 
	'LOG_WORD_DELETE'		=> '<strong>Palavra Censurada Excluída</strong><br />» %s', 
	'LOG_WORD_EDIT'			=> '<strong>Palavra Censurada Editada</strong><br />» %s', 
)); 

?>
