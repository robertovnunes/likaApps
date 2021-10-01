<?php
include_once("controllers/ControllerGeral.php");
include_once("classes/basicas/Informante.php");
include_once("classes/basicas/Paciente.php");
include_once("controllers/ControllerProntuarioPaciente.php");
include_once("controllers/ControllerListaAtendimentos.php");
include_once("classes/basicas/QPDHDA.php");


$pdfqpd = $fachada->getQPDHDA($atend);
$pdfgeral = $fachada->getIS($atend);
/*IS*/
$lger = $fachada->getValuesTableAt('geral',$atend);
$lpele = $fachada->getValuesTableAt('pele',$atend);
$lolh = $fachada->getValuesTableAt('olhos',$atend);
$louv = $fachada->getValuesTableAt('ouvidos',$atend);
$lrsp = $fachada->getValuesTableAt('aprespiratorio',$atend);
$lapcv = $fachada->getValuesTableAt('apcardiovascular',$atend);
$lgi = $fachada->getValuesTableAt('apgastrointestinal',$atend);
$lgu = $fachada->getValuesTableAt('apgenitourinario',$atend);
$lme = $fachada->getValuesTableAt('sistmusculoesqueletico',$atend);
$lnerv = $fachada->getValuesTableAt('sistnervoso',$atend);
/*Exame Físico*/
$leins = $fachada->getValuesTableAt('inspecao',$atend);
$lepele = $fachada->getValuesTableAt('examepele',$atend);
$legang = $fachada->getValuesTableAt('exameganglinf',$atend);
$medind = $fachada->getValuesTableAt('medind',$atend);
$lant = $fachada->getValuesTableAt('antroestpuberal',$atend);
$ldes = $fachada->getValuesTableAt('desenvneuropsicomotor',$atend);
/*Especial*/
$lcr = $fachada->getValuesTableAt('examecranio',$atend);
$leolh = $fachada->getValuesTableAt('exameolhos',$atend);
$leot = $fachada->getValuesTableAt('examesistotorrin',$atend);
$lepes = $fachada->getValuesTableAt('examepescoco',$atend);
$lecdvs = $fachada->getValuesTableAt('examecardvasc',$atend);
$lersp = $fachada->getValuesTableAt('exameresp',$atend);
$legt = $fachada->getValuesTableAt('examegastint',$atend);
$legu = $fachada->getValuesTableAt('examegenurin',$atend);
if ($paciente->getSexo() == "F"){
			$lesf = $fachada->getValuesTableAt('examegenfem',$atend);
			$fem = 1;
}
if ($paciente->getSexo() == "M"){ 
			$lesm = $fachada->getValuesTableAt('examegenmasc',$atend);
}
$leme = $fachada->getValuesTableAt('examemuscesq',$atend);
$lenv = $fachada->getValuesTableAt('examenervoso',$atend);
/*HD*/
$listahip = $fachada->listaHD($atend);


$paciente = $fachada->obterPacienteAt($atend);

$valPac = array('','','','');

$valPac[0] = $fachada->printCampo($paciente->getNome(), $valPac[0]);
$valPac[1] = $fachada->printCampo($fachada->printData($paciente->getDTNasc()), $valPac[1]);
$valPac[2] = $fachada->printCampo($paciente->getSexo(), $valPac[2]);
$valPac[3] = $fachada->printCampo($paciente->getBairro(),$valPac[3]);
$nomePAC = iniciais($valPac[0]);


function iniciais($nome){
	$aux = explode(' ',$nome);

	$i = 0;
	while($aux[$i] != NULL ){
	
		$iniciais = $iniciais . substr($aux[$i],0,1);
		$i = $i + 1;
	}

	return $iniciais;	
}

foreach ($listaatend as $t){                  
     $dataAtend = $t['dthr'];
     $dataAtendAlt = $t['dthralt'];
}

/*Controle de Informação "Sem Dados" - Prontuário*/


//Interrogatorio Sintomatologico
$dadosInformante = NULL;
$dadosQPD = NULL;
$dadosISGeral = NULL;
$dadosISPele = NULL;
$dadosISOlhos = NULL;
$dadosISOuvidos = NULL;
$dadosISResp = NULL;
$dadosISCardio = NULL;
$dadosISGastro = NULL;
$dadosISGenito = NULL;
$dadosISMusculo = NULL;
$dadosISNervoso = NULL;
$dadosIS = NULL;

