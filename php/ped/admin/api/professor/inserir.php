<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/professor.class.php');
	
	if ( isAdmin() )
	{
		$id = 0;
		$nome = substr($_POST['nome'],0,50);
		$cpf = substr($_POST['cpf'],0,14);
		$login = substr($_POST['login'],0,15);
		$senha = substr($_POST['senha'],0,15);
		
		$professor = new Professor($id, $nome, $cpf, $login, $senha);
		$success = $professor -> insert();	
		
		if( $success )
		{
			header('Content-type: application/json');
			$array = $professor -> to_array();
			$list = Professor::find($array);
			echo to_json($list[0]);
		}
		else
		{
			header('Content-type: application/json');
			header('HTTP/1.1 400 Bad Request');
			echo "Turma já existente!";
		}
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>