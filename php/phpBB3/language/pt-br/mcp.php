<?php 
/** 
* 
* mcp [Portuguese] 
* 
* @package language 
* @version $Id: mcp.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ACTION'				=> 'Ação', 
	'ACTION_NOTE'			=> 'Ação/Nota',
	'ADD_FEEDBACK'			=> 'Adicionar relatório', 
	'ADD_FEEDBACK_EXPLAIN'	=> 'Se quiser deixar um relatório, por favor preencha os campos seguintes. Use apenas texto; HTML, BBCode, etc. não são permitidos.', 
	'ADD_WARNING'			=> 'Adicionar aviso', 
	'ADD_WARNING_EXPLAIN' 	=> 'Para enviar um aviso para este utilizador por favor preencha os seguintes campos. Use apenas texto; HTML, BBCode, etc. não são permitidos.', 
	'ALL_ENTRIES'			=> 'Todas as entradas', 
	'ALL_NOTES_DELETED'		=> 'Todas as notas do Usurio foram excludas com sucesso.',
	'ALL_REPORTS'			=> 'Todas as denúncias.', 
	'ALREADY_REPORTED'		=> 'Esta mensagem já foi denunciada.',
	'ALREADY_WARNED'		=> 'Um aviso já foi enviado para esta mensagem.', 
	'APPROVE'				=> 'Aprovar', 
	'APPROVE_POST'			=> 'Aprovar mensagem', 
	'APPROVE_POST_CONFIRM'	=> 'Deseja mesmo aprovar esta mensagem?', 
	'APPROVE_POSTS'			=> 'Aprovar mensagens', 
	'APPROVE_POSTS_CONFIRM'	=> 'Deseja mesmo aprovar as mensagens selecionadas?', 
	
	'CANNOT_MOVE_SAME_FORUM'=> 'Você não pode mover o fórum itâ€™s em que já está inserido.', 
	'CANNOT_WARN_ANONYMOUS' => 'Você não pode avisar convidados não registrados.',
	'CANNOT_WARN_SELF'		=> 'Você não pode adverter a si mesmo.',
	'CAN_LEAVE_BLANK'		=> 'Pode ser deixado em branco.', 
	'CHANGE_POSTER'			=> 'Alterar criador da mensagem', 
	'CLOSE_REPORT'			=> 'Fechar a denúncia', 
	'CLOSE_REPORT_CONFIRM'	=> 'Tem a certeza que quer fechar a denúncia selecionada?', 
	'CLOSE_REPORTS'			=> 'Fechar denúncias', 
	'CLOSE_REPORTS_CONFIRM'	=> 'Tem a certeza que quer fechar as denúncis selecionadas?', 
	
	'DELETE_POSTS'				=> 'Apagar mensagens', 
	'DELETE_POSTS_CONFIRM'		=> 'Tem a certeza que quer apagar essas mensagens?', 
	'DELETE_POST_CONFIRM'		=> 'Tem a certeza que quer apagar esta mensagem?', 
	'DELETE_REPORT'				=> 'Apagar denúncia', 
	'DELETE_REPORT_CONFIRM'		=> 'Tem a certeza que quer apagar a denúncia selecionada?', 
	'DELETE_REPORTS'			=> 'Apagar denúncias', 
	'DELETE_REPORTS_CONFIRM'	=> 'Tem a certeza que quer apagar as denúncias selecionadas?', 
	'DELETE_SHADOW_TOPIC'		=> 'Excluir tópico fantasma',
	'DELETE_TOPICS'				=> 'Apagar tópicos selecionados', 
	'DELETE_TOPICS_CONFIRM'		=> 'Tem a certeza que quer apagar esses tópicos?', 
	'DELETE_TOPIC_CONFIRM'		=> 'Tem a certeza que quer apagar esse tópico?', 
	'DISAPPROVE'				=> 'Cancelar', 
	'DISAPPROVE_REASON'			=> 'Motivo do cancelamento', 
	'DISAPPROVE_POST'			=> 'Cancelar mensagem', 
	'DISAPPROVE_POST_CONFIRM'	=> 'Tem a certeza que quer cancelar esta mensagem?', 
	'DISAPPROVE_POSTS'			=> 'Cancelar mensagens', 
	'DISAPPROVE_POSTS_CONFIRM'	=> 'Tem a certeza que quer cancelar as mensagens selecionadas?', 
	'DISPLAY_LOG'				=> 'Exibir resultados anteriores', 
	'DISPLAY_OPTIONS'			=> 'Opções de exibição', 
	
	'EMPTY_REPORT'					=> 'Você tem que introduzir uma descrição quando utilizando esta razo.',
	'EMPTY_TOPICS_REMOVED_WARNING'	=> 'Um ou mais tópicos foram excludos da base de dados porque eram ou tornaram-se vazios.',
	
	'FEEDBACK'				=> 'Suporte', 
	'FORK'					=> 'Copiar',
	'FORK_TOPIC'			=> 'Copiar Tópico',
	'FORK_TOPIC_CONFIRM'	=> 'Tem a certeza que quer copiar este tópico?', 
	'FORK_TOPICS'			=> 'Copiar Tópicos selecionados',
	'FORK_TOPICS_CONFIRM'	=> 'Tem a certeza que quer copiar os tópicos selecionados?', 
	'FORUM_DESC'			=> 'Descrição', 
	'FORUM_NAME'			=> 'Nome do fórum', 
	'FORUM_NOT_EXIST'		=> 'O Fórum selecionado não existe.',
	'FORUM_NOT_POSTABLE'	=> 'Você não pode enviar mensagens nesse fórum.',
	'FORUM_STATUS'			=> 'Estado do fórum', 
	'FORUM_STYLE'			=> 'Estilo do fórum', 
	
	'GLOBAL_ANNOUNCEMENT'	=> 'Anúncio global', 
	
	'IP_INFO'				=> 'Informação de IP', 
	'IPS_POSTED_FROM'		=> 'Endereço de IP utilizado pelo usuário ao enviar esta mensagem',
		
	'LATEST_LOGS'				=> 'Últimas 5 ações registradas', 
	'LATEST_REPORTED'			=> 'Últimas 5 denúncias', 
	'LATEST_UNAPPROVED'			=> 'Últimos 5 tópicos aguardando Aprovao',
	'LATEST_WARNING_TIME'		=> 'Último aviso emitido', 
	'LATEST_WARNINGS'			=> 'Últimos 5 avisos', 
	'LEAVE_SHADOW'				=> 'Deixar Tópico Fantasma no lugar',
	'LIST_REPORT'				=> '1 denúncia', 
	'LIST_REPORTS'				=> '%d denúncias', 
	'LOCK'						=> 'Trancar', 
	'LOCK_POST_POST'			=> 'Trancar mensagem', 
	'LOCK_POST_POST_CONFIRM'	=> 'Tem a certeza que quer trancar esta mensagem?(Não poderá editá-la futuramente)', 
	'LOCK_POST_POSTS'			=> 'Trancar mensagens selecionadas', 
	'LOCK_POST_POSTS_CONFIRM'	=> 'Tem a certeza que quer trancar as mensagens selecionadas?(Não poderá editá-las futuramente)', 
	'LOCK_TOPIC_CONFIRM'		=> 'Tem a certeza que quer trancar este tópico?', 
	'LOCK_TOPICS'				=> 'Trancar tópicos selecionados', 
	'LOCK_TOPICS_CONFIRM'		=> 'Tem a certeza que quer trancar todos os tópicos selecionados??', 
	'LOGS_CURRENT_TOPIC'		=> 'Exibindo registos de:', 
	'LOGIN_EXPLAIN_MCP'			=> 'Para morerar este fórum você tem que entrar.', 
	'LOGVIEW_VIEWTOPIC'			=> 'Exibir tópico', 
	'LOGVIEW_VIEWLOGS'			=> 'Exipir registo do tópico', 
	'LOGVIEW_VIEWFORUM'			=> 'Exibir fórum', 
	'LOOKUP_ALL'				=> 'Exibir todos os IPs', 
	'LOOKUP_IP'					=> 'Procurar IP', 
	
	'MARKED_NOTES_DELETED'		=> 'Todas as notas do usurio marcadas foram excludas com sucesso.',
	
	'MCP_ADD'						=> 'Adicionar aviso', 
	
	'MCP_BAN'					=> 'Banindo', 
	'MCP_BAN_EMAILS'			=> 'Banir Emails', 
	'MCP_BAN_IPS'				=> 'Banir IPs', 
	'MCP_BAN_USERNAMES'			=> 'Banir Usuários', 
	
	'MCP_LOGS'						=> 'Registros de Moderador', 
	'MCP_LOGS_FRONT'				=> 'Página Inicial', 
	'MCP_LOGS_FORUM_VIEW'			=> 'Registos de fórum', 
	'MCP_LOGS_TOPIC_VIEW'			=> 'Registos de Tópico', 
	
	'MCP_MAIN'						=> 'Principal', 
	'MCP_MAIN_FORUM_VIEW'			=> 'Exibir fórum', 
	'MCP_MAIN_FRONT'				=> 'Página frontal', 
	'MCP_MAIN_POST_DETAILS'			=> 'Detalhes dos tópcios', 
	'MCP_MAIN_TOPIC_VIEW'			=> 'Ver tópico', 
	'MCP_MAKE_ANNOUNCEMENT'			=> 'Deixar como anúncio', 
	'MCP_MAKE_ANNOUNCEMENT_CONFIRM' => 'Você está certo que deseja alterar este tópico para anúncio?', 
	'MCP_MAKE_ANNOUNCEMENTS'		=> 'Criar anúncios', 
	'MCP_MAKE_ANNOUNCEMENTS_CONFIRM'=> 'Você está certo que deseja alterar estes tópicos para anúncios?', 
	'MCP_MAKE_GLOBAL'				=> 'Deixar como anúncio global', 
	'MCP_MAKE_GLOBAL_CONFIRM'		=> 'Você está certo que deseja alterar este tópico para anúncio global?', 
	'MCP_MAKE_GLOBALS'				=> 'Deixar como anúncios globais', 
	'MCP_MAKE_GLOBALS_CONFIRM'		=> 'Você está certo que deseja alterar estestes tópicos para anúncios globais?', 
	'MCP_MAKE_STICKY'				=> 'Deixar tópico fixado', 
	'MCP_MAKE_STICKY_CONFIRM'		=> 'Você está certo que deseja deixar este tópico fixado?', 
	'MCP_MAKE_STICKIES'				=> 'Deixar Tópicos Fixados',
	'MCP_MAKE_STICKIES_CONFIRM'		=> 'Você está certo que deseja deixar estes tópicos fixadas?', 
	'MCP_MAKE_NORMAL'				=> 'Deixar como tópico normal', 
	'MCP_MAKE_NORMAL_CONFIRM'		=> 'Você está certo que deseja deixar esta tópico como tópico normal?', 
	'MCP_MAKE_NORMALS'				=> 'Deixar como tópicos normais', 
	'MCP_MAKE_NORMALS_CONFIRM'		=> 'Você está certo que deseja deixar estes tópicos como tópicos normais?', 
	
	'MCP_NOTES'						=> 'Notas do usuário', 
	'MCP_NOTES_FRONT'				=> 'Página frontal', 
	'MCP_NOTES_USER'				=> 'Detalhes do usuário', 
	
	'MCP_POST_REPORTS'				=> 'Denúncias emitidas desta mensagem',
	
	'MCP_REPORTS'					=> 'Tópicos relatados', 
	'MCP_REPORT_DETAILS'			=> 'Relatar detalhes', 
	'MCP_REPORTS_CLOSED'			=> 'Denúncias fechadas', 
	'MCP_REPORTS_CLOSED_EXPLAIN'	=> 'Esta é uma lista de todas as denúncias dos tópicos que vem sido concluídos recentemente.',
	'MCP_REPORTS_OPEN'				=> 'Abrir denúncia', 
	'MCP_REPORTS_OPEN_EXPLAIN'		=> 'Esta é uma lista de todas as denúncias dos tópicos que ainda não foram concluídos.',
	
	'MCP_QUEUE'								=> 'Moderação', 
	'MCP_QUEUE_APPROVE_DETAILS'				=> 'Aprovar detalhes', 
	'MCP_QUEUE_UNAPPROVED_POSTS'			=> 'Mensagens esperando aprovação', 
	'MCP_QUEUE_UNAPPROVED_POSTS_EXPLAIN'	=> 'Esta é uma lista de todas as mensagens que devem ser aprovadas para se tornarem visíveis aos usuários.',
	'MCP_QUEUE_UNAPPROVED_TOPICS'			=> 'Novos tópicos esperando aprovação', 
	'MCP_QUEUE_UNAPPROVED_TOPICS_EXPLAIN'	=> 'Esta é uma lista de todos os tópicos que devem ser aprovados para se tornarem visíveis aos usuários.',
	
	'MCP_VIEW_USER'			=> 'Avisos de Visita de um Usuários específico',
	
	'MCP_WARN'				=> 'Avisos', 
	'MCP_WARN_FRONT'		=> 'Painel frontal', 
	'MCP_WARN_LIST'			=> 'Lista de avisos', 
	'MCP_WARN_POST'			=> 'Alertar uma mensagem', 
	'MCP_WARN_USER'			=> 'Alertar um usuários', 
	
	'MERGE_POSTS'			=> 'Fusão de mensagens', 
	'MERGE_POSTS_CONFIRM'	=> 'Você está certo que deseja fundir as mensagens selecionadas?', 
	'MERGE_TOPIC_EXPLAIN'	=> 'Usando este formulário você pode fundir uma mensagem com um outro tópico. As mensagens não serão requisitadas novamente, serão exibidas como se os usuários tivem enviado as mensagens em um novo tópico.<br />Por favor, digite a ID do tópico que será fundido ou então clique em "Selecionar" e procure por um.',
	'MERGE_TOPIC_ID'		=> 'ID do tópico a ser fundido', 
	'MERGE_TOPICS'			=> 'Fundir tópicos',
	'MERGE_TOPICS_CONFIRM'	=> 'Você tem certeza que deseja fundir os tópicos selecionados?',	
	'MODERATE_FORUM'		=> 'Fórum moderado',	
	'MODERATE_TOPIC'		=> 'Tópico moderado',
	'MODERATE_POST'			=> 'Mensagem moderada',	
	'MOD_OPTIONS'			=> 'Opções do moderador', 
	'MORE_INFO'				=> 'Informações adicionais', 
	'MOST_WARNINGS'			=> 'Usuários com a maioria dos avisos', 
	'MOVE_TOPIC_CONFIRM'	=> 'Você está certo que deseja mover este tópico selecionado para dentro de um novo fórum?', 
	'MOVE_TOPICS'			=> 'Mover tópicos selecionados', 
	'MOVE_TOPICS_CONFIRM'	=> 'Você está certo que deseja movers estes tópicos selecionados para dentro de um novo fórum?', 
	
	'NOTIFY_POSTER_APPROVAL'		=> 'Notificar o autor da mensagem sobre a aprovação?', 
	'NOTIFY_POSTER_DISAPPROVAL'		=> 'Notificar o autor da mensagem sobre a desaprovação?', 
	'NOTIFY_USER_WARN'				=> 'Notificar o usuário sobre a alerta?', 
	'NOT_MODERATOR'					=> 'Você não é um Moderador deste fórum.',
	'NO_DESTINATION_FORUM'			=> 'Por Favor, selecione um fórum para destino.',
	'NO_DESTINATION_FORUM_FOUND'	=> 'Não há fórum de destino disponível.', 
	'NO_ENTRIES'					=> 'Não há LOGs para este perdo.',
	'NO_FEEDBACK'					=> 'Não existe denúncia deste usuário.',
	'NO_FINAL_TOPIC_SELECTED'		=> 'Você deve selecionar um tópico de destino para fundir as mensagens.',
	'NO_MATCHES_FOUND'				=> 'Nenhum resultado encontrado.',
	'NO_POST'						=> 'Você deve selecionar uma mensagem para alertar o usuário sobre ela.',
	'NO_POST_REPORT'				=> 'Esta mensagem não foi relatada.', 
	'NO_POST_SELECTED'				=> 'Você deve selecionar pelo menos uma mensagem para realizar esta ação.',
	'NO_REASON_DISAPPROVAL'			=> 'Por Favor, dê uma razão apropriada para a desaprovação.',
	'NO_REPORT'						=> 'Nenhuma denúncia encontrada',
	'NO_REPORTS'					=> 'Sem denúncias',
	'NO_REPORT_SELECTED'			=> 'Você deve selecionar pelo menos uma denúncia para realizar esta ação.',	
	'NO_TOPIC_ICON'					=> 'Nenhum', 
	'NO_TOPIC_SELECTED'				=> 'Você deve selecionar ao menos um tópico para realizar esta ação.',
	'NO_TOPICS_QUEUE'				=> 'Sem tópicos',
	
	'ONLY_TOPIC'			=> 'Sómente o tópico "%s"', 
	'OTHER_USERS'			=> 'Usuários enviando mensagens deste IP',
	
	'POSTER'					=> 'Autor', 
	'POSTS_APPROVED_SUCCESS'	=> 'As mensagens selecionadas foram aprovadas com sucesso.',
	'POSTS_DELETED_SUCCESS'		=> 'As mensagens selecionadas foram removidas do banco de dados com sucesso.', 
	'POSTS_DISAPPROVED_SUCCESS' => 'As mensagens selecionadas foram reprovadas com sucesso.',
	'POSTS_LOCKED_SUCCESS'		=> 'As mensagens selecionadas foram trancadas com sucesso.', 
	'POSTS_MERGED_SUCCESS'		=> 'As mensagens selecionadas foram fundidas com sucesso.',
	'POSTS_UNLOCKED_SUCCESS'	=> 'As mensagens selecionadas foram destrancadas com sucesso.', 
	'POSTS_PER_PAGE'			=> 'Mensagens por Página',
	'POSTS_PER_PAGE_EXPLAIN'	=> '(Escreva 0 para visualizar todas as mensagens)',
	'POST_APPROVED_SUCCESS' 	=> 'A mensagem selecionada foi aprovada com sucesso.',
	'POST_DELETED_SUCCESS'		=> 'A mensagem selecionada foi removida do banco de dados com sucesso.', 
	'POST_DISAPPROVED_SUCCESS'	=> 'A mensagem seleconada foi reprovada com sucesso.',
	'POST_LOCKED_SUCCESS'		=> 'A mensagem selecionada foi trancada com sucesso.', 
	'POST_NOT_EXIST'			=> 'A mensagem que você solicitou não existe.', 
	'POST_REPORTED_SUCCESS'		=> 'A mensagem foi relatada com sucesso.', 
	'POST_UNLOCKED_SUCCESS'		=> 'A mensagem foi destrancada com sucesso.', 
	
	'READ_USERNOTES'			=> 'Notas do usuário', 
	'READ_WARNINGS'				=> 'Avisos do usuário', 
	'REPORTER'					=> 'Denúnciador', 
	'REPORTED'					=> 'Denúnciado', 
	'REPORTED_BY'				=> 'Denúnciado por', 
	'REPORTED_ON_DATE'			=> 'em', 
	'REPORTS_CLOSED_SUCCESS'	=> 'As denúncias selecionadas foram trancadas com sucesso.', 
	'REPORTS_DELETED_SUCCESS'	=> 'As denúncias selecionadas foram removidas com sucesso.', 
	'REPORTS_TOTAL'				=> 'Há um total de <strong>%d</strong> denúncias para revisão.', 
	'REPORTS_ZERO_TOTAL'		=> 'Não há denúncias para revisão.',
	'REPORT_CLOSED'				=> 'Esta denúncia está temporariamente trancada.', 
	'REPORT_CLOSED_SUCCESS' 	=> 'A denúncia selecionada foi trancada com sucesso!.', 
	'REPORT_DELETED_SUCCESS'	=> 'A denúncia selecionada foi removida com sucesso!.', 
	'REPORT_DETAILS'			=> 'Detalhes da denúncia', 
	'REPORT_MESSAGE'			=> 'Relate esta mensagem', 
	'REPORT_MESSAGE_EXPLAIN'	=> 'Use este formulário para relatar esta mensagem aos administradores. A mensagem deve ser relatado geralmente quando o mesmo quebra as regras do fórum.', 
	'REPORT_NOTIFY'				=> 'Notifique-me', 
	'REPORT_NOTIFY_EXPLAIN'		=> 'Informar de quando sua denúncia é tratada.', 
	'REPORT_POST_EXPLAIN'		=> 'Use este formulário para relatar as mensagens selecionadas aos administradores e moderadores do fórum. A mensagem deve ser relatado geralmente quando o mesmo quebra as regras do fórum.', 
	'REPORT_REASON'				=> 'Razão do relato', 
	'REPORT_TIME'				=> 'Tempo do relato', 
	'REPORT_TOTAL'				=> 'No total, há <strong>1</strong> denýncias para revisão.',
	'RESYNC'					=> 'Resincronizar', 
	'RETURN_MESSAGE'			=> '%sRetornar à mensagem%s', 
	'RETURN_NEW_FORUM'			=> '%sRetornar ao novo fórum%s', 
	'RETURN_NEW_TOPIC'			=> '%sRetornar ao novo tópico%s', 
	'RETURN_POST'				=> '%sRetornar à mensagem%s', 
	'RETURN_QUEUE'				=> '%sRetornar à lista%s', 
	'RETURN_REPORTS'			=> '%sRetornar à denúncia%s', 
	'RETURN_TOPIC_SIMPLE'		=> '%sRetornar ao tópico%s',
		
	'SEARCH_POSTS_BY_USER'				=> 'Procurar mensagens por', 
	'SELECT_ACTION'						=> 'Selecione a ação desejada',
	'SELECT_FORUM_GLOBAL_ANNOUNCEMENT'	=> 'Selecione o forum que você deseja exibir este anúncio global.',
	'SELECT_FORUM_GLOBAL_ANNOUNCEMENTS'	=> 'Um ou mais dos tópicos selecionados são anúncios globais. Selecione o forum que deseja exibir estes anúncios globais.',	
	'SELECT_MERGE'						=> 'Selecione para fundir',
	'SELECT_TOPICS_FROM'				=> 'Selecione os tópicos de', 
	'SELECT_TOPIC'						=> 'Tópico selecionado', 
	'SELECT_USER'						=> 'Usuário selecionado', 
	'SORT_ACTION'						=> 'Ação do registro', 
	'SORT_DATE'							=> 'Data', 
	'SORT_IP'							=> 'Endereço de IP', 
	'SORT_WARNINGS'						=> 'Avisos', 
	'SPLIT_AFTER'						=> 'Dividir a mensagem selecionada', 
	'SPLIT_FORUM'						=> 'Fórum para um novo tópico', 
	'SPLIT_POSTS'						=> 'Dividir mensagens selecionada', 
	'SPLIT_SUBJECT'						=> 'Novo título do tópico', 
	'SPLIT_TOPIC_ALL'					=> 'Dividir o tópico para as mensagens selecionadas', 
	'SPLIT_TOPIC_ALL_CONFIRM'			=> 'Você está certo que deseja dividir este tópico?', 
	'SPLIT_TOPIC_BEYOND'				=> 'Dividir o tópico em mensagens selecionadas', 
	'SPLIT_TOPIC_BEYOND_CONFIRM'		=> 'Você está certo que deseja cortar este tópico na mensagem selecionada?', 
	'SPLIT_TOPIC_EXPLAIN'				=> 'Usando o formulário abaixo você pode partir um tópico em dois, selecionando as mensagens invididualmente ou por mensagem selecionada.',
	
	'THIS_POST_IP'				=> 'IP para esta mensagem', 
	'TOPICS_APPROVED_SUCCESS'	=> 'Os tópicos selecionados foram aprovados com sucesso.',
	'TOPICS_DELETED_SUCCESS'	=> 'Os tópicos selecionados foram removidos do banco de dados com sucesso.', 
	'TOPICS_DISAPPROVED_SUCCESS'=> 'Os tópicos selecionados foram reprovados com sucesso.',
	'TOPICS_FORKED_SUCCESS'		=> 'Os tópicos selecionados foram copiados com sucesso.', 
	'TOPICS_LOCKED_SUCCESS'		=> 'Os tópicos selecionados foram trancados com sucesso.',
	'TOPICS_MOVED_SUCCESS'		=> 'Os tópicos selecionados foram movidos com sucesso.', 
	'TOPICS_RESYNC_SUCCESS'		=> 'Os tópicos selecionados foram resincronizados com sucesso.', 
	'TOPICS_TYPE_CHANGED'		=> 'Típos dos tópicos alterados com sucesso.',
	'TOPICS_UNLOCKED_SUCCESS'	=> 'Os tópicos selecionados foram destrancados com sucesso.',
	'TOPIC_APPROVED_SUCCESS'	=> 'O tópico selecionado foi aprovado com sucesso.',
	'TOPIC_DELETED_SUCCESS'		=> 'O tópico selecionado foi removido do banco de dados com sucesso.', 
	'TOPIC_DISAPPROVED_SUCCESS' => 'O tópico selecionado foi desaprovado com sucesso.',
	'TOPIC_FORKED_SUCCESS'		=> 'O tópico selecionado foi copiado com sucesso.', 
	'TOPIC_LOCKED_SUCCESS'		=> 'O tópico selecionad foi trancado com sucesso.',
	'TOPIC_MOVED_SUCCESS'		=> 'O tópico selecionado foi movido com sucesso.', 
	'TOPIC_NOT_EXIST'			=> 'O tópico selecionado não existe.', 
	'TOPIC_RESYNC_SUCCESS'		=> 'O tópico selecionado foi resincronizado com sucesso.',
	'TOPIC_SPLIT_SUCCESS'		=> 'O tópico selecionado foi dividido com sucesso.', 
	'TOPIC_TIME'				=> 'Tempo do tópico', 
	'TOPIC_TYPE_CHANGED'		=> 'O tipo do tópico foi modificado com sucesso.', 
	'TOPIC_UNLOCKED_SUCCESS'	=> 'O tópico selecionado foi destrancado com sucesso.',
	'TOTAL_WARNINGS' 			=> 'Total de Advertncias',
	
	'UNAPPROVED_POSTS_TOTAL'		=> 'Há um total de <strong>%d</strong> mensagens esperando aprovação.',
	'UNAPPROVED_POSTS_ZERO_TOTAL'	=> 'Não há mensagens esperando aprovação.',
	'UNAPPROVED_POST_TOTAL'			=> 'Há um total de <strong>1</strong> mensagem esperando aprovação.',
	'UNLOCK'						=> 'Destrancar', 
	'UNLOCK_POST'					=> 'Destrancar mensagem', 
	'UNLOCK_POST_EXPLAIN'			=> 'Permitir edição na mensagem.',
	'UNLOCK_POST_POST'				=> 'Destrancar mensagem', 
	'UNLOCK_POST_POST_CONFIRM'		=> 'Você está certo que deseja permitir a edição desta mensagem?', 
	'UNLOCK_POST_POSTS'				=> 'Destrancar mensagens selecionadas', 
	'UNLOCK_POST_POSTS_CONFIRM'		=> 'Você está certo que deseja permitir a edição destas mensagens?', 
	'UNLOCK_TOPIC'					=> 'Destrancar tópico', 
	'UNLOCK_TOPIC_CONFIRM'			=> 'Você está certo que deseja destrancar este tópico?', 
	'UNLOCK_TOPICS'					=> 'Destrancar tópicos selecionados', 
	'UNLOCK_TOPICS_CONFIRM'			=> 'Você está certo que deseja destrancar os tópicos selecionados?', 
	'USER_CANNOT_POST'				=> 'Você não pode enviar mensagens neste fórum.',
	'USER_CANNOT_REPORT'			=> 'Você não pode denúnciar mensagens neste fórum.',
	'USER_FEEDBACK_ADDED'			=> 'Relatório do usuário adicionado com sucesso.', 
	'USER_WARNING_ADDED'			=> 'O usuário foi alertado com sucesso.', 
	
	'VIEW_DETAILS' 			=> 'Ver detalhes', 
	
	'WARNED_USERS' 			=> 'Usuários Advertidos',
	'WARNED_USERS_EXPLAIN' 	=> 'Esta é uma lista dos usuários com os avisos não expiradores emitidos pelos mesmos.', 
	'WARNING_PM_BODY' 		=> 'O seguinte é um aviso emitido para você por um administrador ou moderador do fórum.[quote]%s[quote]', 
	'WARNING_PM_SUBJECT' 	=> 'Avisos emitidos', 
	'WARNING_POST_DEFAULT' 	=> 'Este é um aviso a respeito das suas seguintes mensagens: %s.', 
	'WARNINGS_ZERO_TOTAL' 	=> 'Nenhuma advertncia existente.',
	
	'YOU_SELECTED_TOPIC' 	=> 'Você selecionou o tópico de número %d: %s.', 
	
	'report_reasons' => array( 
		'TITLE' => array( 
			'WAREZ'		=> 'Pirataria', 
			'SPAM' 		=> 'Spam', 
			'OFF_TOPIC' => 'Off-topic', 
			'OTHER' 	=> 'Outro' 
		), 
		'DESCRIPTION' => array( 
			'WAREZ'		=> 'A mensagem denúnciada contém endereços ilegais ou softwares piratiados', 
			'SPAM' 		=> 'A mensagem denúnciada tem apenas o propósito de anunciar um website ou um produto', 
			'OFF_TOPIC' => 'A mensagem denúnciada é desecessária, não faz sentido', 
			'OTHER' 	=> 'A mensagem denúnciada não se encaixa em outra categoria, use o campo de descrição para especificar uma' 
		) 
	), 
)); 

?>
