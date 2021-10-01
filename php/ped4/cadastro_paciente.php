<?php
include("includer.php");

$sql_estados = listaEstado();
$sql_cidades = listaCidade($_POST['estado']);

if ($_POST['salvar'] == "Salvar"){
	include("classes/Paciente.php");
	include("fachada.php");
	$paciente = new Paciente($_POST['nome'], $_POST['data'], $_POST['cns'], $_POST['cpf'], $_POST['sexo'], $_POST['mae'],
		$_POST['pai'], $_POST['ende'], $_POST['comp'], $_POST['bair'], $_POST['cidade'], $_POST['estado'], $_POST['cep']);
	$fachada = new Fachada();
	try {
		$idAtendimento = $fachada->cadastrarPaciente($paciente,$usuario->getLogin());	
		header("Location:prontuario_paciente.php?at=$idAtendimento");
	} catch (CamposInvalidos $e) {
		$error = 1;
	}
}

//$show = "alp";
$n = "cadpaciente";
$height = "375";
?>

<?php include("acesso_aluno.php");?>
