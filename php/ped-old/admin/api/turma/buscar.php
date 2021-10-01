<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/turma.class.php');
	
	if ( isAdmin() )
	{
		$array = array();
		if(strlen($_GET['nome']) > 0)
		{
	 		$array['nome'] = $_GET['nome'];
		}
		if(strlen($_GET['periodo']) > 0)
		{
			$array['periodo'] = $_GET['periodo'];
		}
		
		$turmas = Turma::find($array);
		
		echo list_to_json($turmas);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>