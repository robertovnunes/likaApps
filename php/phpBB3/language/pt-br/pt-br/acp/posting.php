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

// BBCodes 
// Note to translators: you can translate everything but what's between { and } 
$lang = array_merge($lang, array( 
	'ACP_BBCODES_EXPLAIN'		=> 'O BBCode é uma implementação especial do HTML oferecendo um maior controle sobre o quê e como será exibido. Aqui você pode adicionar, editar e excluir os BBCodes existentes.', 
	'ADD_BBCODE'				=> 'Adicionar novo BBCode', 

	'BBCODE_ADDED'				=> 'O BBCode foi adicionado com sucesso.', 
	'BBCODE_EDITED'				=> 'O BBCode foi editado com sucesso.', 
	'BBCODE_NOT_EXIST'			=> 'O BBCode selecionado não existe.', 
	'BBCODE_HELPLINE'			=> 'Linha de Ajuda',
	'BBCODE_HELPLINE_EXPLAIN'	=> 'Este campo contm o texto mouseover do BBCode.',
	'BBCODE_HELPLINE_TEXT'		=> 'Texto da Linha de Ajuda',
	'BBCODE_INVALID_TAG_NAME'	=> 'O Nome da TAG de BBCode selecionado já existe.', 
	'BBCODE_OPEN_ENDED_TAG'		=> 'O seu BBCode customizado deve conter ambos uma TAG de início como uma de fim.', 
	'BBCODE_TAG'				=> 'TAG', 
	'BBCODE_TAG_TOO_LONG'		=> 'O Nome da TAG selecionado é muito grande.', 
	'BBCODE_TAG_DEF_TOO_LONG'	=> 'A Definição da TAG escrita é muito grande. Por Favor, reescreva de forma mais curta.', 
	'BBCODE_USAGE'				=> 'BBCode usage', 
	'BBCODE_USAGE_EXAMPLE'		=> '[hilight={COR}]{TEXTO}[/hilight]<br /><br />[font={TEXTO1}]{TEXTO2}[/font]', 
	'BBCODE_USAGE_EXPLAIN'		=> 'Aqui você pode definir como utilizar o BBCode. Substitua qualquer variável inserida pelo símbolo correspondente (%sveja abaixo%s).',

	'EXAMPLE'						=> 'Exemplo:', 
	'EXAMPLES'						=> 'Exemplos:', 

	'HTML_REPLACEMENT'				=> 'Substituição do HTML', 
	'HTML_REPLACEMENT_EXAMPLE'		=> '&lt;span style="background-color:{COR};"&gt;{TEXTO}&lt;/span&gt;<br /><br />&lt;span style="font-family:{TEXTO1};"&gt;{TEXTO2}&lt;/span&gt;', 
	'HTML_REPLACEMENT_EXPLAIN'		=> 'Aqui você pode definir a substituição padrão do HTML. Não esqueça de colocar os símbolos utilizados acima!',

	'TOKEN'					=> 'Símbolo', 
	'TOKENS'				=> 'Símbolos', 
	'TOKENS_EXPLAIN'		=> 'Os símbolos são placeholders para serem adicionados pelos usuários. Mas estes apenas serão válidos apenas se igualmente estiverem com as suas definições correspondentes. Se necessário, você pode numerá-las adicionando um número como o último caractere entre os braços, ex. {USURIO}, {USURIO2}.<br /><br />Em adição destes símbolos você pode utilizar qualquer sequência de linguagem presente em seu diretório /language como este: {L_<em>&lt;stringname&gt;</em>} onde <em>&lt;stringname&gt;</em> é o nome da sequência traduzida que você deseja adicionar. Por exemplo, {L_WROTE} será exibido como "wrote" ou traduzido de acordo com a localidade do usuário.',
	'TOKEN_DEFINITION'		=> 'O que isto pode ser?', 
	'TOO_MANY_BBCODES'		=> 'Você não pode criar mais BBCodes. Por Favor, exclua um ou mais BBCodes e tente novamente.', 

	'tokens'	=>	array( 
		'TEXT'			=> 'Qualquer texto, incluindo caracteres externos, números, e etc.', 
		'NUMBER'		=> 'Qualquer Séries de Digitos', 
		'EMAIL'			=> 'Um endereço de email válido', 
		'URL'			=> 'Uma URL válida utilizando qualquer protocolo (http, ftp, etc. não pode ser utilizada para javascript). Se nenhum for concedido, "http://" é prepended para a sequência', 
		'LOCAL_URL'		=> 'Uma URL local. A URL deve ser relativa à página do tópico e não pode um nome de servidor ou protocolo', 
		'COLOR'			=> 'Uma Cor de HTML, pode ser tanto na forma numérica <samp>#FF1234</samp> ou uma <a href="http://www.w3.org/TR/CSS21/syndata.html#value-def-color">CSS colour keyword</a> assim como <samp>fuchsia</samp> ou <samp>InactiveBorder</samp>' 
	) 
)); 

