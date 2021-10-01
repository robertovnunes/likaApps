<?php
include ("cabecalho.inc.php");
include ("ped.php");
include("dbconfig.php");
include ("funcoes_bd.php");
$l = $_POST['tfLogin'];
$c = $_POST['tfCpf'];

$nome = $_POST['tfNome'];
$senha = $_POST['editSenhaNova'];
$email = $_POST['tfEmail'];
$emailConf = $_POST['tfConfEmail'];
$id = $_GET['id'];
$erro = false;
$alterou=false;

?>
	<div id="tabelaContent2">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <font size="4"><b>Editar Perfil</b></font>
    <br />
    <div id="content"> 
    

<?php
	echo "<div id = 'mensagensErroNome'><br/><br/>";
	if($nome != getNomeAluno($id) && strlen($nome) > 5) {
		alteraNomeAluno($id, $nome);
		echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font > Nome alterado. </font> ";	
		$alterou = true;
		
	}else if(strlen($nome) < 5){
		 for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font color='#FF0000'> Nome muito curto. </font> ";
		$erro=true;
	}
	if(strlen($senha) > 4){
		alteraSenhaAluno($id, $senha);
		$alterou = true;
		echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font > Senha alterada. </font> ";	
	}else if ($senha !="") {
		echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font color='#FF0000'> Senha curta.Digite uma senha com pelo menos 5 caracteres. </font> ";
	 $erro=true;
	}
	if($email != getEmailAluno($id)){
		$pattern = "^([A-Z_a-z])+.+@([a-zA-Z])+";
	    if((ereg($pattern,$email) == false) && (ereg($pattern,$emailConf) == false)) {
				$erro=true;       
			   echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font color='#FF0000'> Formato de e-mail inv&aacute;lido. </font> ";
			   
		}else if($email == $emailConf){
				
				alteraEmailAluno($id, $email);
				$alterou = true;
				echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font > Email alterado. </font> ";	
		}else {
		
			echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font color='#FF0000'> Email e confirma&ccedil;&atilde;o de email n&atilde;o conferem. </font> ";
			$erro=true;
			   
			
		}
			    
		
		?>
    	
		<?php 
	}
	if(!$alterou) {
       	 echo "<br/>"; for($i = 0; $i < 30; $i++) echo "&nbsp;"; echo"<font color='#FF0000'> Nenhum dado alterado. </font> ";
        }
	echo "</div>";
	 for($i = 0; $i < 42; $i++) echo "&nbsp;";
	echo"<a href='"; 
	if($erro) echo "acesso_aluno.php?n=editPerfil";
	else echo "acesso_aluno.php";  
	echo "'>voltar</a>";
 ?>

		
 
 </div>

</div>
</td></tr></table>

<?php


include("rodapeped.inc");



?>

