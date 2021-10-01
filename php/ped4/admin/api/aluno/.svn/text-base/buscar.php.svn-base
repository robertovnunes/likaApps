<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/aluno.class.php');
	
	if ( isAdmin() )
	{
		$array = array();
		if(strlen($_GET['nome']) > 0)
		{
	 		$array['nome'] = $_GET['nome'];
		}
		if(strlen($_GET['cpf']) > 0)
		{
			$array['cpf'] = $_GET['cpf'];
		}
		if(strlen($_GET['login']) > 0)
		{
	 		$array['login'] = $_GET['login'];
		}
		if($_GET['idEquipe'] > 0)
		{
			$array['idEquipe'] = $_GET['idEquipe'];
		}
		
		$alunos = Aluno::find($array);
		
		echo list_to_json($alunos);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>