// Smilies and topic icons 
$lang = array_merge($lang, array( 
	'ACP_ICONS_EXPLAIN'		=> 'Aqui você pode adicionar, editar e excluir os seus ícones os quais os usuários adicionarão em seus tópicos e mensagens. Estes ícones são exibidos geralmente perto do título dos tópicos na listagem de seções, ou o título do tópico na listagem de tópicos. Você pode também instalar e criar novos Pacotes de Ícones.', 
	'ACP_SMILIES_EXPLAIN'	=> 'Os Smileys ou Emoções são tipicamente pequenos, as vezes imagens animadas utilizadas para mostrar alguma emoção ou sentimento. Aqui você pode adicionar, editar e excluir as emoções que os usuários poderão utilizar em seus tópicos e mensagens particulares. Você pode também instalar e criar novos Pacotes de Smileys.', 
	'ADD_SMILIES'			=> 'Adicionar Smiles Múltiplos', 
	'ADD_SMILEY_CODE'		=> 'Adicionar Código Adicional ao Smilie',
	'ADD_ICONS'				=> 'Adicionar Ícones Múltiplos', 
	'AFTER_ICONS'			=> 'Depois %s', 
	'AFTER_SMILIES'			=> 'Depois %s', 

	'CODE'						=> 'Código', 
	'CURRENT_ICONS'				=> 'Ícones Atuais', 
	'CURRENT_ICONS_EXPLAIN'		=> 'Escolha o que fazer com os Ícones atualmente instalados.',
	'CURRENT_SMILIES'			=> 'Smileys Atuais', 
	'CURRENT_SMILIES_EXPLAIN'	=> 'Escolha o que fazer com os Smileys atualmente instalados.',

	'DISPLAY_ON_POSTING'	=> 'Exibir na Mensagem', 

	'EDIT_ICONS'				=> 'Editar Ícones', 
	'EDIT_SMILIES'				=> 'Editar Smileys', 
	'EMOTION'					=> 'Emoção', 
	'EXPORT_ICONS'				=> 'Exportar e Baixar icons.pak', 
	'EXPORT_ICONS_EXPLAIN'		=> '%sClicando neste link, a configuração para os seus ícones instalados serão compactadas para <samp>icons.pak</samp> que uma vez baixado pode ser utilizado para criar um arquivo <samp>.zip</samp> ou <samp>.tgz</samp> contendo todos os seus ícones mais este arquivo de configuração<samp>icons.pak</samp>%s.', 
	'EXPORT_SMILIES'			=> 'Exportar e Baixar smilies.pak', 
	'EXPORT_SMILIES_EXPLAIN'	=> '%sClicando neste link, a configuração para os seus ícones instalados serão compactadas para <samp>smilies.pak</samp> que uma vez baixado pode ser utilizado para criar um arquivo <samp>.zip</samp> ou <samp>.tgz</samp> contendo todos os seus smileys mais este arquivo de configuração<samp>smilies.pak</samp>%s.', 

	'FIRST'			=> 'Primeiro', 

	'ICONS_ADD'				=> 'Adicionar novo Ícone', 
	'ICONS_ADDED'			=> 'O Ícone foi adicionado com sucesso.', 
	'ICONS_CONFIG'			=> 'Configuração de Ícones', 
	'ICONS_DELETED'			=> 'O Ícone foi excluído com sucesso.', 
	'ICONS_EDIT'			=> 'Editar Ícone', 
	'ICONS_EDITED'			=> 'O Ícone foi atualizado com sucesso.', 
	'ICONS_HEIGHT'			=> 'Altura do Ícone', 
	'ICONS_IMAGE'			=> 'Imagem do Ícone', 
	'ICONS_IMPORTED'		=> 'O Pacote de Ícones foi instalado com sucesso.', 
	'ICONS_IMPORT_SUCCESS'	=> 'O Pacote de Ícones foi importado com sucesso.', 
	'ICONS_LOCATION'		=> 'Local do Ícone', 
	'ICONS_NOT_DISPLAYED'	=> 'Os Ícones seguintes não serão exibidos na página de mensagens', 
	'ICONS_ORDER'			=> 'Ordem do Ícone', 
	'ICONS_URL'				=> 'Arquivo de Imagem do Ícone', 
	'ICONS_WIDTH'			=> 'Largura do Ícone', 
	'IMPORT_ICONS'			=> 'Instalar Pacote de cones',
	'IMPORT_SMILIES'		=> 'Instalar Pacote de Smileys', 

	'KEEP_ALL'			=> 'Salvar Todos', 

	'MASS_ADD_SMILIES'	=> 'Adicionar Smileys Múltiplos', 

	'NO_ICONS_ADD'		=> 'Não há Ícones disponíveis para adicionar.',
	'NO_ICONS_EDIT'		=> 'Não há Ícones disponíveis para modificar.',
	'NO_ICONS_EXPORT'	=> 'Você não possui Ícones para Criar um Pacote.', 
	'NO_ICONS_PAK'		=> 'Nenhum Pacote de Ícones foi encontrado.',
	'NO_SMILIES_ADD'	=> 'Não há Smilies disponíveis apra adicionar.',
	'NO_SMILIES_EDIT'	=> 'Não há Smilies disponíveis para modificar.',	 
	'NO_SMILIES_EXPORT'	=> 'Você não possui Smileys para Criar um Pacote.', 
	'NO_SMILIES_PAK'	=> 'Nenhum Pacote de Smileys foi encontrado.', 

	'PAK_FILE_NOT_READABLE'		=> 'Não é possível ler o arquivo <samp>.pak</samp>.', 

	'REPLACE_MATCHES'	=> 'Substituir matches', 

	'SELECT_PACKAGE'			=> 'Selecionar um Arquivo do Pacote', 
	'SMILIES_ADD'				=> 'Adicionar novo Smiley', 
	'SMILIES_ADDED'				=> 'O Smiley foi adicionado com sucesso.', 
	'SMILIES_CODE'				=> 'Código do Smiley', 
	'SMILIES_CONFIG'			=> 'Configuração do Smiley', 
	'SMILIES_DELETED'			=> 'O Smiley foi excluído com sucesso.', 
	'SMILIES_EDIT'				=> 'Editar Smiley', 
	'SMILIES_EDITED'			=> 'O Smiley foi atualizado com sucesso.', 
	'SMILIES_EMOTION'			=> 'Emoção', 
	'SMILIES_HEIGHT'			=> 'Altura do Smiley', 
	'SMILIES_IMAGE'				=> 'Imagem do Smiley', 
	'SMILIES_IMPORTED'			=> 'O Pacote de Smileys foi instalado com sucesso.', 
	'SMILIES_IMPORT_SUCCESS'	=> 'O Pacote de Smileys foi importado com sucesso.', 
	'SMILIES_LOCATION'			=> 'Local do Smiley', 
	'SMILIES_NOT_DISPLAYED'		=> 'Os Smileys seguintes não serão exibidos na página de mensagens', 
	'SMILIES_ORDER'				=> 'Ordem do Smiley', 
	'SMILIES_URL'				=> 'Arquivo de Imagem do Smiley', 
	'SMILIES_WIDTH'				=> 'Largura do Smiley', 

	'WRONG_PAK_TYPE'	=> 'O Pacote selecionado não possui as informações apropriadas.', 
)); 