if($infoParent|| $infoEsc|| $informante->bairro||($informante->sexo && $informante->sexo!='NA')|| $nomeInfo)
	$dadosInformante = 1;
if($pdfqpd->queixa || $pdfqpd->historico)
	$dadosQPD = 1;
if(($lger->altpeso && $lger->altpeso != 'NA') || ($lger->apetite && $lger->apetite != 'NA') || ($lger->atividade && $lger->atividade!= 'NA') || ($lger->febre && $lger->febre != 'NA') || ($lger->obs))
	$dadosISGeral = 1;
if(($lpele->rash && $lpele->rash != 'NA') || ($lpele->ictericia && $lpele->ictericia != 'NA') || ($lpele->infecrep && $lpele->infecrep != 'NA') || ($lpele->obs))
	$dadosISPele = 1;
if(($lolh->fotofobia && $lolh->fotofobia != 'NA') || ($lolh->lacrim && $lolh->lacrim != 'NA') || ($lolh->secrecaool && $lolh->secrecaool != 'NA') || ($lolh->edemapalp && $lolh->edemapalp != 'NA') || ($lolh->dorolho && $lolh->dorolho != 'NA') || ($lolh->acuidvis && $lolh->acuidvis != 'NA') || ($lolh->obs))
	$dadosISOlhos = 1;
if(($louv->obs) || ($louv->acuidaud && $louv->acuidaud != 'NA') || ($louv->secrecaoou && $louv->secrecaoou != 'NA') || ($louv->infecfreq && $louv->infecfreq != 'NA') || ($louv->dorouvido && $louv->dorouvido != 'NA') || ($louv->acuidaud && $louv->acuidaud != 'NA'))
	$dadosISOuvidos = 1;
if(($lrsp->obs)||($lrsp->hemoptise && $lrsp->hemoptise != 'NA')||($lrsp->difresp && $lrsp->difresp != 'NA')||($lrsp->dortor && $lrsp->dortor != 'NA')||($lrsp->resffreq && $lrsp->resffreq != 'NA')||($lrsp->ttosse && $lrsp->ttosse != 'NA')|| ($lrsp->tosse && $lrsp->tosse != 'NA')||($lrsp->corrnasal && $lrsp->corrnasal != 'NA') ||($lrsp->epistaxe && $lrsp->epistaxe != 'NA') ||($lrsp->sufocacao && $lrsp->sufocacao != 'NA'))
	$dadosISResp = 1;
if(($lapcv->obs)||($lapcv->taquicardia && $lapcv->taquicardia != 'NA')||($lapcv->palpitacao && $lapcv->palpitacao!= 'NA')||($lapcv->dispneia && $lapcv->dispneia!= 'NA')||($lapcv->cianose && $lapcv->cianose!= 'NA'))
	$dadosISCardio = 1;
if(($lgi->obs)||($lgi->tenesmo && $lgi->tenesmo != 'NA')||($lgi->evacuacao && $lgi->evacuacao != 'NA')||($lgi->vomitos && $lgi->vomitos != 'NA')||($lgi->dorabdom && $lgi->dorabdom != 'NA')||($lgi->nauseas && $lgi->nauseas != 'NA'))
	$dadosISGastro = 1;
if(($lgu->obs)|| ($lsf->fluxo && $lsf->fluxo != 'NA')|| ($lsf->regularidade && $lsf->regularidade != 'NA')|| ($lsf->histmenst && $lsf->histmenst != 'NA')|| ($lsf->pubarcam && $lsf->pubarcam != 'NA')|| ($lsf->telarca && $lsf->telarca != 'NA')|| ($lsf->prucorrvag && $lsf->prucorrvag != 'NA')|| ($lsf->odorcorrvag && $lsf->odorcorrvag != 'NA')|| ($lsf->corrvag && $lsf->corrvag != 'NA')|| ($lsm->polucoes && $lsm->polucoes != 'NA')|| ($lsm->tampenis && $lsm->tampenis != 'NA')||($lsm->erecao && $lsm->erecao != 'NA') ||($lsm->voltest && $lsm->voltest != 'NA') || ($lsm->pubarcah && $lsm->pubarcah != 'NA')|| ($lgu->ativsex && $lgu->ativsex != 'NA')||($lgu->disuria && $lgu->disuria != 'NA')||($lgu->qtdurina && $lgu->qtdurina != 'NA') || ($lgu->corurina != 'NA' && $lgu->corurina) || ($lgu->frequrina != 'NA' && $lgu->frequrina) || ($lgu->jatourina != 'NA' && $lgu->jatourina) || ($lgu->odorurina != 'NA' && $lgu->odorurina) || ($lgu->urgurina != 'NA' && $lgu->urgurina))
	$dadosISGenito = 1;
