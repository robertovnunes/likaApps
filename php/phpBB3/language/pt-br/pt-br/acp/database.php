<?php 
/** 
* 
* acp_database [Portuguese] 
* 
* @package language 
* @version $Id: database.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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

// Database Backup/Restore 
$lang = array_merge($lang, array( 
	'ACP_BACKUP_EXPLAIN'	=> 'Aqui você pode fazer backup de todas as informações relativas ao seu phpBB. Você pode salvar os resultados em um arquivo na sua pasta <samp>/store</samp> ou baixá-lo diretamente. Dependendo das configurações do seu servidor, você poderá comprimir o arquivo em diversos formatos.',
	'ACP_RESTORE_EXPLAIN'	=> 'Esta operação irá restaurar todas as tabelas do phpBB contidas no arquivo. Se seu servidor suportar compressão de arquivos de texto gzip ou bzpi2 ela será automaticamente descompremida. <strong>ATENÇÃO</strong> Todas as informações existentes serão substituidas. A restauração pode demorar, aguarde o processo ser concluído.', 

	'BACKUP_DELETE'		=> 'O arquivo de backup foi excluído com sucesso.', 
	'BACKUP_INVALID'	=> 'O arquivo selecionado para backup é inválido.', 
	'BACKUP_OPTIONS'	=> 'Opções de Backup', 
	'BACKUP_SUCCESS'	=> 'O arquivo de backuo foi criado com sucesso.', 
	'BACKUP_TYPE'		=> 'Típo de Backup', 

	'DATABASE'			=> 'Ferramentas de Banco de Dados', 
	'DATA_ONLY'			=> 'Somente dados', 
	'DELETE_BACKUP'		=> 'Excluir backup', 
	'DELETE_SELECTED_BACKUP'	=> 'Você tem certeza que deseja excluir o backup do banco de dados selecionado?',
	'DESELECT_ALL'		=> 'Desmarcar todos', 
	'DOWNLOAD_BACKUP'	=> 'Baixar backup', 

	'FILE_TYPE'			=> 'Típo de arquivo', 
	'FULL_BACKUP'		=> 'Completo', 

	'RESTORE_FAILURE'		=> 'O arquivo de backup deve estar corrompido.',
	'RESTORE_OPTIONS'		=> 'Opções de restauração', 
	'RESTORE_SUCCESS'		=> 'O banco de dados foi reataurado com sucesso.<br /><br />Seu fórum deve estar de volta ao que era quando o backup foi feito.', 

	'SELECT_ALL'			=> 'Marcar todas', 
	'SELECT_FILE'			=> 'Selecionar o arquivo', 
	'START_BACKUP'			=> 'Iniciar backup', 
	'START_RESTORE'			=> 'Iniciar restauração', 
	'STORE_AND_DOWNLOAD'	=> 'Armazenar e baixar', 
	'STORE_LOCAL'			=> 'Armazenar o arquivo localmente', 
	'STRUCTURE_ONLY'		=> 'Somente estrutura', 

	'TABLE_SELECT'		=> 'Seleção de tabelas',
	'TABLE_SELECT_ERROR'=> 'Você deve selecionar pelo menos uma tabela.',	
)); 

?>
