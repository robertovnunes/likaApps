<?php 
/** 
* 
* search [Portuguese] 
* 
* @package language 
* @version $Id: search.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
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
	'ALL_AVAILABLE'			=> 'Todos disponíveis', 
	'ALL_RESULTS'			=> 'Todos resultados', 

	'DISPLAY_RESULTS'		=> 'Exibir resultados como', 

	'FOUND_SEARCH_MATCH'		=> 'Pesquisa encontrou %d resultado', 
	'FOUND_SEARCH_MATCHES'		=> 'Pesquisa encontrou %d resultados', 
	'FOUND_MORE_SEARCH_MATCHES'	=> 'Pesquisa encontrou mais que %d resultados', 

	'GLOBAL'				=> 'Anúncio Global', 

	'IGNORED_TERMS'			=> 'Ignorados', 
	'IGNORED_TERMS_EXPLAIN'	=> 'As seguintes Palavras foram ignoradas em sua Pesquisa: <strong>%s</strong>.',
	
	'JUMP_TO_POST'			=> 'Pular para a mensagem',	

	'NO_KEYWORDS'			=> 'Você deve especificar pelo menos uma palavra para efetuar a pesquisa. Cada palavra deve ter no mínimo %d caracteres e não deve ultrapassar o limite de %d caracteres.', 
	'NO_RECENT_SEARCHES'	=> 'Nenhuma Pesquisa tem sido realizada recentemente.',
	'NO_SEARCH'				=> 'Desculpe mas você não tem permissões para utilizar o sistema de pesquisas.', 
	'NO_SEARCH_RESULTS'		=> 'Nenhum resultado foi encontrado.', 
	'NO_SEARCH_TIME'		=> 'Desculpe mas você não pode utilizar o sistema de pesquisas agora. Tente novamente em alguns minutos.', 
	'WORD_IN_NO_POST'		=> 'Nenhuma mensagem foi encontrada pois a palavra %s não foi localizada em nenhuma mensagem.', 
	'WORDS_IN_NO_POST'		=> 'Nenhuma mensagem foi encontrada pois as palavras %s não foram localizadas em nenhuma mensagem.', 

	'POST_CHARACTERS'		=> 'caracteres das mensagens', 

	'RECENT_SEARCHES'		=> 'Buscas recentes', 
	'RESULT_DAYS'			=> 'Limite de resultados anteriores', 
	'RESULT_SORT'			=> 'Classificar resultados por', 
	'RETURN_FIRST'			=> 'Retornar ao primeiro', 
	'RETURN_TO_SEARCH_ADV'	=> 'Retornar à busca avançada',
	
	'SEARCHED_FOR'				=> 'Pesquisar por termo utilizado', 
	'SEARCHED_TOPIC'			=> 'Pesquisar por tópicos', 
	'SEARCH_ALL_TERMS'			=> 'Pesquisar por todos os termos com a seguinte entrada', 
	'SEARCH_ANY_TERMS'			=> 'Pesquisar por qualquer termo', 
	'SEARCH_AUTHOR'				=> 'Pesquisar por autor', 
	'SEARCH_AUTHOR_EXPLAIN'		=> 'Use * para resultados parciais.', 
	'SEARCH_FIRST_POST'			=> 'Apenas a primeira mensagem do tópico', 
	'SEARCH_FORUMS'				=> 'Procurar em fóruns', 
	'SEARCH_FORUMS_EXPLAIN'		=> 'Selecione o fórum ou os fóruns no qual você deseja realizar a pesquisa. Para velocidade todos os sub-fóruns podem ser perquisados selecionando o fórum principal e habilitando os valores na pesquisa dos sub-fóruns abaixo.', 
	'SEARCH_IN_RESULTS'			=> 'Pesquisar por estes resultados', 
	'SEARCH_KEYWORDS_EXPLAIN'	=> 'Colocar <strong>+</strong> na frente de uma palavra que deve ser localizada e <strong>-</strong> na frente de uma palavra que não deve ser localizada. Ponha uma lista de palavras separadas por <strong>|</strong> na pesquisa se somente uma das palavras for encontrada. Use * para resultados parciais.', 
	'SEARCH_MSG_ONLY'			=> 'Somente texto da mensagem', 
	'SEARCH_OPTIONS'			=> 'Opções de pesquisa', 
	'SEARCH_QUERY'				=> 'Pergunta da pesquisa', 
	'SEARCH_SUBFORUMS'			=> 'Pesquisar por Sub-fóruns', 
	'SEARCH_TITLE_MSG'			=> 'Títulos e texto das mensagens', 
	'SEARCH_TITLE_ONLY'			=> 'Apenas títulos das mensagens', 
	'SEARCH_WITHIN'				=> 'Pesquisar dentro da mensagem', 
	'SORT_ASCENDING'			=> 'Crescente', 
	'SORT_AUTHOR'				=> 'Autor', 
	'SORT_DESCENDING'			=> 'Decrescente', 
	'SORT_FORUM'				=> 'Fórum', 
	'SORT_POST_SUBJECT'			=> 'Assunto da mensagem', 
	'SORT_TIME'					=> 'Tempo da mensagem', 

	'TOO_FEW_AUTHOR_CHARS'	=> 'Você deve especidificar pelo menos %d do nome do autor.', 
)); 

?>