if(($lme->obs)||($lme->dorossea && $lme->dorossea != 'NA')||($lme->fraqmusc && $lme->fraqmusc != 'NA')||($lme->deform && $lme->deform != 'NA')||($lme->tumefacoes && $lme->tumefacoes != 'NA'))
	$dadosISMusculo = 1;
if(($lnerv->obs)||($lnerv->retneuropsi && $lnerv->retneuropsi != 'NA')|| ($lnerv->paralisias && $lnerv->paralisias != 'NA')|| ($lnerv->paresias && $lnerv->paresias != 'NA') ||($lnerv->sincopes && $lnerv->sincopes != 'NA')||($lnerv->traumacran && $lnerv->traumacran != 'NA')||($lnerv->convulsoes && $lnerv->convulsoes != 'NA')||($lnerv->tonturas && $lnerv->tonturas != 'NA')||($lnerv->cefaleia && $lnerv->cefaleia != 'NA'))
	$dadosISNervoso = 1;
if($dadosISGeral||$dadosISPele||$dadosISOlhos||$dadosISOuvidos||$dadosISResp||$dadosISCardio ||$dadosISGenito|| $dadosISGastro||$dadosISNervoso || $dadosISMusculo)
	$dadosIS = 1;

//Exame Físico

//Exame Físico Geral
$dadosInspecao = NULL;
$dadosPeleMuc = NULL;
$dadosGanglios = NULL;
$dadosExFisGeral = NULL;

if(($leins->estgeral && $leins->estgeral != 'NA') || ($leins->tdoenca && $leins->tdoenca != 'NA') || ($leins->aspdoenca && $leins->aspdoenca != 'NA') || ($leins->desenvfis && $leins->desenvfis != 'NA') || ($leins->nutricao && $leins->nutricao != 'NA') || ($leins->coop &&  $leins->coop != 'NA') || ($leins->deformfis && $leins->deformfis != 'NA') || ($leins->anormpost && $leins->anormpost != 'NA') || ($leins->obs))
	$dadosInspecao = 1;
if(($lepele->corpele && $lepele->corpele != 'NA') || ($lepele->umidpele && $lepele->umidpele != 'NA') || ($lepele->temppele && $lepele->temppele != 'NA')|| ($lepele->cicatriz && $lepele->cicatriz != 'NA') || ($lepele->hemor && $lepele->hemor != 'NA') || ($lepele->rash && $lepele->rash != 'NA') || ($lepele->circcol && $lepele->circcol != 'NA') || ($lepele->edemapele && $lepele->edemapele != 'NA') || (($lepele->consistun && $lepele->consistun != 'NA') || ($lepele->deformun && $lepele->deformun != 'NA') || ($lepele->manchasun != 'NA' && $lepele->manchasun) || ($lepele->inflamun && $lepele->inflamun != 'NA') ) || ($lepele->obs))
	$dadosPeleMuc = 1;
if(($legang->ganglios && $legang->ganglios != 'NA') || ($legang->obs))
	$dadosGanglios = 1;
if($dadosInspecao || $dadosPeleMuc || $dadosGanglios)
	$dadosExFisGeral = 1;

//Antropometria
$dadosMedInd = NULL;
$dadosEstPub = NULL;
$dadosDesNeuro = NULL;
$dadosAntro = NULL;

if((($medind->peso && $medind->peso != 'NA') || ($medind->altura && $medind->altura != 'NA') || ($medind->permcef && $medind->permcef != 'NA') || ($medind->permtora && $medind->permtora != 'NA') || ($medind->permab && $medind->permab != 'NA') || ($medind->pregatric && $medind->pregatric != 'NA') || ($medind->pregasubesc && $medind->pregasubesc != 'NA')))
	$dadosMedInd = 1;
