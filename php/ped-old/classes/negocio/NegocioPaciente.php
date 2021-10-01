<?php
include_once("classes/repositorio/RepositorioPaciente.php");

class NegocioPaciente {
	
	private $repPac;
	
	public function __construct(){
		$this->repPac = new RepositorioPaciente();
	}

	public function existe($paciente) {
		$cpf = $paciente->getCPF();
        if (!$cpf) {
			return $this->repPac->existePacienteCPF($cpf);
        } else {
			return $this->repPac->existePacienteNome($paciente->getNome());
        }
    }

	public function existePaciente($paciente) {
		return $this->repPac->existePaciente($paciente);
    }
	
 	public function cadastrar($paciente, $login) {
        $invalido = $this->parametrosInvalidos($paciente->getNome(),$paciente->getDTNasc(),$paciente->getSexo(),$paciente->getMae(),
			$paciente->getEndereco(), $paciente->getBairro(),$paciente->getCidade(),$paciente->getUF(), $paciente->getCEP());
		$invalido1 = $this->validaCPF($paciente->getCPF());

        if (!$invalido && $invalido1) {
			if (!$this->existePaciente($paciente)){
				$idAtendimento = $this->repPac->cadastrar($paciente, $login);
			} else {
				throw new ExistePaciente();
			}
        } else {
            throw new CamposInvalidos();
        }
		return $idAtendimento;
    }
	
    public function alterar($paciente, $idProntuario) {
        $invalido = $this->parametrosInvalidos($paciente->getNome(),$paciente->getDTNasc(),$paciente->getSexo(),$paciente->getMae(),
			$paciente->getEndereco(), $paciente->getBairro(), $paciente->getCidade(),$paciente->getUF(), $paciente->getCEP());
        if (!$invalido) {
            $this->repPac->alterar($paciente, $idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

	function consultar($valor, $tipo, $idAluno){
		if ($valor)
			if ($tipo == "n")
				return $this->repPac->consultaPacienteNome($valor, $idAluno);
			else if ($tipo == "p")
				return $this->repPac->consultaPacientePr($valor, $idAluno);
			else if ($tipo == "m")
				return $this->repPac->consultaPacienteMae($valor, $idAluno);
			else {
				throw new CamposInvalidos();
			}
		else {
			throw new CamposInvalidos();
		}
	}
    
	public function novoAtendimento($idAluno, $idProntuario, $sexo) {
		return $this->repPac->novoAtendimento($idAluno, $idProntuario, $sexo);
    }

    function parametrosInvalidos($nome, $data, $sexo, $mae, $endereco, $bairro, $cidade, $estado, $cep) {
        if ($nome == "" || $sexo == "" || $mae == "" || $endereco == "" || $bairro == "" ||
			$cidade == "" || $estado == "" || $cep == "")
        	return true;
        if ($this->validaData($data) != ""){
            return true;
        }
        if (!$this->validaCEP($cep)){
            return true;
        }
        return false;
    }

	function listaAtendimentos($idPront) {
        return $this->repPac->listaAtendimentos($idPront);
    }
	
	function listarPacientes($login) {
        return $this->repPac->listaPacientes($login);
    }

	function listarPacientesLimit($login, $inicio, $limite) {
        return $this->repPac->listarPacientesLimit($login, $inicio, $limite);
    }
	
	public function getUltimoAtendimento($idPront){
		return $this->repPac->getUltimoAtendimento($idPront);
	}

	public function getProntuarioAtendimento($idAtend){
		return $this->repPac->getProntuarioAtendimento($idAtend);
	}
	
	function obterPacientePr($pront) {
        return $this->repPac->obterPacientePr($pront);
    }

	function obterPacienteAt($atend) {
        return $this->repPac->obterPacienteAt($atend);
    }

	function getValuesTablePr($nome, $pront) {
        return $this->repPac->getValuesTablePr($nome, $pront);
    }
	
	function getValuesTableAt($nome, $pront) {
        return $this->repPac->getValuesTableAt($nome, $pront);
    }
	
	function getGrupoSanguineo(){
        return $this->repPac->getGrupoSanguineo();
    }

	function consultaInformante($idAtend) {
		return $this->repPac->consultaInformante($idAtend);
    }
	
	function consultaParentesco() {
		return $this->repPac->consultaParentesco();
    }

    function consultaEscolaridade() {
		return $this->repPac->consultaEscolaridade();
    }
	
	function validaCPF($cpf){
		if ($cpf == "") return true;
		$cpf = str_pad(ereg_replace('[^0-9]', '', $cpf), 11, '0', STR_PAD_LEFT);
		if (strlen($cpf) != 11 || $cpf == '00000000000' || $cpf == '11111111111' || $cpf == '22222222222' || $cpf == '33333333333'||
			$cpf == '44444444444' || $cpf == '55555555555' || $cpf == '66666666666'||$cpf == '77777777777'||$cpf == '88888888888' ||
			$cpf == '99999999999'){
			return false;
		} else {
			for ($t = 9; $t < 11; $t++) {
				for ($d = 0, $c = 0; $c < $t; $c++) {
					$d += $cpf{$c} * (($t + 1) - $c);
				}
				$d = ((10 * $d) % 11) % 10;
				if ($cpf{$c} != $d) {
					return false;
				}
			}
			return true;
		}
	}

	function validaCEP($cep){
		if ($cep == "") return false;
		return ereg("^[0-9]{5}-[0-9]{3}$", $cep);
	}

	function validaData($data){
		if ($data == "") return "Preencha uma data de nascimento";
		date_default_timezone_set("America/Sao_Paulo"); 
		$ano = date(Y);

		if (checkdate(substr($data, 3, 2), substr($data, 0, 2), substr($data, 6, 4))){
			if (substr($data, 6, 4) > $ano)
				return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
			else if (substr($data, 6, 4) < $ano-21)
				return "Voc&ecirc; deve inserir datas a partir do ano de ".($ano-21);
			else if (substr($data, 6, 4) == $ano){
				if (substr($data, 3, 2) > date(m))
					return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
				else if (substr($data, 3, 2) == date(m) && substr($data, 0, 2) > date(d))
					return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
			}
			return "";
		}
		return "Preencha uma data de nascimento v&aacute;lida";
	}
	

	public function __destruct() {}

} ?>
