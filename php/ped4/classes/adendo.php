<?php
include ("dbconfig.php");

class Adendo{
    private $adendo;

    public function __construct($adendo){
        $this->adendo = $adendo;
    }
	
    public function setAdendo($adendo){
        $this->adendo = $adendo;
    }

    public function getAdendo(){
        return $this->adendo;
    }

    function inserirAdendoQH($idAtendimento, $idAluno){
		$nAdendo = $this->getNumAdendo('adendoqh');
        $data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendoqh values ('".$nAdendo."','".$idAtendimento."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
    }

    function inserirAdendoIS($idAtendimento, $idAluno){
		$nAdendo = $this->getNumAdendo('adendois');
        $data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendois values ('".$nAdendo."','".$idAtendimento."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

    function inserirAdendoCD($idAtendimento, $idAluno){
		$nAdendo = $this->getNumAdendo('adendocd');
        $data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendocd values ('".$nAdendo."','".$idAtendimento."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

    function inserirAdendoHD($idAtendimento, $idAluno){
		$nAdendo = $this->getNumAdendo('adendohd');
        $data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendohd values ('".$nAdendo."','".$idAtendimento."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

    function inserirAdendoHP($idProntuario, $idAluno){
		$nAdendo = $this->getNumAdendo('adendohp');
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendohp values ('".$nAdendo."','".$idProntuario."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

    function inserirAdendoHF($idProntuario, $idAluno){
		$nAdendo = $this->getNumAdendo('adendohf');
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendohf values ('".$nAdendo."','".$idProntuario."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

    function inserirAdendoEX($idAtendimento, $idAluno){
		$nAdendo = $this->getNumAdendo('adendoex'); 
        $data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("insert into adendoex values ('".$nAdendo."','".$idAtendimento."','".$this->getAdendo()."','".$data."','"
			.$idAluno."')") or die("ERRO no comando SQL:".mysql_error());
	}

	private function getNumAdendo($adendo){
		$query = mysql_query("SHOW TABLE STATUS LIKE '".$adendo."'");
        $data = mysql_fetch_array($query);
		return $data['Auto_increment'];
	}
	
    public function __destruct() {}
}
?>