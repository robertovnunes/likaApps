<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/aluno.class.php');
	
	if ( isAdmin() )
	{
		$id = $_POST['id'];
		$nome = substr($_POST['nome'],0,50);
		$cpf = substr($_POST['cpf'],0,14);
		$login = substr($_POST['login'],0,15);
		$senha = substr($_POST['senha'],0,15);
		$idEquipe = $_POST['idEquipe'];
		$email = $_POST['email'];
		
		$aluno = new Aluno($id, $nome, $cpf, $login, $senha, $idEquipe,$email);
		$success = $aluno -> edit();	
		
		if( $success )
		{
			header('Content-type: application/json');
			$array = $aluno -> to_array();
			$list = Aluno::find($array);
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