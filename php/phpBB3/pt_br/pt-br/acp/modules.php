<?php 
/** 
* 
* acp_modules [Portuguese] 
* 
* @package language 
* @version $Id: modules.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ACP_MODULE_MANAGEMENT_EXPLAIN'	=> 'Aqui você pode gerenciar todos os tipos de módulos. Por Favor, note que o Painel de Administração possui uma estrutura de menu de três níveis (Categoria -> Categoria -> Módulo) whereby os outros que possuem uma estrutura de menu de dois níveis (Categoria -> Módulo) que precisam ser salvos. Por Favor, além disso fique atento que você precisa lock out você mesmo, se você desativar ou deletar os módulos responsáveis pelo Gerenciamento de Módulos itself.', 
	'ADD_MODULE'					=> 'Adicionar um Módulo', 
	'ADD_MODULE_CONFIRM'			=> 'Você deseja realmente ADICIONAR este Módulo com o modo selecionado?', 
	'ADD_MODULE_TITLE'				=> 'Adicionar Módulos', 

	'CANNOT_REMOVE_MODULE'	=> 'Não é possível excluir este módulo, pois ele está assinalado como Criança. Por Favor, exclua ou mova todas as Crianças antes de efetivar esta ação.', 
	'CATEGORY'				=> 'Categoria', 
	'CHOOSE_MODE'			=> 'Escolher Modo de Módulo', 
	'CHOOSE_MODE_EXPLAIN'	=> 'Escolher the modules mode being used.', 
	'CHOOSE_MODULE'			=> 'Escolher Módulo', 
	'CHOOSE_MODULE_EXPLAIN'	=> 'Escolher o arquivo being called by this module.', 
	'CREATE_MODULE'			=> 'Criar novo Módulo', 

	'DEACTIVATED_MODULE'	=> 'Módulo Desativado', 
	'DELETE_MODULE'			=> 'Excluir Módulo', 
	'DELETE_MODULE_CONFIRM'	=> 'Você deseja realmente EXCLUIR este Módulo?', 

	'EDIT_MODULE'			=> 'Editar Módulo', 
	'EDIT_MODULE_EXPLAIN'	=> 'Aqui você pode escrever configurações específicas para os seus módulos.', 

	'HIDDEN_MODULE'			=> 'Módulo Invisível', 

	'MODULE'					=> 'Módulo', 
	'MODULE_ADDED'				=> 'O Módulo selecionado foi adicionado com sucesso.', 
	'MODULE_DELETED'			=> 'O Módulo selecionado foi excluído com sucesso.', 
	'MODULE_DISPLAYED'			=> 'Módulos Exibidos', 
	'MODULE_DISPLAYED_EXPLAIN'	=> 'Se você não deseja exibir este módulo, mas gostaria de utilizá-lo, selecione Não.', 
	'MODULE_EDITED'				=> 'O Módulo selecionado foi editado com sucesso.', 
	'MODULE_ENABLED'			=> 'Módulo Ativado', 
	'MODULE_LANGNAME'			=> 'Nome de Língua do Módulo', 
	'MODULE_LANGNAME_EXPLAIN'	=> 'Escreva the nome do módulo exibido. Utilize language constant se o nome for oferecido pelo arquivo de linguagem.', 
	'MODULE_TYPE'				=> 'Tipo de Módulo', 

	'NO_CATEGORY_TO_MODULE'	=> 'Não é possível transformar esta Categoria em Módulo. Por Favor, exclua ou mova todas as Crianças antes de efetivar esta ação.', 
	'NO_MODULE'				=> 'Nenhum módulo foi encontrado.', 
	'NO_MODULE_ID'			=> 'A ID do Módulo não foi especificada.', 
	'NO_MODULE_LANGNAME'	=> 'O Nome de Língua do Módulo não foi especificado.', 
	'NO_PARENT'				=> 'Sem Pais no momento', 

	'PARENT'				=> 'Pais', 
	'PARENT_NO_EXIST'		=> 'O Pai selecionado não existe.', 

	'SELECT_MODULE'			=> 'Selecionar um Módulo', 
)); 

?>