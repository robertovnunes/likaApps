<?php
include("includer.php");

$atend = $_GET['at'];
$pront = $_GET['pr'];
validarProntuario($usuario->getLogin(),$pront);
$pac = obterPacientePr($usuario->getLogin(), $pront);
$sexo = $pac->sexo;
if ($_POST['novoatend'] == "Criar Novo Atendimento"){
	include("fachada.php");
	$fachada = new Fachada();
	try {
		$fachada->novoAtendimento($usuario->getID(), $pront, $sexo);	
				
	} catch (CamposInvalidos $e){
		$error = 1;
	}
}

$listaatend = SQLListaAtendimentos($pront);

$show = "alp";
$n = "atend";
?>

<?php include("acesso_aluno.php");?>