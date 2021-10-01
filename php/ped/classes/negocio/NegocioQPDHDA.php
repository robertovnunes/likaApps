<?php
include_once ("classes/repositorio/RepositorioIS.php");

class NegocioQPDHDA{
	
	private $repPac;
	
	public function __construct(){
		$this->repIS = new RepositorioIS();
	}
	
	public function alterar($qpdhda, $idAtendimento, $assinar, $idAluno){
		$invalido = $this->parametrosInvalidos($qpdhda->getQPD(), $qpdhda->getHDA());
		if (!$invalido){
			if ($assinar)
            	$this->repIS->alterarQPDHDA($qpdhda, $idAtendimento,1, $idAluno);
			else
            	$this->repIS->alterarQPDHDA($qpdhda, $idAtendimento,0,$idAluno);
		} else
			throw new CamposInvalidos();
		
	}

	public function adendo($adendo, $idAtendimento, $idAluno){
		if ($adendo){
			$this->repIS->inserirAdendo($adendo, $idAtendimento, $idAluno, "AdendoQH");
		} else {
			throw new CamposInvalidos();
		}
	}
	
	public function getQPDHDA($idAtendimento) {
        return $this->repIS->getQPDHDA($idAtendimento);
    }
	
	function parametrosInvalidos($qpd,$hda){
		if(!$qpd || !$hda) return true;
		return false;
	}
	
	public function __destruct(){}
	
}?>
