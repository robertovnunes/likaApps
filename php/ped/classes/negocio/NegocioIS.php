<?php
include_once ("classes/repositorio/RepositorioIS.php");

class NegocioIS {

    private $repIS;

    public function __construct() {
        $this->repIS = new repositorioIS();
    }

	public function getIS($idAtendimento) {
        return $this->repIS->getIS($idAtendimento);
    }	

	public function getSalvosAbasIS($idAtendimento) {
        return $this->repIS->getSalvosAbasIS($idAtendimento);
    }	

	public function assinarIS($assinar, $idAtendimento, $idAluno) {
        if ($assinar) $this->repIS->assinar($idAtendimento, $idAluno);
    }

    public function alterarGIS($febre, $altpeso, $atividade, $apetite, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosGIS($febre, $altpeso, $atividade, $apetite);
        if (!$invalido) {
            $this->repIS->alterarGeral($febre, $altpeso, $atividade, $apetite, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarPIS($rash, $ictericia, $infecrep, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosPIS($rash, $ictericia, $infecrep);
        if (!$invalido) {
            $this->repIS->alterarPele($rash, $ictericia, $infecrep, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarOLIS($fotofobia, $lacrim, $edemapalp, $secrecaool, $dorolho, $acuidvis, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosOLIS($fotofobia, $lacrim, $edemapalp, $secrecaool, $dorolho, $acuidvis);
        if (!$invalido) {
            $this->repIS->alterarOlhos($fotofobia, $lacrim, $edemapalp, $secrecaool, $dorolho, $acuidvis, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }


    public function alterarOUIS($infeccoes, $secrecao, $dor, $acuidade, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosOUIS($infeccoes, $secrecao, $dor, $acuidade);
        if (!$invalido) {
            $this->repIS->alterarOuvidos($infeccoes, $secrecao, $dor, $acuidade, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarRIS($corrnasal, $sufocacao, $epistaxe, $tosse, $difresp, $durtosse, $tipotosse, $pertosse, $resffreq, $dortorac, $hemoptise, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosRIS($epistaxe, $resffreq, $dortorac, $difresp, $hemoptise, $sufocacao, $corrnasal, $tosse, $durtosse, $tipotosse, $pertosse);

        if (!$invalido) {
            $this->repIS->alterarResp($corrnasal, $sufocacao, $epistaxe, $tosse, $difresp, $durtosse, $tipotosse, $pertosse, $resffreq, $dortorac, $hemoptise, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarCVIS($dispneia, $cianose, $palpitacao, $taquicardia, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosCVIS($dispneia, $palpitacao, $taquicardia, $cianose);

        if (!$invalido) {
            $this->repIS->alterarCardVasc($dispneia, $cianose, $palpitacao, $taquicardia, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarGIIS($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao, $aspfezes, $nfezes, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosGIIS($dorabdom, $vomitos, $nauseas, $tenesmo, $evacuacao, $aspfezes, $nfezes);

        if (!$invalido) {
			if ($nfezes == "0") $nfezes = "\0";
			$this->repIS->alterarGastInt($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao, $aspfezes, $nfezes, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarGUIS($sexo, $qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corrure, $corcorrure, $odorcorrure, $disuria, $atsexual, $voltestic, $tampenis, $pubarcah, $polucoes, $erecao, $corrvag, $corcorrvag, $odorcorrvag, $prucorrvag, $telarca, $pubarcam, $histmenst, $menarca, $regularidade, $fluxo, $obs, $idAtendimento) {

        if ($sexo == "M") {
            $invalido = $this->parametrosInvalidosGUISM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corrure, $corcorrure, $odorcorrure, $disuria, $atsexual, $pubarcah, $voltestic, $tampenis, $polucoes, $erecao);

            if (!$invalido) {
                $this->repIS->alterarGenUrinM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corrure, $corcorrure, $odorcorrure, $disuria, $atsexual, $voltestic, $tampenis, $pubarcah, $polucoes, $erecao, $obs, $idAtendimento);
            } else {
                throw new CamposInvalidos();
            }

        } else
            if ($sexo == "F") {
                $invalido = $this->parametrosInvalidosGUISF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corrure, $corcorrure, $odorcorrure, $disuria, $atsexual, $pubarcam, $corrvag, $corcorrvag, $odorcorrvag, $prucorrvag, $telarca, $histmenst, $menarca, $regularidade, $fluxo);

                if (!$invalido) {
                    $this->repIS->alterarGenUrinF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corrure, $corcorrure, $odorcorrure, $disuria, $atsexual, $corrvag, $corcorrvag, $odorcorrvag, $prucorrvag, $telarca, $pubarcam, $histmenst, $menarca, $regularidade, $fluxo, $obs, $idAtendimento);
                } else {
                    throw new CamposInvalidos();
                }

            }
    }

    public function alterarMEIS($deform, $tumefacoes, $fraqmusc, $dorossea, $obs, $idAtendimento) {
        $invalido = $this->parametrosInvalidosMEIS($deform, $tumefacoes, $dorossea, $fraqmusc);

        if (!$invalido) {
            $this->repIS->alterarMuscEsq($deform, $tumefacoes, $fraqmusc, $dorossea, $obs, $idAtendimento);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarNIS($cefaleia, $tonturas, $convulsoes, $conv1, $conv2, $traumacran, $sincopes, $paresias, $paralisias, $neuropsi, $obs, $idProntuario) {
        $invalido = $this->parametrosInvalidosNIS($cefaleia, $tonturas, $convulsoes, $traumacran, $sincopes, $paresias, $paralisias, $neuropsi, $conv1, $conv2);

        if (!$invalido) {
            $this->repIS->alterarNerv($cefaleia, $tonturas, $convulsoes, $conv1, $conv2, $traumacran, $sincopes, $paresias, $paralisias, $neuropsi, $obs, $idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

    private function parametrosInvalidosGIS($febre, $peso, $atividade, $apetite) {
        if (!$febre || $peso == "0" || $atividade == "0" || $apetite == "0")
            return true;
        return false;
    }

    private function parametrosInvalidosPIS($rash, $ictericia, $infeccoes) {
        if ($rash == "0" || $ictericia == "0" || !$infeccoes)
            return true;
        return false;
    }

    private function parametrosInvalidosOLIS($fotofobia, $lacrimejamento, $edema, $secrecao, $dor, $acuidade) {
        if (!$fotofobia || !$lacrimejamento || !$edema || !$secrecao || $dor == "0" || $acuidade == "0")
            return true;
        return false;
    }

    private function parametrosInvalidosOUIS($infeccoes, $secrecao, $dor, $acuidade) {
		if (!$infeccoes || !$secrecao || $dor == "0" || $acuidade == "0")
            return true;
        return false;
    }

    private function parametrosInvalidosRIS($epistaxe, $resfriados, $dortoracica, $dificresp, $hemoptise, $sufocacao, $corrnasal,
        $tosse, $durtosse, $tipotosse, $pertosse) {
        if (!$epistaxe || !$resfriados || !$dortoracica || !$dificresp || !$hemoptise || !$sufocacao || 
			$corrnasal == "0" || !$tosse)
            return true;
        if ($tosse == "P" && ($durtosse == "0" || $tipotosse == "0" || $pertosse == "0"))
            return true;
        return false;
    }

    private function parametrosInvalidosCVIS($dispneia, $palpitacao, $taquicardia, $cianose) {
        if (!$dispneia || !$palpitacao || !$taquicardia || $cianose == "0")
            return true;
        return false;
    }

    private function parametrosInvalidosGIIS($dorabdominal, $vomitos, $nauseas, $tenesmo, $evacuacao, $aspfezes, $nfezes) {
        if (!$dorabdominal || $vomitos == "0" || !$nauseas || !$tenesmo || $evacuacao == "0")
            return true;
        if ($evacuacao != "NA" && !is_numeric($nfezes))
            return true;
        return false;
    }

    private function parametrosInvalidosGUISM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corruretral,
        $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $pubarca, $voltesticular, $tampenis, $polucoes, $erecoes) {
        if ($qtdurina == "0" || $jatourina == "0" || $corurina == "0" || $odorurina == "0" || 
			$frequrina == "0" || !$urgurina || !$corruretral || !$disuria || !$ativsexual || 
			$pubarca == "0" || $voltesticular == "0" || $tampenis == "0" || !$polucoes || !$erecoes )
            return true;
        if ($corruretral == "P" && ($corcorruretral == "0" || $odorcoruretral == "0"))
            return true;
        return false;
    }

    private function parametrosInvalidosGUISF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corruretral,
        $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $pubarca, $corrvaginal, $corcorrvaginal, $odorcorrvaginal,
        $prucorrvaginal, $telarca, $menstruacao, $menarca, $regularidade, $fluxo) {
		if ($qtdurina == "0" || $jatourina == "0" || $corurina == "0" || $odorurina == "0" || 
			$frequrina == "0" || !$urgurina || !$corruretral || !$disuria || !$ativsexual || 
			$pubarca == "0" || !$corrvaginal || $telarca == "0" || $menstruacao == "")
            return true;
        if ($corruretral == "P" && ($corcorruretral == "0" || $odorcorruretral == "0"))
            return true;
        if ($corrvaginal == "P" && ($corcorrvaginal == "0" || $odorcorrvaginal == "0" || 
			$prucorrvaginal == ""))
            return true;
        if ($menstruacao == "P" && ($menarca == "0" || $regularidade == "0" || $fluxo == "0"))
            return true;
        return false;
    }

    private function parametrosInvalidosMEIS($deformidades, $tumefacoes, $dorossea, $fraqmusc) {
        if (!$deformidades || !$tumefacoes || !$dorossea || !$fraqmusc)
            return true;
        return false;
    }

    private function parametrosInvalidosNIS($cefaleia, $tonturas, $convulsoes, $traumascranianos, $sincopes, $paresias,
        $paralisias, $retardoneurom, $tipo1, $tipo2) {
        if (!$cefaleia || !$tonturas || $convulsoes == "0" || !$traumascranianos || !$sincopes || 
			!$paresias || !$paralisias || !$retardoneurom)
            return true;
        if (($convulsoes == "F" || $convulsoes == "A") && ($tipo1 == "0" || $tipo2 == "0"))
            return true;
        return false;
    }

    public function __destruct() {
    }

} ?>
