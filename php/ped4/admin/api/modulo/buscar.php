<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/modulo.class.php');
	
	if ( isAdmin() )
	{
		$array = array();
		if(strlen($_GET['nome']) > 0)
		{
	 		$array['nome'] = $_GET['nome'];
		}
		if(strlen($_GET['objetivo']) > 0)
		{
			$array['objetivo'] = $_GET['objetivo'];
		}
		if(strlen($_GET['descricao']) > 0)
		{
			$array['descricao'] = $_GET['descricao'];
		}
		
		$modulos = Modulo::find($array);
		
		echo list_to_json($modulos);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>