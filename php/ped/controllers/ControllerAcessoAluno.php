<?php
	$x = (isset ($_GET['x'])) ? $_GET['x'] : null;
	$limite = 20;
	//examino a p�gina a mostrar e o inicio do registo a mostrar
	$pagina = (isset ($_GET['pagina'])) ? $_GET['pagina'] : null;
	if (!$pagina) {
	   $inicio = 0;
	   $pagina = 1;
	} else 
		$inicio = ($pagina - 1) * $limite;
	$lista = $fachada->listarPacientes($user->getLogin());
	$total_paginas = ceil(sizeOf($lista) / $limite);
	$lista1 = $fachada->listarPacientesLimit($user->getLogin(), $inicio, $limite);
	if ((isset ($_POST['buscar'])) and ($_POST['buscar'] == "Buscar")) {
		try{
			$listacons = $fachada->consultarPacientes($_POST['valor'],$_POST['tipo'], $user->getID());
		} catch (CamposInvalidos $e) {
			$error = 1;
		}
		if ($_POST['tipo'] == "n") $a = "selected";
		if ($_POST['tipo'] == "p") $b = "selected";
		if ($_POST['tipo'] == "m") $c = "selected";
	}
	if ($x == "c"){
		$paccad = $fachada->obterPacienteAt($_GET['at']);
	}
    $show = "al";
    $valida = "a";
?>