// Word censors 
$lang = array_merge($lang, array( 
	'ACP_WORDS_EXPLAIN'		=> 'Aqui você pode adicionar, editar e excluir palavras que serão automaticamente censuradas em seu forum. Adicionando esta opção, os visitantes não estarão permitidos a se registrar com Nomes de Usuários contendo estas palavras. Podem ser utilizados asteriscos (*) aumentando as possibilidades de abranger variações de uma mesma palavra. Por exemplo, *testa* abrangerá detestável, testa* abrangerá testando e *testa abrangerá detesta.', 
	'ADD_WORD'				=> 'Adicionar nova Palavra', 

	'EDIT_WORD'		=> 'Editar Palavra Censurada', 
	'ENTER_WORD'	=> 'Você precisa escrever uma palavra e sua substituição.', 

	'NO_WORD'	=> 'Nenhuma palavra foi selecionada para ser editada.', 

	'REPLACEMENT'	=> 'Substituição', 

	'UPDATE_WORD'	=> 'Atualizar Palavra Censurada', 

	'WORD'				=> 'Palavra', 
	'WORD_ADDED'		=> 'A Palavra Censurada foi adicionada com sucesso.', 
	'WORD_REMOVED'		=> 'A Palavra Censurada foi excluída com sucesso.', 
	'WORD_UPDATED'		=> 'A Palavra Censurada foi atualizada com sucesso.', 
)); 

