<?php
include ("classes/RepositorioAtend.php");

class NegocioPaciente {

 	public function cadastrar($paciente, $login) {
        $invalido = $this->parametrosInvalidos($paciente->getNome(),$paciente->getDtNasc(),$paciente->getSexo(),$paciente->getMae(),
			$paciente->getEndereco(), $paciente->getBairro(),$paciente->getCidade(),$paciente->getEstado(), $paciente->getCEP());
		$invalido1 = validaCPF($paciente->getCPF());
        if (!$invalido && $invalido1) {
           $idAtendimento = $paciente->cadastrar($login);
        } else {
            throw new CamposInvalidos();
        }
	return $idAtendimento;
    }
	

    public function alterar($paciente, $idProntuario) {
        $invalido = $this->parametrosInvalidos($paciente->getNome(),$paciente->getDTNasc(),$paciente->getSexo(),$paciente->getMae(),
			$paciente->getEndereco(), $paciente->getBairro(), $paciente->getCidade(),$paciente->getEstado(), $paciente->getCEP());
        if (!$invalido) {
            $paciente->alterar($idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function novoAtendimento($idAluno, $idProntuario, $sexo) {
        $repAtend = new RepositorioAtend();
		$repAtend->novoAtendimento($idAluno, $idProntuario, $sexo);
    }

    function parametrosInvalidos($nome, $data, $sexo, $mae, $endereco, $bairro, $cidade, $estado, $cep) {
        if ($nome == "" || $sexo == "" || $mae == "" || $endereco == "" || $bairro == "" || 
			$cidade == 0 || $estado == 0 || $cep == "")
        	return true;
        if (validaData($data) != "")
            return true;
        if (!validaCEP($cep))
            return true;
        return false;
    }

	public function __destruct() {}

} ?>
