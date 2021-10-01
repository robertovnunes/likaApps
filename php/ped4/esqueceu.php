<?php
include ("cabecalho.inc.php");
include ("ped.php");
$l = $_GET['l'];
$e = $_GET['e'];
$n = $_GET['n'];
 ?>

<div id="tabelaContent2">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <h2>Recupera&ccedil;&atilde;o de Senha</h2>
   
    <div id="content">
		<?php if(!$n) echo "<br><font color='#FF0000'> Favor preencher os campos em vermelho! </font>";?>
      <!--	<h3>Professores</h3>-->
      <div id="formContato">
      	<br/>
        <form name="formContato" method="post" action="enviaSenha.php?" class="formFale">
          <label for="nome" id="labelFormContato"><?php if(!$l && !$n) echo "<font color='#FF0000'>Login:</font></label>"; else echo "Login:</label>";?>
          <input type="text" name="tfNome"  <? if ($l && !$e) echo "value ='".$l."'";?> id="nome" maxlength="60" size ="40" class="inputFormContato" style="margin-left: 20px;" /><br />
          <br clear="all" />
          <label for="email" id="labelFormContato"><?php if(!$e && !$n) echo "<font color='#FF0000'>E-mail:</font></label>"; else echo "E-mail:</label>";?>
          <input type="text" name="tfEmail" <? if (!$l && $e) echo "value ='".$e."'";?> id="email" maxlength="60" size="40" class="inputFormContato" style="margin-left: 13px;"/><br />
          <br clear="all" />
          
          <div id="barButton">
           <input type="submit" name="voltar" id="voltar" value="Voltar" class="buttonFormContato"  onclick="action='index.php'"/>
          
            <input type="submit" name="ok" id="ok" value="Enviar para o e-mail" class="buttonFormContato"  />
          </div>
        </form>
        
       

      </div>
    </div>
    <!-- /#content -->
  </div>
  <!-- /#middle -->

<!-- /#container -->

</td></tr></table>

<? include("rodapeped.inc"); ?>
