
<?php
if ($n == "") include("includer.php");

$x = $_GET['x'];
$sql_pacientes = SQLlistarPacientes($usuario->getLogin());
$show = "al";
$valida = "a"; ?>
<?php 
include ("cabecalho.inc.php"); 
include ("painelLogado.php");
include("ped.php");

 ?>
<div id="contentAluno">

 <div id="dataHora"><?php include("menugeral.inc");?> </div>
<table width="760" bgcolor="#FFFFFF"  style="background-attachment: scroll;background-repeat: no-repeat-x;" >
 
    <tr>
	<td>
	<table width="300" cellpadding="0" cellspacing="0" >
	<tr>
	<td background="images/Tela_01_r4_c3.gif" height="41" width="151">
    <div id="textoListaPaciente">
	<u1><a onclick="muda('','','a')">Lista de Pacientes</a></u1></div>
	</td>
	<td background="images/Tela_01_r4_c6.gif">
    	   <div id="textoCadastrarPaciente">
           <u1><a onclick="muda('','','n');" >Cadastrar Paciente</a></u1></div>
	</td>
	</table>
	<td>




	</tr>
	<tr>
		<?php 
				    if (mysql_num_rows($sql_pacientes) == 0) {
					
					  echo '<td height="200"  width="637">';
					  }
		             else echo '<td height="200"  width="637">';?>
        	
			<div>
			<?php
				if ($n == ""){
				  if($_GET['n'] != "editPerfil") include("telas/form_acesso_aluno.php");
				  else include("editarPerfil.php");
				}
				else if ($n == "cadpaciente") include("telas/form_cadastro_paciente.php");
				else if ($n == "altpaciente") include("telas/form_alterar_paciente.php");
				else if ($n == "prontpaciente") include("telas/form_prontuario_paciente.php");
				else if ($n == "histpaciente") include("telas/form_historico_paciente.php");
				else if ($n == "naoautorizado") include("telas/tela_naoautorizado.php");
				else if ($n == "sucesso") include("telas/tela_sucesso.php");
				else if ($n == "atend") include("telas/telalista_atendimentos.php");
			?>
			</div>
			<br /><br />
			</td>
      	</tr>
    </tbody>
</table>


<?php include("rodapeped.inc"); ?>
</div>