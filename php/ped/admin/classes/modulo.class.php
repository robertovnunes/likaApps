<?php
class Modulo
{
	private $id;
	private $nome;
	private $objetivo;
	private $descricao;
	
	public function Modulo($id, $nome, $objetivo, $descricao)
	{
		$this -> id = $id;
		$this -> nome = $nome;
		$this -> objetivo = $objetivo;
		$this -> descricao = $descricao;
	}
	
	public function to_array()
	{
		$ret['id'] = $this -> id;
		$ret['nome'] = $this -> nome;
		$ret['objetivo'] = $this -> objetivo;
		$ret['descricao'] = $this -> descricao;
		
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
	
	public function getObjetivo()
	{
		return $this -> objetivo;
	}
	
	public function getDescricao()
	{
		return $this -> descricao;
	}
	
	public function setId($id)
	{
		$this -> id = $id;
	}
	
	public function setNome($nome)
	{
		$this -> nome = $nome;
	}
	
	public function setObjetivo($objetivo)
	{
		$this -> objetivo = $objetivo;
	}
	
	public function setDescricao($descricao)
	{
		$this -> descricao = $descricao;
	}
	
	public function insert()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("insert into modulo (modulo,objetivo,descricao) values('%s','%s','%s')", mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> objetivo), mysql_real_escape_string($this -> descricao));
		$result = mysql_query($query);
		
		return $result;		
	}
	
	public function edit()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("update modulo set modulo = '%s', objetivo = '%s', descricao = '%s' where idMod = %d",mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> objetivo), mysql_real_escape_string($this -> descricao), $this -> id);
		$result = mysql_query($query);
				
		return $result;
	}
	
	public function delete()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("delete from modulo where idMod = %d", $this -> id);
		$result = mysql_query($query);
						
		return $result;
	}
	
	public static function all()
	{
		$ret = Modulo::gql("");
		return $ret;
	}
	
	public static function find($array)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$temp = array();
		
		if(array_key_exists("nome",$array))
		{
			array_push($temp,"modulo LIKE '%".mysql_real_escape_string($array['nome'])."%'");
		}
		
		if(array_key_exists("objetivo",$array))
		{
			array_push($temp,"objetivo LIKE '%".mysql_real_escape_string($array['objetivo'])."%'");
		}
		
		if(array_key_exists("descricao",$array))
		{
			array_push($temp,"descricao LIKE '%".mysql_real_escape_string($array['descricao'])."%'");
		}
	
		$gql_query = implode(" AND ",$temp);
		if(strlen($gql_query) > 0)
		{
			$gql_query = "WHERE ".$gql_query;
		}
		
		$ret = Modulo::gql($gql_query);
		
		return $ret;
	}
	
	public static function gql($gql_query)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = "select * from modulo ".$gql_query;
		
		$result = mysql_query($query);
		
		$ret = array();
		if( $result )
		{
			while ( $row = mysql_fetch_assoc($result) ) 
			{
			    $id = $row['idMod'];
				$nome = $row['modulo'];
				$objetivo = $row['objetivo'];
				$descricao = $row['descricao'];
				array_push ($ret, new Modulo($id, $nome, $objetivo, $descricao));
			}
			mysql_free_result($result);
		}
		
		return $ret;
	}
}
?>
