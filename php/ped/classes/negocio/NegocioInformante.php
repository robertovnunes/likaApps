<?php
include_once ("classes/repositorio/RepositorioIS.php");

class NegocioInformante{

    private $repIS;

    public function __construct() {
        $this->repIS = new RepositorioIS();
    }

	public function alterar($informante, $idAtendimento){ 
		$invalido = $this->parametrosInvalidos($informante->getNome(), $informante->getSexo(), 
			$informante->getEndereco(), $informante->getNumero(), $informante->getComplemento(), 
			$informante->getBairro(), $informante->getCidade(), 
			$informante->getEstado(), $informante->getCEP(), $informante->getEscolaridade(), 
			$informante->getParentesco());
		if (!$invalido){  
			
			if(!$this->repIS->existeInformante($idAtendimento))
				$this->repIS->cadastrarInformante($informante, $idAtendimento);
			else
				$this->repIS->alterarInformante($informante, $idAtendimento);
		
		} else {
			throw new CamposInvalidos();
		}
	}

	function parametrosInvalidos($nome, $sexo, $endereco, $numero, $complemento, $bairro, $cidade, $estado, $cep, 
		$escolaridade, $parentesco){ 
		if(!$nome || !$sexo || !$endereco || !$bairro || !$cidade || !$estado
			|| $escolaridade == 0 || $parentesco == 0) return true;
		if (!$this->validaCEP($cep) && $cep)
			return true;
		return false;
	}
	
	function validaCEP($cep){
		if ($cep == "") return false;
		return preg_match("/^[0-9]{5}-[0-9]{3}$/", $cep);
	
	}
	public function __destruct(){}
	
}?>
