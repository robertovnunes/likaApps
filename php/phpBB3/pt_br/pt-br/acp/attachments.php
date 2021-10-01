<?php 
/** 
* 
* acp_attachments [Portuguese] 
* 
* @package language 
* @version $Id: attachments.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
* @copyright (c) 2007 Suporte phpBB 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
* @Traduzido por: 
* @Suporte phpBB - 
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
	'ACP_ATTACHMENT_SETTINGS_EXPLAIN'	=> 'Aqui você pode configurar as Opções Principais para Anexos e as Categorias Especiais associadas.', 
	'ACP_EXTENSION_GROUPS_EXPLAIN'		=> 'Aqui você pode adicionar, excluir, modificar e desabilitar seus Grupos de Extensão, atribuir uma Categoria especial a eles, mudar o mecanismo de download e também pode definir um Ícone de Upload que será mostrado na frente de um anexo pertencente ao Grupo.', 
	'ACP_MANAGE_EXTENSIONS_EXPLAIN'		=> 'Aqui você pode gerenciar as extensões permitidas. Para ativar suas Extensões, por favor consulte o painel gerenciador de grupos de extensão. Nós enfaticamente recomendamos não permitir extensões de scripts (tipo: php, php3, php4, phtml, pl, cgi, py, rb, asp, aspx, entre outros…).', 
	'ACP_ORPHAN_ATTACHMENTS_EXPLAIN'	=> 'Aqui você poderá ver arquivos órfãos. Isto acontece normalmente se um usuário anexar um arquivo e não enviar a sua mensagem. Você pode excluir os arquivos ou anexá-los em outras mensagens existentes. Anexar em mensagens exige um ID de mensagem válido, você deve determinar este ID você mesmo. Isto irá adicionar o anexo à mensagem informada.', 
	'ACP_ORPHAN_ATTACHMENTS_EXPLAIN'	=> 'Here you are able to see orphaned files. This happens mostly if users are attaching files but not submitting the post. You are able to delete the files or attach them to existing posts. Attaching to posts requires a valid post ID, you have to determine this ID by yourself. This will assign the already uploaded attachment to the post you entered.',	 
	'ADD_EXTENSION'						=> 'Adicionar extensão', 
	'ADD_EXTENSION_GROUP'				=> 'Adicionar Grupo de Extensões', 
	'ADMIN_UPLOAD_ERROR'				=> 'Erros enquanto tentava anexar o arquivo: "%s".', 
	'ALLOWED_FORUMS'					=> 'Fóruns Permitidos', 
	'ALLOWED_FORUMS_EXPLAIN'			=> 'Apto a postar as extensões atribuídas aos fóruns selecionados (ou a todos se selecionado).', 
	'ALLOWED_IN_PM_POST'				=> 'Permitido', 
	'ALLOW_ATTACHMENTS'					=> 'Permitir Anexos', 
	'ALLOW_ALL_FORUMS'					=> 'Permitir Todos os Fóruns', 
	'ALLOW_IN_PM'						=> 'Permitir em Mensagens Privadas', 
	'ALLOW_PM_ATTACHMENTS'				=> 'Permitir Anexos em Mensagens Privadas', 
	'ALLOW_SELECTED_FORUMS'				=> 'Apenas os Fóruns selecionados abaixo', 
	'ASSIGNED_EXTENSIONS'				=> 'Extensões Atribuídas', 
	'ASSIGNED_GROUP'					=> 'Grupo Atribuído', 
	'ATTACH_EXTENSIONS_URL'				=> 'Extensões', 
	'ATTACH_EXT_GROUPS_URL'				=> 'Grupos de Extensões', 
	'ATTACH_ID'							=> 'ID', 
	'ATTACH_MAX_FILESIZE'				=> 'Tamanho Máximo de Arquivos', 
	'ATTACH_MAX_FILESIZE_EXPLAIN'		=> 'Tamanho máximo de cada arquivo, 0 = sem limite.', 
	'ATTACH_MAX_PM_FILESIZE'			=> 'Tamanho máximo de Mensagens', 
	'ATTACH_MAX_PM_FILESIZE_EXPLAIN'	=> 'Espaço em disco máximo disponível, por usuário, para anexos em mensagens privadas, 0 = sem limite.', 
	'ATTACH_ORPHAN_URL'					=> 'Anexos Órfãos', 
	'ATTACH_POST_ID'					=> 'ID da Postagem', 
	'ATTACH_QUOTA'						=> 'Cota total de anexos', 
	'ATTACH_QUOTA_EXPLAIN'				=> 'Espaço em disco máximo disponível para acúmulo de anexos, 0 = sem limite.', 
	'ATTACH_TO_POST'					=> 'Anexar arquivo à postagem', 

	'CAT_FLASH_FILES'			=> 'Arquivos Flash', 
	'CAT_IMAGES'				=> 'Imagens', 
	'CAT_QUICKTIME_FILES'		=> 'Arquivo de midia Quicktime', 
	'CAT_RM_FILES'				=> 'Real Media Streams', 
	'CAT_WM_FILES'				=> 'Win Media Streams', 
	'CREATE_GROUP'				=> 'Criar novo grupo', 
	'CREATE_THUMBNAIL'			=> 'Criar imagem reduzida', 
	'CREATE_THUMBNAIL_EXPLAIN'	=> 'Criar uma imagem reduzida em todas as situções possíveis.', 

	'DEFINE_ALLOWED_IPS'			=> 'Definir IPs/Servidores permitidos', 
	'DEFINE_DISALLOWED_IPS'			=> 'Definir IPs/Servidores proibidos', 
	'DOWNLOAD_ADD_IPS_EXPLAIN'		=> 'Para definir vários IPs ou Servidores diferentes, digite cada um numa nova linha. Para definir uma faixa de endereços de IP separe o início e o fim com um ífem (-), para definir um coringa use “*”.', 
	'DOWNLOAD_REMOVE_IPS_EXPLAIN'	=> 'Você pode remover (ou não-excluir) múltiplos endereços de IP de uma única vez usando a combinação apropriada de mouse e teclado para seu computador e navegador. IPs excluídos têm um fundo em azul.', 
	'DISPLAY_INLINED'				=> 'Mostrar imagens', 
	'DISPLAY_INLINED_EXPLAIN'		=> 'Se escolher NÃO, imagens anexadas serão mostradas como link.', 
	'DISPLAY_ORDER'					=> 'Ordem de Visualização dos Anexos', 
	'DISPLAY_ORDER_EXPLAIN'			=> 'Mostra anexos ordenados pela hora.', 
	 
	'EDIT_EXTENSION_GROUP'			=> 'Editar Grupo de Extensão', 
	'EXCLUDE_ENTERED_IP'			=> 'Habilite para excluir o IP/Servidor digitado.', 
	'EXCLUDE_FROM_ALLOWED_IP'		=> 'Excluir IP dos IPs/Servidores permitidos', 
	'EXCLUDE_FROM_DISALLOWED_IP'	=> 'Excluir IP dos IPs/Servidores proibídos', 
	'EXTENSIONS_UPDATED'			=> 'Extensões atualizadas com sucesso.', 
	'EXTENSION_EXIST'				=> 'A Extensão %s já existe.', 
	'EXTENSION_GROUP'				=> 'Grupo de Extensão', 
	'EXTENSION_GROUPS'				=> 'Grupos de Extensões', 
	'EXTENSION_GROUP_DELETED'		=> 'Grupo de Extensão excluído com sucesso.', 
	'EXTENSION_GROUP_EXIST'			=> 'O Grupo de Extensão %s já existe.', 

	'GO_TO_EXTENSIONS'		=> 'Vá para a Tela de Gerência de Extensões', 
	'GROUP_NAME'			=> 'Nome do Grupo', 

	'IMAGE_LINK_SIZE'			=> 'Dimensões p/ Link de Imagem', 
	'IMAGE_LINK_SIZE_EXPLAIN'	=> 'Mostra anexo de imagem como link se a imagem for maior que o informado, digite 0px por 0px para desabilitar.', 
	'IMAGICK_PATH'				=> 'Local do Imagemagick', 
	'IMAGICK_PATH_EXPLAIN'		=> 'Caminho completo para o programa Imagemagick, p.exemplo: /usr/bin/.', 

	'MAX_ATTACHMENTS'				=> 'Máximo de anexos por postagem', 
	'MAX_ATTACHMENTS_PM'			=> 'Máximo de anexos por mensagem', 
	'MAX_EXTGROUP_FILESIZE'			=> 'Tamanho Máximo de Arquivos', 
	'MAX_IMAGE_SIZE'				=> 'Dimensão Máxima de Imagens', 
	'MAX_IMAGE_SIZE_EXPLAIN'		=> 'Tamanho Máximo de imagem anexada, 0px por 0px impede anexo de imagens.', 
	'MAX_THUMB_WIDTH'				=> 'Largura máxima das imagens em miniaturas em pixels', 
	'MAX_THUMB_WIDTH_EXPLAIN'		=> 'A largura das miniatura das imagens geradas não ultrapassara a informada aqui.', 
	'MIN_THUMB_FILESIZE'			=> 'Tamanho Mínimo de imagem reduzida', 
	'MIN_THUMB_FILESIZE_EXPLAIN'	=> 'Não criar imagem reduzida para imagens menores que o informado.', 
	'MODE_INLINE'					=> 'Na linha', 
	'MODE_PHYSICAL'					=> 'Físico', 

	'NOT_ALLOWED_IN_PM'			=> 'Somente permitido nas mensagens', 
	'NOT_ALLOWED_IN_PM_POST'	=> 'Negado', 
	'NOT_ASSIGNED'				=> 'Não atribuido', 
	'NO_EXT_GROUP'				=> 'Nenhum', 
	'NO_EXT_GROUP_NAME'			=> 'Nome do Grupo não informado', 
	'NO_EXT_GROUP_SPECIFIED'	=> 'Grupo de Extensão não especificado.', 
	'NO_FILE_CAT'				=> 'Nenhum', 
	'NO_IMAGE'					=> 'Sem imagem', 
	'NO_THUMBNAIL_SUPPORT'		=> 'O suporte ao Thumbnail (imagem reduzida) foi desabilitado. Para abilitar esta funcionalidade é nexessario a extensão GD ou imagemagick instalado. Nenhum dos dois foi encontrado.',	 
	'NO_UPLOAD_DIR'				=> 'O diretório de envio (upload) que você especificou não existe.', 
	'NO_WRITE_UPLOAD'			=> 'O diretório que você especificou não permite gravação. Por favor, altere as permissões para permitir a escrita nele.', 

	'ONLY_ALLOWED_IN_PM'	=> 'Somente permitir em Mensagens Privadas', 
	'ORDER_ALLOW_DENY'		=> 'Permitir', 
	'ORDER_DENY_ALLOW'		=> 'Negar', 

	'REMOVE_ALLOWED_IPS'		=> 'Remover ou Não-exclui IPs/Servidores permitidos', 
	'REMOVE_DISALLOWED_IPS'		=> 'Remover ou Não-exclui IPs/Servidores proibidos', 

	'SEARCH_IMAGICK'				=> 'Localizar Imagemagick', 
	'SECURE_ALLOW_DENY'				=> 'Permitur/Nega Lista', 
	'SECURE_ALLOW_DENY_EXPLAIN'		=> 'Permite ou Nega a lista de endereços, essa configuração aplica-se apenas aos arquivos para download.', 
	'SECURE_DOWNLOADS'				=> 'Habilita Downloads Seguro', 
	'SECURE_DOWNLOADS_EXPLAIN'		=> 'Com esta opção habilitada, os downloads são permitidos apenas para os IPs/Servidores que você definiu.', 
	'SECURE_DOWNLOAD_NOTICE'		=> 'Downloads Seguro está desabilitado. As opções abaixo só serão aplicadas depois de habilitá-lo.', 
	'SECURE_DOWNLOAD_UPDATE_SUCCESS'=> 'A lista de IPs foi atualizada com sucesso.', 
	'SECURE_EMPTY_REFERRER'			=> 'Permitir origem em branco', 
	'SECURE_EMPTY_REFERRER_EXPLAIN'	=> 'Downloads Seguros são baseados na origem. Você quer permitir downloads para aqueles que omitirem a origem?', 
	'SETTINGS_CAT_IMAGES'			=> 'Configuração de Categorias de Imagens', 
	'SPECIAL_CATEGORY'				=> 'Categoria Especial', 
	'SPECIAL_CATEGORY_EXPLAIN'		=> 'Categorias Especiais se diferenciam na forma como são apresentadas dentro da postagem.', 
	'SUCCESSFULLY_UPLOADED'			=> 'Enviado com sucesso.', 
	'SUCCESS_EXTENSION_GROUP_ADD'	=> 'O Grupo de Extensão foi adicionado com sucesso.', 
	'SUCCESS_EXTENSION_GROUP_EDIT'	=> 'O Grupo de Extensão foi atualizado com sucesso.', 

	'UPLOADING_FILES'				=> 'Enviando Arquivos', 
	'UPLOADING_FILE_TO'				=> 'Enviando Arquivo "%1$s" à Postagem Nº %2$d...', 
	'UPLOAD_DENIED_FORUM'			=> 'Você não tem permissão para enviar arquivos para o fórum "%s".', 
	'UPLOAD_DIR'					=> 'Diretório de Envios (Uploads)', 
	'UPLOAD_DIR_EXPLAIN'			=> 'Pasta de armazenamento de anexos. Por Favor, note que se voc?lterar o diret?? enquanto envia um arquivo, voc?er?e copiar manualmente os arquivos para o novo local.', 
	'UPLOAD_ICON'					=> 'Ícone de Envio', 
	'UPLOAD_NOT_DIR'				=> 'O local para envio de arquivos que você especificou não parece ser um diretório.', 
)); 

?>