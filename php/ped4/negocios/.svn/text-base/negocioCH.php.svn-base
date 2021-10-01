<?php
include ("classes/repositorioHDC.php");

class negocioCH{
	
	private $repCH;
	
    public function __construct() {
        $this->repCH = new repositorioHDC();
    }

    function preencherHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		if ($hip != ""){
			if ($assinar)
            	$this->repCH->preencherHipDiag($hip, $idAtendimento, 1, $idAluno);
			else
            	$this->repCH->preencherHipDiag($hip, $idAtendimento, 0, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
    }

	public function adendoHD($adendo, $idAtendimento, $idAluno){
		if ($adendo->getAdendo() != ""){
			$adendo->inserirAdendoHD($idAtendimento, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
	}
	
    function preencherConduta($cond, $idAtendimento, $assinar, $idAluno){
		if ($cond != ""){
			if ($assinar)
            	$this->repCH->preencherConduta($cond, $idAtendimento, 1, $idAluno);
			else
            	$this->repCH->preencherConduta($cond, $idAtendimento, 0, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
    }

	public function adendoCD($adendo, $idAtendimento, $idAluno){
		if ($adendo->getAdendo() != ""){
			$adendo->inserirAdendoCD($idAtendimento, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
	}

	public function __destruct(){}
	
}?>
