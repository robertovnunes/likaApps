<?php
class Professor
{
	private $id;
	private $nome;
	private $cpf;
	private $login;
	private $senha;
	
	public function Professor($id, $nome, $cpf, $login, $senha)
	{
		$this -> id = $id;
		$this -> nome = $nome;
		$this -> cpf = $cpf;
		$this -> login = $login;
		$this -> senha = $senha;
	}
	
	public function to_array()
	{
		$ret['id'] = $this -> id;
		$ret['nome'] = $this -> nome;
		$ret['cpf'] = $this -> cpf;
		$ret['login'] = $this -> login;
		
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
	
	public function getCPF()
	{
		return $this -> cpf;
	}
	
	public function getLogin()
	{
		return $this -> login;
	}
	
	public function getSenha()
	{
		return $this -> senha;
	}
	
	public function setId($id)
	{
		$this -> id = $id;
	}
	
	public function setNome($nome)
	{
		$this -> nome = $nome;
	}
	
	public function setCPF($cpf)
	{
		$this -> cpf = $cpf;
	}
	
	public function setLogin($login)
	{
		$this -> login = $login;
	}
	
	public function setSenha($senha)
	{
		$this -> senha = $senha;
	}
	
	public function insert()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("insert into acesso (login, senha, nome, cpf, usuario) values ('%s',md5('%s'),'%s','%s','p')",mysql_real_escape_string($this -> login), mysql_real_escape_string($this -> senha), mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> cpf));
		$result = mysql_query($query);
		
		return $result;
	}
	
	public function edit()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("update acesso set login = '%s', senha = md5('%s'), nome = '%s', cpf = '%s' where idAcesso = %d",mysql_real_escape_string($this -> login), mysql_real_escape_string($this -> senha), mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> cpf), $this -> id);
		$result = mysql_query($query);
		
		return $result;
	}
	
	public function delete()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("delete from acesso where idAcesso = %d", $this -> id);
		$result = mysql_query($query);
						
		return $result;
	}
	
	public static function all()
	{
		$ret = Professor::gql("");
		return $ret;
	}
	
	public static function find($array)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$temp = array();
		
		if(array_key_exists("nome",$array))
		{
			array_push($temp,"nome LIKE '%".mysql_real_escape_string($array['nome'])."%'");
		}
		
		if(array_key_exists("cpf",$array))
		{
			array_push($temp,"cpf LIKE '%".mysql_real_escape_string($array['cpf'])."%'");
		}
		
		if(array_key_exists("login",$array))
		{
			array_push($temp,"login LIKE '%".mysql_real_escape_string($array['login'])."%'");
		}
		
		$gql_query = implode(" AND ",$temp);
		if(strlen($gql_query) > 0)
		{
			$gql_query = "WHERE ".$gql_query;
		}

		$ret = Professor::gql($gql_query);
		
		return $ret;
	}
	
	public static function gql($gql_query)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		if(strlen($gql_query) > 0)
			$end_query = " AND usuario = 'p' ORDER BY nome";
		else
			$end_query = " WHERE usuario = 'p' ORDER BY nome";
				
		$query = "select * from acesso ".$gql_query.$end_query;

		$result = mysql_query($query);
		
		$ret = array();
		if( $result )
		{
			while ( $row = mysql_fetch_assoc($result) ) 
			{
			    $id = $row['idAcesso'];
				$nome = $row['nome'];
				$cpf = $row['cpf'];
			    $login = $row['login'];
				$senha = $row['senha'];
				array_push ($ret, new Professor($id, $nome, $cpf, $login, $senha));
			}
			mysql_free_result($result);
		}
		
		return $ret;
	}
}
?>