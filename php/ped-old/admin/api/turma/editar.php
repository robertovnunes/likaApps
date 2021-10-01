<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/turma.class.php');
	
	if ( isAdmin() )
	{
		$id = $_POST['id'];
		$nome = substr($_POST['nome'],0,30);
		$periodo = substr($_POST['periodo'],0,20);
		
		$turma = new Turma($id, $nome, $periodo);
		$success = $turma -> edit();	
		if( $success )
		{
			header('Content-type: application/json');
			$array = $turma -> to_array();
			$list = Turma::find($array);
			echo to_json($list[0]);
		}
		else
		{
			header('Content-type: application/json');
			header('HTTP/1.1 400 Bad Request');
			echo "Erro";
		}
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>
