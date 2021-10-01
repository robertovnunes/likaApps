<?php 
/** 
* 
* acp_profile [Portuguese] 
* 
* @package language 
* @version $Id: profile.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

// Custom profile fields 
$lang = array_merge($lang, array( 
	'ADDED_PROFILE_FIELD'	=> 'O Campo do Perfil customizado foi adicionado com sucesso.', 
	'ALPHA_ONLY'			=> 'Alphanumeric only', 
	'ALPHA_SPACERS'			=> 'Alphanumeric and spacers', 
	'ALWAYS_TODAY'			=> 'Sempre a Data Atual', 

	'BOOL_ENTRIES_EXPLAIN'	=> 'Escreva suas opções agora', 
	'BOOL_TYPE_EXPLAIN'		=> 'Defina o tipo, como uma checkbox ou botes de rdio.',

	'CHANGED_PROFILE_FIELD'		=> 'O Campo do Perfil foi modificado com sucesso.', 
	'CHARS_ANY'					=> 'Qualquer Caractere', 
	'CHECKBOX'					=> 'Checkbox', 
	'COLUMNS'					=> 'Colunas', 
	'CP_LANG_DEFAULT_VALUE'		=> 'Valor Padrão', 
	'CP_LANG_EXPLAIN'			=> 'Descrição do Campo', 
	'CP_LANG_EXPLAIN_EXPLAIN'	=> 'A Explicação para este Campo exibido ao Usuário.',
	'CP_LANG_NAME'				=> 'Título do Campo exibido ao Usuário', 
	'CP_LANG_OPTIONS'			=> 'Opções', 
	'CREATE_NEW_FIELD'			=> 'Criar novo Campo', 
	'CUSTOM_FIELDS_NOT_TRANSLATED'	=> 'Os Campos do perfil não foram totalmente traduzidos. Por Favor, escreva a informação solicitada clicando no link &quot;Traduzir&quot;.',

	'DEFAULT_ISO_LANGUAGE'			=> 'Língua Padrão [%s]', 
	'DEFAULT_LANGUAGE_NOT_FILLED'	=> 'Os entries de linguagem para a Língua Padrão não estão preenchidos a este campo do perfil.', 
	'DEFAULT_VALUE'					=> 'Valor Padrão', 
	'DELETE_PROFILE_FIELD'			=> 'Excluir Campo do Perfil', 
	'DELETE_PROFILE_FIELD_CONFIRM'	=> 'Você deseja realmente EXCLUIR este Campo do Perfil?', 
	'DISPLAY_AT_PROFILE'			=> 'Exibir no Painel de Usuários', 
	'DISPLAY_AT_PROFILE_EXPLAIN'	=> 'O Usuário está autorizado a alterar este campo do perfil com o Painel de Usuários.', 
	'DISPLAY_AT_REGISTER'			=> 'Exibir na Tela de Registros', 
	'DISPLAY_AT_REGISTER_EXPLAIN'	=> 'Se esta opção estiver ativa, o campo será exibido no registro e autorizado para ser alterado com o Painel de Usuários.', 
	'DISPLAY_PROFILE_FIELD'			=> 'Exibir Campo do Perfil', 
	'DISPLAY_PROFILE_FIELD_EXPLAIN'	=> 'O Campo do Perfil será visualizado em tpicos, perfils e lista de membros, se isto estiver ativo com as configurações de carga. Apenas exibindo com o perfil dos usuários estará padronalmente ativo.',
	'DROPDOWN_ENTRIES_EXPLAIN'		=> 'Escreva suas opções agora, todas elas em uma linha.',

	'EDIT_DROPDOWN_LANG_EXPLAIN'	=> 'Por Favor, note que você pode alterar os seus textos de opções e também pode adicionar novas opções ao fim. Não é aconselhado adicionar novas opções dentre outras opções existentes - isto pode resultar em opções defeituosas exibidas aos usuários. Isto pode também acontecer se você excluir opções dentre outras. Excluindo opções do fim resulta em Usuários possuindo assigned this item now reverting back to the default one.', 
	'EMPTY_FIELD_IDENT'				=> 'Identificação do Campo Vazia', 
	'EMPTY_USER_FIELD_NAME'			=> 'Por Favor, escreva um Título para o Campo', 
	'ENTRIES'						=> 'Entries', 
	'EVERYTHING_OK'					=> 'Tudo OK', 

	'FIELD_BOOL'				=> 'Boolean (Sim/Não)', 
	'FIELD_DATE'				=> 'Data', 
	'FIELD_DESCRIPTION'			=> 'Descrição do Campo', 
	'FIELD_DESCRIPTION_EXPLAIN'	=> 'A explicação para este campo exibida ao usuário.', 
	'FIELD_DROPDOWN'			=> 'Dropdown box', 
	'FIELD_IDENT'				=> 'Identificação do Campo', 
	'FIELD_IDENT_ALREADY_EXIST'	=> 'A Identificação do Campo selecionada já existe. Por Favor, escolha outro nome.', 
	'FIELD_IDENT_EXPLAIN'		=> 'A Identificação do Campo é um nome para identificar o campo do perfil com o Banco de Dados e suas Templates.', 
	'FIELD_INT'					=> 'Números', 
	'FIELD_LENGTH'				=> 'Comprimento da Caixa de Entrada', 
	'FIELD_NOT_FOUND'			=> 'O Campo de Perfil não foi encontrado.', 
	'FIELD_STRING'				=> 'Campo de Texto Individual',
	'FIELD_TEXT'				=> 'rea de Texto',
	'FIELD_TYPE'				=> 'Tipo do Campo', 
	'FIELD_TYPE_EXPLAIN'		=> 'Você não pode alterar o tipo de perfil depois.', 
	'FIELD_VALIDATION'			=> 'Validação do Campo', 
	'FIRST_OPTION'				=> 'Primeira Opção', 

	'HIDE_PROFILE_FIELD'			=> 'Campo de Perfil Invisível', 
	'HIDE_PROFILE_FIELD_EXPLAIN'	=> 'Apenas administradores e moderadores podem visualizar/preencher este campo. Se esta opção estiver ativa, o campo será exibido apenas no perfil dos usuários.', 

	'INVALID_CHARS_FIELD_IDENT'	=> 'A Identificação do Campo pode conter apenas lowercase a-z e _', 
	'INVALID_FIELD_IDENT_LEN'	=> 'A Identificação do Campo pode conter apenas 17 caracteres', 
	'ISO_LANGUAGE'				=> 'Língua [%s]', 

	'LANG_SPECIFIC_OPTIONS'		=> 'Opções Específicas da Língua [<strong>%s</strong>]', 

	'MAX_FIELD_CHARS'		=> 'Núm. Máx. de Caracteres', 
	'MAX_FIELD_NUMBER'		=> 'Número Máximo Permitido', 
	'MIN_FIELD_CHARS'		=> 'Núm. Mín. de Caracteres', 
	'MIN_FIELD_NUMBER'		=> 'Número Mínimo Permitido', 

	'NO_FIELD_ENTRIES'			=> 'Sem entries definidas', 
	'NO_FIELD_ID'				=> 'Não foi especificada a ID do Campo.', 
	'NO_FIELD_TYPE'				=> 'Não foi especificado o Tipo de Campo.', 
	'NO_VALUE_OPTION'			=> 'Opo igual a um valor no escrito',
	'NO_VALUE_OPTION_EXPLAIN'	=> 'Valor para um no escrito. Se o campo for solicitado, o usuário receberá um erro se ele escolher a opção selecionada aqui.',
	'NUMBERS_ONLY'				=> 'Apenas Números (0-9)', 

	'PREVIEW_PROFILE_FIELD'		=> 'Prever Campo', 
	'PROFILE_BASIC_OPTIONS'		=> 'Opções Básicas', 
	'PROFILE_FIELD_ACTIVATED'	=> 'O Campo foi ativado com sucesso.', 
	'PROFILE_FIELD_DEACTIVATED'	=> 'O Campo foi desativado com sucesso.', 
	'PROFILE_LANG_OPTIONS'		=> 'Opções Específicas da Língua', 
	'PROFILE_TYPE_OPTIONS'		=> 'Opções Específicas ao Tipo de Perfil', 

	'RADIO_BUTTONS'				=> 'Botões do Rádio', 
	'REMOVED_PROFILE_FIELD'		=> 'O Campo foi excluído com sucesso.', 
	'REQUIRED_FIELD'			=> 'Campo Requerido', 
	'REQUIRED_FIELD_EXPLAIN'	=> 'Força o campo a ser preenchido ou especificado pelo usuário. Isto irá exibir o campo no registro e com Painel de Usuários.', 
	'ROWS'						=> 'Linhas', 

	'SAVE'							=> 'Salvar', 
	'SECOND_OPTION'					=> 'Segunda Opção', 
	'STEP_1_EXPLAIN_CREATE'			=> 'Aqui você pode escrever os primeiros parâmetros básicos de seu novo campo no perfil. Estas informações são necessárias para a segunda etapa, onde você poderá inserir as opções restantes e prever seu campo mais adiante.',
	'STEP_1_EXPLAIN_EDIT'			=> 'Aqui você pode alterar os parâmetros básicos de seu campo no perfil. As opções relevantes são re-cauculadas com a segunda etapa, onde você poderá prever e testar as suas novas configurações.', 
	'STEP_1_TITLE_CREATE'			=> 'Adicionar Campo de Perfil', 
	'STEP_1_TITLE_EDIT'				=> 'Editar Campo de Perfil', 
	'STEP_2_EXPLAIN_CREATE'			=> 'Aqui você pode definir algumas opções comuns. Além disso, você pode prever o campo o qual você gerou, visualizando-o enquanto usuário. Por Favor, teste as suas configurações para ver se tudo está funcionando corretamente.', 
	'STEP_2_EXPLAIN_EDIT'			=> 'Aqui você pode alterar algumas opções comuns. Além disso, você pode prever o campo alterado, visualizando-o enquanto usuário. Por Favor, teste as suas configurações para ver se tudo está funcionando corretamente.<br /><strong>Por Favor, note que as alterações no campos do perfil não afetará os campos existentes inseridos pelos seus usuários.</strong>', 
	'STEP_2_TITLE_CREATE'			=> 'Opções Específicas ao Tipo de Perfil', 
	'STEP_2_TITLE_EDIT'				=> 'Opções Específicas ao Tipo de Perfil', 
	'STEP_3_EXPLAIN_CREATE'			=> 'Desde que você tenha mais de uma Língua instalada, você deve preencher os itens de linguagem restantes também. O Campo irá trabalhar com a Língua Padrão selecionada, e você pode preencher os itens de linguagem restantes depois também.', 
	'STEP_3_EXPLAIN_EDIT'			=> 'Desde que você tenha mais de uma Língua instalada, você pode alterar ou adicionar os itens de linguagem restantes também. O Campo irá trabalhar com a Língua Padrão selecionada.', 
	'STEP_3_TITLE_CREATE'			=> 'Definições da Língua Restantes', 
	'STEP_3_TITLE_EDIT'				=> 'Definições da Língua', 
	'STRING_DEFAULT_VALUE_EXPLAIN'	=> 'Escreva uma frase padrão a ser exibida, um valor parão. Deixe em branco se você não deseja ativar esta opção.', 

	'TEXT_DEFAULT_VALUE_EXPLAIN'	=> 'Escreva um texto padrão a ser exibido, um valor parão. Deixe em branco se você não deseja ativar esta opção.', 
	'TRANSLATE'						=> 'Traduzir', 

	'UPDATE_PREVIEW'	=> 'Atualizar Previsão', 
	'USER_FIELD_NAME'	=> 'Título do Campo exibido ao Usuário', 

	'VISIBILITY_OPTION'				=> 'Opção de Visibilidade', 
)); 

?>