if((($lant->pelospub && $lant->pelospub != 'NA') || ($lant->mamas && $lant->mamas != 'NA') || ($lant->voltest && $lant->voltest != 'NA') || ($lant->genitais && $lant->genitais != 'NA') || ($lant->obs)))
	$dadosEstPub = 1;
if((($ldes->brvm && $ldes->brvm != 'NA') || ($ldes->orpp && $ldes->orpp != 'NA') || ($ldes->rscs && $ldes->rscs != 'NA') || ($ldes->pblco && $ldes->pblco != 'NA') || ($ldes->scopo && $ldes->scopo != 'NA') || ($ldes->bcvtc && $ldes->bcvtc != 'NA') || ($ldes->bcmlb && $ldes->bcmlb != 'NA') || ($ldes->bmfsa && $ldes->bmfsa != 'NA') || ($ldes->vrs && $ldes->vrs != 'NA') || ($ldes->vrs && $ldes->vrs != 'NA') || ($ldes->qeabtl && $ldes->qeabtl != 'NA') || ($ldes->bfssa && $ldes->bfssa != 'NA') || ($ldes->cae && $ldes->cae != 'NA') || ($ldes->pomo && $ldes->pomo != 'NA') || ($ldes->epd && $ldes->epd != 'NA') || ($ldes->rspm && $ldes->rspm != 'NA') || ($ldes->bpfpca && $ldes->bpfpca != 'NA') || ($ldes->bpacda && $ldes->bpacda != 'NA') || ($ldes->pfudp && $ldes->pfudp != 'NA') || ($ldes->cas && $ldes->cas != 'NA') || ($ldes->cbld && $ldes->cbld != 'NA') || ($ldes->qcs && $ldes->qcs != 'NA') || ($ldes->gehmd && $ldes->gehmd != 'NA') || ($ldes->cfbqc && $ldes->cfbqc != 'NA') || ($ldes->ffs && $ldes->ffs != 'NA') || ($ldes->dtvp && $ldes->dtvp != 'NA') || ($ldes->csde && $ldes->csde != 'NA') || ($ldes->pasv && $ldes->pasv != 'NA') || ($ldes->acxc && $ldes->acxc != 'NA') || ($ldes->secac && $ldes->secac != 'NA') || ($ldes->cpnt && $ldes->cpnt != 'NA') || ($ldes->gboc && $ldes->gboc != 'NA') || ($ldes->vests && $ldes->vests != 'NA') || ($ldes->ffcc && $ldes->ffcc != 'NA') || ($ldes->pmpq && $ldes->pmpq != 'NA') || ($ldes->iaaif && $ldes->iaaif != 'NA') ||($ldes->obs) ))
	$dadosDesNeuro = 1;
if($dadosDesNeuro || $dadosEstPub || $dadosMedInd)
	$dadosAntro = 1;
	


//Especial
$dadosCranio = NULL;
$dadosOlhos = NULL;
$dadosOtorrino = NULL;
$dadosPescoco = NULL;
$dadosResp = NULL;
$dadosCardio = NULL;
$dadosGastro = NULL;
$dadosGenito = NULL;
$dadosMusculo = NULL;
$dadosNervoso = NULL;
$dadosEspecial = NULL;

if(($lcr->tamcranio && $lcr->tamcranio != 'NA') || ($lcr->formacranio && $lcr->formacranio != 'NA') || ($lcr->fontanelas && $lcr->fontanelas != 'NA') || ($lcr->suturas && $lcr->suturas != 'NA') || (($lcr->craneo && $lcr->craneo != 'NA') || ($lcr->cabelo && $lcr->cabelo != 'NA') || ($lcr->lescab && $lcr->lescab != 'NA') || ($lcr->obs)))
	$dadosCranio = 1;
if(($leolh->ptose && $leolh->ptose != 'NA') || ($leolh->edemapalp  && $leolh->edemapalp  != 'NA') || ($leolh->corescle || $leolh->hemorragias || $leolh->secrecao || $leolh->inflamacao || $leolh->cilios ||  $leolh->movoc || $leolh->pupila ||$leolh->acuidvis)  || ($leolh->obs))
	$dadosOlhos = 1;