// Ranks 
$lang = array_merge($lang, array( 
	'ACP_RANKS_EXPLAIN'		=> 'Aqui você pode adicionar, editar, visualizar e excluir ranks. Você pode também criar ranks customizados que podem ser aplicados a um usuário pelas facilidades do Gerenciamento de Usuários.', 
	'ADD_RANK'				=> 'Adicionar novo Rank', 

	'MUST_SELECT_RANK'		=> 'Você precisa selecionar um Rank.', 
	 
	'NO_ASSIGNED_RANK'		=> 'Nenhum Rank Especial existente.', 
	'NO_RANK_TITLE'			=> 'O Título do Rank deve ser escrito.', 
	'NO_UPDATE_RANKS'		=> 'O Rank foi excluído com sucesso. De qualquer modo, os registros que utilizavam este rank não foram atualizados. Você precisa atualizar os ranks nestes registros manualmente.', 

	'RANK_ADDED'			=> 'O Rank foi adicionado com sucesso.', 
	'RANK_IMAGE'			=> 'Imagem do Rank', 
	'RANK_IMAGE_EXPLAIN'	=> 'Imagem do Rank (relativo à pasta raíz do phpBB).', 
	'RANK_MINIMUM'			=> 'Núm. Mín. de Mensagens', 
	'RANK_REMOVED'			=> 'O Rank foi excluído com sucesso.', 
	'RANK_SPECIAL'			=> 'Escreva um Rank Especial', 
	'RANK_TITLE'			=> 'Título do Rank', 
	'RANK_UPDATED'			=> 'O Rank foi atualizado com sucesso.', 
)); 

