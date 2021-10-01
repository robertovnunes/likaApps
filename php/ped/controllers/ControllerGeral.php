<?php
$array = explode("/", $_SERVER['PHP_SELF']);
$pagina = end($array);
include_once("classes/basicas/Usuario.php");
include_once("classes/Fachada.php");
$fachada = Fachada::singleton();
$msg = '';
$aba = '';
$error = 0;
$n = '';

if($pagina != "index.php" && $pagina != "esqueceu.php"){
	include_once("controllers/ControllerSession.php");
}
if (isset($_POST['flag']) and $_POST['flag'] == "logar"){
	$val = array($_POST['login'], $_POST['senha']);
	$conn = $fachada->openDB();
	try {
		$user = $fachada->autentica($val[0], $val[1]);
		session_start();
		$_SESSION['user'] = serialize($user);
		if($user->getTipo() == 'a'){
			header("Location: aluno.php");
		} else if($user->getTipo() == 'd'){
			header("Location: admin/index.php");
		}
	} catch (CamposInvalidos $e) {
		$fachada->closeDB($conn);
		$error = 1;
		$err = "*Login ou senha inv�lidos.<br />";
	}
}
?>