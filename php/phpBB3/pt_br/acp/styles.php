<?php 
/** 
* 
* acp_styles [Portuguese] 
* 
* @package language 
* @version $Id: styles.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ACP_IMAGESETS_EXPLAIN'	=> 'Set de Imagens são todos os botões, fórum, folders, etc. e outros imagens não especificamente usado pelo estilo do fórum. Aqui você pode editar, exportar or deletar um Set de Imagens existente e importar or ativar novos Sets.', 
	'ACP_STYLES_EXPLAIN'	=> 'Aqui você pode gerenciar os estilos disponíveis no seu fórum. Um estilo consiste fora de um template, tema e Set de Imagem. Você pode alterar estilos existentes, deletar, desativar, reativar, criar ou importar novos. Você pode também ver como ficará um estilo usando a função de prever. O estilo padrão atual está marcado com um asterisco (*). Também está listado o total de usuário usando o estilo, note que a substituição de estilo dos usuários não é refletida aqui.', 
	'ACP_TEMPLATES_EXPLAIN'	=> 'Um set template compreende todo código usado para gerar o layout do seu fórum. Aqui você pode editar um set template, deletar, exportar, importar e prever sets. Você também pode modificar o código de template usado para gerar BBCode.', 
	'ACP_THEMES_EXPLAIN'	=> 'Aqui você pode criar, instalar, editar, excluir e exportar temas. Um tema é a combinação de cores e imagens que são aplicadas em suas templates para definir o visual básico de seu fórum. A escala de opções depende da configuração do seu servidor e instalação do phpBB, veja o manual para mais detalhes. Por Favor, note que quando estiver criando novos temas o uso de um tema existente como base é opcional.',
	'ADD_IMAGESET'			=> 'Criar Set de Imagens', 
	'ADD_IMAGESET_EXPLAIN'	=> 'Aqui você pode criar um novo Set de Imagens. Dependendo da configuração do seu servidor e permissões de arquivo. Dependendo da configuração do seu servidor e permissões dos arquivos você terá opções adicionais aqui. Por exemplo you pode basear este set de imagem em um existente. Você pode também enviar ou importar (da pasta de armazenamento) um arquivo de set de imagens. Se você enviar ou importar um arquivo Se você enviar ou importar um arquivo o nome do tema pode ser opcionalmente mantido do nome do arquivo (para isto deixe o nome do set de imagem em branco).', 
	'ADD_STYLE'				=> 'Criar Estilo', 
	'ADD_STYLE_EXPLAIN'		=> 'Aqui você pode criar um novo estilo. Dependendo da configuração do seu servidor e permissões dos arquivos você terá opções adicionais aqui. Por exemplo you pode basear este estilo em um existente. Você também pode enviar, importar (do sistema de arquivos) um arquivo de estilo. Se você enviar ou importar um arquivo de estilo o nome do estilo será determinado automaticamente.', 
	'ADD_TEMPLATE'			=> 'Criar Template', 
	'ADD_TEMPLATE_EXPLAIN'	=> 'Aqui você pode adicionar um novo template. Dependendo da configuração do seu servidor e permissões dos arquivos você terá opções adicionais aqui. Por exemplo you pode basear este set de template em um existente. Você também pode enviar, importar (do sistema de arquivos) um arquivo de template. Se você enviar ou importar um arquivo o nome do tema pode ser opcionalmente mantido do nome do arquivo (para isto deixe o nome do template em branco).', 
	'ADD_THEME'				=> 'Criar tema', 
	'ADD_THEME_EXPLAIN'		=> 'Aqui você pode adicionar um novo tema. Dependendo da configuração do seu servidor e permissões dos arquivos você terá opções adicionais aqui. Por exemplo você pode basear este tema em um outro existente. Você também pode enviar ou importar (da pasta de armazenamento) um arquivo de tema. Se você enviar ou importar um arquivo o nome pode ser opcional Se você enviar ou importar um arquivo o nome do tema pode ser opcionalmente mantido do nome do arquivo (para isto deixe o nome do tema em branco).', 
	'ARCHIVE_FORMAT'		=> 'Tipo do arquivo', 

	'BACKGROUND'			=> 'Fundo', 
	'BACKGROUND_COLOUR'		=> 'Cor de Fundo', 
	'BACKGROUND_IMAGE'		=> 'Imagem de Fundo', 
	'BACKGROUND_REPEAT'		=> 'Repetição do Fundo', 
	'BOLD'					=> 'Negrito', 

	'CACHE'							=> 'Cache', 
	'CACHE_CACHED'					=> 'Em Cache', 
	'CACHE_FILENAME'				=> 'Arquivo de Template', 
	'CACHE_FILESIZE'				=> 'Tamanho do Arquivo', 
	'CACHE_MODIFIED'				=> 'Modificado', 
	'CONFIRM_IMAGESET_REFRESH'		=> 'Você tem certeza que deseja atualizar todas os dados de Set de Imagens? As configurações dos sets de imagens irão substituidos todas as modificações que você fez fora do Editor de Set de Imagens.', 
	'CONFIRM_TEMPLATE_CLEAR_CACHE'	=> 'Você tem certeza que deseja limpar todas as versões em cache dos arquivos de seu template ?', 
	'CONFIRM_TEMPLATE_REFRESH'		=> 'Você tem certeza que deseja atualizar todos os dados de template no banco de dados com o conteúdo dos arquivos no sistema de arquivos? Isto substituirá todas as modificações que você fez fora do editor de template enquanto o template foi armazenado no banco de dados.', 
	'CONFIRM_THEME_REFRESH'			=> 'Você tem certeza que deseja atualizar todos os dados do tema no banco de dados com o conteúdo dos arquivos no sistema de arquivos? Isto substituirá todas as modificações que você fez fora do editor de tema enquanto o tema foi armazenado no banco de dados.', 
	'COPYRIGHT'						=> 'Copyright', 
	'CREATE_IMAGESET'				=> 'Criar novo Set de Imagens', 
	'CREATE_STYLE'					=> 'Criar novo Estilo', 
	'CREATE_TEMPLATE'				=> 'Criar novo Set de Template', 
	'CREATE_THEME'					=> 'Criar novo Tema', 
	'CURRENT_IMAGE'					=> 'Imagem Atual', 

	'DEACTIVATE_DEFAULT'		=> 'Você não pode desativar o estilo padrão.', 
	'DELETE_FROM_FS'			=> 'Deletar do sistema de arquivos', 
	'DELETE_IMAGESET'			=> 'Excluir Set de Imagens', 
	'DELETE_IMAGESET_EXPLAIN'	=> 'Aqui você pode remover o set de imagens selecionado do banco de dados. Adicionalmente, se você tiver permissão você pode selecionar para remover o set do sistema de arquivos. Por favor note que não é possível desfazer isto. Quando o set de imagens é deletado ele vai para o bom. É recomendável que você primeiro exporte seu set para possível futuro uso.', 
	'DELETE_STYLE'				=> 'Excluir Estilo', 
	'DELETE_STYLE_EXPLAIN'		=> 'Aqui você pode remover o estilo selecionado. Você não pode remover todos os elementos de estilo daqui. Eles devem ser deletados individualmente por seus respectivos formulários. Tome cuidado ao excluir estilos, pois os efeitos são permanentes.', 
	'DELETE_TEMPLATE'			=> 'Excluir Template', 
	'DELETE_TEMPLATE_EXPLAIN'	=> 'Aqui você pode remover o template selecionado do banco de dados. Adicionalmente, se você tiver permissão você pode selecionar para remover o set do sistema de arquivos. Por favor, note que não há capacidade de retorno. Quando templates são deletadas elas vão para o bom. É recomendável que você primeiro exporte seu set para possível futuro uso.', 
	'DELETE_THEME'				=> 'Excluir Tema', 
	'DELETE_THEME_EXPLAIN'		=> 'Aqui você pode remover o tema selecionado do banco de dados. Adicionalmente, se você tiver permissão você pode selecionar para remover o set do sistema de arquivos. Por favor, note que não há capacidade de retorno. Quando tema são deletadas elas vão para o bom. É recomendável que você primeiro exporte seu tema para possível futuro uso.', 
	'DETAILS'					=> 'Detalhes', 
	'DIMENSIONS_EXPLAIN'		=> 'Selecionando Sim aqui você irá incluir os parâmetros de largura/altura.', 

	'EDIT_DETAILS_IMAGESET'				=> 'Editar detalhes do Set de Imagens', 
	'EDIT_DETAILS_IMAGESET_EXPLAIN'		=> 'Aquio você pode editar certos detalhes do set de imagens como seu nome.', 
	'EDIT_DETAILS_STYLE'				=> 'Editar estilo', 
	'EDIT_DETAILS_STYLE_EXPLAIN'		=> 'Usando o formulário abaixo você pode modificar um estilo existente. Você pode alterar a combinação da template, tema e set de imagens que definem o estilo próprio. Você também pode criar um estilo padrão.', 
	'EDIT_DETAILS_TEMPLATE'				=> 'Editar detalhes da template', 
	'EDIT_DETAILS_TEMPLATE_EXPLAIN'		=> 'Aqui você pode editar certos detalhes da template, como o seu nome. Você também tem a opção de trocar o armazenamento da folha de estilos do sistema de arquivos para o banco de dados e vice versa. Esta opção depende da configuração do seu PHP e se o seu set de template puder ser escrito no servidor.',
	'EDIT_DETAILS_THEME'				=> 'Edit detalhes do tema', 
	'EDIT_DETAILS_THEME_EXPLAIN'		=> 'Aqui você pode editar certos detalhes do tema, como seu nome. Você também tem a opção de trocar o armazenamento da folha de estilos do sistema de arquivos para o banco de dados e vice versa. Esta opção depende da configuração do seu PHP e se sua folha de estilos puder ser escrita no servidor.',
	'EDIT_IMAGESET'						=> 'Editar Set de Imagens', 
	'EDIT_IMAGESET_EXPLAIN'				=> 'Aqui você pode editar as imagens individuais no qual define o set de imagens. Você também pode especificar dimensões para esta imagem. Dimensões são opcionais, especificá-los pode superar determinadas edições de renderização em alguns navegadores. Não especificando-os você reduz um pouco o tamanho do registro no banco de dados.', 
	'EDIT_TEMPLATE'						=> 'Editar template', 
	'EDIT_TEMPLATE_EXPLAIN'				=> 'Aqui você pode editar seu set template diretamente. Por favor lembre-se que essas edições são permanentes e não podem serem desfeitas depois de enviadas. Se o PHP puder gravar arquivos de templates em seu diretório de estilos algumas alterações aqui serão gravaras diretamente nos arquivos. Se o PHP não puder gravar estes arquivos serão copiados para o banco de dados e todas as alterações serão refletidas somente lá. Por favor tome cuidado quando editar seu set template, lembre-se de fechar todas as variáveis de termos de substituição {XXXX} e indicações condicionais.', 
	'EDIT_TEMPLATE_STORED_DB'			=> 'O arquivo de template não é gravável porém agora o set template foi armazenado no banco de dados contendo o arquivo modificado.', 
	'EDIT_THEME'						=> 'Editar Tema', 
	'EDIT_THEME_EXPLAIN'				=> 'Aqui você pode editar o tema selecionado, trocando cores, imagens, etc.',
	'EDIT_THEME_STORED_DB'				=> 'A folha de estilos não é gravável então agora será armazenado no banco dados contendo sua modificação.', 
	'EXPORT'							=> 'Exportar', 

	'FOREGROUND'			=> 'Primeiro Plano', 
	'FONT_COLOUR'			=> 'Cor da Fonte', 
	'FONT_FACE'				=> 'Fonte', 
	'FONT_FACE_EXPLAIN'		=> 'Você pode especificar múltiplas fontes separadas por vírgulas. Se um usuário não tiver a primeira fonte instalada, a próxima fonte funcionando será escolhida.', 
	'FONT_SIZE'				=> 'Tamanho da Fonte', 

	'GLOBAL_IMAGES'			=> 'Global', 

	'HIDE_CSS'				=> 'Ocultar código CSS', 

	'IMAGE_WIDTH'				=> 'Largura da Imagem', 
	'IMAGE_HEIGHT'				=> 'Altura da Imagem', 
	'IMAGE'						=> 'Imagem', 
	'IMAGE_NAME'				=> 'Nome da Imagem', 
	'IMAGE_PARAMETER'			=> 'Parâmetro', 
	'IMAGE_VALUE'				=> 'Valor', 
	'IMAGESET_ADDED'			=> 'Novo Set de Imagens adicionado ao Sistema de Arquivos.', 
	'IMAGESET_ADDED_DB'			=> 'Novo Set de Imagens adicionado ao Banco de Dados.', 
	'IMAGESET_DELETED'			=> 'Set de Imagens excluído com sucesso.', 
	'IMAGESET_DELETED_FS'		=> 'Set de Imagens removido do Banco de Dados mas alguns arquivos ainda restam no sistema de arquivos.', 
	'IMAGESET_DETAILS_UPDATED'	=> 'Detalhes do Set de Imagens atualizado com sucesso.', 
	'IMAGESET_ERR_ARCHIVE'		=> 'Por favor selecione um método de arquivo.', 
	'IMAGESET_ERR_COPY_LONG'	=> 'O copyright não pode ter mais que 60 caracteres.', 
	'IMAGESET_ERR_NAME_CHARS'	=> 'O nome do Set de Imagens pode conter apenas caracteres alfanuméricos, -, +, _ e espaço.', 
	'IMAGESET_ERR_NAME_EXIST'	=> 'Um Set de Imagens com o mesmo já existe.', 
	'IMAGESET_ERR_NAME_LONG'	=> 'O nome do Set de Imagens não pode conter mais que 30 caracteres.', 
	'IMAGESET_ERR_NOT_IMAGESET'	=> 'O arquivo que você especificou não contém um Set de Imagens válido.', 
	'IMAGESET_ERR_STYLE_NAME'	=> 'Você precisa informar um nome para este Set de Imagens.', 
	'IMAGESET_EXPORT'			=> 'Exportar Set de Imagens', 
	'IMAGESET_EXPORT_EXPLAIN'	=> 'Aqui você pode exportar um set de imagens no formulário de arquivo. Este arquivo deve conter todas os dados necessários para instalar o set de imagens em outro fórum. Você deve selecionar para baixar o arquivo diretamente ou colocá-lo na sua pasta de armazenamento para baixar depois ou via FTP.', 
	'IMAGESET_EXPORTED'			=> 'Set de imagens exportado com sucesso e armazenado em %s.', 
	'IMAGESET_NAME'				=> 'Nome do Set de Imagens', 
	'IMAGESET_REFRESHED'		=> 'Set de Imagens atualizado com sucesso.', 
	'IMAGESET_UPDATED'			=> 'Set de Imagens atualizado com sucesso.', 
	'ITALIC'					=> 'Itálico', 

	'IMG_CAT_BUTTONS'		=> 'Botões Localizados', 
	'IMG_CAT_CUSTOM'		=> 'Imagens Customizadas', 
	'IMG_CAT_FOLDERS'		=> 'Ícones de Tópico', 
	'IMG_CAT_FORUMS'		=> 'Ícones de Fórum', 
	'IMG_CAT_ICONS'			=> 'Ícones Gerais', 
	'IMG_CAT_LOGOS'			=> 'Logos', 
	'IMG_CAT_POLLS'			=> 'Imagens de Enquete', 
	'IMG_CAT_UI'			=> 'Elementos gerais da interface do usuário', 
	'IMG_CAT_USER'			=> 'Imagens Adicionais', 

	'IMG_SITE_LOGO'			=> 'Logo Principal', 
	'IMG_UPLOAD_BAR'		=> 'Barra de progresso de upload', 
	'IMG_POLL_LEFT'			=> 'Fim da enquete à esquerda', 
	'IMG_POLL_CENTER'		=> 'Centro da enquete', 
	'IMG_POLL_RIGHT'		=> 'Fim da enquete à direita', 
	'IMG_ICON_FRIEND'		=> 'Adicionar como amigo', 
	'IMG_ICON_FOE'			=> 'Adicionar como inimigo', 

	'IMG_FORUM_LINK'			=> 'Fórum Link', 
	'IMG_FORUM_READ'			=> 'Fórum', 
	'IMG_FORUM_READ_LOCKED'		=> 'Fórum Trancado', 
	'IMG_FORUM_READ_SUBFORUM'	=> 'Sub-fórum', 
	'IMG_FORUM_UNREAD'			=> 'Fórum com novas mensagens', 
	'IMG_FORUM_UNREAD_LOCKED'	=> 'Fórum trancado com novas mensagens', 
	'IMG_FORUM_UNREAD_SUBFORUM'	=> 'Sub-fórum com novas mensagens', 
	'IMG_SUBFORUM_READ'			=> 'Sub-forum',
	'IMG_SUBFORUM_UNREAD'		=> 'Sub-forum com novas mensagens',

	'IMG_TOPIC_MOVED'			=> 'Tópico movido', 

	'IMG_TOPIC_READ'				=> 'Tópico', 
	'IMG_TOPIC_READ_MINE'			=> 'Tópico enviado para',
	'IMG_TOPIC_READ_HOT'			=> 'Tópico Popular',
	'IMG_TOPIC_READ_HOT_MINE'		=> 'Tópico Popular enviado para',
	'IMG_TOPIC_READ_LOCKED'			=> 'Tópico Trancado',
	'IMG_TOPIC_READ_LOCKED_MINE'	=> 'Tópico Trancado enviado para',

	'IMG_TOPIC_UNREAD'				=> 'Tópico com Novas Mensagens',
	'IMG_TOPIC_UNREAD_MINE'			=> 'Tópico enviado para novo',
	'IMG_TOPIC_UNREAD_HOT'			=> 'Tópico Popular com Novas Mensagens',
	'IMG_TOPIC_UNREAD_HOT_MINE'		=> 'Tópico Popular enviado para novo',
	'IMG_TOPIC_UNREAD_LOCKED'		=> 'Tópico Trancado novo',
	'IMG_TOPIC_UNREAD_LOCKED_MINE'	=> 'Tópico Trancado enviado para novo',

	'IMG_STICKY_READ'				=> 'Tópico fixado', 
	'IMG_STICKY_READ_MINE'			=> 'Tópico fixado postado para', 
	'IMG_STICKY_READ_LOCKED'		=> 'Tópico fixado trancado', 
	'IMG_STICKY_READ_LOCKED_MINE'	=> 'Tópico fixado trancado postado para novo', 
	'IMG_STICKY_UNREAD'				=> 'Tópico fixado com novas mensagens', 
	'IMG_STICKY_UNREAD_MINE'		=> 'Tópico fixado postado para novo', 
	'IMG_STICKY_UNREAD_LOCKED'		=> 'Tópico fixado trancado com novas mensagens', 
	'IMG_STICKY_UNREAD_LOCKED_MINE'	=> 'Tópico fixado trancado postado para novo', 

	'IMG_ANNOUNCE_READ'					=> 'Anúncio', 
	'IMG_ANNOUNCE_READ_MINE'			=> 'Anúncio postado para', 
	'IMG_ANNOUNCE_READ_LOCKED'			=> 'Anúncio trancado', 
	'IMG_ANNOUNCE_READ_LOCKED_MINE'		=> 'Anúncio trancado postado para', 
	'IMG_ANNOUNCE_UNREAD'				=> 'Anúncio com novas mensagens', 
	'IMG_ANNOUNCE_UNREAD_MINE'			=> 'Anúncio postado para novo', 
	'IMG_ANNOUNCE_UNREAD_LOCKED'		=> 'Anúncio trancado novo mensagem', 
	'IMG_ANNOUNCE_UNREAD_LOCKED_MINE'	=> 'Anúncio trancado postado para novo', 

	'IMG_GLOBAL_READ'					=> 'Global', 
	'IMG_GLOBAL_READ_MINE'				=> 'Global postado para', 
	'IMG_GLOBAL_READ_LOCKED'			=> 'Global trancado', 
	'IMG_GLOBAL_READ_LOCKED_MINE'		=> 'Global trancado postado para', 
	'IMG_GLOBAL_UNREAD'					=> 'Global com novas mensagens', 
	'IMG_GLOBAL_UNREAD_MINE'			=> 'Global postado para novo', 
	'IMG_GLOBAL_UNREAD_LOCKED'			=> 'Global trancado com novas mensagens', 
	'IMG_GLOBAL_UNREAD_LOCKED_MINE'		=> 'Global trancado postado para novo', 

	'IMG_PM_READ'		=> 'Mensagem Privadas Lidas', 
	'IMG_PM_UNREAD'		=> 'Mensagem Privada Não Lida', 

	'IMG_ICON_BACK_TOP'		=> 'Topo',

	'IMG_ICON_CONTACT_AIM'		=> 'AIM', 
	'IMG_ICON_CONTACT_EMAIL'	=> 'Enviar Email', 
	'IMG_ICON_CONTACT_ICQ'		=> 'ICQ', 
	'IMG_ICON_CONTACT_JABBER'	=> 'Jabber', 
	'IMG_ICON_CONTACT_MSNM'		=> 'MSNM', 
	'IMG_ICON_CONTACT_PM'		=> 'Enviar Mensagem', 
	'IMG_ICON_CONTACT_YAHOO'	=> 'YIM', 
	'IMG_ICON_CONTACT_WWW'		=> 'Website', 

	'IMG_ICON_POST_DELETE'			=> 'Deletar Mensagem', 
	'IMG_ICON_POST_EDIT'			=> 'Editar Mensagem', 
	'IMG_ICON_POST_INFO'			=> 'Exibir detalhes da mensagem', 
	'IMG_ICON_POST_QUOTE'			=> 'Citar Mensagem', 
	'IMG_ICON_POST_REPORT'			=> 'Reportar Mensagem', 
	'IMG_ICON_POST_TARGET'			=> 'Minipost', 
	'IMG_ICON_POST_TARGET_UNREAD'	=> 'Novo minipost', 


	'IMG_ICON_TOPIC_ATTACH'			=> 'Anexo', 
	'IMG_ICON_TOPIC_LATEST'			=> 'Última Mensagem', 
	'IMG_ICON_TOPIC_NEWEST'			=> 'Última Mensagem não lida', 
	'IMG_ICON_TOPIC_REPORTED'		=> 'Mensagem Reportada', 
	'IMG_ICON_TOPIC_UNAPPROVED'		=> 'Mensagem não Aprovada', 

	'IMG_ICON_USER_ONLINE'		=> 'Usuário online', 
	'IMG_ICON_USER_OFFLINE'		=> 'Usuário offline', 
	'IMG_ICON_USER_PROFILE'		=> 'Mostrar Perfil', 
	'IMG_ICON_USER_SEARCH'		=> 'Procurar Mensagem', 
	'IMG_ICON_USER_WARN'		=> 'Alertar Usuário', 

	'IMG_BUTTON_PM_FORWARD'		=> 'Encaminhar Mensagem Privada', 
	'IMG_BUTTON_PM_NEW'			=> 'Nova Mensagem Privada', 
	'IMG_BUTTON_PM_REPLY'		=> 'Responder', 
	'IMG_BUTTON_TOPIC_LOCKED'	=> 'Tópico Trancado', 
	'IMG_BUTTON_TOPIC_NEW'		=> 'Novo Tópico', 
	'IMG_BUTTON_TOPIC_REPLY'	=> 'Responder Mensagem', 

	'IMG_USER_ICON1'		=> 'Imagem definida pelo usuário 1', 
	'IMG_USER_ICON2'		=> 'Imagem definida pelo usuário 2', 
	'IMG_USER_ICON3'		=> 'Imagem definida pelo usuário 3', 
	'IMG_USER_ICON4'		=> 'Imagem definida pelo usuário 4', 
	'IMG_USER_ICON5'		=> 'Imagem definida pelo usuário 5', 
	'IMG_USER_ICON6'		=> 'Imagem definida pelo usuário 6', 
	'IMG_USER_ICON7'		=> 'Imagem definida pelo usuário 7', 
	'IMG_USER_ICON8'		=> 'Imagem definida pelo usuário 8', 
	'IMG_USER_ICON9'		=> 'Imagem definida pelo usuário 9', 
	'IMG_USER_ICON10'		=> 'Imagem definida pelo usuário 10', 

	'INCLUDE_DIMENSIONS'		=> 'Incluir Dimensões', 
	'INCLUDE_IMAGESET'			=> 'Incluir Set de Imagens', 
	'INCLUDE_TEMPLATE'			=> 'Incluir Template', 
	'INCLUDE_THEME'				=> 'Incluir Tema', 
	'INSTALL_IMAGESET'			=> 'Instalar Set de Imagens', 
	'INSTALL_IMAGESET_EXPLAIN'	=> 'Aqui você pode instalar os set de imagens selecionados. Você pode editar certos detalhes se quiser ou usar a instalação padrão.', 
	'INSTALL_STYLE'				=> 'Instalar Estilo', 
	'INSTALL_STYLE_EXPLAIN'		=> 'Aqui você pode instalar um novo estilo os elementos correspondentes. Se você já tem instalados os elementos relevantes do estilo eles são serão substituidos. Alguns estilos requerem que os elementos do estilo já estejam instalados. Se você tentar instalar um estilo e seus elementos requeridos ainda não estiverem instalados você será avisado.', 
	'INSTALL_TEMPLATE'			=> 'Instalar Template', 
	'INSTALL_TEMPLATE_EXPLAIN'	=> 'Aqui você pode instalar um novo set template. Dependendo da configuração do seu servidor você terá algumas opções aqui.', 
	'INSTALL_THEME'				=> 'Instalar Tema', 
	'INSTALL_THEME_EXPLAIN'		=> 'Aqui você pode instalar seu tema selecionado. Você pode editar certos detalhes caso queira ou use a instalação padrão.', 
	'INSTALLED_IMAGESET'		=> 'Sets de Imagens Instalados', 
	'INSTALLED_STYLE'			=> 'Estilos Instalados', 
	'INSTALLED_TEMPLATE'		=> 'Templates Instalados', 
	'INSTALLED_THEME'			=> 'Temas Instalados', 

	'LINE_SPACING'				=> 'Espaçamento da Linha', 
	'LOCALISED_IMAGES'			=> 'Localizado', 

	'NO_CLASS'					=> 'Não foi possível encontrar classes na folha de estilos.', 
	'NO_IMAGESET'				=> 'Não foi possível encontrar Set de Imagens no sistema de arquivos.', 
	'NO_IMAGE'					=> 'Nenhuma Imagem', 
	'NO_IMAGE_ERROR'			=> 'Não foi possível encontrar a imagem no sistema de arquivos.',
	'NO_STYLE'					=> 'Não foi possível encontrar estilo no sistema de arquivos.', 
	'NO_TEMPLATE'				=> 'Não foi possível encontrar template no sistema de arquivos.', 
	'NO_THEME'					=> 'Não foi possível encontrar tema no sistema de arquivos.', 
	'NO_UNINSTALLED_IMAGESET'	=> 'Nenhum Set de Imagens desinstalado encontrado.',
	'NO_UNINSTALLED_STYLE'		=> 'Nenhum estilo desinstalado encontrado.',
	'NO_UNINSTALLED_TEMPLATE'	=> 'Nenhum template desinstalado encontrado.',
	'NO_UNINSTALLED_THEME'		=> 'Nenhum tema desinstalado encontrado.',
	'NO_UNIT'					=> 'Nenhum', 

	'ONLY_IMAGESET'			=> 'Este é o único Set de Imagens restante, você não pode deletá-lo.', 
	'ONLY_STYLE'			=> 'Este é o único Estilo restante, você não pode deletá-lo.', 
	'ONLY_TEMPLATE'			=> 'Este é o único Template restante, você não pode deletá-lo.', 
	'ONLY_THEME'			=> 'Este é o único Tema restante, você não pode deletá-lo.', 
	'OPTIONAL_BASIS'		=> 'Bases Opcionais', 

	'REFRESH'					=> 'Atualizar', 
	'REPEAT_NO'					=> 'Nenhum', 
	'REPEAT_X'					=> 'Apenas Horizontalmente', 
	'REPEAT_Y'					=> 'Apenas Verticalmente', 
	'REPEAT_ALL'				=> 'Ambas direções', 
	'REPLACE_IMAGESET'			=> 'Substituir Set de Imagens por', 
	'REPLACE_IMAGESET_EXPLAIN'	=> 'Este set de imagens irá substituir todos os estilos que estão usando-o.', 
	'REPLACE_STYLE'				=> 'Substituir Estilo por', 
	'REPLACE_STYLE_EXPLAIN'		=> 'Este estilo iriá substituir os usuários que estão usando-o.', 
	'REPLACE_TEMPLATE'			=> 'Substituir Template por', 
	'REPLACE_TEMPLATE_EXPLAIN'	=> 'Este template set irá substituir todos os estilos que estiverem usando-o.', 
	'REPLACE_THEME'				=> 'Substituir Tema por', 
	'REPLACE_THEME_EXPLAIN'		=> 'Este tema irá substituir todos os estilos que estiverem usando-o.', 
	'REQUIRES_IMAGESET'			=> 'Este estilo requer o Set de Imagens %s para ser instalado.', 
	'REQUIRES_TEMPLATE'			=> 'Este estilo requer o Template %s para ser instalado.', 
	'REQUIRES_THEME'			=> 'Este estilo requer o Tema %s para ser instalado.', 

	'SELECT_IMAGE'				=> 'Selecionar Imagem', 
	'SELECT_TEMPLATE'			=> 'Selecionar arquivo de template', 
	'SELECT_THEME'				=> 'Selecionar arquivo de tema',
	'SELECTED_IMAGE'			=> 'Imagem Selecionada', 
	'SELECTED_IMAGESET'			=> 'Set de Imagens selecionado', 
	'SELECTED_TEMPLATE'			=> 'Template selecionado', 
	'SELECTED_TEMPLATE_FILE'	=> 'Arquivo de template selecionado', 
	'SELECTED_THEME'			=> 'Tema selecionado',
	'SELECTED_THEME_FILE'		=> 'Arquivo de tema selecionado',
	'STORE_DATABASE'			=> 'Banco de Dados', 
	'STORE_FILESYSTEM'			=> 'Sistema de Arquivos', 
	'STYLE_ACTIVATE'			=> 'Ativado', 
	'STYLE_ACTIVE'				=> 'Ativo', 
	'STYLE_ADDED'				=> 'Estilo adicionado com sucesso.', 
	'STYLE_DEACTIVATE'			=> 'Desativado', 
	'STYLE_DEFAULT'				=> 'Tornar estilo padrão', 
	'STYLE_DELETED'				=> 'Estilo excluído com sucesso.', 
	'STYLE_DETAILS_UPDATED'		=> 'Estilo editado com sucesso.', 
	'STYLE_ERR_ARCHIVE'			=> 'Por favor selecione um método de arquivo.', 
	'STYLE_ERR_COPY_LONG'		=> 'O copyright não pode ter mais que 60 caracteres.', 
	'STYLE_ERR_MORE_ELEMENTS'	=> 'Você deve selecionar pelo menos um estilo.', 
	'STYLE_ERR_NAME_CHARS'		=> 'O nome do estilo pode conter somente caracteres alfanuméricos, -, +, _ e espaço.', 
	'STYLE_ERR_NAME_EXIST'		=> 'Um estilo com o mesmo nome já existe.', 
	'STYLE_ERR_NAME_LONG'		=> 'O nome do estilo não pode ter mais que 30 caracteres.', 
	'STYLE_ERR_NO_IDS'			=> 'Você precisa selecionar um template, tema e set de imagens para este estilo.', 
	'STYLE_ERR_NOT_STYLE'		=> 'O arquivo importado ou enviado contém um arquivo válido de estilo.', 
	'STYLE_ERR_STYLE_NAME'		=> 'Você precisa especificar um nome para este estilo.', 
	'STYLE_EXPORT'				=> 'Exportar estilo', 
	'STYLE_EXPORT_EXPLAIN'		=> 'Aqui você pode exportar um estilo no formulário de arquivo. Um estilo não precisa conter todos os elementos mas deve conter pelo menos um. Por exemplo se você criou um novo tema e set de imagens para geralmente usado em template você poderia simplesmente exportar o tema e o set de imagens e omitir o template. Você deve selecionar para baixar o arquivo diretamente ou colocá-lo na sua pasta de armazenamento para baixar depois ou via FTP.', 
	'STYLE_EXPORTED'			=> 'Estilo exportado com sucesso e armazenado em %s.', 
	'STYLE_IMAGESET'			=> 'Set de Imagens', 
	'STYLE_NAME'				=> 'Nome do Estilo', 
	'STYLE_TEMPLATE'			=> 'Template', 
	'STYLE_THEME'				=> 'Tema', 
	'STYLE_USED_BY'				=> 'Usado por (incluindo bots)', 

	'TEMPLATE_ADDED'			=> 'Set de Template adicionado e armazenado no sistema de arquivos.', 
	'TEMPLATE_ADDED_DB'			=> 'Set de Template adicionado e armazenado no banco de dados.', 
	'TEMPLATE_CACHE'			=> 'Cache do Template', 
	'TEMPLATE_CACHE_EXPLAIN'	=> 'Por padrão o phpBB armazena em cache a versão compilada dos templates. Isto reduz a carga do servidor para cada vez que a página é vista e também reduz o tempo de geração da página. Aqui você pode ver o status do cache de cada arquivo e deletar arquivos individuais ou o cache todo.', 
	'TEMPLATE_CACHE_CLEARED'	=> 'Cache do Template limpo com sucesso.', 
	'TEMPLATE_CACHE_EMPTY'		=> 'Não há templates em cache.', 
	'TEMPLATE_DELETED'			=> 'Set de templates deletado com sucesso.', 
	'TEMPLATE_DELETED_FS'		=> 'Set de templates removido do banco de dados mas alguns arquivos ainda restam no sistema de arquivos.', 
	'TEMPLATE_DETAILS_UPDATED'	=> 'Detalhes da template atualizados com sucesso.', 
	'TEMPLATE_EDITOR'			=> 'Template editor código HTML', 
	'TEMPLATE_EDITOR_HEIGHT'	=> 'Altura do editor de template', 
	'TEMPLATE_ERR_ARCHIVE'		=> 'Por favor selecione um método de arquivo.', 
	'TEMPLATE_ERR_CACHE_READ'	=> 'O diretório de cache usado para armazenar as versões em cache dos arquivos de template não pode ser aberta.', 
	'TEMPLATE_ERR_COPY_LONG'	=> 'O copyright não pode ter mais que 60 caracteres.', 
	'TEMPLATE_ERR_NAME_CHARS'	=> 'O nome do template pode conter apenas caracteres alfanuméricos, -, +, _ e espaço.', 
	'TEMPLATE_ERR_NAME_EXIST'	=> 'Um set de template com o mesmo nome já existe.', 
	'TEMPLATE_ERR_NAME_LONG'	=> 'O nome do template não pode ter mais que 30 caracteres.', 
	'TEMPLATE_ERR_NOT_TEMPLATE'	=> 'O arquivo especificado não contém um um set template válido.', 
	'TEMPLATE_ERR_STYLE_NAME'	=> 'Você precisa especificar um nome válido para esta template.',
	'TEMPLATE_EXPORT'			=> 'Exportar templates', 
	'TEMPLATE_EXPORT_EXPLAIN'	=> 'Aqui você pode exportar um set de templates no formulário de um arquivo. Este arquivo deve conter todos os arquivos necessários para instalar as templates em outros fórum. Você pode selecionar para baixar o arquivo diretamente ou colocá-lo na sua pasta de armazenamento para baixar depois ou via FTP.', 
	'TEMPLATE_EXPORTED'			=> 'Templates exportados com sucesso e armazenados em %s.', 
	'TEMPLATE_FILE'				=> 'Arquivo de template', 
	'TEMPLATE_FILE_UPDATED'		=> 'Arquivo de Template atualizado com sucesso.', 
	'TEMPLATE_LOCATION'			=> 'Armazenar templates em', 
	'TEMPLATE_LOCATION_EXPLAIN'	=> 'Imagens são sempre armazenadas no sistema de arquivos.', 
	'TEMPLATE_NAME'				=> 'Nome do Template', 
	'TEMPLATE_REFRESHED'		=> 'Template atualizado com sucesso.', 

	'THEME_ADDED'				=> 'Novo tema adicionado no sistema de arquivos.', 
	'THEME_ADDED_DB'			=> 'Novo tema adicionado ao banco de dados.', 
	'THEME_CLASS_ADDED'			=> 'Classe customizada adicionada com sucesso.', 
	'THEME_DELETED'				=> 'Tema deletado com sucesso.', 
	'THEME_DELETED_FS'			=> 'Tema removido do banco de dados mas os arquivos ainda estão no sistema de arquivos.', 
	'THEME_DETAILS_UPDATED'		=> 'Detalhes do tema atualizado com sucesso.', 
	'THEME_EDITOR'				=> 'Editor de Tema',
	'THEME_EDITOR_HEIGHT'		=> 'Altura do editor de Tema', 
	'THEME_ERR_ARCHIVE'			=> 'Por favor selecione um método de arquivo.', 
	'THEME_ERR_CLASS_CHARS'		=> 'Somente caracteres alfanuméricos e ., :, -, _ e # são validos em nomes de classes.', 
	'THEME_ERR_COPY_LONG'		=> 'O copyright não pode ter mais que 60 caracteres.', 
	'THEME_ERR_NAME_CHARS'		=> 'O nome do tema pode conter apenas caracteres alfanuméricos, -, +, _ e espaço.', 
	'THEME_ERR_NAME_EXIST'		=> 'Um tema com o mesmo nome já existe.', 
	'THEME_ERR_NAME_LONG'		=> 'O nome do tema não deve ter mais que 30 caracteres.', 
	'THEME_ERR_NOT_THEME'		=> 'O arquivo que você especificou não contém um tema válido.', 
	'THEME_ERR_REFRESH_FS'		=> 'Este tema está armazenado no sistema de arquivos e não há necessidade de atualizá-lo.', 
	'THEME_ERR_STYLE_NAME'		=> 'Você precisa fornecer um nome para este tema.', 
	'THEME_FILE'				=> 'Arquivo de Tema',
	'THEME_EXPORT'				=> 'Exportar Tema', 
	'THEME_EXPORT_EXPLAIN'		=> 'Aqui você pode exportar um tema no formulário ou arquivo. Este aquivo deve conter todas as informações necessárias para instalar o tema em outro fórum. Você pode selecionar entre baixar o arquivo diretamente ou colocá-lo em sua pasta de armazenamento para baixar depois ou via FTP.', 
	'THEME_EXPORTED'			=> 'Tema exportado com sucesso e armazenado em %s.', 
	'THEME_LOCATION'			=> 'Armazenar folha de estilo em', 
	'THEME_LOCATION_EXPLAIN'	=> 'Imagens são sempre armazenadas no sistema de arquivos.', 
	'THEME_NAME'				=> 'Nome do Tema', 
	'THEME_REFRESHED'			=> 'Tema atualizado com sucesso.', 
	'THEME_UPDATED'				=> 'O Tema selecionado foi atualizado com sucesso.',

	'UNDERLINE'				=> 'Underline', 
	'UNINSTALLED_IMAGESET'	=> 'Sets de Imagens desinstalados', 
	'UNINSTALLED_STYLE'		=> 'Estilos desinstalados', 
	'UNINSTALLED_TEMPLATE'	=> 'Templates desinstalados', 
	'UNINSTALLED_THEME'		=> 'Temas desinstalados', 
	'UNSET'					=> 'Indefinido', 

)); 

?>