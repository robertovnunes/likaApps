<?php
class RepositorioAdendo
{
    public function __construct() {}

    function inserirAdendo($adendo, $idAtendimento, $idAluno, $name){
		$nAdendo = $this->getNumAdendo($name);
        $data = date(Y) . "-" . date(m) . "-" . date(d) . " " . date("H:i:s");
        mysql_query("insert into " . $name . " values ('" . $nAdendo . "','" . $idAtendimento . "','" . $adendo . 
			"','" . $data . "','" . $idAluno . "')") or die("ERRO no comando SQL:" . mysql_error());
        mysql_query("UPDATE atendimento SET dthr = SYSDATE() WHERE idAtend = '" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}

    private function getNumAdendo($adendo){
		$query = mysql_query("SHOW TABLE STATUS LIKE '" . $adendo . "'");
        $data = mysql_fetch_array($query);
		return $data['Auto_increment'];
	}

    function numAdendoQH($idAtend) {
        $query = mysql_query("select * from adendoqh where idAtend = '" . $idAtend . "'");
        return mysql_num_rows($query);
    }
	
	function getAdendoQH($idAtendimento){
		$sqlqh = mysql_query("SELECT * FROM adendoqh WHERE idAtend='".$idAtendimento."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlqh)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}

	function getAdendoIS($idAtendimento){
		$sqlis = mysql_query("SELECT * FROM adendois WHERE idAtend='".$idAtendimento."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlis)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}

	function getAdendoEX($idAtendimento){
		$sqlex = mysql_query("SELECT * FROM adendoex WHERE idAtend='".$idAtendimento."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlex)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}

	function getAdendoHD($idAtendimento){
		$sqlhd = mysql_query("SELECT * FROM adendohd WHERE idAtend='".$idAtendimento."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlhd)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}

	function getAdendoCD($idAtendimento){
		$sqlcd = mysql_query("SELECT * FROM adendocd WHERE idAtend='".$idAtendimento."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlcd)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}
	
    public function __destruct(){}

}
?>