if(($leot->obs) || ($leot->corfaringe && $leot->corfaringe != 'NA') || ($leot->exsudatof && $leot->exsudatof != 'NA') || ($leot->numdentes && $leot->numdentes != 'NA') || ($leot->consdentes && $leot->consdentes != 'NA') || ($leot->impldentes && $leot->impldentes != 'NA') ||($leot->corlingua && $leot->corlingua != 'NA') || ($leot->umidlingua && $leot->umidlingua != 'NA') || ($leot->exsudatol && $leot->exsudatol != 'NA')|| ($leot->tremlingua && $leot->tremlingua != 'NA')|| ($leot->tumoracoes && $leot->tumoracoes != 'NA') || (($leot->corgeng && $leot->corgeng != 'NA') || ($leot->hemorrgeng && $leot->hemorrgeng != 'NA')) |($leot->corlabios && $leot->corlabios != 'NA') || ($leot->umidlabios && $leot->umidlabios != 'NA') || ($leot->eruplabios && $leot->eruplabios != 'NA') || ($leot->fisslabios && $leot->fisslabios != 'NA') || ($leot->posorelha && $leot->posorelha != 'NA') || ($leot->posorelha && $leot->posorelha != 'NA') || ($leot->formorelha && $leot->formorelha != 'NA') || ($leot->dorouvido && $leot->dorouvido != 'NA') || ($leot->edemamast && $leot->edemamast != 'NA') || ($leot->secrouvido && $leot->secrouvido != 'NA') || ($leot->canaudext && $leot->canaudext != 'NA') || ($leot->otoscopia && $leot->otoscopia != 'NA') || (($leot->batasanariz && $leot->batasanariz != 'NA') || ($leot->secrnariz && $leot->secrnariz != 'NA') || ($leot->tumornariz && $leot->tumornariz != 'NA') || ($leot->rinoscopia && $leot->rinoscopia != 'NA')))
	$dadosOtorrino = 1;
if(($lepes->retracoesp && $lepes->retracoesp != 'NA') || ($lepes->torcicolo && $lepes->torcicolo != 'NA') || ($lepes->claviculas && $lepes->claviculas != 'NA') || ($lepes->tireoide && $lepes->tireoide != 'NA') || ($lepes->massastum && $lepes->massastum != 'NA') || ($lepes->fistulas && $lepes->fistulas != 'NA') || ($lepes->rigidez && $lepes->rigidez != 'NA') || ($lepes->fosspesc && $lepes->fosspesc != 'NA') || ($lepes->obs))
	$dadosPescoco = 1;
if((($lersp->formtorax && $lersp->formtorax != 'NA') || ($lersp->simtorax && $lersp->simtorax != 'NA') || ($lersp->contornos && $lersp->contornos != 'NA') || ($lersp->proemi && $lersp->proemi != 'NA') || ($lersp->mamas && $lersp->mamas != 'NA') || ($lersp->massasanorm && $lersp->massasanorm != 'NA') || ($lersp->tresp && $lersp->tresp != 'NA') || ($lersp->tirinterc && $lersp->tirinterc != 'NA') || ($lersp->freqresp && $lersp->freqresp != 'NA') || ($lersp->fremtv && $lersp->fremtv != 'NA') || ($lersp->frembronq && $lersp->frembronq != 'NA') || ($lersp->frempleur && $lersp->frempleur != 'NA') || ($lersp->submacicez && $lersp->submacicez != 'NA') || ($lersp->macicez && $lersp->macicez != 'NA') || ($lersp->timpanico && $lersp->timpanico != 'NA') || ($lersp->murmvesic && $lersp->murmvesic != 'NA') ||($lersp->estertores && $lersp->estertores != 'NA') || ($lersp->estridores && $lersp->estridores != 'NA') || ($lersp->sibilos && $lersp->sibilos != 'NA') || ($lersp->atritopleur && $lersp->atritopleur != 'NA') || ($lersp->obs)))
	$dadosResp = 1;
