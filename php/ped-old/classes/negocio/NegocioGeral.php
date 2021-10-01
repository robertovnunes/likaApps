<?php
include_once("classes/repositorio/RepositorioGeral.php");

class NegocioGeral{

    private $repGeral;

    public function __construct() {
        $this->repGeral = new RepositorioGeral();
    }


  	public function openDB() {
       return $this->repGeral->openDB();
    }

	public function closeDB($conn){
		$this->repGeral->closeDB($conn);
	}

	function autentica($login, $senha) {
	    if ($login && $senha && $this->existeLogin($login, $senha)){
            return $this->repGeral->autentica($login, $senha);
        } else {
		    throw new CamposInvalidos();
	    }
	}

	function existeLoginEmail($login, $email){
		return $this->repGeral->existeLoginEmail($login, $email);
	}
	
	function novaSenha($login, $email){
		return $this->repGeral->novaSenha($login, $email);
	}
	
	function existeLogin($login, $senha){
		return $this->repGeral->existeLogin($login, $senha);
	}


	function alteraEmailAluno($id,$email){
	}

	function alteraNomeAluno($id,$nome){
	}

	function editarPerfil($id, $nome, $nsenha, $rsenha, $senhaa, $senha, $email){
		if ($nome && $this->validaEmail($email) && ($nsenha == $rsenha) && ($senhaa == $senha))
			if (!$nsenha)
				$this->repGeral->editarPerfil($id, $nome, $senha, $email);
			else 
				$this->repGeral->editarPerfil($id, $nome, $nsenha, $email);
		else {
			throw new CamposInvalidos();
		}
	}
	
	function getNomeAluno($idAluno) {
        return $this->repGeral->getNomeAluno($idAluno);
    }

	function getEmailAluno($idAluno) {
	}

	function getEquipeAluno($login) {
        return $this->repGeral->getEquipeAluno($login);
    }


	function validarProntuario($login, $pront){
       return $this->repGeral->validarProntuario($login, $pront);	
	}

    function validarAtendimento($login, $idAtend) {
		return $this->repGeral->validarAtendimento($login, $idAtend);
    }

    function getCBO(){
		return $this->repGeral->getCBO();
    }

	function printData($dthr){
		$pos = strpos($dthr,'-');

		if($pos != false) {
			$dia = substr($dthr, 8, 2);
			$mes = substr($dthr, 5, 2);
			$ano = substr($dthr, 0, 4);
			return $dia . "/" . $mes . "/" . $ano;
		}
		
		return $dthr;
	}
	function msgData($data){
		if ($data == "") return "Preencha uma data de nascimento";
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

	function validaEmail($email){
		if ($email == "") return false;
		return ereg("^([A-Z_a-z])+.+@([a-zA-Z])+", $email);
	}
	
	function printCampo($field, $value) {
		if ($value != "" && $value != NULL)
			return $value;
		else if ($field != "" && $field != "0"){
			if ($field == "\0") $field = "0"; 
			return $field;
		}else return "";
	}
	
	function printHora($dthr){
		return substr($dthr,11,5);
	}
	function validaHora($hora){
		if ($hora == "") return true;
		return ereg("^([0-1][0-9]|[2][0-3]):[0-5][0-9]$", $hora);
	}
	
	function checkPOST($id, $value, $field) {
		if ($_POST[$id] == NULL || $_POST[$id] == ""){
			if ($field == $value)
				return "checked='true'";
		} else if ($_POST[$id] != NULL && $_POST[$id] != "") {
			if ($_POST[$id] == $value)
				return "checked='true'";
		}
		if ($value == "NA" && ($field == "" || $field == NULL) && ($_POST[$id] == "" || $_POST[$id] == NULL))
			return "checked='true'";
	}

	function checkOpUF($id, $value, $field) {
			if ($field == $value)
				return "SELECTED";
			if ($_POST[$id] == $value)
				return "SELECTED";
	}

	function checkOption($id, $value, $field) {
		if ($_POST[$id] == $value) 
			return "SELECTED";
		if (!$_POST[$id] || $_POST[$id] == 0){
			if ($field == $value)
				return "SELECTED";
		}
		if ($value == "NA" && ($field == "0" || !$field) && !$_POST[$id])
			return "SELECTED";
/*		if ($value == "NA" && ($field == "0" || $field == "" || $field == NULL) && ($_POST[$id] == "" || $_POST[$id] == NULL))
			return "SELECTED";
		if ($_POST[$id] == NULL || $_POST[$id] == "" || $_POST[$id] == 0){
			if ($field == $value)
				return "SELECTED";
		} else if ($_POST[$id] != NULL && $_POST[$id] != "") {
			if ($_POST[$id] == $value)
				return "SELECTED";
		}*/
	}
	
	function checkDisable($id, $field, $value) {
//		if ($_POST[$id] == "AV" && (!$field || $field == "NA") && $value == "AV")
//			return "disabled='true'";
		if ($_POST[$id] == $value || $field == $value)
			return "";
		return "disabled='true'";
	}

	function checkDisable2($id, $field, $value, $value2) {
		if ($_POST[$id] == $value || $field == $value || $_POST[$id] == $value2 || $field == $value2)
			return "";
		return "disabled='true'";
	}

	function checkDisable3($id, $field, $value, $value2, $value3) {
		if ($_POST[$id]==$value || $field==$value || $_POST[$id]==$value2 || $field==$value2 || $_POST[$id]==$value3 || $field==$value3)
			return "";
		return "disabled='true'";
	//	else return "disabled=true";
	}
	function checkDisable4($id, $field, $value, $value2, $value3, $value4) {
		if ($_POST[$id]==$value || $field==$value || $_POST[$id]==$value2 || $field==$value2 || $_POST[$id]==$value3 || $field==$value3 || $_POST[$id]==$value4 || $field==$value4)
			return "";
		return "disabled='true'";
	}

	function printOBS($field, $value) {
		if ($value != "")
			return $value;
		else if ($field != ""){
			if ($field == "\0") $field = "0"; 
			return $field;
		} else return "";
	}

	function checkAssinado($assinado) {
		if ($assinado)
			return "disabled='true'";
	}

	function verPreenchimento($ctrlaba,$valor){
		for ($i = 0; $i < strlen($ctrlaba); $i++){
			if (substr($ctrlaba,$i,1) == $valor) return true;
		}
		return false;
	}

	function printMsg($msg1, $msg2){
		if ($msg1 == "") $msg1 = $msg2;
		else $msg1 = $msg1.", ".$msg2;
		return $msg1;
	}

	public function __destruct(){}

}?>
