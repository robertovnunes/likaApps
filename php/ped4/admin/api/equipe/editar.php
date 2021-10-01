<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/equipe.class.php');
	
	if ( isAdmin() )
	{
		$id = $_POST['id'];
		$nome = substr($_POST['nome'],0,30);
		$descricao = substr($_POST['descricao'],0,60);
		$idTurma = $_POST['idTurma'];
		$idModulo = $_POST['idModulo'];
		
		$equipe = new Equipe($id, $nome, $descricao, $idTurma, $idModulo);
		$success = $equipe -> edit();	
		
		if( $success )
		{
			header('Content-type: application/json');
			$array = $equipe -> to_array();
			$list = Equipe::find($array);
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
