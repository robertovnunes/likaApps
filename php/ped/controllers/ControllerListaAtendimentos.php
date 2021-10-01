<?php 
$atend = (isset($_GET['at'])) ? $_GET['at'] : '';
$pront = $_GET['pr'];
$pac = $fachada->obterPacientePr($pront);
$sexo = $pac->getSexo();
$flag = 0;
$error = 0;

if ((isset($_POST['novoatend'])) and ($_POST['novoatend'] == "Criar Novo Atendimento")){
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