// Disallow Usernames 
$lang = array_merge($lang, array( 
	'ACP_DISALLOW_EXPLAIN'	=> 'Aqui você pode controlar os Nomes Proibidos a serem aplicados no forum. Aos Nomes Proibidos são permitidos conter um asterisco (*). Por Favor, note que você não será autorizado a especificar qualquer nome de usuário que já se encontra registrado, então você precisará primeiro excluir o mesmo para então desativá-lo.', 
	'ADD_DISALLOW_EXPLAIN'	=> 'Aqui você pode Proibir um Nome de Usuário utilizando asteriscos (*) para abranger qualquer caractere.', 
	'ADD_DISALLOW_TITLE'	=> 'Adicionar um Nome Proibido', 

	'DELETE_DISALLOW_EXPLAIN'	=> 'Aqui você pode excluir um Nome Proibido selecionando através desta lista e clicando em enviar.', 
	'DELETE_DISALLOW_TITLE'		=> 'Excluir um Nome Proibido', 
	'DISALLOWED_ALREADY'		=> 'O Nome especificado não pode ser proibido. Pode ser que ele já exista na Lista de Nomes Proibidos, na Lista de Palavras Censuradas ou encontre-se atualmente em uso por algum usuário registrado.', 
	'DISALLOWED_DELETED'		=> 'O Nome Proibido foi excluído com sucesso.', 
	'DISALLOW_SUCCESSFUL'		=> 'O Nome Proibido foi adicionado com sucesso.', 

	'NO_DISALLOWED'				=> 'Não há Nomes Proibidos', 
	'NO_USERNAME_SPECIFIED'		=> 'O Nome Proibido não foi selecionado.', 
)); 

// Reasons 
$lang = array_merge($lang, array( 
	'ACP_REASONS_EXPLAIN'	=> 'Aqui você pode gerenciar as razões utilizadas em denúncias e mensagens negativas quando desaprovando mensagens. Existe uma razão padrão (marcada com um (*)) em que você não pode excluir, esta razão é normalmente utilizada para mensagens customizadas se não possuirem motivos plausíveis.', 
	'ADD_NEW_REASON'		=> 'Adicionar nova Razão', 
	'AVAILABLE_TITLES'		=> 'Ttulos de Razes Locais Disponveis',
	 
	'IS_NOT_TRANSLATED'			=> 'A Razão <strong>não</strong> foi encontrada.',
	'IS_NOT_TRANSLATED_EXPLAIN'	=> 'A Razão <strong>no</strong> foi encontrada. Se voc deseja estabelecer a forma local, especifique a chave correta atravs dos arquivos de linguagem da seção de razões para denúncias.',
	'IS_TRANSLATED'				=> 'A Razão foi encontrada.',
	'IS_TRANSLATED_EXPLAIN'		=> 'A Razão foi encontrada. Se o título que você escreveu aqui for especificado com os arquivos de linguagem da seção de razões para denúncias, a forma localizada para o título e a descrição serão utilizadas.',
	 
	'NO_REASON'					=> 'A Razão não pôde ser encontrada.', 
	'NO_REASON_INFO'			=> 'O Título e a Descrição para esta Razão devem ser escritos.', 
	'NO_REMOVE_DEFAULT_REASON'	=> 'Você não está autorizado a excluir a Razão Padrão "Outros".', 

	'REASON_ADD'				=> 'Adicionar Razão para Denúncia/Negação', 
	'REASON_ADDED'				=> 'A Razão para Denúncia/Negação foi adicionada com sucesso.', 
	'REASON_ALREADY_EXIST'		=> 'O Título escrito já existe. Por Favor, escreva outro título para esta razão.', 
	'REASON_DESCRIPTION'		=> 'Descrição da Razão', 
	'REASON_DESC_TRANSLATED'	=> 'Descrição da Razão exibida', 
	'REASON_EDIT'				=> 'Editar Razão para Denúncia/Negação', 
	'REASON_EDIT_EXPLAIN'		=> 'Aqui você pode adicionar ou editar uma razão. Se a razão for traduzida, a versão localizada é utilizada ao invés da descrição descrita aqui.', 
	'REASON_REMOVED'			=> 'Report/denial reason successfully removed.', 
	'REASON_TITLE'				=> 'Título da Razão', 
	'REASON_TITLE_TRANSLATED'	=> 'Título da Razão exibida', 
	'REASON_UPDATED'			=> 'A Razão para Denúncia/Negação foi atualizada com sucesso.', 

	'USED_IN_REPORTS'		=> 'Utilizado em Denúncias', 
)); 

?>
