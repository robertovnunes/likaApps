<?php 
$atend = $_GET['at'];
$pront = $_GET['pr'];
$pac = $fachada->obterPacientePr($pront);
$sexo = $pac->getSexo();

if ($_POST['novoatend'] == "Criar Novo Atendimento"){
	$flag = 1;
	try {
		$atend = $fachada->novoAtendimento($user->getID(), $pront, $sexo);	
		header("Location:prontuario_paciente.php?at=".$atend);
	} catch (CamposInvalidos $e){
		$error = 1;
	}
}

$listaatend = $fachada->listaAtendimentos($pront);

$show = "alp";
?>