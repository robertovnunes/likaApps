<?php
class Turma
{
	private $id;
	private $nome;
	private $perido;
	
	public function Turma($id, $nome,$periodo)
	{
		$this -> id = $id;
		$this -> nome = $nome;
		$this -> periodo = $periodo;
	}
	
	public function to_array()
	{
		$ret['id'] = $this -> id;
		$ret['nome'] = $this -> nome;
		$ret['periodo'] = $this -> periodo;
		
		return $ret;
	}
	
	public function getId()
	{
		return $this -> id;
	}
	
	public function getNome()
	{
		return $this -> nome;
	}
	
	public function getPeriodo()
	{
		return $this -> periodo;
	}
	
	public function setId($id)
	{
		$this -> id = $id;
	}
	
	public function setNome($nome)
	{
		$this -> nome = $nome;
	}
	
	public function setPeriodo($periodo)
	{
		$this -> periodo = $periodo;
	}
	
	public function insert()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("insert into turma (turma,periodo) values('%s','%s')", mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> periodo));
		$result = mysql_query($query);
		
		return $result;		
	}
	
	public function edit()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("update turma set turma = '%s', periodo = '%s' where idTurm = %d",mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> periodo), $this -> id);
		$result = mysql_query($query);
				
		return $result;
	}
	
	public function delete()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("delete from turma where idTurma = %d", $this -> id);
		$result = mysql_query($query);
						
		return $result;
	}
	
	public static function all()
	{
		$ret = Turma::gql("");
		return $ret;
	}
	
	public static function find($array)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$temp = array();
		
		if(array_key_exists("nome",$array))
		{
			array_push($temp,"turma LIKE '%".mysql_real_escape_string($array['nome'])."%'");
		}
		
		if(array_key_exists("periodo",$array))
		{
			array_push($temp,"periodo LIKE '%".mysql_real_escape_string($array['periodo'])."%'");
		}
	
		$gql_query = implode(" AND ",$temp);
		if(strlen($gql_query) > 0)
		{
			$gql_query = "WHERE ".$gql_query;
		}
		
		$ret = Turma::gql($gql_query);
		
		return $ret;
	}
	
	public static function gql($gql_query)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = "select * from turma ".$gql_query;
		$result = mysql_query($query);
		
		$ret = array();
		if( $result )
		{
			while ( $row = mysql_fetch_assoc($result) ) 
			{
			    $id = $row['idTurma'];
				$nome = $row['turma'];
				$periodo = $row['periodo'];
				array_push ($ret, new Turma($id, $nome, $periodo));
			}
			mysql_free_result($result);
		}
		
		return $ret;
	}
}
?>