if((($lecdvs->precord && $lecdvs->precord != 'NA') || ($lecdvs->ictuscordi && $lecdvs->ictuscordi != 'NA') || ($lecdvs->ictuscordp && $lecdvs->ictuscordp != 'NA') || ($lecdvs->artperif && $lecdvs->artperif != 'NA') || ($lecdvs->bulhas && $lecdvs->bulhas != 'NA') || ($lecdvs->sopros && $lecdvs->sopros != 'NA') || ($lecdvs->pressaoart && $lecdvs->pressaoart != 'NA') || ($lecdvs->freqcard && $lecdvs->freqcard != 'NA') || ($lecdvs->obs)))
	$dadosCardio = 1;
if((($legt->formabd && $legt->formabd != 'NA') || ($legt->cicatumb && $legt->cicatumb != 'NA') || ($legt->peristal && $legt->peristal != 'NA') || ($legt->distensao && $legt->distensao != 'NA') || ($legt->tumorgt && $legt->tumorgt != 'NA') || ($legt->ondfluidas && $legt->ondfluidas != 'NA') || ($legt->timpangt && $legt->timpangt != 'NA') || ($legt->paredesmusc && $legt->paredesmusc != 'NA') || ($legt->espasmos && $legt->espasmos != 'NA') || ($legt->rigidez && $legt->rigidez != 'NA') || ($legt->estomago && $legt->estomago != 'NA') || ($legt->figado && $legt->figado != 'NA') || ($legt->baco && $legt->baco != 'NA') || ($legt->rins && $legt->rins!= 'NA') ||  ($legt->hernias && $legt->hernias != 'NA') || ($legt->massastum && $legt->massastum != 'NA') || ($legt->ruidosha && $legt->ruidosha != 'NA') || ($legt->dor && $legt->dor != 'NA') || ($legt->obs)))
	$dadosGastro = 1;
if((($lesm->fimose && $lesm->fimose != 'NA') || ($lesm->circuncisao && $lesm->circuncisao != 'NA') || ($lesm->hidrocele && $lesm->hidrocele != 'NA') ||($lesm->varicocele && $lesm->varicocele != 'NA') || ($lesm->testiculos && $lesm->testiculos != 'NA') || ($lesf->peqlabios && $lesf->peqlabios != 'NA') || ($lesf->peqlabios && $lesf->peqlabios != 'NA') || ($lesf->secrvag && $lesf->secrvag != 'NA') || ($legu->secruret && $legu->secruret != 'NA') || ($legu->pelos && $legu->pelos != 'NA') || ($legu->lojrenais && $legu->lojrenais != 'NA') || ($legu->bexiga && $legu->bexiga != 'NA') || ($legu->aspectogu && $legu->aspectogu != 'NA') || ($legu->anus && $legu->anus != 'NA') || ($legu->obs)))
	$dadosGenito = 1;
if(($leme->anomalias && $leme->anomalias != 'NA') || ($leme->deformidades && $leme->deformidades != 'NA') || ($leme->edemas && $leme->edemas != 'NA') || ($leme->tumoracoes && $leme->tumoracoes != 'NA') || ($leme->forcamusc && $leme->forcamusc != 'NA') || ($leme->dorossea && $leme->dorossea != 'NA') || ($leme->movativa && $leme->movativa != 'NA') || ($leme->movpassiva && $leme->movpassiva != 'NA') || ($leme->escoliose && $leme->escoliose != 'NA') || ($leme->lordose && $leme->lordose != 'NA') || ($leme->cifose && $leme->cifose != 'NA') || ($leme->curvfrente && $leme->curvfrente != 'NA') || ($leme->espmusc && $leme->espmusc != 'NA') || ($leme->dorlocal && $leme->dorlocal != 'NA') ||($leme->anomalias && $leme->anomalias != 'NA') || ($leme->dorreflexa && $leme->dorreflexa != 'NA') || ($leme->obs))
	$dadosMusculo = 1;
if((($lenv->nivconsc && $lenv->nivconsc != 'NA') || ($lenv->orientacao && $lenv->orientacao != 'NA') || ($lenv->sinfocais && $lenv->sinfocais != 'NA') || ($lenv->obs)))
	$dadosNervoso = 1;
if($dadosNervoso || $dadosMusculo || $dadosMusculo || $dadosGenito || $dadosCranio || $dadosOlhos || $dadosOtorrino || $dadosPescoco || $dadosResp || $dadosCardio || $dadosGastro)
	$dadosEspecial = 1;





?>
