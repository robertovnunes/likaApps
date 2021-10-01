<?php
/** 
*
* posting [Portuguese]
*
* @package language
* @version $Id: posting.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ADD_ATTACHMENT'			=> 'Enviar Anexo',
	'ADD_ATTACHMENT_EXPLAIN'	=> 'Se você deseja anexar um o mais arquivos preencha com os detalhes abaixo.',
	'ADD_FILE'					=> 'Adicionar o Arquivo',
	'ADD_POLL'					=> 'Criação de Votação',
	'ADD_POLL_EXPLAIN'			=> 'Se você não deseja adicionar uma votação a seu tópico deixe os campos em branco.',
	'ALREADY_DELETED'			=> 'Esta mensagem já foi excluída.',
	'ATTACH_QUOTA_REACHED'		=> 'A cota máxima de anexos para este painel foi alcançada.',
	'ATTACH_SIG'				=> 'Anexar assinatura (assinaturas podem ser alteradas pelo Painel de Controle do Usuário)',

	'BBCODE_A_HELP'				=> 'Anexo enviado: [attachment=]nome do arquivo.ext[/attachment]',
	'BBCODE_B_HELP'				=> 'Texto em Negrito: [b]texto[/b]  (alt+b)',
	'BBCODE_C_HELP'				=> 'Exibir código: [code]código[/code]  (alt+c)',
	'BBCODE_E_HELP'				=> 'Lista: Adicionar um elemento àlista',
	'BBCODE_F_HELP'				=> 'Tamanho da fonte: [size=x-small]texto pequeno[/size]',
	'BBCODE_IS_OFF'				=> '%sBBCode%s está <em>ATIVADO</em>',
	'BBCODE_IS_ON'				=> '%sBBCode%s está <em>DESATIVADO</em>',
	'BBCODE_I_HELP'				=> 'Texto em Itálico: [i]texto[/i]  (alt+i)',
	'BBCODE_L_HELP'				=> 'Lista: [list]texto[/list]  (alt+l)',
	'BBCODE_LISTITEM_HELP'			=> 'Listar Itens: [*]texto[/*]',
	'BBCODE_O_HELP'				=> 'Lista Ordenada: [list=]texto[/list]  (alt+o)',
	'BBCODE_P_HELP'				=> 'Inserir Omagem: [img]http://url_da_imagem[/img]  (alt+p)',
	'BBCODE_Q_HELP'				=> 'Citar Texto: [quote]texto[/quote]  (alt+q)',
	'BBCODE_S_HELP'				=> 'Cor da Fonte: [color=red]texto[/color]  Você também pode usar color=#FF0000',
	'BBCODE_U_HELP'				=> 'Texto Sublinhado: [u]texto[/u]  (alt+u)',
	'BBCODE_W_HELP'				=> 'Inserir URL: [url]http://url[/url] ou [url=http://url]texto da URL[/url]  (alt+w)',
	'BBCODE_D_HELP'				=> 'Flash: [flash=width,height]http://url[/flash]  (alt+d)',
	'BUMP_ERROR'				=> 'Você não pode ressuscitar este tópico com uma última mensagem tão recente.',

	'CANNOT_DELETE_REPLIED'		=> 'Você não pode excluir mensagens que não foram respondidas.',
	'CANNOT_EDIT_POST_LOCKED'	=> 'Esta mensagem foi trancada. Você não pode mais editar essa mensagem.',
	'CANNOT_EDIT_TIME'			=> 'Você não pode mais editar ou excluir esta mensagem.',
	'CANNOT_POST_ANNOUNCE'		=> 'Você não pode criar anúncios.',
	'CANNOT_POST_STICKY'		=> 'Você não pode criar tópicos fixos.',
	'CHANGE_TOPIC_TO'			=> 'Alterar típo do tópico para',
	'CLOSE_TAGS'				=> 'Fechar tags',
	'CURRENT_TOPIC'				=> 'Tópico atual',

	'DELETE_FILE'				=> 'Excluir arquivo',
	'DELETE_MESSAGE'			=> 'Excluir mensagem',
	'DELETE_MESSAGE_CONFIRM'	=> 'Você tem certeza que deseja excluir esta mensagem?',
	'DELETE_OWN_POSTS'			=> 'Você só pode excluir as suas mensagens.',
	'DELETE_POST_CONFIRM'		=> 'Você tem certeza que deseja excluir esta mensagem?',
	'DELETE_POST_WARN'			=> 'Uma vez excluída, a mensagem não poderá mais ser recuperada',
	'DISABLE_BBCODE'			=> 'Desativar BBCode',
	'DISABLE_MAGIC_URL'			=> 'Não processar automáticamente as URLs',
	'DISABLE_SMILIES'			=> 'Desativar smilies',
	'DISALLOWED_EXTENSION'		=> 'A extensão %s não é permitida.',
	'DRAFT_LOADED'				=> 'Rascunho carregado, você pode terminar sua mensagem agora. Seu rascunho será apagado ao enviar esta mensagem.',
	'DRAFT_LOADED_PM'			=> 'Rascunho carregado, você pode terminar a sua mensagem privada agora. Seu rascunho será apagado ao enviar esta mensagem privada.',
	'DRAFT_SAVED'				=> 'Rascunho salvo com sucesso.',
	'DRAFT_TITLE'				=> 'Título do rascunho',

	'EDIT_REASON'				=> 'Motivos para editar esta mensagem',
	'EMPTY_FILEUPLOAD'			=> 'O arquivo enviado está vazio.',
	'EMPTY_MESSAGE'				=> 'Você precisa informar uma mensagem.',
	'EMPTY_REMOTE_DATA'			=> 'O arquivo não pode ser enviado, tente enviá-lo manualmente.',

	'FLASH_IS_OFF'				=> '[flash] está <em>DESLIGADO</em>',
	'FLASH_IS_ON'				=> '[flash] está <em>LIGADO</em>',
	'FLOOD_ERROR'				=> 'Você não pode enviar uma nova mensagem tão rapidamente.',
	'FONT_COLOR'				=> 'Cor da Fonte',
	'FONT_COLOR_HIDE'			=> 'Ocultar cor da fonte',
	'FONT_HUGE'					=> 'Enorme',
	'FONT_LARGE'				=> 'Grande',
	'FONT_NORMAL'				=> 'Normal',
	'FONT_SIZE'					=> 'Tamanho da Fonte',
	'FONT_SMALL'				=> 'Pequena',
	'FONT_TINY'					=> 'Minúscula',

	'GENERAL_UPLOAD_ERROR'		=> 'Não foi possível enviar o Anexo para %s.',

	'IMAGES_ARE_OFF'			=> '[img] está <em>DESLIGADO</em>',
	'IMAGES_ARE_ON'				=> '[img] está <em>LIGADO</em>',
	'INVALID_FILENAME'			=> '%s é um nome de Arquivo Inválido.',

	'LOAD'						=> 'Carregar',
	'LOAD_DRAFT'				=> 'Carregar rascunho',
	'LOAD_DRAFT_EXPLAIN'		=> 'Aqui você pode selecionar o rascunho que deseja continuar escrevendo. Sua mensagem atual será cancelada, todo o conteúdo da mensagem atual será perdido. Você pode ver, editar e excluir rascunhos no Painel de Controle do Usuário.',
	'LOGIN_EXPLAIN_BUMP'		=> 'Você precisa fazer login para ressuscitar tópicos neste fórum.',
	'LOGIN_EXPLAIN_DELETE'		=> 'Você precisa fazer login para excluir mensagens neste fórum.',
	'LOGIN_EXPLAIN_POST'		=> 'Você precisa fazer login para enviar mensagens neste fórum.',
	'LOGIN_EXPLAIN_QUOTE'		=> 'Você precisa fazer login para citar mensagens neste fórum.',
	'LOGIN_EXPLAIN_REPLY'		=> 'Você precisa fazer login para responder tópicos neste fórum.',

	'MAX_FONT_SIZE_EXCEEDED'	=> 'Você só pode usar fonte até o tamanho %1$d.',
	'MAX_FLASH_HEIGHT_EXCEEDED'	=> 'Você só pode usar arquivos flash com o tamanho máximo de %1$d pixels de altura.',
	'MAX_FLASH_WIDTH_EXCEEDED'	=> 'Você só pode usar arquivos flash com o tamanho máximo de %1$d pixels de largura.',
	'MAX_IMG_HEIGHT_EXCEEDED'	=> 'Você só pode usar imagens com o tamanho máximo de %1$d pixels de altura.',
	'MAX_IMG_WIDTH_EXCEEDED'	=> 'Você só pode usar imagens com o tamanho máximo de %1$d pixels de largura.',

	'MESSAGE_BODY_EXPLAIN'		=> 'Insira sua mensagem aqui, ela não pode ultrapassar o tamanho de <strong>%d</strong> caracteres.',
	'MESSAGE_DELETED'			=> 'A Mensagem foi excluída com sucesso.',
	'MORE_SMILIES'				=> 'Ver mais smilies',

	'NOTIFY_REPLY'				=> 'Me enviar um email quando houver uma resposta enviada',
	'NOT_UPLOADED'				=> 'Não foi possível enviar o arquivo.',
	'NO_DELETE_POLL_OPTIONS'	=> 'Você não pode excluir opções de votação existentes.',
	'NO_PM_ICON'				=> 'MP sem ícone',
	'NO_POLL_TITLE'				=> 'O Ttulo da Enquete deve ser escrito.',
	'NO_POST'					=> 'Esta mensagem não existe.',
	'NO_POST_MODE'				=> 'Nenhum modo de mensagem foi informado.',

	'PARTIAL_UPLOAD'			=> 'O Arquivo foi enviado parcialmente.',
	'PHP_SIZE_NA'				=> 'O Tamanho do Arquivo é muito grande.<br />Não foi possível determinar o tamanho máximo definido no php.ini do PHP.',
	'PHP_SIZE_OVERRUN'			=> 'O Tamanho do Arquivo é muito grande. O Tamanho máximo é de %d MB.<br />Este tamanho é configurado no php.ini e não pode ser substitudo.',
	'PLACE_INLINE'				=> 'Insira na linha',
	'POLL_DELETE'				=> 'Excluir votação',
	'POLL_FOR'					=> 'Votação expira em',
	'POLL_FOR_EXPLAIN'			=> 'Insira 0 ou deixe em branco o campo para uma enquete sem tempo limite.',
	'POLL_MAX_OPTIONS'			=> 'Opções por usuário',
	'POLL_MAX_OPTIONS_EXPLAIN'	=> 'Este é o número de opções que cada usuário pode selecionar quando votar.',
	'POLL_OPTIONS'				=> 'Opções da votação',
	'POLL_OPTIONS_EXPLAIN'		=> 'Insira uma opção em cada linha. Você não pode inserir mais que <strong>%d</strong> opções.',
	'POLL_QUESTION'				=> 'Pergunta da votação',
	'POLL_TITLE_TOO_LONG'		=> 'O título da votação deve conter no máximo 100 caracteres.',
	'POLL_TITLE_COMP_TOO_LONG'	=> 'O tamanho do título da sua votação é muito longo, considerar remoção de BBCodes ou Smilies.',
	'POLL_VOTE_CHANGE'			=> 'Permitir mudança de voto',
	'POLL_VOTE_CHANGE_EXPLAIN'	=> 'Se habilitado, os usuário poderão alterar o seu voto.',
	'POSTED_ATTACHMENTS'		=> 'Anexos',
	'POST_CONFIRMATION'			=> 'Confirmação da mensagem',
	'POST_CONFIRM_EXPLAIN'		=> 'Para evitar mensagens automáticas, o administrador deste painel exige que você informe o código de confirmação. O código é mostrado na imagem abaixo. Se você não consegue ver a imagem, por favor contate o %sAdministrador%s.',
	'POST_DELETED'				=> 'A Mensagem foi excluda com sucesso.',
	'POST_EDITED'				=> 'A Mensagem foi editata com sucesso.',
	'POST_EDITED_MOD'			=> 'A Mensagem foi editada mas necessita ser aprovada por um Moderador antes de se tornar publicamente visvel. Voc ser avisado quando a sua mensagem for aprovada.',
	'POST_GLOBAL'				=> 'Global',
	'POST_ICON'					=> 'Ícone da Mensagem',
	'POST_NORMAL'				=> 'Normal',
	'POST_REVIEW'				=> 'Rever mensagem',
	'POST_REVIEW_EXPLAIN'		=> 'Pelo menos uma nova mensagem foi feita neste tópico. Você deseja rever sua mensagem levando isso em conta.',
	'POST_STORED'				=> 'Esta mensagem foi enviada com sucesso.',
	'POST_STORED_MOD'			=> 'Esta mensagem foi enviada, mas necessita ser aprovada.',
	'POST_TOPIC_AS'				=> 'Criar tópico em',
	'PROGRESS_BAR'				=> 'Barra de Progresso',

	'QUOTE_DEPTH_EXCEEDED'		=> 'Você só pode inserir %1$d citações dentro de outras.',

	'SAVE'						=> 'Salvar',
	'SAVE_DATE'					=> 'Salvar em',
	'SAVE_DRAFT'				=> 'Salvar rascunho',
	'SAVE_DRAFT_CONFIRM'		=> 'Rascunhos salvos somente incluirão o assunto e a mensagem, qualquer outro elemento será removido. Você tem certeza que deseja salvar o rascunho agora?',
	'SMILIES'					=> 'Smilies',
	'SMILIES_ARE_OFF'			=> 'Smilies está <em>DESLIGADO</em>',
	'SMILIES_ARE_ON'			=> 'Smilies está <em>LIGADO</em>',
	'STICKY_ANNOUNCE_TIME_LIMIT'=> 'Tempo limite do Fixo/Anúncio',
	'STICK_TOPIC_FOR'			=> 'Fixar Tópico por',
	'STICK_TOPIC_FOR_EXPLAIN'	=> 'Insira 0 ou deixe em branco para um tpico anncio/fixo sem fim.',
	'STYLES_TIP'				=> 'Dica: Estilos podem ser aplicados a textos selecionados.',

	'TOO_FEW_CHARS'				=> 'Sua mensagem contém poucos caracteres.',
	'TOO_FEW_POLL_OPTIONS'		=> 'Você precisa inserir pelo menos duas opções àvotação.',
	'TOO_MANY_ATTACHMENTS'		=> 'Você não pode adicionar outro anexo, o limite é de %d anexos.',
	'TOO_MANY_CHARS'			=> 'Sua mensagem contém muitos caracteres.',
	'TOO_MANY_POLL_OPTIONS'		=> 'Você tentou inserir muitas opções  votação.',
	'TOO_MANY_SMILIES'			=> 'Sua mensagem contém muitos smilies. O número máximo de smilies permitidos é %d.',
	'TOO_MANY_URLS'				=> 'Sua mensagem contém muitas URLs. O número máximo de URLs permitidas é %d.',
	'TOO_MANY_USER_OPTIONS'		=> 'Você não pode especificar mais opções por usuário do que na votação.',
	'TOPIC_BUMPED'				=> 'O Tópico foi Ressuscitado com sucesso.',

	'UNAUTHORISED_BBCODE'		=> 'Você não pode usar certos BBCodes: %s.',
	'UNGLOBALISE_EXPLAIN'		=> 'Para alterar um anúncio para um tópico normal, você precisa informar um fórum aonde ele será exibido.',
	'UPDATE_COMMENT'			=> 'Atualizar comentário',
	'URL_INVALID'				=> 'A URL informada é inválida.',
	'URL_NOT_FOUND'				=> 'O arquivo informado não foi encontrado.',
	'URL_IS_OFF'				=> '[url] está <em>DELIGADO</em>',
	'URL_IS_ON'					=> '[url] está <em>LIGADO</em>',
	'USER_CANNOT_BUMP'			=> 'Você não pode ressuscitar tópicos neste fórum.',
	'USER_CANNOT_DELETE'		=> 'Você não pode excluir mensagens neste fórum.',
	'USER_CANNOT_EDIT'			=> 'Você não pode editar mensagens neste fórum.',
	'USER_CANNOT_REPLY'			=> 'Você não pode responder neste fórum.',
	'USER_CANNOT_FORUM_POST'	=> 'Você não pode utilizar estas operações porque o típo de fórum não as suporta.',

	'VIEW_MESSAGE'				=> '%sVer sua mensagem enviada%s',

	'WRONG_FILESIZE'			=> 'O Arquivo é muito grande. O Tamanho Máximo permitido é %1d %2s.',
	'WRONG_SIZE'				=> 'A imagem deve ter pelo menos %1$d pixels de largura, %2$d pixels de altura e no máximo %3$d pixels de largura e %4$d pixels de altura. A imagem enviada tem %5$d pixels de largura e %6$d pixels de altura.',
));

?>
