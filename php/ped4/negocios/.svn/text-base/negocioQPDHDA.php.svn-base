<?php

class NegocioQPDHDA{

	public function alterar($qpdhda, $idAtendimento, $assinar, $idAluno){
	
		$invalido = $this->parametrosInvalidos($qpdhda->getQPD(), $qpdhda->getHDA());
		if (!$invalido){
			if ($assinar)
            	$qpdhda->alterar($idAtendimento,1, $idAluno);
			else
            	$qpdhda->alterar($idAtendimento,0,$idAluno);
		} else
			throw new CamposInvalidos();
		
	}

	public function adendo($adendo, $idAtendimento, $idAluno){
		if ($adendo->getAdendo() != ""){
			$adendo->inserirAdendoQH($idAtendimento, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
	}

	function parametrosInvalidos($qpd,$hda){
		if($qpd == "" || $hda == "") return true;
		return false;
	}
	
	public function __destruct(){}
	
}?>
