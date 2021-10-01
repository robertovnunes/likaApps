<?php
function to_json($object)
{
	$array = $object -> to_array();
	
	foreach($array as $k => $v)
	{
		$ret = sprintf("%s'%s':'%s',",$ret,$k,$v);
	}
	
	$ret = substr($ret,0,strlen($ret)-1);
	$ret = '{'.$ret.'}';
	
	return $ret;
}

function list_to_json($objects)
{
	$novo_array = array_map(to_json, $objects);
	
	$ret = '['.join(',',$novo_array).']';
	
	return $ret;
}

function isAdmin()
{
	include_once $_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/usuario.class.php';
	@session_start();
	
	$ret = false;
	if ( isset($_SESSION['usuario']) )
	{
		$usuario = unserialize($_SESSION['usuario']);
		if( $usuario -> getTipo() == 'd' )
		{
			$ret = true;
		}
	}
	
	return $ret;
}
?>
