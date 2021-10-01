<?php 
/** 
* 
* acp_forums [Portuguese] 
* 
* @package language 
* @version $Id: forums.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

// Forum Admin 
$lang = array_merge($lang, array( 
	'AUTO_PRUNE_DAYS'			=> 'Dias para a Limpeza', 
	'AUTO_PRUNE_DAYS_EXPLAIN'	=> 'Número de dias desde a última mensagem depois que o tópico é excluído.', 
	'AUTO_PRUNE_FREQ'			=> 'Frequência da Auto-Limpeza', 
	'AUTO_PRUNE_FREQ_EXPLAIN'	=> 'Tempo em dias entre a execução de uma limpeza e outra.', 
	'AUTO_PRUNE_VIEWED'			=> 'Auto-prune post viewed age', 
	'AUTO_PRUNE_VIEWED_EXPLAIN'	=> 'Número de dias desde a última visualização depois que o tópico é excluído.', 

	'COPY_PERMISSIONS'				=> 'Copiar Permissões de', 
	'COPY_PERMISSIONS_ADD_EXPLAIN'	=> 'Quando criada, a seção terá as mesmas permissões como a que você selecionar aqui. Se nenhuma seção for selecionada, a seção recentemente criada não será visível até que as suas permissões sejam escritas.', 
	'COPY_PERMISSIONS_EDIT_EXPLAIN'	=> 'Se você selecionar para copiar permissões, a seção terá as mesmas permissões como a que você selecionar aqui. Isto irá substituir quaisquer permissões que você tenha previamente atribuido a esta seção com as permissões da seção que você selecionar aqui. Se nenhuma seção for selecionada, as permissões atuais serão salvas.', 
	'CREATE_FORUM'					=> 'Criar nova Seção', 

	'DECIDE_MOVE_DELETE_CONTENT'		=> 'Excluir Mensagens ou Mover para Seção', 
	'DECIDE_MOVE_DELETE_SUBFORUMS'		=> 'Excluir SubSeções ou Mover para Seção', 
	'DEFAULT_STYLE'						=> 'Estilo Padrão', 
	'DELETE_ALL_POSTS'					=> 'Excluir Mensagens', 
	'DELETE_SUBFORUMS'					=> 'Excluir SubSeções e Mensagens', 
	'DISPLAY_ACTIVE_TOPICS'				=> 'Ativar a Ativação de Tópicos', 
	'DISPLAY_ACTIVE_TOPICS_EXPLAIN'		=> 'Se você selecionar (SIM), a ativação de tópicos nas subseções selecionadas será exibida abaixo desta categoria.', 

	'EDIT_FORUM'					=> 'Editar Seção', 
	'ENABLE_INDEXING'				=> 'Ativar atributos da Pesquisa', 
	'ENABLE_INDEXING_EXPLAIN'		=> 'Se você selecionar (SIM), mensagens escritas à esta seção serão indexadas para pesquisas.', 
	'ENABLE_POST_REVIEW'			=> 'Ativar Revisão da Mensagem', 
	'ENABLE_POST_REVIEW_EXPLAIN'	=> 'Se você selecionar (SIM), os usuários poderão fazer uma revisão em suas mensagens se novas mensagens forem escritas ao tópico enquanto usuários escreveram as deles. Isto deverá ser desativado para seções de chat geral.', 
	'ENABLE_RECENT'					=> 'Exibir Tópicos Ativos', 
	'ENABLE_RECENT_EXPLAIN'			=> 'Se você selecionar (SIM), tópicos escritos à esta seção serão exibidos na lista de tópicos ativos.', 
	'ENABLE_TOPIC_ICONS'			=> 'Ativar Ícones de Tópicos', 

	'FORUM_ADMIN'						=> 'Administração de Seções', 
	'FORUM_ADMIN_EXPLAIN'				=> 'No phpBB3 não existem Categorias, tudo é baseado em Seções. Cada seção pode obter ilimitados números de SubSeções e você pode determinar o que poderá ser enviado à cada uma ou não. Aqui você pode adicionar, editar, excluir, trancar, destrancar seções individuais assim como incluir controles adicionais. Se as suas mensagens e tópicos estavam fora de sincronização, você pode re-Sincronizar uma seção.', 
	'FORUM_AUTO_PRUNE'					=> 'Ativar Auto-limpeza', 
	'FORUM_AUTO_PRUNE_EXPLAIN'			=> 'Limpa os tópicos da seção, determinando os parâmetros de frequência/tempo abaixo.', 
	'FORUM_CREATED'						=> 'A Seção foi criada com sucesso.', 
	'FORUM_DATA_NEGATIVE'				=> 'Os Parâmetros da Limpeza não podem ser negativos.', 
	'FORUM_DESC_TOO_LONG'				=> 'A sua Descrição é muito grande, ela precisa ser menor do que 4000 caracteres.', 
	'FORUM_DELETE'						=> 'Excluir Seção', 
	'FORUM_DELETE_EXPLAIN'				=> 'Esta ferramenta lhe permite excluir a determinada seção. Se esta, for uma seção de grande número de mensagens, você pode decidir para onde deseja mover todas as suas mensagens (ou seções) incluidas.', 
	'FORUM_DELETED'						=> 'A Seção selecionada foi excluída com sucesso.', 
	'FORUM_DESC'						=> 'Descrição', 
	'FORUM_DESC_EXPLAIN'				=> 'Qualquer texto descrito aqui será exibido junto a esta seção. Cdigos HTML so aceitos.',
	'FORUM_EDIT_EXPLAIN'				=> 'Esta ferramenta lhe permitirá customizar a sua seção. Por Favor, note que Moderação e o Controle do Contador de Mensagens são determinados pelas Permissões de Seções para cada usuário ou grupo.', 
	'FORUM_IMAGE'						=> 'Imagem da Seção', 
	'FORUM_IMAGE_EXPLAIN'				=> 'Local da Imagem (relativo à pasta raíz do phpBB).', 
	'FORUM_LINK_EXPLAIN'				=> 'URL Completa (incluindo o protocolo, ex. <samp>http://</samp>) para o local em que o usuário será redirecionado ao clicar, ex: http://www.phpbb.com/.',
	'FORUM_LINK_TRACK'					=> 'Salvar Redirecionamento de Links', 
	'FORUM_LINK_TRACK_EXPLAIN'			=> 'Recorda o número de vezes em que um link de uma seção foi clicado.', 
	'FORUM_NAME'						=> 'Nome da Seção', 
	'FORUM_NAME_EMPTY'					=> 'O Nome deve ser escrito.', 
	'FORUM_PARENT'						=> 'Seção Pai', 
	'FORUM_PASSWORD'					=> 'Senha da Seção', 
	'FORUM_PASSWORD_CONFIRM'			=> 'Confirmar Senha da Seção', 
	'FORUM_PASSWORD_CONFIRM_EXPLAIN'	=> 'Apenas precisa ser inserida se uma senha for atribuida à seção.', 
	'FORUM_PASSWORD_EXPLAIN'			=> 'Define uma Senha para esta seção. Utilize o sistema de permissões de preferência.', 
	'FORUM_PASSWORD_MISMATCH'			=> 'As Senhas escritas não coincidem.', 
	'FORUM_PRUNE_SETTINGS'				=> 'Configuração da Limpeza de Seções', 
	'FORUM_RESYNCED'					=> 'A Seção selecionada foi Re-Sincronizada com sucesso', 
	'FORUM_RULES_EXPLAIN'				=> 'As Regras da Seção são exibidas em qualquer página com a seção selecionada.', 
	'FORUM_RULES_LINK'					=> 'Link para as Regras da Seção', 
	'FORUM_RULES_LINK_EXPLAIN'			=> 'Você pode escrever a URL da página/mensagem as regras de sua seção aqui. Esta configuração irá substituir o texto de regras da seção que você escreveu.', 
	'FORUM_RULES_PREVIEW'				=> 'Prever Regras da Seção', 
	'FORUM_RULES_TOO_LONG'				=> 'As Regras da Seção são muito grandes, elas precisam ser menores que 4000 caracteres.', 
	'FORUM_SETTINGS'					=> 'Configurações da Seção', 
	'FORUM_STATUS'						=> 'Status da Seção', 
	'FORUM_STYLE'						=> 'Estilo da Seção', 
	'FORUM_TOPICS_PAGE'					=> 'Núm. Máx. de Tópicos por Página', 
	'FORUM_TOPICS_PAGE_EXPLAIN'			=> 'Se não zero, este valor irá substituir a configuração padrão de tópicos por página.', 
	'FORUM_TYPE'						=> 'Tipo da Seção', 
	'FORUM_UPDATED'						=> 'A Configuração da Seção foi atualizada com sucesso.', 

	'GENERAL_FORUM_SETTINGS'	=> 'Configuração Geral de Seções', 

	'LINK'					=> 'Link', 
	'LIST_INDEX'			=> 'Lista de Seções na Listagem de SubSeções', 
	'LIST_INDEX_EXPLAIN'	=> 'Exibe um link para esta seção abaixo de suas subseções se pelo menos uma existir.', 
	'LOCKED'				=> 'Trancado', 

	'MOVE_POSTS_NO_POSTABLE_FORUM'	=> 'A seção escolhida para mover as mensagens não pode receber mensagens. Selecione uma seção que possa receber mensagens.',
	'MOVE_POSTS_TO'					=> 'Mover Mensagens para', 
	'MOVE_SUBFORUMS_TO'				=> 'Mover SubSeções para', 

	'NO_DESTINATION_FORUM'			=> 'Você não especificou uma Seção para Mover o conteúdo.', 
	'NO_FORUM_ACTION'				=> 'Sem ações definidas para o conteúdo da Seção.', 
	'NO_PARENT'						=> 'Sem Pais', 
	'NO_PERMISSIONS'				=> 'Não Copiar Permissões', 
	'NO_PERMISSION_FORUM_ADD'		=> 'Você não está autorizado a adicionar seções.', 
	'NO_PERMISSION_FORUM_DELETE'	=> 'Você não está autorizado a excluir seções.', 

	'PARENT_IS_LINK_FORUM'		=> 'A seção pai especificadoa é um seção link. Seções link não podem ter sub-seções.',
	'PARENT_NOT_EXIST'			=> 'O Pai selecionado não existe.', 
	'PRUNE_ANNOUNCEMENTS'		=> 'Limpar Anúncios', 
	'PRUNE_STICKY'				=> 'Limpar Tópicos Fixos', 
	'PRUNE_OLD_POLLS'			=> 'Limpar Enquetes Antigas', 
	'PRUNE_OLD_POLLS_EXPLAIN'	=> 'Exclui tópicos com enquetes que não recebem votos em um determinado período.', 
	 
	'REDIRECT_ACL'	=> 'Agora, você pode %ssDar Permissões%s para esta seção.', 

	'SYNC_IN_PROGRESS'			=> 'Sincronizando Seção', 
	'SYNC_IN_PROGRESS_EXPLAIN'	=> 'Atualmente re-sincronizando a ordem dos tópicos %1$d/%2$d.', 

	'TYPE_CAT'			=> 'Categoria', 
	'TYPE_FORUM'		=> 'Seção', 
	'TYPE_LINK'			=> 'Link', 

	'UNLOCKED'			=> 'Destrancado', 
)); 

?>
