<?php
//include ("cabecalho.inc.php");
//include ("ped.php"); 



?>
<div id="tabelaContentLogado">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <h2>Editar Perfil</h2>
    <br />
    <div id="content">
      <!--	<h3>Professores</h3>-->
      <div id="formEditar">
      			
         <form name="formContato" method="post" action="confirmarEditar.php?id=<?php echo $usuario->getID();?>" class="formFale">
         
         <label for="editlogin" id="labelFormEditarPerfil"><b>Login:</b></label>
          <input type="text" name="tfLogin"  id="editlogin" maxlength="60" size ="25" class="inputFormEditarPerfil" style="margin-left: 12px;border:0px;background-color:#FFFFFF" value ="<?php echo $usuario->getLogin();?>" disabled="disabled"/>
         
         <label for="editcpf" id="labelFormEditarPerfil"><b>CPF:</b></label>
          <input type="text" name="tfCpf"  id="editcpf" maxlength="60" size ="30" class="inputFormEditarPerfil" style="border:0px;background-color:#FFFFFF"="margin-left: 0px;" value ="<?php  echo  $usuario->getCPF(); ?>" disabled="disabled" /><br />
          <br clear="all" />
		  
		   <label for="editnome" id="labelFormEditarPerfil"><b>Nome:</b></label>
          <input type="text" name="tfNome"  id="editnome" maxlength="100" size="60" cols="60" class="inputFormEditarPerfil" style="margin-left: 10px;" value="<?php if($_GET['clicou']!="ok") echo  $usuario->getNome(); else echo $_POST['tfNome'];  ?>" /><br />

		  
		  <br clear="all"/>
		  
		  <?php /*
          <label for="editlogin" id="labelFormEditarPerfil">Login:</label>
          <input type="text" name="tfLogin"  id="editlogin" maxlength="60" size ="25" class="inputFormEditarPerfil" style="margin-left: 12px;" value ="<?php echo $usuario->getLogin();?>" /><br />
          <br clear="all" />
          <label for="editSenhaAntiga" id="labelFormEditarPerfil">Senha atual:</label>
          <input type="password" name="tfSenha"  id="editSenha" maxlength="60" size ="25" class="inputFormEditarPerfil" style="margin-left: 8px;"/><br />
          <br clear="all" />*/?>
          <label for="editSenhaNova" id="labelFormEditarPerfil">*<b>Senha nova:</b></label>
          <input type="password" name="editSenhaNova"  id="editSenhaNova" maxlength="60" size ="25" class="inputFormEditarPerfil" style="margin-left: 8px;"/><br />
          <br clear="all" /> <?php /*
          <label for="editSenhaNovaConf" id="labelFormEditarPerfil">Confirmar nova senha:</label>
          <input type="text" name="editSenhaNova"  id="editSenhaNovaConf" maxlength="60" size ="25" class="inputFormEditarPerfil" style="margin-left: 8px;"/><br />
          <br clear="all" /> */?>
           <label for="editemail" id="labelFormEditarPerfil"><b>E-mail:</b></label>
          <input type="text" name="tfEmail"  id="editemail"  size ="60" class="inputFormEditarPerfil" style="margin-left: 6px;" value="<?php echo $usuario->getEmail(); ?>"/><br />
          <br clear="all" />
		  <label for="editemail" id="labelFormEditarPerfil">*<b>Confirmar e-mail:</b></label>
          <input type="text" name="tfConfEmail"  id="editconfemail"  size ="60" class="inputFormEditarPerfil" style="margin-left: 6px;" /><br />
          <br clear="all" />
          	<div id="barButtEdit">
            <input type="submit" name="voltarEdit" onclick="action='acesso_aluno.php'" id="voltarEdit" value="Voltar" class="buttonFormVoltarEditarPerfil"  />
              <input type="submit" name="editar" id="editar" value="Salvar" class="buttonFormEditarPerfil"  />
			  <br />
			  <br />
			  
            </div>
			<br />
			*Deixar em branco se n&atilde;o deseja alterar
          </div>
        </form>

      </div>
    </div>
    <!-- /#content -->
  
  <!-- /#middle -->

<!-- /#container -->

</td></tr></table>

<?php // include("rodapeped.inc");
 ?>
