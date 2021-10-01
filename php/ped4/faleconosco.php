<?php
include ("cabecalho.inc.php"); 

 include ("ped.php");
 $nome = $_GET['nome'];
 $email = $_GET['email'];
 $assunto = $_GET['assunto'];
 $badmail = $_GET['badmail'];
 
 $n = $_GET['n'];
 
  ?>
<div id="tabelaContent2">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <h2>Fale Conosco</h2>
    
   <?php  if((!$email || !$nome || !$assunto )&& !$n)  echo "<br><font color='#FF0000'> Favor preencher os campos em vermelho! </font>";
   else if($badmail) echo "<br><font color='#FF0000'> E-mail Inválido! </font>";?>
    <div id="content">
      <!--	<h3>Professores</h3>-->
      <div id="formContato">
      <br>
        <form name="formContato" method="post"  action ="envia.php" class="formFale">
          <label for="nome" id="labelFormContato"> <?php if(!$n && !$nome) echo "<font color='#FF0000'>Nome:</font></label>";
		  else echo "Nome:</label>";
		  ?>
          <input type="text" name="tfNome" <?php if($nome) echo "value='".$nome."' "; ?> id="nome" maxlength="60" size="40" class="inputFormContato" style="margin-left: 20px;" /><br />
          <br clear="all" />
          <label for="email" id="labelFormContato"><?php if(!$n && (!$email || $badmail)) echo "<font color='#FF0000'>E-mail:</font></label>";
		  else echo "E-mail:</label>";
		  ?>
          <input type="text" name="tfEmail" <?php if($email) echo "value='".$email."' ";  ?> id="email" maxlength="60" size="40" onChange="style='color:#FF0000'" class="inputFormContato" style="margin-left: 16px;"/><br />
          <br clear="all" />
          <label for="assunto" id="labelFormContato"><?php if(!$n && !$assunto) echo "<font color='#FF0000'>Assunto:</font></label>";
		  else echo "Assunto:</label>";
		  ?>
          <input type="text" name="tfAssunto" <?php if($assunto) echo "value='".$assunto."' "; ?> id="assunto" maxlength="60" size="40" class="inputFormContato" style="margin-left: 9px;"/><br />
          <br clear="all" />
          <br/>
          <label for="mensagem" id="labelFormContato"><?php if(!$n && !$mensagem) echo "<font color='#FF0000'>Mensagem:</font></label>";
		  else echo "Mensagem:</label>";
		  ?>
          <br/>
          <textarea name="mensagem" cols="60" rows="5"  id="mensagem" class="textareaFormContato"></textarea>
          <br clear="all" /><br />
          <div id="barButton2">
          <input type="submit" name="volar" id="voltar" value="Voltar" class="buttonFormContato"  onclick="action='index.php'"/>
            <input type="submit" name="ok" id="ok" value="Enviar mensagem" class="buttonFormContato"  />
            <input type="reset" name="limpa" id="limpa" value="Limpar dados" class="buttonFormContato" />
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
