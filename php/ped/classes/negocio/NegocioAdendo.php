<?php
include_once("classes/repositorio/RepositorioAdendo.php");

class NegocioAdendo{

    private $repAdendo;

    public function __construct() {
        $this->repAdendo = new RepositorioAdendo();
    }

    function inserirAdendo($adendo, $idAtendimento, $idAluno, $name){
		if ($adendo){
			$this->repAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, $name);
		} else {
			throw new CamposInvalidos();
		}
    }

    function numAdendoQH($idAtend) {
        return $this->repAdendo->numAdendoQH($idAtend);
    }
	
	function getAdendoQH($idAtendimento){
        return $this->repAdendo->getAdendoQH($idAtendimento);
	}

	function getAdendoIS($idAtendimento){
        return $this->repAdendo->getAdendoIS($idAtendimento);
	}

	function getAdendoEX($idAtendimento){
        return $this->repAdendo->getAdendoEX($idAtendimento);
	}

	function getAdendoHD($idAtendimento){
        return $this->repAdendo->getAdendoHD($idAtendimento);
	}

	function getAdendoCD($idAtendimento){
        return $this->repAdendo->getAdendoCD($idAtendimento);
	}
	public function __destruct(){}
	
}?>
