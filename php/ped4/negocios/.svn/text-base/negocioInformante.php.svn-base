<?php

class NegocioInformante{

	public function alterar($informante, $idAtendimento){
		$invalido = $this->parametrosInvalidos($informante->getNome(), $informante->getSexo(), $informante->getEndereco(), $informante->getBairro(), $informante->getCidade(), $informante->getEstado(), $informante->getCEP(), $informante->getEscolaridade(),$informante->getParentesco());
		if (!$invalido){
			$informante->alterar($idAtendimento);
		} else {
			throw new CamposInvalidos();
		}
	}

	function parametrosInvalidos($nome,$sexo,$endereco,$bairro,$cidade,$estado,$cep,$escolaridade,$parentesco){
		if($nome == "" || $sexo == "" || $endereco == ""|| $bairro == "" || $cidade == 0 || $estado == 0 || $escolaridade == 0 || $parentesco == 0) return true;
		if (!validaCEP($cep))
            return true;
		return false;
	}
	
	public function __destruct(){}
	
}?>
