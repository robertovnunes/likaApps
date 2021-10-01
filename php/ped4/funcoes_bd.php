<?php

function recuperaSenha($login, $email){

	$senha = mysql_query("select senha from acesso where login ='". $login."' and email ='". $email."'");
	$pass = mysql_fetch_array($senha);
	return $pass['senha'];
}


function inserirAbasExame($idAtend) {
   mysql_query("insert into abasexame values (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'".$idAtend."',0)");

}

function alteraSenha($login, $email, $senha){
	mysql_query("update acesso set senha = md5('".$senha."') where login = '".$login."' and email ='".$email."'") or die("ERRO no comando SQL:".mysql_error());
}

function alteraSenhaAluno($id, $senha){
	mysql_query("update acesso set senha = md5('".$senha."') where idAcesso = '".$id."'") or die("ERRO no comando SQL:".mysql_error());
}


function alteraEmailAluno($id,$email){
	mysql_query("update acesso set email = '".$email."' where idAcesso = '".$id."'") or die("ERRO no comando SQL:".mysql_error());
}

function alteraNomeAluno($id,$nome){
	mysql_query("update acesso set nome = '".$nome."' where idAcesso = '".$id."'") or die("ERRO no comando SQL:".mysql_error());
}



function inserirAbasIs($idAtend) {
   mysql_query("insert into abasis values (0,0,0,0,0,0,0,0,0,0,'".$idAtend."')");

}
function inserirAntroestpuberal($idAtend) {
   mysql_query("insert into antroestpuberal values ('".$idAtend."','NA','NA','NA','NA')");

}

function getSalvosAbasExame($idAtend) {
    $consulta = mysql_query("select * from abasexame where idAtend = '".$idAtend."'");
   	$abasSalvas = mysql_fetch_object($consulta);
    return $abasSalvas;
}

function getSalvosAbasIs($idAtend) {
    $consulta = mysql_query("select * from abasis where idAtend = '".$idAtend."'");
   	$abasSalvas = mysql_fetch_object($consulta);
    return $abasSalvas;
}

