<?php 
/** 
* 
* help_bbcode [Portuguese] 
* 
* @package language 
* @version $Id: help_bbcode.php,v 1.0 2007/19/04 01:12:00 Suporte phpBB Exp $ 
* @copyright (c) 2007 Suporte phpBB
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
* @Traduzido por:
* @Suporte phpBB - <http://www.suportephpbb.org/>
* 
*/ 

/** 
*/ 

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

$help = array( 
   array( 
      0 => '--', 
      1 => 'Introdução' 
   ), 
   array( 
      0 => 'O que é BBCode?', 
      1 => 'BBCode é uma implementação especial de HTML. Você pode utilizar BBCode em suas mensagens no fórum, os permitidos são determinados pelo administrador. Em edição de mensagens você pode tanto desabilitar como adicionar/modificar os BBCodes via formulário de envio de mensagens. O BBCode em sí é parecido com o HTML, porém suas tags são cercadas em chaves "[ e ]" em vez de &lt; e &gt; e isto oferece maior controle para algum item que será exibido. Contando com o modelo você está utilizando você pode utilizar os BBCodes de maneira muito mais rápida e fácil, basta clicar sobre os botões no topo do formulário de mensagem, isto pode ser utilizado tanto para publicação de novos tópicos como para edição dos mesmos. Neste segundo guia vamos aprender a como utilizar os BBCodes e quais as modificações que eles fazem no texto.' 
   ), 
   array( 
      0 => '--', 
      1 => 'Formatando o Texto' 
   ), 
   array( 
      0 => 'Como deixar o texto em itálico, sublinhado ou em negrito', 
      1 => 'BBCode inclui tags para que permitem que você edite de forma rápida e fácil o seu texto. Você pode realizar tais modificações das seguintes formas: <ul><li>Para deixar uma parte do texto (ou ele por completo, porém adicionando no início do texto) você deve utilizar a tag <strong>[b][/b]</strong>, eg. <br /><br /><strong>[b]</strong>Olá<strong>[/b]</strong><br /><br /> vai se tornar <strong>Olá</strong></li><li>Para tornar o texto sublinhado utilize a tag <strong>[u][/u]</strong>, por exemplo:<br /><br /><strong>[u]</strong>Bom Dia<strong>[/u]</strong><br /><br /> torna-se <u>Good Morning</u></li><li>Para deixar o texto em itálico utilize a tag <strong>[i][/i]</strong>, eg.<br /><br />Isto está <strong>[i]</strong>Grande!<strong>[/i]</strong><br /><br />vai ficar Isto está <i>Grande!</i></li></ul>' 
   ), 
   array( 
      0 => 'Como modificar a cor e tamanho do texto', 
      1 => 'Para alterar a cor ou tamanho do texto você pode utilizar as seguintes tags. Lembrando que qualidade da formatação aparece dependendo do navegador e do sistema do usuário: <ul><li>Para modificar a cor do texto você precisa utilizar a tag <strong>[color=][/color]</strong>. Você pode especificar uma cor utilizando o nome da mesma em inglês (eg. red, blue, yellow, etc.) ou utilizando valor hexadecimais, eg. #FFFFFF, #000000. Por exemplo, para criar um texto com a cor vermelha você deve utilizar a seguinte tag:<br /><br /><strong>[color=red]</strong>Olá!<strong>[/color]</strong><br /><br />or<br /><br /><strong>[color=#FF0000]</strong>Olá!<strong>[/color]</strong><br /><br />para ambas modificações fica <span style="color:red">Olá!</span></li><li>Para modificar o tamanho do texto seguimos um caminho parecido, para isto utilizamos as tags <strong>[size=][/size]</strong>. Esta tag depende do template do fórum, pois cada template tem características diferentes, conseqüentemente o tamanho padrão da fonte é diferente das demais. Este BBCode começa em 1 (assim pequeninho você não verá isto) até 29 (muito grande). Por exemplo:<br /><br /><strong>[size=9]</strong>PEQUENO<strong>[/size]</strong><br /><br />geralmente será <span style="font-size:9px;">PEQUENO</span><br /><br />whereas:<br /><br /><strong>[size=24]</strong>ENORME!<strong>[/size]</strong><br /><br />fica <span style="font-size:24px;">ENORME!</span></li></ul>' 
   ), 
   array( 
      0 => 'Eu posso unir as tags?', 
      1 => 'Sim, certamente você pode, neste exemplo vamos juntar as tags de alteração de cor e medida do texto:<br /><br /><strong>[size=18][color=red][b]</strong>ME OLHE!<strong>[/b][/color][/size]</strong><br /><br />isso fica <span style="color:red;font-size:18px;"><strong>ME OLHE!</strong></span><br /><br />Você deve sempre verificar se as tags foram fechamadas e organizadas corretamente, se não foram as alteração ficam contidas em todo o restante do texto. Um exemplo de como não deve ser feito:<br /><br /><strong>[b][u]</strong>Isso não deve ser feito<strong>[/b][/u]</strong>' 
   ), 
   array( 
      0 => '--', 
      1 => 'Citando um texto completo ou uma parte do texto' 
   ), 
   array( 
      0 => 'Citando texto em respostas', 
      1 => 'Você pode citar de duas maneiras uma resposta, uma das maneiras é com refência e a outra sem referência.<ul><li>Quando você utiliza a função de citar uma resposta o texto é adicionado para dentro de uma janela de mensagem cercada por um <strong>[quote=""][/quote]</strong> bloco. Esse método permite que você cite o texto com uma referência para uma pessoa! Por exemplo para você citar um trecho do texto do Mr. Blobby você poderia digitar da seguinte maneira:<br /><br /><strong>[quote="Mr. Blobby"]</strong>O texto que o Mr. Blobby escreveu poderia vir aqui<strong>[/quote]</strong><br /><br />Com isto é adicionado automaticamente o trecho "Mr. Blobby escreveu" antes do atual texto. Lembre-se que você <strong>deve</strong> incluir as aspas "" em volta do nome que está sendo citado, isto não é opcional. </li><li>O segundo método permite que você cite o texto sem referência a nenhum usuário. Para fazer isto basta deixar o texto cercado por estas <strong>[quote][/quote]</strong> tags. Quando você faz isto o texto citado aparece da seguinte maneira, Citação: adicione as tags antes do texto.</li></ul>' 
   ), 
   array( 
      0 => 'Deixando o texto completo em forma de código ou apenas uma parte dele', 
      1 => 'Se você deseja deixar o texto todo em formato de código ou até mesmo uma parte dele você devê cercar o texto com essas <strong>[code][/code]</strong> tags, eg.<br /><br /><strong>[code]</strong>echo "Isto é algum código";<strong>[/code]</strong><br /><br />Todo texto contido dentro das tags <strong>[code][/code]</strong> pode ser modificado e retirado da tag furutamente.' 
   ), 
   array( 
      0 => '--', 
      1 => 'Gerando listas' 
   ), 
   array( 
      0 => 'Criando uma lista não-ordenada', 
      1 => 'BBCode suporta dois tipos de listas, as ordenadas e as não-ordenadas. Eles são iguais ao seu código em HTML, apenas muda o formato da tag. Uma lista não-ordenada cria cada ítem em forma seqüencial. Para criar uma lista não-ordenada você deve usar <strong>[list][/list]</strong> e definir cada marcador dentro da lista usando <strong>[*]</strong>. Por exemplo, para as suas cores favoritas você poderia fazer da seguinte maneira:<br /><br /><strong>[list]</strong><br /><strong>[*]</strong>Vermelho<br /><strong>[*]</strong>Azul<br /><strong>[*]</strong>Amarelo<br /><strong>[/list]</strong><br /><br />Isto vai gerar a seguinte lista: <ul><li>Vermelho</li><li>Azul</li><li>Amarelo</li></ul>' 
   ), 
   array( 
      0 => 'Criando uma lista ordenada', 
      1 => 'O segundo tipo de lista é uma lista ordenada que você pode controlar. Para criar uma lista ordenada use <strong>[list=1][/list]</strong> para criar uma lista numerada ou alternativa e <strong>[list=a][/list]</strong> para criar uma lista alfabética. É como nas listas não-ordenadas que os itens são especificados usando <strong>[*]</strong>. Por exemplo:<br /><br /><strong>[list=1]</strong><br /><strong>[*]</strong>Vá às lojas<br /><strong>[*]</strong>Compre um novo computador<br /><strong>[*]</strong>Compre com garantia e mande para o conserto se estragar<br /><strong>[/list]</strong><br /><br />Isto vai gerar o seguinte:<ol type="1"><li>Vá às lojas</li><li>Compre um novo computador</li><li>Compre com garantia e mande para o conserto se estragar</li></ol>Para uma lista alfabética você poderia fazer da seguinte maneira:<br /><br /><strong>[list=a]</strong><br /><strong>[*]</strong>A primeira possível resposta<br /><strong>[*]</strong>A segunda possível resposta<br /><strong>[*]</strong>A terceira possível resposta<br /><strong>[/list]</strong><br /><br />gerando<ol type="a"><li>A primeira possível resposta</li><li>A segunda possível resposta</li><li>A terceira possível resposta</li></ol>' 
   ), 
   array( 
      0 => '--', 
      1 => 'Criando links' 
   ), 
   array( 
      0 => 'Linkando para outro site', 
      1 => 'phpBB BBCode suporta um número de destinos para criar os URIs, Uniform Resource Indicators, mais conhecidos como URLs.<ul><li>Por início precisamos utilizar a tag <strong>[url=][/url]</strong>, você deve digitar depois do = o destino do link. Por exemplo, para criar um link que leve o usuário para o phpBB.com você deve fazer da seguinte maneira:<br /><br /><strong>[url=http://www.phpbb.com/]</strong>Visite o phpBB!<strong>[/url]</strong><br /><br />Para fazer com que o link abra em uma nova janela o phpBB você deve fazer da seguinte maneira: <a href="http://www.phpbb.com/" target="_blank">Visite o phpBB!</a> Basta adicionar o target="_blank", que faz com que o link abra uma nova página</li><li>Para fazer a URL ser exibida na mesma página, o que vimos primeiro, basta fazer da seguinte forma:<br /><br /><strong>[url]</strong>http://www.phpbb.com/<strong>[/url]</strong><br /><br />Isto faria a segunda ligação, ou seja, abrindo em uma nova página: <a href="http://www.phpbb.com/" target="_blank">http://www.phpbb.com/</a></li><li>O phpBB tem um recurso extra chamado <i>Links Mágicos</i>, isto cria automáticamente a URL correta em um link, sem necessidade de incluir a tag e até mesmo de especificar o endereço. Por exemplo, se você digitar www.phpbb.com dentro da sua mensagem nós automáticamente linkaremos para <a href="http://www.phpbb.com/" target="_blank">www.phpbb.com</a> tais alterações são feitas ao visualizar a sua mensagem.</li><li>Para inserir um link para envio de mensagens para um endereço de e-mail você pode fazer da seguinte forma:<br /><br /><strong>[email]</strong>email@servidor.com.br<strong>[/email]</strong><br /><br />vai se tornar <a href="mailto:email@servidor.com.br">email@servidor.com.br</a> ou você pode simplesmente digitar email@servidor.com.br dentra da sua mensagem para que o mesmo seja convertido automáticamente em link após o envio da mensagem.</li></ul>Como com todas as outras tags do BBCode você pode juntar duas ou mais tags e formar algo como, <strong>[img][/img]</strong> (veja o próximo exemplo), <strong>[b][/b]</strong>, etc. Como com as tags de formato de texto você deve ter certeza que as tags estão organizadas e corretas, por exemplo:<br /><br /><strong>[url=http://www.google.com/][img]</strong>http://www.google.com/intl/en_ALL/images/logo.gif<strong>[/url][/img]</strong><br /><br />isso <u>não</u> é correto e com isto sua mensagem pode ser deletada.' 
   ), 
   array( 
      0 => '--', 
      1 => 'Exibir imagens nas mensagens' 
   ), 
   array( 
      0 => 'Adicionando uma imagem em uma mensagem', 
      1 => 'phpBB BBCode incorpora uma tag que permite que você adicione imagens nas suas mensagens. Duas coisas muito importantes sobre tal são: muitos usuários não apreciam muitas imagens em uma mensagem, tanto pela velocidade da conexão do mesmo quanto pela resolução que ele possa estar utilizando. O outro ponto forte é que você deve ver se o endereço da imagem continua disponivel (isso não pode existir unicamente no seu computador, a não ser que você tenha um webserver!). Para exibir uma imagem você deve colocar o endereço da mesma dentro da tag <strong>[img][/img]</strong>. Por exemplo:<br /><br /><strong>[img]</strong>http://www.google.com/intl/en_ALL/images/logo.gif<strong>[/img]</strong><br /><br />Como notado na URL acima você pode adicionar uma imagem em uma <strong>[url][/url]</strong> tag da sua escolha, eg.<br /><br /><strong>[url=http://www.google.com/][img]</strong>http://www.google.com/intl/en_ALL/images/logo.gif<strong>[/img][/url]</strong><br /><br />would generate:<br /><br /><a href="http://www.google.com/" target="_blank"><img src="http://www.google.com/intl/en_ALL/images/logo.gif" alt="" /></a>' 
   ), 
   array( 
      0 => 'Anexando arquivos na mensagem', 
      1 => 'A tag de anexar arquivos pode ser inserida em qualquer local do post pois utiliza o novo <strong>[attachment=][/attachment]</strong> BBCode, isso se o recurso de anexar arquivos foi ativado pelo administrador do fórum &amp; se isto foi ativado você pode anexar livremente arquivos em suas mensagens. Dentro da tela de publicação de mensagens vai ter uma bloco onde pode anexar um ou mais arquivos.' 
   ), 
   array( 
      0 => '--', 
      1 => 'Outras matérias' 
   ), 
   array( 
      0 => 'Eu posso adicionar minhas próprias tags?', 
      1 => 'Se você é um administrador ou tiver permissões para tal, além disso você pode adicionar BBCodes atravéz da seção Custom BBCodes.' 
   ) 
); 

?>