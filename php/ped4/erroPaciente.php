<?php
include ("cabecalho.inc.php");
include ("ped.php");
include ("includer.php");



	include("classes/Paciente.php");
	include("fachada.php");
	$paciente = new Paciente($_POST['nome'],codificarStringBuscaFonetica($_POST['nome']), $_POST['data'], $_POST['cns'], $_POST['cpf'], $_POST['sexo'], $_POST['mae'],
		$_POST['pai'], $_POST['ende'], $_POST['comp'], $_POST['bair'], $_POST['cidade'], $_POST['estado'], $_POST['cep']);
		
    
    
		
	$fachada = new Fachada();
	try {
		if(!$fachada->existe($paciente)){
		 	$idAtendimento = $fachada->cadastrarPaciente($paciente,$usuario->getLogin());
		 	header("Location:prontuario_paciente.php?at=$idAtendimento");
		}
		else  {
		     header("Location:erroPaciente.php");
			 
		}
	} catch (CamposInvalidos $e) {
		$error = 1;
	}


//$show = "alp";

?>

<div id="tabelaContent2">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <h3>Cadastro de Paciente</h3>
   
    <div id="content">
		<br/>O usu&aacute;rio tentou cadastrar o seguinte paciente:
      <!--	<h3>Professores</h3>-->
      <br/><br/>
      <h4>Dados pessoais</h4><br>
      <b>Nome:</b> <?php echo $_GET['nome'];?> &nbsp;&nbsp;&nbsp;&nbsp;<b>Data de nascimento:</b> <?php  echo $_GET['data']; ?>
      &nbsp;&nbsp;&nbsp;&nbsp;<b>Sexo:</b> <?php echo $_GET['sexo'];?>&nbsp;&nbsp;&nbsp;&nbsp;<b>CPF:</b> <?php echo $_GET['cpf'];?>
      <br>
      <b>Nome da m&atilde;e: </b><?php echo $_GET['mae'];?> &nbsp;&nbsp;&nbsp;&nbsp; <b>Nome do pai: </b><?php echo $_GET['pai'];?>
      
      <br/><br/><br/>
      <h4>Paciente(s) semelhante(s) est&aacute;/est&atilde;o cadastrado(s) em nosso banco de dados:</h4><br>
      <?php 
     
	echo '<table width="625" cellspacing="2" >';
	$sql = consultaPacienteHashNome(codificarStringBuscaFonetica($_POST['nome']));
	while($dados = mysql_fetch_array($sql)){
		$atend = getUltimoAtendimento($dados['idPront']); ?>
		<tr bgcolor="#C0C0C0" class="style5">
			<td width="169" height="22"><font color="#263A5A"><b><?php echo $dados['nome'];?></font></b></td>
			<td width="63" align="center"><font color="#263A5A"><b><?php echo $dados['idPront'];?></font></b></td>
			<td width="90" align="center"><font color="#263A5A"><b><?php echo printData($dados['dtnasc']); ?></font></b></td>
			<td width="164"><font color="#263A5A"><b><?php echo $dados['mae'];?></font></b></td>
			<td width="115"><div align="center"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr align="center">
					<td width="23"><a href='alterar_paciente.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/user.png" width="16" height="16" title="Editar cadastro do paciente" /></a></td>
					<td width="23"><a href='historico_paciente.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/list_users.gif" width="16" height="16" title="Hist&oacute;rico do paciente" /></a></td>
					<td width="23"><a href='prontuario_paciente.php?at=<?php echo $atend;?>'><img src="images/icons/page_edit.gif" width=
					"16" height="16" title="&Uacute;ltimo Atendimento" /></a></td>
					<td width="23"><a href='lista_atendimentos.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/folder.gif" width="16" height="16" title="Atendimentos anteriores" /></a></td>
				</tr>
			</table></div></td>
		</tr>
	<?php } 
	echo '</table>';
 ?>	
		<br>
       Clique <a href=cadastro_paciente.php?er=1&nome=<?php echo $_GET['nome']?>&data=<?php  echo $_GET['data']; ?>&sexo=<?php  echo $_GET['sexo']; ?>&cpf=<?php  echo $_GET['cpf']; ?>&mae=<?php  echo $_GET['mae']; ?>&pai=<?php  echo $_GET['pai']; ?>>aqui </a>para ignorar o aviso e continuar salvando.

      </div>
    </div>
    <!-- /#content -->
  </div>
  <!-- /#middle -->

<!-- /#container -->

</td></tr></table>

<? include("rodapeped.inc"); ?>