function setInspecao($idAtend){
	mysql_query("update abasexame set inspecao=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setPele($idAtend){
	mysql_query("update abasexame set pele=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setGanglios($idAtend){
	mysql_query("update abasexame set ganglios=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setEstadPuberal($idAtend){
	mysql_query("update abasexame set estadpuberal=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setDesenvNeuropsicomotor($idAtend){
	mysql_query("update abasexame set desenvneuropsicomotor=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setCranio($idAtend){
	mysql_query("update abasexame set cranio=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setOlhos($idAtend){
	mysql_query("update abasexame set olhos=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setSistOtorrino($idAtend){
	mysql_query("update abasexame set sistotorrino=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setPescoco($idAtend){
	mysql_query("update abasexame set pescoco=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setApRespiratorio($idAtend){
	mysql_query("update abasexame set aprespiratorio=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setApCardiovascular($idAtend){
	mysql_query("update abasexame set apcardiovascular=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setApGastroInt($idAtend){
	mysql_query("update abasexame set apgastroint=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setApGenitoUrinario($idAtend){
	mysql_query("update abasexame set apgenitourinario=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setApMuscesqueletico($idAtend){
	mysql_query("update abasexame set apmuscesqueletico=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setSistNervoso($idAtend){
	mysql_query("update abasexame set sistnervoso=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}

function setGeral($idAtend){
	mysql_query("update abasis set geral=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setPeleIs($idAtend){
	mysql_query("update abasis set pele=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setOlhosIs($idAtend){
	mysql_query("update abasis set olhos=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setOuvidos($idAtend){
	mysql_query("update abasis set ouvidos=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setRespiratorio($idAtend){
	mysql_query("update abasis set respiratorio=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setCardiovascular($idAtend){
	mysql_query("update abasis set cardiovascular=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setGastroIntest($idAtend){
	mysql_query("update abasis set gastrointestinal=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setGenitoUrinario($idAtend){
	mysql_query("update abasis set genitourinario=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setMuscEsqueletico($idAtend){
	mysql_query("update abasis set muscesqueletico=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}
function setNervoso($idAtend){
	mysql_query("update abasis set nervoso=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}

function getNomeAluno($idAluno) {
    $consulta = mysql_query("select nome from acesso where idacesso = '".$idAluno."'");
   	$aluno = mysql_fetch_object($consulta);
    return $aluno->nome;
}

function getEmailAluno($idAluno) {
    $consulta = mysql_query("select email from acesso where idacesso = '".$idAluno."'");
   	$aluno = mysql_fetch_object($consulta);
    return $aluno->email;
}

function getEquipeAluno($login) {
    $consulta = mysql_query("select e.equipe from equipe e, aluno al, acesso ac where ac.idacesso = al.idalun and al.idEquipe = e.idEquipe and ac.login = '".$login."'");
    return mysql_fetch_object($consulta);
}


function SQLlistarPacientes($login) {
    return mysql_query("select pa.idPront, pa.nome, pa.mae, pa.dtnasc from paciente pa, aluno al, acesso ac, prontuario pr where ac.idacesso = al.idalun and ac.login = '".$login."' and pr.idPront = pa.idPront and al.idEquipe = pr.idEquipe ORDER BY pa.idPront DESC");
}

function SQLlistarPacientesLimit($login,$inicio, $limite) {
    return mysql_query("select pa.idPront, pa.nome, pa.mae, pa.dtnasc from paciente pa, aluno al, acesso ac, prontuario pr where ac.idacesso = al.idalun and ac.login = '".$login."' and pr.idPront = pa.idPront and al.idEquipe = pr.idEquipe ORDER BY pa.nome ASC limit ".$inicio.",".$limite);
}

function getUltimoAtendimento($idPront) {
    $sqlatend = mysql_query("SELECT idAtend FROM atendimento WHERE idPront = '".$idPront."' ORDER BY dthr DESC LIMIT 1");
    $atend = mysql_fetch_object($sqlatend);
    return $atend->idAtend;
}

function obterPacientePr($login, $idPront) {
	$sqlpaciente = mysql_query("SELECT cns, pa.nome, dtnasc, pa.cpf, mae, pai, ender, bairro, idEst, idCid, cep, sexo, compl FROM  acesso ac, paciente pa, aluno al, prontuario pr where ac.login = '".$login."' and al.idEquipe = pr.idEquipe and pa.idPront = '".$idPront."' and pa.idPront = pr.idPront and ac.idAcesso = al.idAlun");
	$paciente = mysql_fetch_object($sqlpaciente);
	return $paciente;
}

function obterPacienteAt($login, $idAtend) {
    $sql_paciente = mysql_query("SELECT cns, pa.nome, dtnasc, mae, pai, ender, bairro, idEst, idCid, cep, sexo, compl FROM atendimento at, paciente pa, acesso ac, aluno al, prontuario pr where ac.login = '".$login."' and al.idEquipe = pr.idEquipe and pr.idPront = at.idPront and at.idAtend = '".$idAtend."' and pa.idPront = pr.idPront and ac.idAcesso = al.idAlun");
    return mysql_fetch_object($sql_paciente);
}

function getDadosPaciente($idAtend) {
	$sql_prontuario = mysql_query("SELECT idPront FROM atendimento WHERE idAtend = '".$idAtend."'");
	$p = mysql_fetch_object($sql_prontuario);
	return getDadosPacientePr($p->idPront);
}

function getDadosPacientePr($idPront) {
	$sqlpaciente = mysql_query("SELECT pa.nome, pa.dtnasc, pa.sexo, ci.descricao, es.sigla, oi.alergmed, da.alergalim FROM outrasinformacoes oi, doencasanteriores da, paciente pa, tb_cidade ci, tb_estado es WHERE pa.idPront = '".$idPront."' and oi.idPront = '".$idPront."' and da.idPront = '".$idPront."' and ci.cod_cidade = (SELECT idCid FROM paciente pa WHERE idPront = '" . $idPront."') and es.cod_estado = (SELECT idEst FROM paciente pa WHERE idPront = '".$idPront."')");
	$paciente = mysql_fetch_object($sqlpaciente);
	return $paciente;
}

function consultaPacienteNome($nome) {
	return mysql_query("SELECT nome, dtnasc, mae, idPront FROM paciente WHERE nome LIKE '".$nome."%'");
}

function consultaPacientePr($idPront) {
	return mysql_query("SELECT nome, dtnasc, mae, idPront FROM paciente WHERE idPront LIKE '".$idPront."%'");
}

function consultaPacienteMae($mae) {
    return mysql_query("SELECT nome, dtnasc, mae, idPront FROM paciente WHERE mae LIKE '".$mae."%'");
}

function consultaInformante($idAtend) {
    $sql_informante = mysql_query("SELECT * FROM informante where idAtend = '".$idAtend."'");
    return mysql_fetch_object($sql_informante);
}

function consultaParentesco() {
    return mysql_query("SELECT * FROM parentesco ORDER BY idParent");
}

function consultaEscolaridade() {
    return mysql_query("SELECT * FROM escolaridade ORDER BY idEsc");
}

function consultaEstado($idEstado) {
    $sql_estado = mysql_query("SELECT * FROM estado where idEst = '".$idEst."'");
    return mysql_fetch_object($sql_estado);
}

function consultaCidade($idCidade) {
    $sql_cidade = mysql_query("SELECT * FROM cidade where idCid = '".$idCid."'");
    return mysql_fetch_object($sql_cidade);
}

function listaEstado() {
    return mysql_query("SELECT * FROM tb_estado ORDER BY cod_estado");
}

function listaCidade($idEstado) {
    return mysql_query("SELECT * FROM tb_cidade where fk_cod_estado = '".$idEstado."'");
}

function QPDHDAAssinado($idAtend) {
    $sqlqh = mysql_query("SELECT ass FROM qpdhda WHERE idAtend = '".$idAtend."'");
    $linhaqh = mysql_fetch_object($sqlqh);
    if ($linhaqh->ass)
		return true;
	else return false;
}

function ISAssinado($idAtend) {
    $sqlis = mysql_query("SELECT ass FROM interrogsintomatologico WHERE idAtend = '".$idAtend."'");
    $linhais = mysql_fetch_object($sqlis);
    if ($linhais->ass)
		return true;
	else return false;
}

function ISAssinadoStr($idAtend) {
    $sqlis = mysql_query("SELECT ass FROM interrogsintomatologico WHERE idAtend = '".$idAtend."'");
    $linhais = mysql_fetch_object($sqlis);
    if ($linhais->ass)
		return "true";
	else return "false";
}

function assinaIS($idAtend){
	mysql_query("update interrogsintomatologico set ass=1 where idAtend='".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
}

function HDAssinado($idAtend) {
    $sqlhd = mysql_query("SELECT ass FROM hipotdiagnost WHERE idAtend = '".$idAtend."'");
    $linhahd = mysql_fetch_object($sqlhd);
    if ($linhahd->ass)
		return true;
	else return false;
}

function CondAssinado($idAtend) {
    $sqlcd = mysql_query("SELECT ass FROM conduta WHERE idAtend = '".$idAtend."'");
    $linhacd = mysql_fetch_object($sqlcd);
    if ($linhacd->ass)
		return true;
	else return false;
}

function HPAssinado($idPront) {
    $sqlhp = mysql_query("SELECT ass FROM historicopessoal WHERE idPront = '".$idPront."'");
    $linhahp = mysql_fetch_object($sqlhp);
    if ($linhahp->ass)
		return true;
	else return false;
}

function HFAssinado($idPront) {
    $sqlhf = mysql_query("SELECT ass FROM historicofamiliar WHERE idPront = '".$idPront."'");
    $linhahf = mysql_fetch_object($sqlhf);
    if ($linhahf->ass)
		return true;
	else return false;
}

function EXAssinado($idAtend) {
    $sqlex = mysql_query("SELECT ass FROM examefisico WHERE idAtend = '".$idAtend."'");
    $linhaex = mysql_fetch_object($sqlex);
    if ($linhaex->ass)
		return true;
	else return false;
}

function existeInformante($idAtend) {
    $sql_informante = mysql_query("SELECT * from informante where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:" .
        mysql_error());
    if (mysql_num_rows($sql_informante) == 0)
        return false;
    return true;
}

function verQPDHDA($idAtend) {
    $sql_qpdhda = mysql_query("SELECT * FROM qpdhda where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
    $linhaqh = mysql_fetch_object($sql_qpdhda);
    return $linhaqh;
}

function queryQPDHDA($idPront) {
    $sql_qpdhda = mysql_query("SELECT qh.idPront FROM qpdhda qh where qh.idPront = '".$idPront."'") or die("ERRO no comando SQL:".
		mysql_error());
    return $sql_qpdhda;
}

function existeQPDHDA($idPront) {
    $sql_qpdhda = mysql_query("SELECT qh.idPront FROM qpdhda qh where qh.idPront = '".$idPront."'") or die("ERRO no comando SQL:".
		mysql_error());
    if (mysql_num_rows($sql_qpdhda) > 0)
		return true;
    return false;
}

function numAdendoQH($idAtend) {
    $query = mysql_query("select * from adendoqh where idAtend = '".$idAtend."'");
    return mysql_num_rows($query);
}

function existeIS($idAtend) {
    $sql_is = mysql_query("SELECT * FROM interrogsintomatologico where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".
        mysql_error());
    if (mysql_num_rows($sql_is) > 0)
		return true;
    return false;
}

function verIS($idAtend) {
    $sql_is = mysql_query("SELECT * FROM interrogsintomatologico where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".
		mysql_error());
    $linhais = mysql_fetch_object($sql_is);
    return $linhais;
}


function existeGeral($idAtend) {
    $sql_geral = mysql_query("SELECT idPront FROM geral where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".
		mysql_error());
    if (mysql_num_rows($sql_geral) > 0)
		return true;
    return false;
}

function verEX($idAtend) {
    $sqlex = mysql_query("SELECT * FROM examefisico where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".
		mysql_error());
    $linhaex = mysql_fetch_object($sqlex);
    return $linhaex;
}

function verHD($idAtend) {
    $sqlhd = mysql_query("SELECT * FROM hipotdiagnost where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
    return mysql_fetch_object($sqlhd);
}

function verCD($idAtend){
    $sqlcond = mysql_query("SELECT * FROM conduta where idAtend = '".$idAtend."'") or die("ERRO no comando SQL:".mysql_error());
    return mysql_fetch_object($sqlcond);
}

function verHP($idPront) {
    $sql = mysql_query("SELECT * FROM historicopessoal WHERE idPront='".$idPront."'") or die("ERRO no comando SQL:".
		mysql_error());
    $linha = mysql_fetch_object($sql);
    return $linha;
}

function verHF($idPront) {
    $sql = mysql_query("SELECT * FROM historicofamiliar WHERE idPront = '".$idPront."'") or die("ERRO no comando SQL:".
		mysql_error());
    $linha = mysql_fetch_object($sql);
    return $linha;
}

/*function validarProntuario($login,$idProntuario){
$sql_pront = mysql_query("SELECT prontuario.idProntuario FROM paciente, acesso,aluno, prontuario where aluno.idAluno = acesso.idAcesso and acesso.login = '$login' and aluno.idEquipe = prontuario.idEquipe and prontuario.idProntuario = '$idProntuario'");
if (mysql_num_rows($sql_pront) == 0){
header("Location:nao_autorizado.php");
}
}*/

function validarProntuario($login, $idPront) {
    $sql_pront = mysql_query("SELECT pr.idPront FROM paciente pa, acesso ac, aluno al, prontuario pr where al.idAlun = ac.idAcesso
		and ac.login = '".$login."' and pa.idPront = pr.idPront and al.idEquipe = pr.idEquipe and pr.idPront = '".$idPront."'");
    if (mysql_num_rows($sql_pront) == 0)
        header("Location:nao_autorizado.php");
}

function validarAtendimento($login, $idAtend) {
    $sql_pront = mysql_query("SELECT idAtend FROM paciente pa, acesso ac, aluno al, prontuario pr, atendimento at where al.idAlun =
		ac.idAcesso and ac.login = '".$login."' and al.idEquipe = pr.idEquipe and pr.idPront = at.idPront and at.idAtend = '".
			$idAtend."'");
    if (mysql_num_rows($sql_pront) == 0)
        header("Location:nao_autorizado.php");
}

function SQLGrupoSanguineo() {
    return mysql_query("select * FROM tiposanguineo");
}

function SQLVacinasPaciente($idPront) {
    return mysql_query("select d.dose, v.vacina, vi.dt FROM vacinacao vi, dose d, vacina v WHERE d.idDose = vi.idDose &&
		v.idvac = vi.idvac && idPront = '".$idPront."' ORDER BY vi.dt");
}

function SQLVacinas() {
    return mysql_query("select * FROM vacina");
}

function SQLDose() {
    return mysql_query("select * FROM dose");
}

function SQLListaAtendimentos($idPront) {
    return mysql_query("SELECT a.nome, at.idAtend, at.dthr, at.dthralt FROM acesso a, atendimento at WHERE at.idAlun = a.idAcesso
		and at.idPront = '".$idPront."' ORDER BY dthr DESC");
}

function getValuesTableAt($table,$id){
	$table = strtolower($table);
	$sql = mysql_query("SELECT * from ".$table." where idAtend = '".$id."'");
	return mysql_fetch_object($sql);
}

function getValuesTablePr($table,$id){
	$table = strtolower($table);
	$sql = mysql_query("SELECT * from ".$table." where idPront = '".$id."'");
	return mysql_fetch_object($sql);
}

function getCbo(){
	
	$sql = mysql_query("SELECT * from cbo");
	return $sql;
}

function generateRows($table, $numcols, $id){
	$table = strtolower($table);
	$str = "";
	for ($i = 0; $i < $numcols; $i++){
		if ($i == $numcols-1)
			$str .= "''";
		else $str .= "'',";
	}

	mysql_query("insert into ".$table." values ('".$id."',".$str.")");
}

function printData($dthr){
	$dia = substr($dthr, 8, 2);
	$mes = substr($dthr, 5, 2);
	$ano = substr($dthr, 0, 4);
	return $dia."/".$mes."/".$ano;
}

function printHora($dthr){
	return substr($dthr,11,5);
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
    if ($_POST[$id] == NULL || $_POST[$id] == ""){
		if ($field == $value)
        	return "SELECTED";
	} else if ($_POST[$id] != NULL && $_POST[$id] != "") {
		if ($_POST[$id] == $value)
       		return "SELECTED";
	}
	if ($value == "NA" && ($field == "0" || $field == "" || $field == NULL) && ($_POST[$id] == "" || $_POST[$id] == NULL))
		return "SELECTED";
}


function checkDisable($id, $field, $value) {

    if ($_POST[$id] == $value || $field == $value)
        return "";
	return "disabled='true'";
//	else return "disabled=true";
}

function checkDisable2($id, $field, $value, $value2) {
    if ($_POST[$id] == $value || $field == $value || $_POST[$id] == $value2 || $field == $value2)
        return "";
	return "disabled='true'";
//	else return "disabled=true";
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
    else if ($field != "")
        return $field;
	else return "";
}

function printCampo($field, $value) {
    if ($value != "" && $value != NULL)
        return $value;
    else if ($field != "" && $field != "0")
        return $field;
	else return "";
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
	return "Preencha uma data de nascimento v�lida";
}

function validaDataVac($data, $dtnasc){
	if ($data == "") return "Preencha uma data";
	$ano = date(Y);
	if (checkdate(substr($data, 3, 2), substr($data, 0, 2), substr($data, 6, 4))){
		if (substr($data, 6, 4) > $ano)
			return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
		else if (substr($data, 6, 4) == $ano){
			if (substr($data, 3, 2) > date(m))
				return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
			else if ((substr($data, 3, 2) == date(m)) && (substr($data, 0, 2) > date(d)))
				return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
		}
		
		if (substr($data, 6, 4) < substr($dtnasc, 0, 4))
			return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
		else if (substr($data, 6, 4) == substr($dtnasc, 0, 4)){
			if (substr($data, 3, 2) < substr($dtnasc, 5, 2))
				return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
			else if ((substr($data, 3, 2) == substr($dtnasc, 5, 2)) && (substr($data, 0, 2) < substr($dtnasc, 8, 2)))
				return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
		}
		return "";
	} 
	return "Preencha uma data v&aacute;lida";
}

function validaHora($hora){
	if ($hora == "") return true;
	return ereg("^([0-1][0-9]|[2][0-3]):[0-5][0-9]$", $hora);
}
?>