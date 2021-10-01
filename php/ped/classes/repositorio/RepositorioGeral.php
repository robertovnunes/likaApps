<?php
class RepositorioGeral{

    public function __construct() {}

  	public function openDB($mysqli=false) {
		$host  = "localhost"; //endereço do servidor MySQL
		$db = "ped2010"; // database
		
		///$user = "root";
		//$senha1 = "";

		$user = "ped";
		$senha1 = "28vFs93Dkr4ddCloa";
				
		//$user = "ped2009"; //login usado no MySQL
		//$senha1 = "TazZx8E53RnwPt3G";//"master"; //senha usado no MySQL
		
		if(!$mysqli){
			$conn = mysql_connect($host, $user, $senha1) or die (mysql_error());
			mysql_select_db($db, $conn) or die (mysql_error());
		}
		else{
			$conn = new mysqli($host, $user, $senha1, $db) or die (mysql_error());;
		}
		return $conn;
    }

	public function closeDB($conn){
		mysql_close($conn);
	}
	
	function existeLogin($login, $senha) {
		$resultados = mysql_query("SELECT * FROM acesso WHERE login = '" . $login . "' && senha = md5('" . 
			$senha . "')");
        return (mysql_num_rows($resultados) > 0);
	}

	function autentica($login, $senha) {
		$resultados = mysql_query("SELECT * FROM acesso WHERE login = '" . $login . "' && senha = md5('" . 
			$senha . "')");
		$userdb = mysql_fetch_object($resultados);
		$usuario = new Usuario($login, $senha);
		$usuario->setNome($userdb->nome);
		$usuario->setID($userdb->idAcesso);
		$usuario->setCpf($userdb->cpf);
		$usuario->setTipo($userdb->usuario);
		$usuario->setEmail($userdb->email);
		return $usuario;
	}

	function existeLoginEmail($login, $email){
		$resultados = mysql_query("SELECT idAcesso FROM acesso WHERE login = '" . $login . "' && email = '" . $email . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
		return (mysql_num_rows($resultados) > 0);
	}
	
	function novaSenha($login, $email){
		$novaSenha = md5(date("D M j G:i: s T Y"));
		$novaSenha = substr($novaSenha,1,10);
		$novaSenha = md5($novaSenha);
		mysql_query("UPDATE acesso SET senha = '". $novaSenha . "' WHERE login = '" . $login . "' && email = '" . 
			$email . "'") or die("ERRO no comando SQL:" . mysql_error());
		return $novaSenha;
	}

	function alteraSenha($login, $email, $senha){

	}

	function editarPerfil($id, $nome, $senha, $email){
		mysql_query("UPDATE acesso SET nome = '" . $nome . "', email = '" . $email . "', senha = md5('" . $senha . "') WHERE 
			idAcesso = '" . $id . "'") or die("ERRO no comando SQL:" . mysql_error());
	}
	
	function alteraSenhaAluno($id, $senha){
		mysql_query("UPDATE acesso SET senha = md5('" . $senha . "') WHERE idAcesso = '" . $id . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}


	function alteraEmailAluno($id,$email){
		mysql_query("UPDATE acesso SET email = '" . $email . "' WHERE idAcesso = '" . $id . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}

	function alteraNomeAluno($id,$nome){
		mysql_query("UPDATE acesso SET nome = '" . $nome . "' WHERE idAcesso = '" . $id . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}

	function getNomeAluno($idAluno) {
		$consulta = mysql_query("SELECT nome FROM acesso WHERE idacesso = '" . $idAluno . "'");
		if(mysql_num_rows($consulta)) {
			$aluno = mysql_fetch_object($consulta);
			return $aluno->nome;
		} else
			return 0;
	}

	function getEmailAluno($idAluno) {
		$consulta = mysql_query("SELECT email FROM acesso WHERE idacesso = '" . $idAluno . "'");
		$aluno = mysql_fetch_object($consulta);
		return $aluno->email;
	}

	function getEquipeAluno($login) {
		$consulta = mysql_query("SELECT e.equipe FROM equipe e, aluno al, acesso ac WHERE ac.idacesso 
			= al.idAluno and al.idEquipe = e.idEquipe and ac.login = '" . $login . "'");
		return mysql_fetch_object($consulta);
	}

	function validarProntuario($login, $idPront) {
        $sql_pront = mysql_query("SELECT pr.idPront FROM paciente pa, acesso ac, aluno al, prontuario 
			pr WHERE al.idAluno = ac.idAcesso and ac.login = '" . $login . "' and pa.idPront = 
			pr.idPront and al.idEquipe = pr.idEquipe and pr.idPront = '" . $idPront . "'");
        return (mysql_num_rows($sql_pront) > 0);
    }

    function validarAtendimento($login, $idAtend) {
        $sql_atend = mysql_query("SELECT idAtend FROM paciente pa, acesso ac, aluno al, prontuario pr, 
			atendimento at WHERE al.idAluno = ac.idAcesso and ac.login = '" . $login . "' and 
			al.idEquipe = pr.idEquipe and pr.idPront = at.idPront and at.idAtend = '" . $idAtend . "'");
        return (mysql_num_rows($sql_atend) > 0);
    }
	
	function getCBO(){
		$sql = mysql_query("SELECT * from cbo");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sql)){
			array_push($tabela, $dados);
		}
		return $tabela;
    }


	public function __destruct() {}

}
?>