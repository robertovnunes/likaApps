<?php
include ("dbconfig.php");

class repositorioIS
{

    function assinar($idAtendimento, $idAluno){
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("update interrogsintomatologico set ass='1', dthr='".$data.".', idAlun='".$idAluno."' where idAtend='"
			.$idAtendimento."'") or die("ERRO no comando SQL:".mysql_error());
    }

    function alterarGeral($febre, $peso, $atividade, $apetite, $obs, $idAtendimento)
    {
        mysql_query("update geral set febre='" . $febre . "', ativ='" . $atividade .
            "', apet='" . $apetite . "', avpeso='" . $peso . "', obs='" . $obs .
            "' where idAtend='" . $idAtendimento . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    function alterarPele($rash, $ictericia, $infecrep, $obs, $idProntuario)
    {
        mysql_query("update pele set rash='" . $rash . "', infecrep='" . $infecrep .
            "', icter='" . $ictericia . "', obs='" . $obs . "' where idAtend='" .
            $idProntuario . "'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarOlhos($fotofobia, $lacrimejamento, $edema, $secrecao, $dor, $acuidade,
        $obs, $idProntuario)
    {
        mysql_query("update olhos set lacrim='" . $lacrimejamento .
            "', fotof='" . $fotofobia . "', secr='" . $secrecao .
            "', edpalp='" . $edema . "', acvis='" . $acuidade .
            "', dorol='" . $dor . "', obs='" . $obs . "' where idAtend='" . $idProntuario .
            "'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarOuvidos($infeccoes, $secrecao, $dor, $acuidade, $obs, $idProntuario)
    {
        mysql_query("update ouvidos set infecfreq='" . $infeccoes . "', dorouv='" . $dor .
            "', acuid='" . $acuidade . "', secr='" . $secrecao . "', obs='" .
            $obs . "' where idAtend='" . $idProntuario . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    function alterarResp($corrnasal, $sufocacao, $epistaxe, $tosse, $dificresp, $durtosse,
        $tipotosse, $pertosse, $resfriados, $dortoracica, $hemoptise, $obs, $idProntuario)
    {
        mysql_query("update aprespiratorio set epist='" . $epistaxe .
            "', resf='" . $resfriados . "', dortor='" . $dortoracica .
            "', difresp='" . $dificresp . "', hemop='" . $hemoptise .
            "', sufoc='" . $sufocacao . "', corrnas='" . $corrnasal .
            "', tosse='" . $tosse . "', durtosse='" . $durtosse . "', tipotosse='" . $tipotosse .
            "', pertosse='" . $pertosse . "', obs='" . $obs . "' where idAtend='" .
            $idProntuario . "'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function alterarCardVasc($dispneia, $cianose, $palpitacao, $taquicardia, $obs, $idProntuario){
        mysql_query("update apcardiovascular set disp='".$dispneia."', palp='".$palpitacao."', taq='".$taquicardia."', cian='".$cianose.	
			"',obs = '".$obs."' where idAtend = '".$idProntuario."'") or die("ERRO no comando SQL:" . mysql_error());
    }


    function alterarGastInt($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao, $aspfezes,
        $nfezes, $obs, $idProntuario)
    {
        mysql_query("update apgastrointestinal set dorabd='" . $dorabdom .
            "', vomit='" . $vomitos . "', naus='" . $nauseas . "', ten='" . $tenesmo .
            "', evac='" . $evacuacao . "', aspfez='" . $aspfezes . "', nevac='" .
            $nfezes . "', obs='" . $obs . "' where idAtend='" . $idProntuario . "'") or
            die("ERRO no comando SQL:" . mysql_error());
    }

    private function alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
        $urgurina, $corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual,
        $obs, $idProntuario)
    {
        mysql_query("update apgenitourinario set dis='" . $disuria .
            "', ativsex='" . $ativsexual . "', curt='" . $corruretral .
            "', corcurt='" . $corcorruretral . "', odorcurt='" . $odorcorruretral .
            "', urgur='" . $urgurina . "', frequr='" . $frequrina .
            "', odorur='" . $odorurina . "', jatour='" . $jatourina . "', corur='" .
            $corurina . "', qtdur='" . $qtdurina . "', obs='" . $obs .
            "' where idAtend='" . $idProntuario . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    function alterarGenUrinM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
        $urgurina, $corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual,
        $voltesticular, $tampenis, $pubarcah, $polucoes, $erecoes, $obs, $idProntuario)
    {
        $this->alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
            $urgurina, $corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual,
            $obs, $idProntuario);

        mysql_query("update genmasc set erec='" . $erecoes . "', poluc='" . $polucoes .
            "', tampen='" . $tampenis . "', voltest='" . $voltesticular .
            "', pub='" . $pubarcah . "' where idAtend='" . $idProntuario . "'") or
            die("ERRO no comando SQL:" . mysql_error());

    }

    function alterarGenUrinF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
        $urgurina, $corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual,
        $corrvaginal, $corcorrvaginal, $odorcorrvaginal, $prucorrvaginal, $telarca, $pubarcam,
        $menstruacao, $menarca, $regularidade, $fluxo, $obs, $idProntuario)
    {
        $this->alterarGenUrin($qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
            $urgurina, $corruretral, $corcorruretral, $odorcorruretral, $disuria, $ativsexual,
            $obs, $idProntuario);

        mysql_query("update genfem set pubarc='" . $pubarcam . "', telarc='" . $telarca .
            "', corrvg='" . $corrvaginal . "', corcv='" . $corcorrvaginal .
            "', prucv='" . $prucorrvaginal . "', odorcv='" . $odorcorrvaginal .
            "', menst='" . $menstruacao . "', men='" . $menarca .
            "', reg='" . $regularidade . "', fluxo='" . $fluxo .
            "' where idAtend ='" . $idProntuario . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    function alterarMuscEsq($deform, $tumefacoes, $fraqmusc, $dorossea, $obs, $idProntuario){
        mysql_query("update sistmusculoesqueletico set deform='" . $deform .
            "', tumef='" . $tumefacoes . "', doross='" . $dorossea .
            "', fraqmusc='" . $fraqmusc . "', obs='" . $obs .
            "' where idAtend='" . $idProntuario . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    function alterarNerv($cefaleia, $tonturas, $convulsoes, $conv1, $conv2, $traumacran,
        $sincopes, $paresias, $paralisias, $neuropsi, $obs, $idProntuario)
    {
        mysql_query("update sistnervoso set tont='" . $tonturas .
            "', trcran='" . $traumacran . "', cefal='" . $cefaleia .
            "', conv='" . $convulsoes . "', conv1='" . $conv1 . "', conv2='" . $conv2 .
            "', sincop='" . $sincopes . "', pares='" . $paresias . "', paral='" .
            $paralisias . "', retnpsi='" . $neuropsi . "', obs='" . $obs .
            "' where idAtend='" . $idProntuario . "'") or die("ERRO no comando SQL:" .
            mysql_error());
    }

    public function __destruct()
    {
    }

}
?>
