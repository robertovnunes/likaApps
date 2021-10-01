<?php
class Equipe
{
	private $id;
	private $nome;
	private $descricao;
	private $idTurma;
	private $idModulo;
	
	public function Equipe($id, $nome, $descricao, $idTurma, $idModulo)
	{
		$this -> id = $id;
		$this -> nome = $nome;
		$this -> descricao = $descricao;
		$this -> idTurma = $idTurma;
		$this -> idModulo = $idModulo;
	}
	
	public function to_array()
	{
		$ret['id'] = $this -> id;
		$ret['nome'] = $this -> nome;
		$ret['descricao'] = $this -> descricao;
		$ret['idTurma'] = $this -> idTurma;
		$ret['idModulo'] = $this -> idModulo;
		
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
	
	public function getDescricao()
	{
		return $this -> descricao;
	}
	
	public function getIdTurma()
	{
		return $this -> idTurma;
	}
	
	public function getIdModulo()
	{
		return $this -> idModulo;
	}
	
	public function setId($id)
	{
		$this -> id = $id;
	}
	
	public function setNome($nome)
	{
		$this -> nome = $nome;
	}
	
	public function setDescricao($descricao)
	{
		$this -> descricao = $descricao;
	}
	
	public function setIdTurma($idTurma)
	{
		$this -> idTurma = $idTurma;
	}
	
	public function setIdModulo($idModulo)
	{
		$this -> idModulo = $idModulo;
	}
	
	public function insert()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("insert into equipe (equipe,descr,idTurma,idModulo) values('%s','%s',%d,%d)", mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> descricao), $this -> idTurma, $this -> idModulo);
		$result = mysql_query($query);
		
		return $result;		
	}
	
	public function edit()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("update equipe set equipe = '%s', descr = '%s', idTurma = %d, idModulo = %d where idEquipe = %d",mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> descricao), $this -> idTurma, $this -> idModulo, $this -> id);
		$result = mysql_query($query);
				
		return $result;
	}
	
	public function delete()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("delete from equipe where idEquipe = %d", $this -> id);
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
			array_push($temp,"equipe LIKE '%".mysql_real_escape_string($array['nome'])."%'");
		}
		
		if(array_key_exists("descricao",$array))
		{
			array_push($temp,"descr LIKE '%".mysql_real_escape_string($array['descricao'])."%'");
		}
	
		if(array_key_exists("idTurma",$array))
		{
			array_push($temp,"idTurma = ".$array['idTurma']);
		}
		
		if(array_key_exists("idModulo",$array))
		{
			array_push($temp,"idModulo = ".$array['idModulo']);
		}
		
		$gql_query = implode(" AND ",$temp);
		if(strlen($gql_query) > 0)
		{
			$gql_query = "WHERE ".$gql_query;
		}
		
		$ret = Equipe::gql($gql_query);
		
		return $ret;
	}
	
	public static function gql($gql_query)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = "select * from equipe ".$gql_query;
		$result = mysql_query($query);
		
		$ret = array();
		if( $result )
		{
			while ( $row = mysql_fetch_assoc($result) ) 
			{
			    $id = $row['idEquipe'];
				$nome = $row['equipe'];
				$descricao = $row['descr'];
				$idTurma = $row['idTurma'];
				$idModulo = $row['idModulo'];
				array_push ($ret, new Equipe($id, $nome, $descricao, $idTurma, $idModulo));
			}
			mysql_free_result($result);
		}
		
		return $ret;
	}
}
?>
