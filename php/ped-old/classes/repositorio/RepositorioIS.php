<?php
class RepositorioIS
{

    public function __construct() {}

    function cadastrarInformante($info, $idAtend)
	{
		mysql_query("INSERT INTO informante (idAtend, nome, sexo, confiab, endereco, compl, bairro, cidade, uf, cep, idParent, 
			idEscol, obs, ass) VALUES ('". $idAtend ."','" . $info->getNome() . "','" . $info->getSexo(). "','a','" . 
			$info->getEndereco() . "','" . $info->getComplemento() . "','" . $info->getBairro() . "','" . $info->getCidade() . 
			"','" . $info->getEstado() . "','" . $info->getCEP() . "','" . $info->getParentesco() . "','" . $info->getEscolaridade() . 
			"','" . $info->getObs() . "','0')") or die("ERRO no comando SQL:" . mysql_error());
	}

	function alterarInformante($info, $idAtend)
	{
		mysql_query("UPDATE informante SET nome='" . $info->getNome() . "', cidade='" . $info->getCidade() . "', uf='" . 
			$info->getEstado() . "', idParent='" . $info->getParentesco() . "', idEsc='" . $info->getEscolaridade() . "', ender='" . 
			$info->getEndereco() . "', compl= '" . $info->getComplemento() . "', confia='a', obs='" . $info->getObs() . "', bairro='" .
			$info->getBairro() . "', cep = '" . $info->getCEP() . "', sexo='" . $info->getSexo() . "', sav = '1' WHERE idAtend = '" .
			$idAtend . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

	function existeInformante($idAtend)
	{
        $sql_informante = mysql_query("SELECT * from informante WHERE idAtend = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return (mysql_num_rows($sql_informante) != 0);
    }
	
    function QPDHDAAssinado($idAtend)
	{
        $sqlqh = mysql_query("SELECT ass FROM qpdhda WHERE idAtend = '" . $idAtend . "'");
        $linhaqh = mysql_fetch_object($sqlqh);
        return ($linhaqh->ass);
    }

	function alterarQPDHDA($qpdhda, $idAtendimento, $assinar, $idAluno)
	{
		mysql_query("UPDATE qpdhda SET historico='" . $qpdhda->getHDA() . "', queixa='" . $qpdhda->getQPD() . "', ass='" . 
			$assinar . "', dthr=SYSDATE(), idAluno = '" . $idAluno . "' WHERE idAtend='" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}
    
    function getQPDHDA($idAtend)
	{
		$sql_qpdhda = mysql_query("SELECT * FROM qpdhda WHERE idAtend = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sql_qpdhda);
    }

    function existeQPDHDA($idPront)
	{
        $sql_qpdhda = mysql_query("SELECT qh.idPront FROM qpdhda qh WHERE qh.idPront = '" . $idPront . "'") or 
			die("ERRO no comando SQL:".mysql_error());
        return (mysql_num_rows($sql_qpdhda) > 0);
    }
	
    function existeIS($idAtend)
	{
        $sql_is = mysql_query("SELECT * FROM interrogsint WHERE idAtend = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:".mysql_error());
        return (mysql_num_rows($sql_is) > 0);
    }

    function getIS($idAtend)
	{
        $sql_is = mysql_query("SELECT * FROM interrogsint WHERE idAtend = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:".mysql_error());
        $linhais = mysql_fetch_object($sql_is);
        return $linhais;
    }

    function assinar($idAtendimento, $idAluno)
	{
		mysql_query("UPDATE interrogsint SET ass = '1', dthr = SYSDATE(), idAluno = '" . $idAluno . "' WHERE
            idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:".mysql_error());
		mysql_query("UPDATE atendimento SET dthralt = SYSDATE() WHERE idAtend = '". $idAtend ."'") or 
			die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarGeral($febre, $peso, $atividade, $apetite, $obs, $idAtendimento)
    {
        mysql_query("UPDATE geral SET febre = '" . $febre . "', atividade = '" . $atividade . 
			"', apetite = '" . $apetite . "', altpeso='" . $peso . "', obs = '" . $obs . 
			"' WHERE idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarPele($rash, $ictericia, $infecrep, $obs, $idAtendimento)
    {
        mysql_query("UPDATE pele SET rash = '" . $rash . "', infecrep = '" . $infecrep . "', ictericia = '" . 
			$ictericia . "', obs = '" . $obs . "' WHERE idAtend = '" . $idAtendimento . "'") 
			or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarOlhos($fotofobia, $lacrimejamento, $edema, $secrecao, $dor, $acuidade, $obs, 
		$idAtendimento)
    {
        mysql_query("UPDATE olhos SET lacrim = '" . $lacrimejamento . "', fotofobia = '" . $fotofobia . 
			"', secrecaool = '" . $secrecao . "', edemapalp = '" . $edema . "', acuidvis = '" . 
			$acuidade . "', dorolho = '" . $dor . "', obs = '" . $obs . "' WHERE idAtend = '" . 
			$idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarOuvidos($infeccoes, $secrecao, $dor, $acuidade, $obs, $idAtendimento)
    {
        mysql_query("UPDATE ouvidos SET infecfreq = '" . $infeccoes . "', dorouvido = '" . $dor . 
			"', acuidaud = '" . $acuidade . "', secrecaoou = '" . $secrecao . "', obs = '" . $obs . 
			"' WHERE idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarResp($corrnasal, $sufocacao, $epistaxe, $tosse, $dificresp, $durtosse, $tipotosse, $pertosse, 
		$resfriados, $dortoracica, $hemoptise, $obs, $idAtendimento)
    {
        mysql_query("UPDATE aprespiratorio SET epistaxe = '" . $epistaxe . "', resffreq = '" . 
			$resfriados . "', dortor = '" . $dortoracica . "', difresp = '" . $dificresp . 
			"', hemoptise = '" . $hemoptise . "', sufocacao = '" . $sufocacao . "', corrnasal = '" . 
			$corrnasal . "', tosse = '" . $tosse . "', dtosse = '" . $durtosse . "', ttosse = '" . 
			$tipotosse . "', ptosse = '" . $pertosse . "', obs = '" . $obs . "' WHERE idAtend = '" . 
			$idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarCardVasc($dispneia, $cianose, $palpitacao, $taquicardia, $obs, $idAtendimento){
        mysql_query("UPDATE apcardiovascular SET dispneia = '" . $dispneia . "', palpitacao = '" . 
			$palpitacao . "', taquicardia = '" . $taquicardia . "', cianose = '" . $cianose. "', obs = '" . 
			$obs . "' WHERE idAtend = '" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
    }


    function alterarGastInt($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao, $aspfezes, $nfezes, 
		$obs, $idAtendimento)
    {
        mysql_query("UPDATE apgastrointestinal SET dorabdom = '" . $dorabdom . "', vomitos = '" . 
			$vomitos . "', nauseas = '" . $nauseas . "', tenesmo = '" . $tenesmo . "', evacuacao = '" . 
			$evacuacao . "', aspfezes = '" . $aspfezes . "', nfezes = '" . $nfezes . "', obs = '" . 
			$obs . "' WHERE idAtend='" . $idAtendimento . "'") or die("ERRO no comando SQL:" . 
			mysql_error());
    }

    private function alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, 
		$corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $obs, $idAtendimento)
    {
        mysql_query("UPDATE apgenitourinario SET disuria = '" . $disuria . "', ativsex = '" . 
			$ativsexual . "', corruret = '" . $corruretral . "', corcorruret = '" . $corcorruretral . 
			"', odorcorruret = '" . $odorcorruretral . "', urgurina = '" . $urgurina . "', frequrina = '" . 
			$frequrina . "', odorurina = '" . $odorurina . "', jatourina = '" . $jatourina . 
			"', corurina = '" . $corurina . "', qtdurina = '" . $qtdurina . "', obs = '" . $obs . 
			"' WHERE idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
	}

    function alterarGenUrinM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, 
		$corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $voltesticular, 
		$tampenis, $pubarcah, $polucoes, $erecoes, $obs, $idAtendimento)
    {
        $this->alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, 
			$corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $obs, $idAtendimento);
        mysql_query("UPDATE genmasc SET erecao = '" . $erecoes . "', polucoes = '" . $polucoes . 
			"', tampenis = '" . $tampenis . "', voltest = '" . $voltesticular . "', pubarcah = '" . 
			$pubarcah . "' WHERE idAtend = '" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarGenUrinF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, 
		$corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $corrvaginal, 
		$corcorrvaginal, $odorcorrvaginal, $prucorrvaginal, $telarca, $pubarcam, $menstruacao, 
		$menarca, $regularidade, $fluxo, $obs, $idAtendimento)
    {
        $this->alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, 
			$corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $obs, $idAtendimento);
        mysql_query("UPDATE genfem SET pubarcam = '" . $pubarcam . "', telarca = '" . $telarca . 
			"', corrvag = '" . $corrvaginal . "', corcorrvag = '" . $corcorrvaginal . "', prucorrvag = '" . 
			$prucorrvaginal . "', odorcorrvag = '" . $odorcorrvaginal . "', histmenst = '" . 
			$menstruacao . "', menarca = '" . $menarca . "', regularidade = '" . $regularidade . 
			"', fluxo = '" . $fluxo . "' WHERE idAtend = '" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarMuscEsq($deform, $tumefacoes, $fraqmusc, $dorossea, $obs, $idAtendimento){
        mysql_query("UPDATE sistmusculoesqueletico SET deform = '" . $deform . "', tumefacoes = '" . 
			$tumefacoes . "', dorossea = '" . $dorossea . "', fraqmusc = '" . $fraqmusc . "', obs = '" . 
			$obs . "' WHERE idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:" . 
			mysql_error());
	}

    function alterarNerv($cefaleia, $tonturas, $convulsoes, $conv1, $conv2, $traumacran, $sincopes, 
		$paresias, $paralisias, $neuropsi, $obs, $idAtendimento)
    {
        mysql_query("UPDATE sistnervoso SET tonturas = '" . $tonturas . "', traumacran = '" . 
			$traumacran . "', cefaleia = '" . $cefaleia . "', convulsoes = '" . $convulsoes . 
			"', conv1 = '" . $conv1 . "', conv2 = '" . $conv2 . "', sincopes = '" . $sincopes . 
			"', paresias = '" . $paresias . "', paralisias = '" . $paralisias . "', retneuropsi = '" . 
			$neuropsi . "', obs = '" . $obs . "' WHERE idAtend = '" . $idAtendimento . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
	}

    function getSalvosAbasIS($idAtend) {
        $consulta = mysql_query("select * from abasis WHERE idAtend = '" . $idAtend . "'");
       	$abasSalvas = mysql_fetch_object($consulta);
        return $abasSalvas;
	}

    public function __destruct(){}

}
?>
