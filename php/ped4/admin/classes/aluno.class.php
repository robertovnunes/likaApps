<?php
class Aluno
{
	private $id;
	private $nome;
	private $cpf;
	private $login;
	private $senha;
	private $idEquipe;
	private $email;
	
	public function Aluno($id, $nome, $cpf, $login, $senha, $idEquipe, $email)
	{
		$this -> id = $id;
		$this -> nome = $nome;
		$this -> cpf = $cpf;
		$this -> login = $login;
		$this -> senha = $senha;
		$this -> idEquipe = $idEquipe;
		$this -> email = $email;
		
	}
	
	public function to_array()
	{
		$ret['id'] = $this -> id;
		$ret['nome'] = $this -> nome;
		$ret['cpf'] = $this -> cpf;
		$ret['login'] = $this -> login;
		$ret['idEquipe'] = $this -> idEquipe;
		$ret['email'] = $this -> email;
		
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
	
	public function getEmail()
	{
		return $this -> email;
	}
	
	public function getIdEquipe()
	{
		return $this -> idEquipe;
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
	
	public function setIdEquipe($idEquipe)
	{
		$this -> idEquipe = $idEquipe;
	}
	
	public function setEmail($email)
	{
		$this -> email = $email;
	}
	
	public function insert()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		
		$query = mysql_query("SHOW TABLE STATUS LIKE 'acesso'");
        $data = mysql_fetch_array($query);
		$this->id = $data['Auto_increment'];
		$idAluno = $this->id;
				
		$result = mysql_query("insert into acesso values (".$this->id.",'". $this->login."',md5('". $this->senha."'),'". $this->nome."','". $this->cpf."','a','".$this->email."')") or die("ERRO no comando SQL:".mysql_error());
		
		$result = mysql_query("insert into aluno values (".$this->id.",". $this->idEquipe.")") or die("ERRO no comando SQL:".mysql_error());
			
			
		/*$query = sprintf("insert into acesso('%d','%s','%s','%s','%s',%c) as result",$idAcesso, mysql_real_escape_string($this -> login), mysql_real_escape_string($this -> senha), mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> cpf), $this -> idEquipe);
		$result = mysql_query($query);
		$row = mysql_fetch_assoc($result);
		$result = $row['result'];*/

		return $result; 
	}
	
	public function edit()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query_acesso = sprintf("update acesso set login = '%s', senha = md5('%s'), nome = '%s', cpf = '%s', email = '%s' where idAcesso = %d",mysql_real_escape_string($this -> login), mysql_real_escape_string($this -> senha), mysql_real_escape_string($this -> nome), mysql_real_escape_string($this -> cpf),  mysql_real_escape_string($this -> email),$this -> id);
		$result = mysql_query($query_acesso);
		
		if( $result )
		{
			$query = sprintf("update aluno set idEquipe = %d where idAlun = %d",$this -> idEquipe, $this -> id);
			$result = mysql_query($query);
		}
				
		return $result;
	}
	
	public function delete()
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		$query = sprintf("delete from aluno where idAlun = %d", $this -> id);
		$result = mysql_query($query);
		if( $result )
		{
			$query_acesso = sprintf("delete from acesso where idAcesso = %d", $this -> id);
			$result = mysql_query($query_acesso);
		}
						
		return $result;
	}
	
	public static function all()
	{
		$ret = Aluno::gql("");
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
		
		if(array_key_exists("idEquipe",$array))
		{
			array_push($temp,"idEquipe = ".mysql_real_escape_string($array['idEquipe']));
		}
		
		if(array_key_exists("email",$array))
		{
			array_push($temp,"email = ".mysql_real_escape_string($array['email']));
		}
		
		$gql_query = implode(" AND ",$temp);
		if(strlen($gql_query) > 0)
		{
			$gql_query = "WHERE ".$gql_query;
		}
		
		$ret = Aluno::gql($gql_query);
		
		return $ret;
	}
	
	public static function gql($gql_query)
	{
		include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/db_config.php');
		
		if(strlen($gql_query) > 0)
			$end_query = " and usuario = 'a' ORDER BY nome";
		else
			$end_query = " WHERE usuario = 'a' ORDER BY nome";
				
		$query = "select acesso.idAcesso idAcesso, acesso.nome nome, acesso.cpf cpf, acesso.login login, acesso.senha senha, acesso.email email ,aluno.idEquipe idEquipe from acesso inner join aluno on acesso.idAcesso = aluno.idAlun ".$gql_query.$end_query;
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
				$idEquipe = $row['idEquipe'];
				$email = $row['email'];
				array_push ($ret, new Aluno($id, $nome, $cpf, $login, $senha, $idEquipe, $email));
			}
			mysql_free_result($result);
		}
		
		return $ret;
	}
}
?>
