<?php
@session_start();
if (isset($_SESSION['user']))
{
	$conn = $fachada->openDB();
	$user = unserialize($_SESSION['user']);
	$tipou = $user->getTipo();
//	echo "=====".$user->getLogin();
	if($tipou != 'a' && $tipou != 'p' && $tipou != 'd'){
		mysql_close($conn);
		header("Location: naoautorizado.php");
	}
	if($tipou == 'a'){
		if ((isset ($_GET['pr'])) and ($_GET['pr'] && !$fachada->validarProntuario($user->getLogin(), $_GET['pr']))){
			header("Location: naoautorizado.php");
		} else if ((isset ($_GET['at'])) and ($_GET['at'] && !$fachada->validarAtendimento($user->getLogin(), $_GET['at']))){
			header("Location: naoautorizado.php");
		}
	} else 	if($tipou == 'p'){
		//header("Location: naoautorizado.php");
	} else 	if($tipou == 'd'){
		//header("Location: naoautorizado.php");
	}
} else {
	header("Location: index.php?x=naoautorizado");
}
?>