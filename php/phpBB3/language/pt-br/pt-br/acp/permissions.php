<?php 
/** 
* 
* acp_permissions [Portuguese] 
* 
* @package language 
* @version $Id: permissions.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ACP_PERMISSIONS_EXPLAIN'	=> ' 
		<p>As Permissões em seu phpBB3 são bastante abrangentes e agrupadas em quatro grandes grupos, que são:</p> 

		<h2>Permissões Globais</h2> 
		<p>Aqui você pode controlar o acesso em um nível global e aplicar ao forum inteiro. Elas são ainda dividias em Permissões de Usuários, Permissões de Grupos, Administradores e Moderadores Globais.</p> 

		<h2>Permissões Básicas do Forum</h2> 
		<p>Aqui você pode controlar o acesso por bases do forum. Elas ainda so dividias em Permissões de Seções, Moderadores de Seções, Permissões de Usuários em Seções e Permissões de Grupos em Seções.</p>

		<h2>Tarefas de Permisso</h2>
		<p>Aqui você pode criar diferentes termos de permissão para os diversos tipos de permissões existentes. As configurações padrão devem cover a administração do quadro de notcias largo e pequeno, entretanto com uma das quatro divisões, você pode adicionar/editar/excluir configurações como você as vê aptas.</p>

		<h2>Mscara de Permisso</h2>
		<p>Aqui você pode visualizar as permissões efetivas atribuidas a Usuários, Moderadores (Locais e Globais), Administradores ou Seções.</p> 
	 
		<br /> 

		<p>Para maiores informações sobre as suas configurações e o gerenciamento de permissões em seu phpBB3, por favor, veja o <a href="http://www.phpbb.com/support/documentation/3.0/quickstart/quick_permissions.html">Capítulo 1.5 de seu Guia de Inicialização Rápida</a>.</p> 
	', 

	'ACL_NEVER'				=> 'Nunca', 
	'ACL_SET'				=> 'Permissões Configuradas', 
	'ACL_SET_EXPLAIN'		=> 'Permissões são baseadas em um simples sistema de <samp>SIM</samp>/<samp>NÃO</samp>. Configurando qualquer opção em <samp>Nunca</samp> para um Usuário ou Grupo irá substituir qualquer valor atribuido aos mesmos. Se você não deseja atribuir um valor de qualquer opção para este Usuário ou Grupo, selecione <samp>NÃO</samp>. Se valores são atribuidos para esta opção elsewhere they will be used in preference, else <samp>Nunca</samp> é assumido. Todos os objetos marcados (com a caixa de confirmação em frente a eles) irão copiar as permissões que você definiu.', 
	'ACL_SETTING'			=> 'Configuração', 

	'ACL_TYPE_A_'			=> 'Permissões Administrativas', 
	'ACL_TYPE_F_'			=> 'Permissões de Seções', 
	'ACL_TYPE_M_'			=> 'Permissões Moderativas', 
	'ACL_TYPE_U_'			=> 'Permissões de Usuário', 

	'ACL_TYPE_GLOBAL_A_'	=> 'Permissões Administrativas', 
	'ACL_TYPE_GLOBAL_U_'	=> 'Permissões de Usuário', 
	'ACL_TYPE_GLOBAL_M_'	=> 'Permissões de Moderadores Globais', 
	'ACL_TYPE_LOCAL_M_'		=> 'Permissões de Moderadores de Seções', 
	'ACL_TYPE_LOCAL_F_'		=> 'Permissões de Seções', 
	 
	'ACL_NO'				=> 'Não', 
	'ACL_VIEW'				=> 'Vendo as Permissões', 
	'ACL_VIEW_EXPLAIN'		=> 'Aqui você pode ver as permissões efetivas que os Usuários/Grupos estão possuindo. Um quadrado vermelho indica que o Usuário/Grupo não possui a permissão, um quadrado verde indica que o Usuário/Grupo possui a permissão.', 
	'ACL_YES'				=> 'Sim', 

	'ACP_ADMINISTRATORS_EXPLAIN'				=> 'Aqui você pode determinar permissões administrativas para Usuários e Grupos. Todos os Usuários com permissões administrativas podem entrar no Painel de Administração.', 
	'ACP_FORUM_MODERATORS_EXPLAIN'				=> 'Aqui você pode determinar Usuários e Grupos como Moderadores do Forum. Para determinar permissões de usuário, para definir permissões de moderadores globais ou administradores, por favor, use a página apropriada.', 
	'ACP_FORUM_PERMISSIONS_EXPLAIN'				=> 'Aqui você pode alterar que Usuários e Grupos poderão acessar a cada Seção. Para determinar Moderadores ou Administradores, por favor, use a página apropriada.', 
	'ACP_GLOBAL_MODERATORS_EXPLAIN'				=> 'Aqui você pode determinar permissões de moderadores globais para Usuários e Grupos. Estes Moderadores são como moderadores usuais, exceto se eles tiverem acesso a todas as seções do forum.', 
	'ACP_GROUPS_FORUM_PERMISSIONS_EXPLAIN'		=> 'Aqui você pode determinar permissões de Seções para Grupos.', 
	'ACP_GROUPS_PERMISSIONS_EXPLAIN'			=> 'Aqui você pode determinar permissões globais para Grupos - permissões de usuários, permissões globais e permissões administrativas. As Permissões de Usuários incluem capacidades de uso de avatares, envio de mensagens particulares e etc; Permissões Globais como a aprovação de mensagens, gerenciamento de tópicos, gerenciamento de banimentos etc; Por último, as Permissões Administrativas como a alteração de permissões, definição de BBCodes, gerenciamento de seções e etc. Permissões de Usuários individuais devem apenas ser alteradas em ocasiões raras, e o método mais apropriado é adicionando usuários em grupos alterando as permissões destes grupos.', 
	'ACP_ADMIN_ROLES_EXPLAIN'					=> 'Aqui você pode gerenciar as tarefas para permissões administrativas. Tarefas são permissões efetivas. Se você alterar uma tarefa, os itens atribuidos a mesma terão suas permissões alteradas também.', 
	'ACP_FORUM_ROLES_EXPLAIN'					=> 'Aqui você pode gerenciar as tarefas para permissões das seções. Tarefas são permissões efetivas. Se você alterar uma tarefa, os itens atribuidos a mesma terão suas permissões alteradas também.', 
	'ACP_MOD_ROLES_EXPLAIN'						=> 'Aqui você pode gerenciar as tarefas para permissões moderativas. Tarefas são permissões efetivas. Se você alterar uma tarefa, os itens atribuidos a mesma terão suas permissões alteradas também.', 
	'ACP_USER_ROLES_EXPLAIN'					=> 'Aqui você pode gerenciar as tarefas para permissões de usuários. Tarefas são permissões efetivas. Se você alterar uma tarefa, os itens atribuidos a mesma terão suas permissões alteradas também.', 
	'ACP_USERS_FORUM_PERMISSIONS_EXPLAIN'		=> 'Aqui você pode determinar permissões de Seções para Usuários.', 
	'ACP_USERS_PERMISSIONS_EXPLAIN'				=> 'Aqui você pode determinar permissões globais para Usuários - As Permissões de Usuários incluem capacidades de uso de avatares, envio de mensagens particulares e etc; Permissões Globais como a aprovação de mensagens, gerenciamento de tópicos, gerenciamento de banimentos etc; Por último, as Permissões Administrativas como a alteração de permissões, definição de BBCodes, gerenciamento de seções e etc. Para alterar estas configurações para um grande número de usuários, o sistema de permissões de grupos é o método mais aconselhável. Permissões de Usuários individuais devem apenas ser alteradas em ocasiões raras, e o método mais apropriado é adicionando usuários em grupos alterando as permissões destes grupos.', 
	'ACP_VIEW_ADMIN_PERMISSIONS_EXPLAIN'		=> 'Aqui você pode ver as permissões administrativas efetivas determinadas aos Usuários/Grupos selecionados.',
	'ACP_VIEW_GLOBAL_MOD_PERMISSIONS_EXPLAIN'	=> 'Aqui você pode ver as permissões globais determinadas aos Usuários/Grupos selecionados.',
	'ACP_VIEW_FORUM_PERMISSIONS_EXPLAIN'		=> 'Aqui você pode ver as permissões de seções determinadas aos Usuários/Grupos e Seções selecionadas.',
	'ACP_VIEW_FORUM_MOD_PERMISSIONS_EXPLAIN'	=> 'Aqui você pode ver as permissões de moderador de seções determinadas aos Usuários/Grupos e Seções selecionadas.',
	'ACP_VIEW_USER_PERMISSIONS_EXPLAIN'			=> 'Aqui você pode ver as permissões de usuários efetivas determinadas aos Usuários/Grupos selecionados.',

	'ADD_GROUPS'				=> 'Adicionar Grupos', 
	'ADD_PERMISSIONS'			=> 'Adicionar Permissões', 
	'ADD_USERS'					=> 'Adicionar Usuários', 
	'ADVANCED_PERMISSIONS'		=> 'Permissões Avançadas', 
	'ALL_GROUPS'				=> 'Selecionar Todos os Grupos', 
	'ALL_NEVER'					=> 'Tudo <samp>Nunca</samp>', 
	'ALL_NO'					=> 'Tudo <samp>Não</samp>', 
	'ALL_USERS'					=> 'Selecionar Todos os Usuários', 
	'ALL_YES'					=> 'Tudo <samp>Sim</samp>', 
	'APPLY_ALL_PERMISSIONS'		=> 'Aplicar Todas as Permissões', 
	'APPLY_PERMISSIONS'			=> 'Aplicar Permissões', 
	'APPLY_PERMISSIONS_EXPLAIN'	=> 'As permissões e tarefas definidas para este item serão apenas aplicadas a este item e todos os itens marcados.', 
	'AUTH_UPDATED'				=> 'As Permissões foram atualizadas com sucesso.', 

	'CREATE_ROLE'				=> 'Criar Tarefa', 
	'CREATE_ROLE_FROM'			=> 'Usar Configurações de', 
	'CUSTOM'					=> 'Customâ€¦', 

	'DEFAULT'					=> 'Padrão', 
	'DELETE_ROLE'				=> 'Excluir Tarefa', 
	'DELETE_ROLE_CONFIRM'		=> 'Você deseja realmente EXCLUIR esta tarefa? Itens atribuidos a esta tarefa <strong>não</strong> perderão a sua configuração de permissões.', 
	'DISPLAY_ROLE_ITEMS'		=> 'Ver Itens utilizando este Tarefa', 

	'EDIT_PERMISSIONS'			=> 'Editar Permissões', 
	'EDIT_ROLE'					=> 'Editar Tarefa', 

	'GROUPS_NOT_ASSIGNED'		=> 'Nenhum Grupo atribuido a esta tarefa', 

	'LOOK_UP_GROUP'				=> 'Encontrar um Grupo', 
	'LOOK_UP_USER'				=> 'Encontrar um Usuário', 

	'MANAGE_GROUPS'		=> 'Gerenciar Grupos', 
	'MANAGE_USERS'		=> 'Gerenciar Usuários', 

	'NO_AUTH_SETTING_FOUND'		=> 'A Configuração de Permissões não foi definida.', 
	'NO_ROLE_ASSIGNED'			=> 'Sem Tarefas atribuidas', 
	'NO_ROLE_ASSIGNED_EXPLAIN'	=> 'A Configuração para esta tarefa não alterou as permissões na direita. Se você deseja unset/excluir todas as permissões você deve utilizar o link â€œTodos <samp>NÃO</samp>.', 
	'NO_ROLE_AVAILABLE'			=> 'Sem Tarefas Disponíveis', 
	'NO_ROLE_NAME_SPECIFIED'	=> 'O Nome da Tarefa deve ser escrito.', 
	'NO_ROLE_SELECTED'			=> 'A Tarefa não pôde ser encontrada.', 
	'NO_USER_GROUP_SELECTED'	=> 'Você não selecionou nenhum Usuário ou Grupo.', 

	'ONLY_FORUM_DEFINED'	=> 'Você apenas definiu seções em sua seleção. Por Favor, também selecione pelo menos um Usuário ou um Grupo.', 

	'PERMISSION_APPLIED_TO_ALL'		=> 'As Tarefas e Permissões também serão aplicadas a todos os objetos selecionados', 
	'PLUS_SUBFORUMS'				=> '+ SubSeções', 

	'REMOVE_PERMISSIONS'			=> 'Excluir Permissões', 
	'REMOVE_ROLE'					=> 'Excluir Tarefa', 
	'ROLE'							=> 'Tarefa', 
	'ROLE_ADD_SUCCESS'				=> 'A Tarefa foi adicionada com sucesso.', 
	'ROLE_ASSIGNED_TO'				=> 'Os Usuários/Grupos foram atribuidos a %s', 
	'ROLE_DELETED'					=> 'A Tarefa foi excluída com sucesso.', 
	'ROLE_DESCRIPTION'				=> 'Descrição da Tarefa', 

	'ROLE_ADMIN_FORUM'			=> 'Administração de Seções', 
	'ROLE_ADMIN_FULL'			=> 'Administração Completa', 
	'ROLE_ADMIN_STANDARD'		=> 'Administração Padrão', 
	'ROLE_ADMIN_USERGROUP'		=> 'Administração de Usuários e Grupos', 
	'ROLE_FORUM_BOT'			=> 'Acesso de BOT', 
	'ROLE_FORUM_FULL'			=> 'Acesso Completo', 
	'ROLE_FORUM_LIMITED'		=> 'Acesso Limitado', 
	'ROLE_FORUM_LIMITED_POLLS'	=> 'Acesso Limitado + Enquetes', 
	'ROLE_FORUM_NOACCESS'		=> 'Sem Acesso', 
	'ROLE_FORUM_ONQUEUE'		=> 'Na Fila de Moderação', 
	'ROLE_FORUM_POLLS'			=> 'Acesso + Enquetes Padrão', 
	'ROLE_FORUM_READONLY'		=> 'Acesso de Leitura Apenas', 
	'ROLE_FORUM_STANDARD'		=> 'Acesso Padrão', 
	'ROLE_MOD_FULL'				=> 'Moderador Completo', 
	'ROLE_MOD_QUEUE'			=> 'Moderador da Fila', 
	'ROLE_MOD_SIMPLE'			=> 'Moderador Simples', 
	'ROLE_MOD_STANDARD'			=> 'Moderador Padrão', 
	'ROLE_USER_FULL'			=> 'Todas as Permissões', 
	'ROLE_USER_LIMITED'			=> 'Permissões Limitadas', 
	'ROLE_USER_NOAVATAR'		=> 'Sem Avatar', 
	'ROLE_USER_NOPM'			=> 'Sem Mensagens Particulares', 
	'ROLE_USER_STANDARD'		=> 'Permissões Padrão', 

	'ROLE_DESCRIPTION_ADMIN_FORUM'			=> 'Pode acessar as Configurações de Gerenciamento e Permissões de Seções.', 
	'ROLE_DESCRIPTION_ADMIN_FULL'			=> 'Ter acesso a Todas as Funções Administrativas neste Forum.<br />Não recomendado.', 
	'ROLE_DESCRIPTION_ADMIN_STANDARD'		=> 'Ter acesso de maior parte das Funções Administrativas, mas não está autorizado a utilizar ferramentas relacionadas ao Servidor ou ao Sistema.', 
	'ROLE_DESCRIPTION_ADMIN_USERGROUP'		=> 'Pode Gerenciar Grupos e Usuários: Pode alterar permissões, configurações, gerenciar banimentos e ranks.', 
	'ROLE_DESCRIPTION_FORUM_BOT'			=> 'Esta Tarefa é recomendada para BOTs e Aranhas de Pesquisa.', 
	'ROLE_DESCRIPTION_FORUM_FULL'			=> 'Pode utilizar todas as Funções da Seção, incluindo o envio de Anúncios e Tópicos Fixos. Pode também ignorar o limite de flood.<br />Não recomendado para Usuários Normais.', 
	'ROLE_DESCRIPTION_FORUM_LIMITED'		=> 'Pode utilizar algumas Funções da Seção, mas não Anexar Arquivos ou utilizar Ícones de Mensagens.', 
	'ROLE_DESCRIPTION_FORUM_LIMITED_POLLS'	=> 'Como o Acesso Limitado, mas pode também Criar Enquetes.', 
	'ROLE_DESCRIPTION_FORUM_NOACCESS'		=> 'Não Pode Ver e nem Acessar o Forum.', 
	'ROLE_DESCRIPTION_FORUM_ONQUEUE'		=> 'Pode utilizar a maior parte das Funções da Seção, incluindo os Anexos, mas tópicos e mensagens precisam ser aprovadas por um Moderador.', 
	'ROLE_DESCRIPTION_FORUM_POLLS'			=> 'Como o Acesso Padrão, mas pode Criar Enquetes.', 
	'ROLE_DESCRIPTION_FORUM_READONLY'		=> 'Pode Ler o Forum, mas não pode Criar Novos Tópicos ou Responder Mensagens.', 
	'ROLE_DESCRIPTION_FORUM_STANDARD'		=> 'Pode utilizar a maior parte das Funções da Seção, incluindo os Anexos, mas não pode Trancar ou Excluir os próprios tópicos, e não pode Criar Enquetes.', 
	'ROLE_DESCRIPTION_MOD_FULL'				=> 'Pode utilizar todas as Funções Moderativas, incluindo os banimentos.', 
	'ROLE_DESCRIPTION_MOD_QUEUE'			=> 'Pode utilizar a Fila de Moderação para validar e Editar Mensagens, mas nada mais.', 
	'ROLE_DESCRIPTION_MOD_SIMPLE'			=> 'Pode utilizar apenas opções básicas de tópicos. Não pode Enviar Advertências ou utilizar a Fila de Moderação.', 
	'ROLE_DESCRIPTION_MOD_STANDARD'			=> 'Pode utilizar a maior parte das Ferramentas Moderativas, mas não pode Banir Usuários ou alterar o Autor da Mensagem.', 
	'ROLE_DESCRIPTION_USER_FULL'			=> 'Pode utilizar todas as Funções do Forum disponíveis para Usuários, incluindo a alteração do Nome de Usuário ou ignorando o Limite de Flood.<br />Não recomendado.', 
	'ROLE_DESCRIPTION_USER_LIMITED'			=> 'Pode acessar algumas da Funções dos Usuários. Anexos, emails, ou Mensagens Urgentes não são permitidas.', 
	'ROLE_DESCRIPTION_USER_NOAVATAR'		=> 'Ter Funções Limitadas e não está permitido a utilizar Avatares.', 
	'ROLE_DESCRIPTION_USER_NOPM'			=> 'Ter Funções Limitadas e não está permitido a utilizar Mensagens Particulares.', 
	'ROLE_DESCRIPTION_USER_STANDARD'		=> 'Pode acessar a maior parte das Funções, mas não todas as Ferramentas de Usuário. Não pode alterar o Nome de Usuário ou ignorar o limite de flood, por exemplo.', 
	 
	'ROLE_DESCRIPTION_EXPLAIN'		=> 'Você pode escrever uma pequena explicação sobre o quê a tarefa está realizando ou sobre qual o objetivo da mesma. O Texto escrito aqui será exibido com as telas de permissão também.', 
	'ROLE_DESCRIPTION_LONG'			=> 'A Descrição da Tarefa é muito grande. Por Favor, limite seu texto a 4000 caracteres.', 
	'ROLE_DETAILS'					=> 'Detalhes da Tarefa', 
	'ROLE_EDIT_SUCCESS'				=> 'A Tarefa foi editada com sucesso.', 
	'ROLE_NAME'						=> 'Nome da Tarefa', 
	'ROLE_NAME_ALREADY_EXIST'		=> 'Uma tarefa nomeada <strong>%s</strong> já existe para o Tipo de Permissão especificado.', 
	'ROLE_NOT_ASSIGNED'				=> 'A Tarefa ainda não foi atribuida.', 

	'SELECTED_FORUM_NOT_EXIST'		=> 'As Seções selecionadas não existem.', 
	'SELECTED_GROUP_NOT_EXIST'		=> 'Os Grupos selecionados não existem.', 
	'SELECTED_USER_NOT_EXIST'		=> 'Os Usuários selecionados não existem.', 
	'SELECT_FORUM_SUBFORUM_EXPLAIN'	=> 'A Seção selecionada aqui irá incluir todas as suas subSeções nesta seleção.', 
	'SELECT_ROLE'					=> 'Selecionar Tarefa', 
	'SELECT_TYPE'					=> 'Selecionar Tipo', 
	'SET_PERMISSIONS'				=> 'Dar Permissões', 
	'SET_ROLE_PERMISSIONS'			=> 'Dar Permissões da Tarefa', 
	'SET_USERS_PERMISSIONS'			=> 'Dar Permissões dos Usuários', 
	'SET_USERS_FORUM_PERMISSIONS'	=> 'Dar Permissões das Seções', 

	'TRACE_DEFAULT'					=> 'Por Padrão, todas as opções estão assinaladas como <samp>NÃO</samp> (unset). Então, a permissão pode ser substituida por outras configurações.', 
	'TRACE_FOR'						=> 'Copiar para', 
	'TRACE_GLOBAL_SETTING'			=> '%s (global)', 
	'TRACE_GROUP_NEVER_TOTAL_NEVER'	=> 'A Permissão do Grupo está assinalada como <samp>NUNCA</samp> como o resultado total, então o resultado antigo foi salvo.', 
	'TRACE_GROUP_NEVER_TOTAL_NO'	=> 'A Permissão do Grupo está assinalada como <samp>NUNCA</samp> que torna-se o novo valor total porque ainda não estava assinalado (assinale <samp>NÃO</samp>).', 
	'TRACE_GROUP_NEVER_TOTAL_YES'	=> 'A Permissão do Grupo está assinalada como <samp>NUNCA</samp> que substitui o total <samp>SIM</samp> para um <samp>NUNCA</samp> para este Usuário.', 
	'TRACE_GROUP_NO'				=> 'A Permissão está assinalada como <samp>NÃO</samp> para este Grupo, o antigo valor total foi salvo.', 
	'TRACE_GROUP_YES_TOTAL_NEVER'	=> 'A Permissão do Grupo está assinalada como <samp>SIM</samp> mas o total <samp>NUNCA</samp> não pode ser substituido.', 
	'TRACE_GROUP_YES_TOTAL_NO'		=> 'A Permissão do Grupo está assinalada como <samp>SIM</samp> que torna-se o novo valor total porque ainda não estava assinalado (assinale <samp>NÃO</samp>).', 
	'TRACE_GROUP_YES_TOTAL_YES'		=> 'A Permissão do Grupo está assinalada como <samp>SIM</samp> e a permissão total já está assinalada como <samp>SIM</samp>, então o resultado total foi salvo.', 
	'TRACE_PERMISSION'				=> 'Permissão de Cópia - %s', 
	'TRACE_SETTING'					=> 'Configuração de Cópia', 

	'TRACE_USER_GLOBAL_YES_TOTAL_YES'		=> 'A Permissão de Usuário independente da Seção está avaliada como <samp>SIM</samp> mas a permissão total já está assinalada como <samp>SIM</samp>, então o resultado total é salvo. %sCópia da Permissão Global%s', 
	'TRACE_USER_GLOBAL_YES_TOTAL_NEVER'		=> 'A Permissão de Usuário independente da Seção está avaliada como <samp>SIM</samp> que substitui o resultado local atual <samp>NUNCA</samp>. %sCópia da Permissão Global%s', 
	'TRACE_USER_GLOBAL_NEVER_TOTAL_KEPT'	=> 'A Permissão de Usuário independente da Seção está avaliada como <samp>NUNCA</samp> que não influencia na permissão local. %sCópia da Permissão Global%s', 
	'TRACE_USER_FOUNDER'					=> 'O Usuário possui as Permissões founder assinaladas, por isso as Permissões Administrativas estão assinaladas como <samp>SIM</samp> por padrão.', 
	'TRACE_USER_KEPT'						=> 'A Permissão do Usuário é <samp>NÃO</samp>, então o antigo valor total foi salvo.', 
	'TRACE_USER_NEVER_TOTAL_NEVER'			=> 'A Permissão do Usuário está assinalada como <samp>NUNCA</samp> e o valor total está assinalado como <samp>NUNCA</samp>, então nada é alterado.', 
	'TRACE_USER_NEVER_TOTAL_NO'				=> 'A Permissão do Usuário está assinalada como <samp>NUNCA</samp> que torna-se o valor total porque estava assinalado como <samp>NÃO</samp>.', 
	'TRACE_USER_NEVER_TOTAL_YES'			=> 'A Permissão do Usuário está assinalada como <samp>NUNCA</samp> e substitui o <samp>SIM</samp> prévio.', 
	'TRACE_USER_NO_TOTAL_NO'				=> 'A Permissão do Usuário é <samp>NÃO</samp> e o valor total estava assinalado como <samp>NÃO</samp>, então é padronizado para <samp>NUNCA</samp>.', 
	'TRACE_USER_YES_TOTAL_NEVER'			=> 'A Permissão do Usuário está assinalada como <samp>SIM</samp> mas o total <samp>NUNCA</samp> não pode ser substituido.', 
	'TRACE_USER_YES_TOTAL_NO'				=> 'A Permissão do Usuário está assinalada como <samp>SIM</samp> que torna-se o valor total porque estava assinalado como <samp>NÃO</samp>.', 
	'TRACE_USER_YES_TOTAL_YES'				=> 'A Permissão do Usuário está assinalada como <samp>SIM</samp> and o valor total é assinalado como <samp>SIM</samp>, então nada é alterado.', 
	'TRACE_WHO'								=> 'Quem', 
	'TRACE_TOTAL'							=> 'Total', 

	'USERS_NOT_ASSIGNED'			=> 'Nenhum Usuário atribuido a esta tarefa', 
	'USER_IS_MEMBER_OF_DEFAULT'		=> 'é um Membro dos Grupos Padrões seguintes', 
	'USER_IS_MEMBER_OF_CUSTOM'		=> 'é um Membro dos Grupos Personalizados seguintes', 

	'VIEW_ASSIGNED_ITEMS'	=> 'Ver Itens Atribuidos', 
	'VIEW_LOCAL_PERMS'		=> 'Permissões Locais', 
	'VIEW_GLOBAL_PERMS'		=> 'Permissões Globais', 
	'VIEW_PERMISSIONS'		=> 'Ver Permissões', 

	'WRONG_PERMISSION_TYPE'	=> 'Tipo de Permissão Falha selecionada.', 
)); 

?>
