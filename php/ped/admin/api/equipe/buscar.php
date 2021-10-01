<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/equipe.class.php');
	
	if ( isAdmin() )
	{
		$array = array();
		if(strlen($_GET['nome']) > 0)
		{
	 		$array['nome'] = $_GET['nome'];
		}
		if(strlen($_GET['descricao']) > 0)
		{
			$array['descricao'] = $_GET['descricao'];
		}
		if($_GET['idTurma'] > 0)
		{
			$array['idTurma'] = $_GET['idTurma'];
		}
		if($_GET['idModulo'] > 0)
		{
			$array['idModulo'] = $_GET['idModulo'];
		}
		
		$equipes = Equipe::find($array);
		
		echo list_to_json($equipes);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>