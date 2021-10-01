<?php
class RepositorioPaciente{

    public function __construct() {}

	function existeAtendimento($idAtend) {
        $sqlatend = mysql_query("SELECT idAtend FROM atendimento WHERE idAtend = '" . $idAtend . "' ORDER BY dthr 
			DESC LIMIT 1");
		return (mysql_num_rows($sqlatend) > 0);
    }

	function existePacienteCPF($cpf) {
        $sqlatend = mysql_query("SELECT idPront FROM paciente WHERE cpf = '" . $cpf . "' ORDER BY dthr 
			DESC LIMIT 1");
		return (mysql_num_rows($sqlatend) > 0);
    }

	function existePacienteNome($nome) {
        $sqlatend = mysql_query("SELECT idPront FROM paciente WHERE nome = '" . $nome . "' ORDER BY dthr 
			DESC LIMIT 1");
		return (mysql_num_rows($sqlatend) > 0);
    }

	function existePaciente($paciente) {
        $sqlatend = mysql_query("SELECT idPront FROM paciente WHERE (nome = '" . $paciente->getNome() . "' and
			mae = '" . $paciente->getMae() . "' and dtnasc = '" . $this->DTFrmt1($paciente->getDTNasc()) . 
			"') or (cpf != '' and cpf = '" . $paciente->getCPF() . "') or (cns != '' and cns = '" . 
			$paciente->getCNS() . "')" );
		return (mysql_num_rows($sqlatend) > 0);
    }
	
    function cadastrar($paciente, $login) {
    	$query = mysql_query("SHOW TABLE STATUS LIKE 'prontuario'");
        $data = mysql_fetch_array($query);
		$idProntuario = $data['Auto_increment'];
		$consulta2 = mysql_query("SELECT idEquipe, idAluno from aluno, acesso where idAluno = idAcesso and login = 
			'" . $login . "'");
		$linha2 = mysql_fetch_object($consulta2);
        $dt = $this->DTFrmt1($paciente->getDTNasc());

        /* Cadastra o prontuário */
        mysql_query("insert into prontuario (idPront, idEquipe) values ('" . $idProntuario . "','" . 
			$linha2->idEquipe . "')");
		mysql_query("insert into paciente (idPront, nome, dtnasc, sexo, cns, cpf, mae, pai, endereco, numero, compl,
			bairro, uf, cidade, cep) values ('" . $idProntuario . "','" . $paciente->getNome() . "','" . $dt . "','" 
			. $paciente->getSexo() . "','" . $paciente->getCNS() . "','" . $paciente->getCPF() . "','" . 
			$paciente->getMae() . "','".$paciente->getPai() . "','" . $paciente->getEndereco() . "','" . 
			$paciente->getNumero() . "','" . $paciente->getComplemento() . "','" . $paciente->getBairro() . "','" . 
			$paciente->getUF() . "','" . $paciente->getCidade(). "','" . $paciente->getCEP() . "')") or 
			die("ERRO no comando SQL:" . mysql_error());
		return $this->novoAtendimento($linha2->idAluno, $idProntuario);;
    }

	function novoAtendimento($idAluno, $idPront){
		$query1 = mysql_query("SHOW TABLE STATUS LIKE 'atendimento'");
		$data1 = mysql_fetch_array($query1);
		$idAtendimento = $data1['Auto_increment'];
		mysql_query("insert into atendimento (idAtend, idPront, idAluno, dthr, dthralt) values ('" . $idAtendimento 
		. "', '" . $idPront . "', '" . $idAluno . "', SYSDATE(), SYSDATE())");
		return $idAtendimento;
	}
	
    function alterar($paciente, $idProntuario) {
		$data = $this->DTFrmt1($paciente->getDTNasc());
        mysql_query("update paciente set nome = '" . $paciente->getNome() . "', dtnasc = '" . 
			$data . "',mae = '" . $paciente->getMae() . "', pai = '" . $paciente->getPai() . 
			"', endereco = '" . $paciente->getEndereco() . "', numero = '" . $paciente->getNumero() . "',compl = '" . 
			$paciente->getComplemento() . "', bairro = '" . $paciente->getBairro() . "', uf = '" . 
			$paciente->getUF() . "', cidade = '" . $paciente->getCidade() . "', cep = '" . $paciente->getCep() . 
			"', sexo = '" . $paciente->getSexo() . "' where idPront = '" . $idProntuario . "'") or
            die("ERRO no comando SQL:" . mysql_error());
    }


    function listaPacientes($login) {
        $sql = mysql_query("select pa.idPront, pa.nome, pa.mae, pa.dtnasc from paciente pa, aluno al, 
			acesso ac, prontuario pr where ac.idAcesso = al.idAluno and ac.login = '" . $login . 
			"' and pr.idPront = pa.idPront and al.idEquipe = pr.idEquipe") 
			or die("ERRO no comando SQL:" . mysql_error());
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			$dados['dtnasc'] = $this->DTFrmt2($dados['dtnasc']);
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function listarPacientesLimit($login, $inicio, $limite) {
        $sql = mysql_query("select pa.idPront, pa.nome, pa.mae, pa.dtnasc from paciente pa, aluno al, acesso ac,
            prontuario pr where ac.idacesso = al.idAluno and ac.login = '" . $login . "' and pr.idPront = pa.idPront 
			and al.idEquipe = pr.idEquipe ORDER BY pa.nome ASC limit " . $inicio . "," . $limite) or 
			die("ERRO no comando SQL:" . mysql_error());
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			$dados['dtnasc'] = $this->DTFrmt2($dados['dtnasc']);
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function getUltimoAtendimento($idPront) {
        $sqlatend = mysql_query("SELECT idAtend FROM atendimento WHERE idPront = '" . $idPront . "' ORDER BY dthr 
			DESC LIMIT 1");
        $atend = mysql_fetch_object($sqlatend);
        return $atend->idAtend;
    }

	public function getProntuarioAtendimento($idAtend){
		$sqlpront = mysql_query("SELECT idPront FROM atendimento WHERE idAtend = '" . $idAtend . "'");
        $pront = mysql_fetch_object($sqlpront);
        return $pront->idPront;
	}
	
    function obterPacientePr($idPront){
    	$sqlpaciente = mysql_query("SELECT pa.*, oi.alergmed, da.alerg FROM paciente pa, prontuario pr,
			outrasinformacoes oi, doencasanteriores da WHERE pa.idPront = '" . $idPront . "' and 
			pa.idPront = pr.idPront and oi.idPront = '" . $idPront . "' and da.idPront = '" . $idPront 
			. "'");
    	$obj = mysql_fetch_object($sqlpaciente);
        $paciente = new Paciente($obj->nome, $obj->dtnasc, $obj->cns, $obj->cpf, $obj->sexo, $obj->mae, $obj->pai,
            $obj->endereco, $obj->numero, $obj->compl, $obj->bairro, $obj->cidade, $obj->uf, $obj->cep);
        $paciente->setID($obj->idPront);
        $paciente->setAlergMed($obj->alergmed);
        $paciente->setAlergias($obj->alerg);
    	return $paciente;
    }

    function obterPacienteAt($idAtend) {
        $sql_paciente = mysql_query("SELECT pa.* FROM atendimento at, paciente pa WHERE pa.idPront = 
			at.idPront and at.idAtend = '" . $idAtend . "'");
    	$obj = mysql_fetch_object($sql_paciente);
        $paciente = new Paciente($obj->nome, $this->DTFrmt2($obj->dtnasc), $obj->cns, $obj->cpf, $obj->sexo, $obj->mae, $obj->pai,
            $obj->endereco, $obj->numero, $obj->compl, $obj->bairro, $obj->cidade, $obj->uf, $obj->cep);
        $paciente->setID($obj->idPront);
    	return $paciente;
    }

    function consultaPacienteNome($nome, $idAluno) {
    	$sql = mysql_query("SELECT p.nome, p.dtnasc, p.mae, p.idPront FROM paciente p, prontuario pr WHERE nome LIKE
			'" . $nome . "%' && p.idPront = pr.idPront && pr.idEquipe = (SELECT idEquipe FROM aluno WHERE idAluno = '" .
			$idAluno . "')");
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			$dados['dtnasc'] = $this->DTFrmt2($dados['dtnasc']);
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function consultaPacientePr($idPront, $idAluno) {
	
    	$sql = mysql_query("SELECT p.nome, p.dtnasc, p.mae, p.idPront FROM paciente p, prontuario pr WHERE p.idPront = '" . 
			$idPront . "' && p.idPront = pr.idPront && pr.idEquipe = (SELECT idEquipe FROM aluno WHERE idAluno = '" .
			$idAluno . "')");
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			$dados['dtnasc'] = $this->DTFrmt2($dados['dtnasc']);
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function consultaPacienteMae($mae, $idAluno) {
        $sql = mysql_query("SELECT p.nome, p.dtnasc, p.mae, p.idPront FROM paciente p, prontuario pr WHERE mae LIKE
			'" . $mae . "%' && p.idPront = pr.idPront && pr.idEquipe = (SELECT idEquipe FROM aluno WHERE idAluno = '" .
			$idAluno . "')");
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			$dados['dtnasc'] = $this->DTFrmt2($dados['dtnasc']);
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function consultaInformante($idAtend) {
        $sql_informante = mysql_query("SELECT * FROM informante where idAtend = '" . $idAtend . "'");
        return mysql_fetch_object($sql_informante);
    }

    function consultaParentesco() {
        $sql = mysql_query("SELECT * FROM parentesco ORDER BY idParent");
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function consultaEscolaridade() {
        $sql = mysql_query("SELECT * FROM escolaridade ORDER BY idEsc");
        $tabela = array();
        while ($dados =  mysql_fetch_array($sql)){
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function listaAtendimentos($idPront) {
        $sql = mysql_query("SELECT a.nome, at.idAtend, at.dthr, at.dthralt FROM acesso a, atendimento 
			at WHERE at.idAluno = a.idAcesso and at.idPront = '" . $idPront . "' ORDER BY dthr DESC");
        $tabela = array();
		while ($dados = mysql_fetch_array($sql)){
			array_push($tabela, $dados);
        }
        return $tabela;
    }

    function getValuesTableAt($table,$id){
	    $table = strtolower($table);
	    $sql = mysql_query("SELECT * from " . $table . " where idAtend = '" . $id . "'");
	    return mysql_fetch_object($sql);
    }

    function getValuesTablePr($table,$id){
    	$table = strtolower($table);
    	$sql = mysql_query("SELECT * from " . $table . " where idPront = '" . $id . "'");
    	return mysql_fetch_object($sql);
    }
	
	function getGrupoSanguineo(){
    	$sql = mysql_query("SELECT * FROM tiposanguineo");
		$tabela = array();
		while ($dados = mysql_fetch_array($sql)){
			array_push($tabela, $dados);
        }
		return $tabela;
    }

    private function generateRows($table, $numcols, $id){
    	$table = strtolower($table);
    	$str = "";
    	for ($i = 0; $i < $numcols; $i++){
    		if ($i == $numcols-1)
    			$str .= "''";
    		else $str .= "'',";
    	}
		if ($table == "hipotdiagnost"){
			$query = mysql_query("SHOW TABLE STATUS LIKE 'hipotdiagnost'");
			$data1 = mysql_fetch_array($query);
			$idHipotese = $data1['Auto_increment'];
			mysql_query("insert into " . $table . " values ('" . $idHipotese . "','" . $id . "'," . $str . ")") or 
					die("ERRO no comando SQL:" . mysql_error());
		} else {
			mysql_query("insert into " . $table . " values ('" . $id . "'," . $str . ")") or 
				die("ERRO no comando SQL:" . mysql_error());
		}
			
    }

    function DTFrmt1($dtt){
        $dia = substr($dtt, 0, 2);
	    $mes = substr($dtt, 3, 2);
	    $ano = substr($dtt, 6, 4);
	    return $ano . "-" . $mes . "-" . $dia;
    }

    function DTFrmt2($dtt){
        $dia = substr($dtt, 8, 2);
	    $mes = substr($dtt, 5, 2);
	    $ano = substr($dtt, 0, 4);
        return $dia . "/" . $mes . "/" . $ano;
    }

    public function __destruct(){}

}
?>
