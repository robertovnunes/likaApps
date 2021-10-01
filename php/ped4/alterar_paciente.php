<?php
include("includer.php");

$pront = $_GET['pr'];
validarProntuario($usuario->getLogin(), $pront);
$paciente = obterPacientePr($usuario->getlogin(), $pront);

$cid = $paciente->idCid;
$est = $paciente->idEst;
$sql_estados = listaEstado();
$cidad = consultaCidade($cid);
if ($_POST['estado'] != "" && $_POST['estado'] != "0") $sql_cidades = listaCidade($_POST['estado']); 
else $sql_cidades = listacidade($est);
$dd = substr($paciente->dtnasc, 9, 2); 
$mm = substr($paciente->dtnasc, 5, 2);
$aa = substr($paciente->dtnasc, 0, 4);


if ($_POST['salvar'] == "Salvar"){
	include("classes/Paciente.php");
	include("fachada.php");
	$pac = new Paciente($_POST['nome'], $_POST['data'], $paciente->cns, $paciente->cpf,$paciente->sexo, $_POST['mae'],$_POST['pai'],
		$_POST['ende'], $_POST['comp'], $_POST['bair'], $_POST['cidade'], $_POST['estado'], $_POST['cep']);
	$fachada = new Fachada();
	try {
		$fachada->alterarPaciente($pac, $pront);	
		header("Location:acesso_aluno.php?x=a");
	} catch (CamposInvalidos $e){
		$error = 1;
	}
}

$n = "altpaciente";
$show = "alp";
?>

<?php include("acesso_aluno.php"); ?>
