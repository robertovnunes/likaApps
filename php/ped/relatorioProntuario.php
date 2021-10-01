<?php
include_once("controllers/ControllerPDF.php");
require_once('fpdf/fpdf.php');

/*Configura��o do PDF*/

$pdf=new FPDF('P','mm','A4');
$pdf->AddPage();
$pdf->SetDrawColor(205,205,205);
$pdf->SetLineWidth(0.3);

/*---------------------Atendimento do Paciente------------------------*/
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,"Atendimento do Paciente",0,1);

/*---------------------Dados do Atendimento------------------------*/
$pdf->SetFont('Arial','B',14);
$pdf->Cell(0,10,"Dados do Atendimento",'LTR',1);
$pdf->SetFont('Arial','',12);
$pdf->Cell(0,5,"Data de Cria��o: $dataAtend",'LR',1);
$pdf->Cell(0,5,"�ltima Altera��o: $dataAtendAlt",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);


/*---------------------Dados do Paciente------------------------*/
$pdf->SetFont('Arial','B',14);
$pdf->Cell(0,10,"Dados do Paciente",'LTR',1);
$pdf->SetFont('Arial','',12);

$pdf->Cell(0,5,"Atendimento: $atend",'LR',1);
$pdf->Cell(0,5,"Nome: $nomePAC",'LR',1);
$pdf->Cell(0,5,"Data Nascimento: $valPac[1]",'LR',1);
if($valPac[2] == 'F')
	$pdf->Cell(0,5,"Sexo: Feminino",'LR',1);
else
	$pdf->Cell(0,5,"Sexo: Masculino",'LR',1);
$pdf->Cell(0,5,"Bairro: $valPac[3]",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);

/*---------------------Informante------------------------*/
$nomeInfo = iniciais($valInfo[0]);
foreach ($escolaridade as $esc){
	
	if($esc['idEsc'] == $informante->idEsc)
		$infoEsc = $esc['tipo'];
	
}
foreach ($parentesco as $parent){
	
	if($parent['idParent'] == $informante->idParent)
		$infoParent = $parent['tipo'];
	
}
$pdf->SetFont('Arial','B',14);
if($nomeInfo)
	$pdf->Cell(0,10,"Dados do Informante",'LTR',1);
else
	$pdf->Cell(0,10,"Dados do Informante - Sem Dados",'LTR',1);
$pdf->SetFont('Arial','',12);

if($nomeInfo)
$pdf->Cell(0,5,"Nome: $nomeInfo",'LR',1);
if($informante->sexo == 'F')
	$pdf->Cell(0,5,"Sexo: Feminino",'LR',1);
if($informante->sexo == 'M')
	$pdf->Cell(0,5,"Sexo: Masculino",'LR',1);
if($informante->bairro)
$pdf->Cell(0,5,"Bairro: $informante->bairro",'LR',1);
if($infoEsc)
$pdf->Cell(0,5,"Escolaridade: $infoEsc",'LR',1);
if($infoParent)
$pdf->Cell(0,5,"Parentesco: $infoParent",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);




/*---------------------QPD/HDA------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosQPD)
	$pdf->Cell(0,10,"QPD/HDA",'LTR',1);
else
	$pdf->Cell(0,10,"QPD/HDA - Sem Dados",'LTR',1);
$pdf->SetFont('Arial','',12);

if($pdfqpd->queixa)
	$pdf->Cell(0,5,"Queixa Principal: $pdfqpd->queixa",'LR',1);
if($pdfqpd->historico)
	$pdf->Cell(0,5,"Hist�rico da Doen�a Atual: $pdfqpd->historico",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);

/*---------------------Interrogat�rio Sintomatol�gico------------------------*/
$pdf->SetFont('Arial','B',16);
if(!$dadosIS)
	$pdf->Cell(0,10,"Interrogat�rio Sintomatol�gico - Sem dados",'LTR',1);
else{
	$pdf->Cell(0,10,"Interrogat�rio Sintomatol�gico",'LTR',1);

/*--------------------- IS->Geral------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISGeral)
	$pdf->Cell(0,10,"Geral",'LR',1);
else
	$pdf->Cell(0,10,"Geral - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lger->altpeso && $lger->altpeso != 'NA'){
	
	if($lger->altpeso == 'GP')
		$pdf->Cell(0,5,"Altera��o de Peso: Ganho de Peso",'LR',1);
	elseif($lger->altpeso == 'PP')
		$pdf->Cell(0,5,"Altera��o de Peso: Perda de Peso",'LR',1);
	else
		$pdf->Cell(0,5,"Altera��o de Peso: Nenhuma Altera��o",'LR',1);
}
if($lger->apetite && $lger->apetite != 'NA'){
	if($lger->apetite == 'F')
		$pdf->Cell(0,5,"Apetite: Falta",'LR',1);
	elseif($lger->apetite == 'E')
		$pdf->Cell(0,5,"Apetite: Em excesso",'LR',1);
	else
		$pdf->Cell(0,5,"Apetite: Normal",'LR',1);

}
if($lger->atividade && $lger->atividade!= 'NA'){
	if($lger->atividade == 'A')
		$pdf->Cell(0,5,"Atividade: Ativo",'LR',1);
	else
		$pdf->Cell(0,5,"Atividade: Quieto",'LR',1);
}
if($lger->febre && $lger->febre != 'NA'){
	if($lger->febre == 'S')
		$pdf->Cell(0,5,"Febre: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Febre: N�o",'LR',1);
}
if($lger->obs)
	$pdf->Cell(0,5,"Observa��es $lger->obs",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

/*--------------------- IS->Pele------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISPele)
	$pdf->Cell(0,10,"Pele",'LR',1);
else
	$pdf->Cell(0,10,"Pele - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lpele->rash && $lpele->rash != 'NA'){
	if($lpele->rash == 'E')	
		$pdf->Cell(0,5,"Rash: Escarlatiniforme",'LR',1);
	elseif($lpele->rash == 'M')	
		$pdf->Cell(0,5,"Rash: Morbiliforme",'LR',1);
	else
		$pdf->Cell(0,5,"Rash: Ausente",'LR',1);
}
if($lpele->ictericia && $lpele->ictericia != 'NA')
	$pdf->Cell(0,5,"Icter�cia: Zona $lpele->ictericia de Kramer",'LR',1);
if($lpele->infecrep && $lpele->infecrep != 'NA'){
	if($lpele->infecrep == 'S')
		$pdf->Cell(0,5,"Infec��es de Repeti��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Infec��es de Repeti��o: N�o",'LR',1);
}
if($lpele->obs)
	$pdf->Cell(0,5,"Observa��es: $lpele->obs",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

/*--------------------- IS->Olhos------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISOlhos)
	$pdf->Cell(0,10,"Olhos",'LR',1);
else
	$pdf->Cell(0,10,"Olhos - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lolh->fotofobia && $lolh->fotofobia != 'NA'){
	if($lolh->fotofobia == 'S')
		$pdf->Cell(0,5,"Fotofobia: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Fotofobia: N�o",'LR',1);
}
if($lolh->lacrim && $lolh->lacrim != 'NA'){
	if($lolh->lacrim == '')
		$pdf->Cell(0,5,"Lacrimejamento: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Lacrimejamento: N�o",'LR',1);
}
if($lolh->secrecaool && $lolh->secrecaool != 'NA'){
	if($lolh->secrecaool == 'S')
		$pdf->Cell(0,5,"Secre��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Secre��o: N�o",'LR',1);
}
if($lolh->edemapalp && $lolh->edemapalp != 'NA'){
	if($lolh->edemapalp == 'S')
		$pdf->Cell(0,5,"Edema Palpebral: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Edema Palpebral: N�o",'LR',1);
}
if($lolh->dorolho && $lolh->dorolho != 'NA'){
	if($lolh->dorolho == 'OE')
		$pdf->Cell(0,5,"Dor: Olho Esquerdo",'LR',1);
	elseif($lolh->dorolho == 'OD')
		$pdf->Cell(0,5,"Dor: Olho Direito",'LR',1);
	elseif($lolh->dorolho == 'AO')
		$pdf->Cell(0,5,"Dor: Ambos os Olhos",'LR',1);
	else
		$pdf->Cell(0,5,"Dor: Sem Dor",'LR',1);
}
if($lolh->acuidvis && $lolh->acuidvis != 'NA'){
	if($lolh->acuidvis == 'TN')
		$pdf->Cell(0,5,"Acuidade Visual: Teste do Olhinho Normal",'LR',1);
	elseif($lolh->acuidvis == 'TA')
		$pdf->Cell(0,5,"Acuidade Visual: Teste do Olhinho Anormal",'LR',1);
	elseif($lolh->acuidvis == 'S')
		$pdf->Cell(0,5,"Acuidade Visual: Sim",'LR',1);
	elseif($lolh->acuidvis == 'N')
		$pdf->Cell(0,5,"Acuidade Visual: N�o",'LR',1);
	else
		$pdf->Cell(0,5,"Acuidade Visual: Cegueira",'LR',1);
}
if($lolh->obs)
	$pdf->Cell(0,5,"Observa��es: $lolh->obs",'LR',1);

/*--------------------- IS->Ouvidos------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISOuvidos)
	$pdf->Cell(0,10,"Ouvidos",'LR',1);
else
	$pdf->Cell(0,10,"Ouvidos - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($louv->secrecaoou && $louv->secrecaoou != 'NA'){
	if($louv->secrecaoou == 'S')
		$pdf->Cell(0,5,"Secre��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Secre��o: N�o",'LR',1);
}
if($louv->infecfreq && $louv->infecfreq != 'NA'){
	if($louv->infecfreq == 'S')
		$pdf->Cell(0,5,"Infec��es Freq�entes: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Infec��es Freq�entes: N�o",'LR',1);
}
if($louv->dorouvido && $louv->dorouvido != 'NA'){
	if($louv->dorouvido == 'OE')
		$pdf->Cell(0,5,"Dor: Ouvido Esquerdo",'LR',1);
	elseif($louv->dorouvido == 'OD')
		$pdf->Cell(0,5,"Dor: Ouvido Direito",'LR',1);
	elseif($louv->dorouvido == 'AO')
		$pdf->Cell(0,5,"Dor: Ambos os Ouvido",'LR',1);
	else
		$pdf->Cell(0,5,"Dor: N�o",'LR',1);
}
if($louv->acuidaud && $louv->acuidaud != 'NA'){
	if($louv->acuidaud == 'TN')
		$pdf->Cell(0,5,"Acuidade Auditiva: Teste da Orelhinha Normal",'LR',1);
	elseif($louv->acuidaud == 'TA')
		$pdf->Cell(0,5,"Acuidade Auditiva: Teste da Orelhinha Anormal",'LR',1);
	elseif($louv->acuidaud == 'S')
		$pdf->Cell(0,5,"Acuidade Auditiva: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Acuidade Auditiva: N�o",'LR',1);
}
if($louv->obs)
	$pdf->Cell(0,5,"Observa��es: $louv->obs",'LR',1);
	
/*--------------------- IS->Respirat�rio------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISResp)
	$pdf->Cell(0,10,"Respirat�rio",'LR',1);
else
	$pdf->Cell(0,10,"Respirat�rio - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lrsp->sufocacao && $lrsp->sufocacao != 'NA'){
	if($lrsp->sufocacao == 'S')
		$pdf->Cell(0,5,"Sufoca��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Sufoca��o: N�o",'LR',1);
}
if($lrsp->epistaxe && $lrsp->epistaxe != 'NA'){
	if($lrsp->epistaxe == 'S')
		$pdf->Cell(0,5,"Epistaxe: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Epistaxe: N�o",'LR',1);
}
if($lrsp->corrnasal && $lrsp->corrnasal != 'NA'){
	if($lrsp->corrnasal == 'CL')
		$pdf->Cell(0,5,"Corrimento Nasal : Normal",'LR',1);
	elseif($lrsp->corrnasal == 'ES')
		$pdf->Cell(0,5,"Corrimento Nasal : Abundante",'LR',1);
	else
		$pdf->Cell(0,5,"Corrimento Nasal : Escassa",'LR',1);
}
if($lrsp->tosse && $lrsp->tosse != 'NA'){
	if($lrsp->tosse == 'P')
		$pdf->Cell(0,5,"Tosse : Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Tosse : Ausente",'LR',1);
	if ($lrsp->dtosse && $lrsp->dtosse != 'NA'){
		if($lrsp->dtosse == '-30')
			$pdf->Cell(0,5,"    Dura��o : Menos de 30 dias",'LR',1);
		else
			$pdf->Cell(0,5,"    Dura��o : Mais de 30 dias",'LR',1);
	}
	if ($lrsp->ttosse && $lrsp->ttosse != 'NA'){
		if($lrsp->ttosse == 'P')
			$pdf->Cell(0,5,"    Tipo : Produtiva",'LR',1);
		else
			$pdf->Cell(0,5,"    Tipo : Seca",'LR',1);
	}
	if ($lrsp->ptosse && $lrsp->ptosse != 'NA'){
		if($lrsp->ptosse == 'N')
			$pdf->Cell(0,5,"    Per�odo: Noturna",'LR',1);
		else
			$pdf->Cell(0,5,"    Per�odo: Matutina",'LR',1);
	}
}
if($lrsp->resffreq && $lrsp->resffreq != 'NA'){
	if($lrsp->resffreq == 'S')
		$pdf->Cell(0,5,"Resfriados Freq�entes: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Resfriados Freq�entes: N�o",'LR',1);
}
if($lrsp->dortor && $lrsp->dortor != 'NA'){
	if($lrsp->dortor == 'P')
		$pdf->Cell(0,5,"Dor Tor�cica: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor Tor�cica: Ausente",'LR',1);
}
if($lrsp->difresp && $lrsp->difresp != 'NA'){
	if($lrsp->difresp == 'S')
		$pdf->Cell(0,5,"Dificuldade Respirat�ria: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Dificuldade Respirat�ria: N�o",'LR',1);
}
if($lrsp->hemoptise && $lrsp->hemoptise != 'NA'){
	if($lrsp->hemoptise == 'P')
		$pdf->Cell(0,5,"Hemoptise: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Hemoptise: Ausente",'LR',1);
}
if($lrsp->obs)
	$pdf->Cell(0,5,"Observa��es: $lrsp->obs",'LR',1);

/*--------------------- IS->Cardiovascular------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISCardio)
	$pdf->Cell(0,10,"Cardiovascular",'LR',1);
else
	$pdf->Cell(0,10,"Cardiovascular - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($lapcv->cianose && $lapcv->cianose!= 'NA'){
	if($lapcv->cianose == 'L')
		$pdf->Cell(0,5,"Cianose: Labial",'LR',1);
	elseif($lapcv->cianose == 'G')
		$pdf->Cell(0,5,"Cianose: Generalizada",'LR',1);
	else
		$pdf->Cell(0,5,"Cianose: Ausente",'LR',1);
}
if($lapcv->dispneia && $lapcv->dispneia!= 'NA'){
	if($lapcv->dispneia == 'S')
		$pdf->Cell(0,5,"Dispn�ia: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Dispn�ia: N�o",'LR',1);
}
if($lapcv->palpitacao && $lapcv->palpitacao!= 'NA'){
	if($lapcv->palpitacao == 'S')
		$pdf->Cell(0,5,"Palpita��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Palpita��o: N�o",'LR',1);
}	
if($lapcv->taquicardia && $lapcv->taquicardia != 'NA'){
	if($lapcv->taquicardia == 'S')
		$pdf->Cell(0,5,"Taquicardia: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Taquicardia: N�o",'LR',1);
}
if($lapcv->obs)
	$pdf->Cell(0,5,"Observa��es: $lapcv->obs",'LR',1);

/*--------------------- IS->Gastro-Intestinal------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISGastro)
	$pdf->Cell(0,10,"Gastro-Intestinal",'LR',1);
else
	$pdf->Cell(0,10,"Gastro-Intestinal - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lgi->nauseas && $lgi->nauseas != 'NA'){
	if($lgi->nauseas == 'S')
		$pdf->Cell(0,5,"N�useas: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"N�useas: N�o",'LR',1);
}
if($lgi->dorabdom && $lgi->dorabdom != 'NA'){
	if($lgi->dorabdom == 'P')
		$pdf->Cell(0,5,"Dor Abdominal: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor Abdominal: Ausente",'LR',1);
}
if($lgi->vomitos && $lgi->vomitos != 'NA'){
	if($lgi->vomitos == 'A')	
		$pdf->Cell(0,5,"V�mitos: Ausente",'LR',1);
	elseif($lgi->vomitos == 'AA')	
		$pdf->Cell(0,5,"V�mitos: Normais",'LR',1);
	elseif($lgi->vomitos == 'SC')	
		$pdf->Cell(0,5,"V�mitos: Brancas",'LR',1);
	else
		$pdf->Cell(0,5,"V�mitos: Escuras",'LR',1);
}
if($lgi->evacuacao && $lgi->evacuacao != 'NA'){
	if($lgi->evacuacao == 'N')
		$pdf->Cell(0,5,"Evacua��o: Normal",'LR',1);
	elseif($lgi->evacuacao == 'C')
		$pdf->Cell(0,5,"Evacua��o: Constipado",'LR',1);
	else
		$pdf->Cell(0,5,"Evacua��o: Diarr�ia",'LR',1);
	if ($lgi->aspfezes && $lgi->aspfezes != 'NA'){
		if($lgi->aspfezes == 'N')
			$pdf->Cell(0,5,"    Aspecto de Fezes: Normais",'LR',1);
		elseif($lgi->aspfezes == 'B')
			$pdf->Cell(0,5,"    Aspecto de Fezes: Brancas",'LR',1);
		elseif($lgi->aspfezes == 'E')
			$pdf->Cell(0,5,"    Aspecto de Fezes: Escuras",'LR',1);
		elseif($lgi->aspfezes == 'L')
			$pdf->Cell(0,5,"    Aspecto de Fezes: L�quidas",'LR',1);
		else
			$pdf->Cell(0,5,"    Aspecto de Fezes: Pastosas",'LR',1);
	}
	if ($lgi->nfezes && $lgi->nfezes != 'NA')
		$pdf->Cell(0,5,"    N� de Vezes: $lgi->nfezes",'LR',1);
}
if($lgi->tenesmo && $lgi->tenesmo != 'NA'){
	if($lgi->tenesmo == 'S')
		$pdf->Cell(0,5,"Tenesmo: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Tenesmo: N�o",'LR',1);
}
if($lgi->obs)
	$pdf->Cell(0,5,"Observa��es: $lgi->obs",'LR',1);

/*--------------------- IS->Genito-Urin�rio------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISGenito)
	$pdf->Cell(0,10,"Genito-Urin�rio",'LR',1);
else
	$pdf->Cell(0,10,"Genito-Urin�rio - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if( ($lgu->qtdurina && $lgu->qtdurina != 'NA') || ($lgu->corurina != 'NA' && $lgu->corurina) || ($lgu->frequrina != 'NA' && $lgu->frequrina) || ($lgu->jatourina != 'NA' && $lgu->jatourina) || ($lgu->odorurina != 'NA' && $lgu->odorurina) || ($lgu->urgurina != 'NA' && $lgu->urgurina))
	$pdf->Cell(0,5,"Urina:",'LR',1);
if($lgu->qtdurina && $lgu->qtdurina != 'NA'){
	if($lgu->qtdurina == 'N')
		$pdf->Cell(0,5,"    Quantidade: Normal",'LR',1);
	elseif($lgu->qtdurina == 'A')
		$pdf->Cell(0,5,"    Quantidade: Abundante",'LR',1);
	else
		$pdf->Cell(0,5,"    Quantidade: Escassa",'LR',1);
}
if($lgu->corurina && $lgu->corurina != 'NA'){
	if($lgu->corurina == 'C')
		$pdf->Cell(0,5,"    Cor: Claro",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Escuro",'LR',1);
}
if($lgu->frequrina && $lgu->frequrina != 'NA'){
	if($lgu->frequrina == 'N')
		$pdf->Cell(0,5,"    Frequ�ncia: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Frequ�ncia: Mais que o Habitual",'LR',1);
}
if($lgu->jatourina && $lgu->jatourina != 'NA'){
	if($lgu->jatourina == 'C')
		$pdf->Cell(0,5,"    Jato: Cont�nuo",'LR',1);
	else
		$pdf->Cell(0,5,"    Jato: Partido",'LR',1);
}
if($lgu->odorurina &&  $lgu->odorurina != 'NA'){
	if($lgu->odorurina == 'C')
		$pdf->Cell(0,5,"    Odor: Caracter�stico",'LR',1);
	else
		$pdf->Cell(0,5,"    Odor: F�tido",'LR',1);
}
if($lgu->urgurina && $lgu->urgurina != 'NA'){
	if($lgu->urgurina == 'S')
		$pdf->Cell(0,5,"    Urg�ncia: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"    Urg�ncia: N�o",'LR',1);
}
if($lgu->corruret && $lgu->corruret != 'NA'){
	if($lgu->corruret == 'A' || $lgu->corruret == 'NA' )
		$pdf->Cell(0,5,"Corrimento Uretral: Ausente",'LR',1);
	else
		$pdf->Cell(0,5,"Corrimento Uretral: Presente",'LR',1);
		
	if($lgu->corcorruret && $lgu->corcorruret != 'NA'){
		if($lgu->corcorruret == 'C')
			$pdf->Cell(0,5,"    Cor: Claro",'LR',1);
		else
			$pdf->Cell(0,5,"    Cor: Leitoso",'LR',1);
	}
	if($lgu->odorcorruret && $lgu->odorcorruret != 'NA'){
		if($lgu->odorcorruret == 'I')
			$pdf->Cell(0,5,"    Odor: Inodoro",'LR',1);
		else
			$pdf->Cell(0,5,"    Odor: F�tido",'LR',1);
	}
}
if($lgu->disuria && $lgu->disuria != 'NA'){
	if($lgu->disuria == 'S')
		$pdf->Cell(0,5,"Dis�ria: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Dis�ria: N�o",'LR',1);
}
if($lgu->ativsex && $lgu->ativsex != 'NA'){
	if($lgu->ativsex == 'S')
		$pdf->Cell(0,5,"Atividade Sexual: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Atividade Sexual: N�o",'LR',1);
}
	
if ($paciente->getSexo() == "M"){	
	$lsm = $fachada->getValuesTableAt('genmasc',$atend);
	if($lsm->pubarcah && $lsm->pubarcah != 'NA'){
		if($lsm->pubarcah == '-8')
			$pdf->Cell(0,5,"Pubarca: Menos de 8 anos",'LR',1);
		elseif($lsm->pubarcah == '814')
			$pdf->Cell(0,5,"Pubarca: Entre 8 e 14 anos",'LR',1);
		elseif($lsm->pubarcah == '+14')
			$pdf->Cell(0,5,"Pubarca: Mais de 14 anos",'LR',1);
		else
			$pdf->Cell(0,5,"Pubarca: Ausente",'LR',1);
	}
	if($lsm->voltest && $lsm->voltest != 'NA'){
		if($lsm->voltest == 'N')
			$pdf->Cell(0,5,"Volume Testicular: Normal",'LR',1);
		elseif($lsm->voltest == 'MA')
			$pdf->Cell(0,5,"Volume Testicular: Maior que o Normal",'LR',1);
		else
			$pdf->Cell(0,5,"Volume Testicular: Menor que o Normal",'LR',1);
	}
	if($lsm->erecao && $lsm->erecao != 'NA'){
		if($lsm->erecao == 'P')
			$pdf->Cell(0,5,"Ere��o: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Ere��o: Ausente",'LR',1);
	}
	if($lsm->tampenis && $lsm->tampenis != 'NA'){
		if($lsm->tampenis == 'N')
			$pdf->Cell(0,5,"Tamanho do P�nis: Normal",'LR',1);
		elseif($lsm->tampenis == 'MA')
			$pdf->Cell(0,5,"Tamanho do P�nis: Maior que o Normal",'LR',1);
		else
			$pdf->Cell(0,5,"Tamanho do P�nis: Menor que o Normal",'LR',1);
	}
	if($lsm->polucoes && $lsm->polucoes != 'NA'){
		if($lsm->polucoes == 'P')
			$pdf->Cell(0,5,"Polu��es: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Polu��es: Ausente",'LR',1);
	}
}else{
	$lsf = $fachada->getValuesTableAt('genfem',$atend);
	if($lsf->corrvag && $lsf->corrvag != 'NA'){
		if($lsf->corrvag == 'P')
			$pdf->Cell(0,5,"Corrimento Uretral: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Corrimento Uretral: Ausente",'LR',1);
			
			if($lsf->corcorrvag && $lsf->corcorrvag != 'NA'){
				if($lsf->corcorrvag == 'C')
					$pdf->Cell(0,5,"Cor: Claro",'LR',1);
				elseif($lsf->corcorrvag == 'L')
					$pdf->Cell(0,5,"Cor: Leitoso",'LR',1);
				else
					$pdf->Cell(0,5,"Cor: Esverdeado",'LR',1);
			}
			if($lsf->odorcorrvag && $lsf->odorcorrvag != 'NA'){
				if($lsf->odorcorrvag == 'I')
					$pdf->Cell(0,5,"Odor: Inodoro",'LR',1);
				else
					$pdf->Cell(0,5,"Odor: F�tido",'LR',1);
			}
			if($lsf->prucorrvag && $lsf->prucorrvag != 'NA'){
				if($lsf->prucorrvag == 'P')
					$pdf->Cell(0,5,"Prurido: Presente",'LR',1);
				else
					$pdf->Cell(0,5,"Prurido: Ausente",'LR',1);
			}
	}
	if($lsf->telarca && $lsf->telarca != 'NA'){
		if($lsf->telarca == '-8')
			$pdf->Cell(0,5,"Telarca: Menos de 8 anos",'LR',1);
		elseif($lsf->telarca == '813')
			$pdf->Cell(0,5,"Telarca: 8 a 13 anos",'LR',1);
		elseif($lsf->telarca == '+13')
			$pdf->Cell(0,5,"Telarca: Mais de 13 anos",'LR',1);
		else
			$pdf->Cell(0,5,"Telarca: Ausente",'LR',1);
			
	}
	if($lsf->pubarcam && $lsf->pubarcam != 'NA'){
		if($lsf->pubarcam == '-6')
			$pdf->Cell(0,5,"Pubarca: Menos de 6 anos",'LR',1);
		elseif($lsf->pubarcam == '613')
			$pdf->Cell(0,5,"Pubarca: 6 a 13 anos",'LR',1);
		elseif($lsf->pubarcam == '+13')
			$pdf->Cell(0,5,"Pubarca: Mais de 13 anos",'LR',1);
		else
			$pdf->Cell(0,5,"Pubarca: Ausente",'LR',1);
	}
	if($lsf->histmenst && $lsf->histmenst != 'NA'){
		if($lsf->histmenst == 'P')
			$pdf->Cell(0,5,"Hist�rico Menstrual: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Hist�rico Menstrual: Ausente",'LR',1);
		if($lsf->menarca && $lsf->menarca != 'NA'){
			if($lsf->menarca == '-8')
				$pdf->Cell(0,5,"    Menarca: Menos de 8 anos",'LR',1);
			elseif($lsf->menarca == '816')
				$pdf->Cell(0,5,"    Menarca: 8 a 16 anos",'LR',1);
			elseif($lsf->menarca == '+16')
				$pdf->Cell(0,5,"    Menarca: Mais de 16 anos",'LR',1);
			else
				$pdf->Cell(0,5,"    Menarca: Ausente",'LR',1);
		}
		if($lsf->regularidade && $lsf->regularidade != 'NA'){
			if($lsf->regularidade == '-28')
				$pdf->Cell(0,5,"    Regularidade: Menos de 28 dias",'LR',1);
			elseif($lsf->regularidade == '28')
				$pdf->Cell(0,5,"    Regularidade: 28 dias",'LR',1);
			else
				$pdf->Cell(0,5,"    Regularidade: Maide de 28 dias",'LR',1);
		}
		if($lsf->fluxo && $lsf->fluxo != 'NA'){
			if($lsf->fluxo == 'N')
				$pdf->Cell(0,5,"    Fluxo: Normal",'LR',1);
			elseif($lsf->fluxo == 'A')
				$pdf->Cell(0,5,"    Fluxo: Aumentado",'LR',1);
			else
				$pdf->Cell(0,5,"    Fluxo: Diminu�do",'LR',1);
		}
	}	
}
if($lgu->obs)
		$pdf->Cell(0,5,"Observa��es:$lgu->obs",'LR',1);
	
/*--------------------- IS->M�sculo-Esquel�tico------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISMusculo)
	$pdf->Cell(0,10,"M�sculo-Esquel�tico",'LR',1);
else
	$pdf->Cell(0,10,"M�sculo-Esquel�tico - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lme->deform && $lme->deform != 'NA'){
	if($lme->deform == 'S')
		$pdf->Cell(0,5,"Deformidades: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Deformidades: N�o",'LR',1);
}
if($lme->tumefacoes && $lme->tumefacoes != 'NA'){	
	if($lme->tumefacoes == 'P')
		$pdf->Cell(0,5,"Tumefa��es: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Tumefa��es: Ausente",'LR',1);
}
if($lme->fraqmusc && $lme->fraqmusc != 'NA'){
	if($lme->fraqmusc == 'S')
		$pdf->Cell(0,5,"Fraqueza Muscular: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Fraqueza Muscular: N�o",'LR',1);
}
if($lme->dorossea && $lme->dorossea != 'NA'){
	if($lme->dorossea == 'P')
		$pdf->Cell(0,5,"Dores �sseas e Articulares: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dores �sseas e Articulares: Ausente",'LR',1);
}
if($lme->obs)	
	$pdf->Cell(0,5,"Observa��es:$lme->obs",'LR',1);	
	
/*--------------------- IS->Nervoso------------------------*/
$pdf->SetFont('Arial','B',14);
if($dadosISNervoso)
	$pdf->Cell(0,10,"Nervoso",'LR',1);
else
	$pdf->Cell(0,10,"Nervoso - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lnerv->cefaleia && $lnerv->cefaleia != 'NA'){
	if($lnerv->cefaleia == 'S')
		$pdf->Cell(0,5,"Cefal�ia: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Cefal�ia: N�o",'LR',1);
}
if($lnerv->tonturas && $lnerv->tonturas != 'NA'){	
	if($lnerv->tonturas == 'S')
		$pdf->Cell(0,5,"Tonturas: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Tonturas: N�o",'LR',1);
}
if($lnerv->convulsoes && $lnerv->convulsoes != 'NA'){
	if($lnerv->convulsoes == 'F')
		$pdf->Cell(0,5,"Convuls�es: Febril",'LR',1);
	elseif($lnerv->convulsoes == 'AF')
		$pdf->Cell(0,5,"Convuls�es: Afebril",'LR',1);
	else
		$pdf->Cell(0,5,"Convuls�es: Ausente",'LR',1);
	if($lnerv->conv1 && $lnerv->conv1 != 'NA'){
		if($lnerv->conv1 == 'T')
			$pdf->Cell(0,5,"    Tipo 1 Febril",'LR',1);
		else
			$pdf->Cell(0,5,"    Tipo 1: Afebril",'LR',1);
	}
	if($lnerv->conv2 && $lnerv->conv2 != 'NA'){
		if($lnerv->conv2 == 'L')
			$pdf->Cell(0,5,"    Tipo 2: Localizada",'LR',1);
		else
			$pdf->Cell(0,5,"    Tipo 2: Generaliada",'LR',1);
	}
}
if($lnerv->traumacran && $lnerv->traumacran != 'NA'){	
	if($lnerv->traumacran == 'S')
		$pdf->Cell(0,5,"Traumas Cranianos: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Traumas Cranianos: N�o",'LR',1);
}
if($lnerv->sincopes && $lnerv->sincopes != 'NA'){
	if($lnerv->sincopes == 'S')
		$pdf->Cell(0,5,"S�ncopes: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"S�ncopes: N�o",'LR',1);
}
if($lnerv->paresias && $lnerv->paresias != 'NA'){
	if($lnerv->paresias == 'S')
		$pdf->Cell(0,5,"Paresias: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Paresias: N�o",'LR',1);
}
if($lnerv->paralisias && $lnerv->paralisias != 'NA'){
	if($lnerv->paralisias == 'S')
		$pdf->Cell(0,5,"Paralisias: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Paralisias: N�o",'LR',1);
}
if($lnerv->retneuropsi && $lnerv->retneuropsi != 'NA'){
	if($lnerv->retneuropsi == 'S')
		$pdf->Cell(0,5,"Retardo Neuropsicomotor: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Retardo Neuropsicomotor: N�o",'LR',1);
}
if($lnerv->obs)	
	$pdf->Cell(0,5,"Observa��es:$lnerv->obs",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);
}

/*--------------------- EXAME F�SICO-----------------------*/
$pdf->SetFont('Arial','B',16);
$pdf->Cell(0,10,"Exame F�sico",'LTR',1);
$pdf->Cell(0,0,"",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

//////////////////////////////////////////////////////////////
/*-------------------Exame F�sico Geral---------------------*/
//////////////////////////////////////////////////////////////

$pdf->SetFont('Arial','B',14);
if(!$dadosExFisGeral)
	$pdf->Cell(0,10,"Exame F�sico Geral - Sem Dados",'LTR',1);
else{
	$pdf->Cell(0,10,"Exame F�sico Geral",'LTR',1);
$pdf->Cell(0,0,"",'LR',1);

/*----------------Inspe��o-------------------*/
$pdf->SetFont('Arial','B',10);
if($dadosInspecao)
	$pdf->Cell(0,10,"Inspe��o",'LR',1);
else
	$pdf->Cell(0,10,"Inspe��o - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($leins->estgeral && $leins->estgeral != 'NA'){
	if($leins->estgeral == 'B')
		$pdf->Cell(0,5,"Estado Geral: BOM (EGB)",'LR',1);
	elseif($leins->estgeral == 'Rg')
		$pdf->Cell(0,5,"Estado Geral: Regular",'LR',1);
	elseif($leins->estgeral == 'R')
		$pdf->Cell(0,5,"Estado Geral: Ruim",'LR',1);
	else
		$pdf->Cell(0,5,"Estado Geral: Grave",'LR',1);
}
if($leins->tdoenca && $leins->tdoenca != 'NA'){
	if($leins->tdoenca == 'A')
		$pdf->Cell(0,5,"Tipo de Doen�a: Aguda",'LR',1);
	else
		$pdf->Cell(0,5,"Tipo de Doen�a: Cr�nica",'LR',1);
}
if($leins->aspdoenca && $leins->aspdoenca != 'NA'){
	if($leins->aspdoenca == 'C')
		$pdf->Cell(0,5,"Aspecto da Doen�a: Com gravidade",'LR',1);
	else
		$pdf->Cell(0,5,"Aspecto da Doen�a: Sem gravidade",'LR',1);
}
if($leins->desenvfis && $leins->desenvfis != 'NA'){
	if($leins->desenvfis == 'C')
		$pdf->Cell(0,5,"Desenvolvimento F�sico: Compat�vel com Idade Cronol�gica",'LR',1);
	else
		$pdf->Cell(0,5,"Desenvolvimento F�sico: Inconpat�vel com Idade Cronol�gica",'LR',1);
}
if($leins->nutricao && $leins->nutricao != 'NA'){
	if($leins->nutricao == 'N')
		$pdf->Cell(0,5,"Nutri��o: Nutrido",'LR',1);
	else
		$pdf->Cell(0,5,"Nutri��o: Desnutrido",'LR',1);
}
if($leins->coop &&  $leins->coop != 'NA'){
	if($leins->coop == 'B')
		$pdf->Cell(0,5,"Coopera��o: Boa",'LR',1);
	elseif($leins->coop == 'P')
		$pdf->Cell(0,5,"Coopera��o: Pouca",'LR',1);
	else
		$pdf->Cell(0,5,"Coopera��o: Nenhuma",'LR',1);
}
if($leins->deformfis && $leins->deformfis != 'NA'){
	if($leins->deformfis == 'P')
		$pdf->Cell(0,5,"Deformidades F�sicas: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Deformidades F�sicas: Ausente",'LR',1);
}
if($leins->anormpost && $leins->anormpost != 'NA'){
	if($leins->anormpost == 'P')
		$pdf->Cell(0,5,"Anormalidade de Postura: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Anormalidade de Postura: Ausente",'LR',1);
}
if($leins->obs)
	$pdf->Cell(0,5,"Observa��es: $leins->obs",'LR',1);


/*----------Peles e Mucosas------------*/
$pdf->SetFont('Arial','B',10);
if($dadosPeleMuc)
	$pdf->Cell(0,10,"Peles e Mucosas",'LR',1);
else
	$pdf->Cell(0,10,"Peles e Mucosas - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lepele->corpele && $lepele->corpele != 'NA'){
	if($lepele->corpele = 'C')
		$pdf->Cell(0,5,"Cor: Corado",'LR',1);
	elseif($lepele->corpele = 'P')
		$pdf->Cell(0,5,"Cor: P�lida",'LR',1);
	elseif($lepele->corpele = 'Ci')
		$pdf->Cell(0,5,"Cor: Cian�tica",'LR',1);
	else	
		$pdf->Cell(0,5,"Cor: Ict�rica",'LR',1);
}
if($lepele->umidpele && $lepele->umidpele != 'NA'){
	if($lepele->umidpele == 'H')
		$pdf->Cell(0,5,"Umidade: Hidratada",'LR',1);
	elseif($lepele->umidpele == 'U')
		$pdf->Cell(0,5,"Umidade: �mida",'LR',1);
	else
		$pdf->Cell(0,5,"Umidade: Seca",'LR',1);
}
if($lepele->temppele && $lepele->temppele != 'NA'){
	if($lepele->temppele == 'N')
		$pdf->Cell(0,5,"Temperatura: Normal",'LR',1);
	elseif($lepele->temppele == 'Q')
		$pdf->Cell(0,5,"Temperatura: Quente",'LR',1);
	else
		$pdf->Cell(0,5,"Temperatura: Fria",'LR',1);
}
if($lepele->cicatriz && $lepele->cicatriz != 'NA'){
	if($lepele->cicatriz == 'P')
		$pdf->Cell(0,5,"Cicatrizes: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Cicatrizes: Ausente",'LR',1);
}
if($lepele->hemor && $lepele->hemor != 'NA'){
	if($lepele->hemor == 'P')
		$pdf->Cell(0,5,"Hemorragias: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Hemorragias: Ausente",'LR',1);
}
if($lepele->rash && $lepele->rash != 'NA'){
	if($lepele->rash == 'P')
		$pdf->Cell(0,5,"Rash: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Rash: Ausente",'LR',1);
}
if($lepele->circcol && $lepele->circcol != 'NA'){
	if($lepele->circcol == 'P')
		$pdf->Cell(0,5,"Circula��o Colateral: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Circula��o Colateral: Ausente",'LR',1);
}
if($lepele->edemapele && $lepele->edemapele != 'NA'){
	if($lepele->edemapele == 'A')
		$pdf->Cell(0,5,"Edema: Ausente",'LR',1);
	elseif($lepele->edemapele == 'M')
		$pdf->Cell(0,5,"Edema: MMII",'LR',1);
	elseif($lepele->edemapele == 'P')
		$pdf->Cell(0,5,"Edema: Periorbital",'LR',1);
	else
		$pdf->Cell(0,5,"Edema: Anasarca",'LR',1);
}	
if(($lepele->consistun && $lepele->consistun != 'NA') || ($lepele->deformun && $lepele->deformun != 'NA') || ($lepele->manchasun != 'NA' && $lepele->manchasun) || ($lepele->inflamun && $lepele->inflamun != 'NA') )				             //AJEITAR!!	
	$pdf->Cell(0,5,"Unhas",'LR',1);
if($lepele->consistun && $lepele->consistun != 'NA'){
	if($lepele->consistun == 'N')
		$pdf->Cell(0,5,"    Consist�ncia: Normal",'LR',1);
	elseif($lepele->consistun == 'Q')
		$pdf->Cell(0,5,"    Consist�ncia: Quebradi�a",'LR',1);
	else
		$pdf->Cell(0,5,"    Consist�ncia: Endurecida",'LR',1);
}
if($lepele->deformun && $lepele->deformun != 'NA'){
	if($lepele->deformun == 'P')
		$pdf->Cell(0,5,"    Deformidades: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Deformidades: Ausente",'LR',1);
}
if($lepele->manchasun && $lepele->manchasun != 'NA'){
	if($lepele->manchasun == 'P')
		$pdf->Cell(0,5,"    Manchas: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Manchas: Ausente",'LR',1);
}
if($lepele->inflamun && $lepele->inflamun != 'NA'){
	if($lepele->inflamun == 'P')
		$pdf->Cell(0,5,"    Inflama��es: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Inflama��es: Ausente",'LR',1);
}

if($lepele->obs)
	$pdf->Cell(0,5,"Observa��es:$lepele->obs",'LR',1);

/*--------G�nglios Linf�ticos--------*/ 
$pdf->SetFont('Arial','B',10);
if($dadosGanglios)
	$pdf->Cell(0,10,"G�nglios Linf�ticos",'LR',1);
else
	$pdf->Cell(0,10,"G�nglios Linf�ticos - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($legang->ganglios && $legang->ganglios != 'NA'){
	if($legang->ganglios == 'N')
		$pdf->Cell(0,5,"G�nglios Linf�ticos: Normais",'LR',1);
	else
		$pdf->Cell(0,5,"G�nglios Linf�ticos: Anormais",'LR',1);
}
if($legang->obs)
	$pdf->Cell(0,5,"Observa��es: $legang->obs",'LR',1);
$pdf->Cell(0,0,"",'LR',1);
$pdf->Cell(0,0,"",'LR',1);
}

/////////////////////////////////////////////////////////
/*-------------------Antropometria---------------------*/
/////////////////////////////////////////////////////////

$pdf->SetFont('Arial','B',14);
if(!$dadosAntro)
	$pdf->Cell(0,10,"Antropometria - Sem Dados",'LTR',1);
else{
	$pdf->Cell(0,10,"Antropometria",'LTR',1);
$pdf->Cell(0,0,"",'LR',1);

/*-----------Medidas e �ndices------------*/ 
$pdf->SetFont('Arial','B',10);
if($dadosMedInd)
	$pdf->Cell(0,10,"Medidas e �ndices",'LR',1);
else
	$pdf->Cell(0,10,"Medidas e �ndices - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($medind->peso && $medind->peso != 'NA')
	$pdf->Cell(0,5,"Peso:$medind->pesoin",'LR',1);
if($medind->altura && $medind->altura != 'NA')
	$pdf->Cell(0,5,"Altura:$medind->alturain",'LR',1);
if($medind->permcef && $medind->permcef != 'NA')
	$pdf->Cell(0,5,"Per�metro Cef�lico:$medind->permcef",'LR',1);
if($medind->permtora && $medind->permtora != 'NA')
	$pdf->Cell(0,5,"Per�metro Tor�cico:$medind->permtora",'LR',1);
if($medind->permab && $medind->permab != 'NA')
	$pdf->Cell(0,5,"Per�metro Abdominal:$medind->permab",'LR',1);
if($medind->pregatric && $medind->pregatric != 'NA')
	$pdf->Cell(0,5,"Prega Tricipital:$medind->pregatric",'LR',1);
if($medind->pregasubesc && $medind->pregasubesc != 'NA')
	$pdf->Cell(0,5,"Prega Sub-escapular:$medind->pregasubesc",'LR',1);
$pdf->Cell(0,0,"",'LR',1);	
	
/*-----------Estadiamento Puberal------------*/ 	
$pdf->SetFont('Arial','B',10);
if($dadosEstPub)
	$pdf->Cell(0,10,"Estadiamento Puberal",'LR',1);
else
	$pdf->Cell(0,10,"Estadiamento Puberal - Sem Dados",'LR',1);
	
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($lant->pelospub && $lant->pelospub != 'NA')
	$pdf->Cell(0,5,"P�los Pubianos: Est�gio $lant->pelospub",'LR',1);
if($paciente->getSexo() == "F"){
	if($lant->mamas && $lant->mamas != 'NA')
		$pdf->Cell(0,5,"Mamas: Est�gio $lant->mamas",'LR',1);
}else{
	if($lant->voltest && $lant->voltest != 'NA'){
		if($lant->voltest == '-4')
			$pdf->Cell(0,5,"Volume Testicular: Menos de 4 mL",'LR',1);
		else
			$pdf->Cell(0,5,"Volume Testicular: $lant->voltest mL",'LR',1);
	}
	if($lant->genitais && $lant->genitais != 'NA')
		$pdf->Cell(0,5,"Genitais: Est�gio $lant->genitais",'LR',1);
}
if($lant->obs)
	$pdf->Cell(0,5,"Observa��es: $lant->obs",'LR',1);	
$pdf->Cell(0,0,"",'LR',1);

/*-----------Desenvolvimento Neuropsicomotor------------*/ 
$pdf->SetFont('Arial','B',10);
if($dadosDesNeuro)
	$pdf->Cell(0,10,"Desenvolvimento Neuropsicomotor",'LR',1);
else
	$pdf->Cell(0,10,"Desenvolvimento Neuropsicomotor - Sem Dados",'LR',1);
	
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($ldes->brvm && $ldes->brvm != 'NA'){
	if($ldes->brvm == '2')
		$pdf->Cell(0,5,"O Beb� reconhece a voz da m�e: At� 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"O Beb� reconhece a voz da m�e: Depois de 2 meses",'LR',1);
}
if($ldes->orpp && $ldes->orpp != 'NA'){
	if($ldes->orpp == '2')
		$pdf->Cell(0,5,"Olha o rosto das pessoas pr�ximas: At� 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Olha o rosto das pessoas pr�ximas: Depois de 2 meses",'LR',1);
}
if($ldes->paqos && $ldes->paqos != 'NA'){
	if($ldes->paqos == '2')
		$pdf->Cell(0,5,"Presta aten��o quando ouve sons: At� 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Presta aten��o quando ouve sons: Depois de 2 meses",'LR',1);
}
if($ldes->rscs && $ldes->rscs != 'NA'){
	if($ldes->rscs == '2')
		$pdf->Cell(0,5,"Responde ao sorriso com um sorriso: At� 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Responde ao sorriso com um sorriso: Depois de 2 meses",'LR',1);
}
if($ldes->pblco && $ldes->pblco != 'NA'){
	if($ldes->pblco == '24')
		$pdf->Cell(0,5,"Posto de bru�os, levanta cabe�a e ombros: Entre 2 e 4 meses",'LR',1);
	elseif($ldes->pblco == '2-')
		$pdf->Cell(0,5,"Posto de bru�os, levanta cabe�a e ombros: Antes de 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Posto de bru�os, levanta cabe�a e ombros: Depois de 4 meses",'LR',1);
}
if($ldes->scopo && $ldes->scopo != 'NA'){
	if($ldes->scopo == '24')
		$pdf->Cell(0,5,"Segue com os olhos pessoas e objetos : Entre 2 e 4 meses",'LR',1);
	elseif($ldes->scopo == '2-')
		$pdf->Cell(0,5,"Segue com os olhos pessoas e objetos : Antes de 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Segue com os olhos pessoas e objetos : Depois de 4 meses",'LR',1);
}
if($ldes->bcvtc && $ldes->bcvtc != 'NA'){
	if($ldes->bcvtc == '24')
		$pdf->Cell(0,5,"Brinca com a voz e tenta conversar: Entre 2 e 4 meses",'LR',1);
	elseif($ldes->bcvtc == '2-')
		$pdf->Cell(0,5,"Brinca com a voz e tenta conversar: Antes de 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Brinca com a voz e tenta conversar: Depois de 4 meses",'LR',1);
}
if($ldes->bcmlb && $ldes->bcmlb != 'NA'){
	if($ldes->bcmlb == '24')
		$pdf->Cell(0,5,"Brinca com as m�os e as leva � boca: Entre 2 e 4 meses",'LR',1);
	elseif($ldes->bcmlb == '2-')
		$pdf->Cell(0,5,"Brinca com as m�os e as leva � boca: Antes de 2 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Brinca com as m�os e as leva � boca: Depois de 4 meses",'LR',1);
}
if($ldes->bmfsa && $ldes->bmfsa != 'NA'){
	if($ldes->bmfsa == '46')
		$pdf->Cell(0,5,"O beb� est� mais firme e senta com apoio: Entre 4 e 6 meses",'LR',1);
	elseif($ldes->bmfsa == '4-')
		$pdf->Cell(0,5,"O beb� est� mais firme e senta com apoio: Antes de 4 meses",'LR',1);
	else
		$pdf->Cell(0,5,"O beb� est� mais firme e senta com apoio: Depois de 6 meses",'LR',1);
}
if($ldes->vrs && $ldes->vrs != 'NA'){
	if($ldes->vrs == '46')
		$pdf->Cell(0,5,"Vira-se e rola sozinho : Entre 4 e 6 meses",'LR',1);
	elseif($ldes->vrs == '4-')
		$pdf->Cell(0,5,"Vira-se e rola sozinho : Antes de 4 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Vira-se e rola sozinho : Depois de 6 meses",'LR',1);
}
if($ldes->absf && $ldes->absf != 'NA'){
	if($ldes->absf == '46')
		$pdf->Cell(0,5,"Agarra brinquedos, segurando firme : Entre 4 e 6 meses",'LR',1);
	elseif($ldes->absf == '4-')
		$pdf->Cell(0,5,"Agarra brinquedos, segurando firme : Antes de 4 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Agarra brinquedos, segurando firme : Depois de 6 meses",'LR',1);
}
if($ldes->qeabtl && $ldes->qeabtl != 'NA'){
	if($ldes->qeabtl == '46')
		$pdf->Cell(0,5,"Quando escuta algum barulho, tenta localiz�-lo: Entre 4 e 6 meses",'LR',1);
	elseif($ldes->qeabtl == '4-')
		$pdf->Cell(0,5,"Quando escuta algum barulho, tenta localiz�-lo: Antes de 4 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Quando escuta algum barulho, tenta localiz�-lo: Depois de 6 meses",'LR',1);
}
if($ldes->bfssa && $ldes->bfssa != 'NA'){
	if($ldes->bfssa == '69')
		$pdf->Cell(0,5,"O beb� fica sentado sem apoio: Entre 6 e 9 meses",'LR',1);
	elseif($ldes->bfssa == '6-')
		$pdf->Cell(0,5,"O beb� fica sentado sem apoio: Antes de 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"O beb� fica sentado sem apoio: Depois de 9 meses",'LR',1);
}
if($ldes->cae && $ldes->cae != 'NA'){
	if($ldes->cae == '69')
		$pdf->Cell(0,5,"Come�a a se arrastar ou engatinhar : Entre 6 e 9 meses",'LR',1);
	elseif($ldes->cae == '6-')
		$pdf->Cell(0,5,"Come�a a se arrastar ou engatinhar : Antes de 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Come�a a se arrastar ou engatinhar : Depois de 9 meses",'LR',1);
}
if($ldes->pomo && $ldes->pomo != 'NA'){
	if($ldes->pomo == '69')
		$pdf->Cell(0,5,"Passa objetos de uma m�o para a outra: Entre 6 e 9 meses",'LR',1);
	elseif($ldes->pomo == '6-')
		$pdf->Cell(0,5,"Passa objetos de uma m�o para a outra: Antes de 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Passa objetos de uma m�o para a outra: Depois de 9 meses",'LR',1);
}
if($ldes->epd && $ldes->epd != 'NA'){
	if($ldes->epd == '69')
		$pdf->Cell(0,5,"Estranha pessoas desconhecidas: Entre 6 e 9 meses",'LR',1);
	elseif($ldes->epd == '6-')
		$pdf->Cell(0,5,"Estranha pessoas desconhecidas: Antes de 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Estranha pessoas desconhecidas: Depois de 9 meses",'LR',1);
}
if($ldes->rspm && $ldes->rspm != 'NA'){
	if($ldes->rspm == '69')
		$pdf->Cell(0,5,"Repete sons como 'pa-pa', 'ma-ma' : Entre 6 e 9 meses",'LR',1);
	elseif($ldes->rspm == '6-')
		$pdf->Cell(0,5,"Repete sons como 'pa-pa', 'ma-ma' : Antes de 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Repete sons como 'pa-pa', 'ma-ma' : Depois de 9 meses",'LR',1);
}
if($ldes->bpfpca && $ldes->bpfpca != 'NA'){
	if($ldes->bpfpca == '9C')
		$pdf->Cell(0,5,"O beb� pode ficar em p� com apoio: Entre 9 e 12 meses",'LR',1);
	elseif($ldes->bpfpca == '9-')
		$pdf->Cell(0,5,"O beb� pode ficar em p� com apoio: Antes de 9 meses",'LR',1);
	else
		$pdf->Cell(0,5,"O beb� pode ficar em p� com apoio: Depois de 12 meses",'LR',1);
}
if($ldes->bpacda && $ldes->bpacda != 'NA'){
	if($ldes->bpacda == '9C')
		$pdf->Cell(0,5,"Bate palmas, aponta com o dedo, acena: Entre 9 e 12 meses",'LR',1);
	elseif($ldes->bpacda == '9-')
		$pdf->Cell(0,5,"Bate palmas, aponta com o dedo, acena: Antes de 9 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Bate palmas, aponta com o dedo, acena: Depois de 12 meses",'LR',1);
}
if($ldes->pfudp && $ldes->pfudp != 'NA'){
	if($ldes->pfudp == '9C')
		$pdf->Cell(0,5,"Pode falar uma ou duas palavras: Entre 9 e 12 meses",'LR',1);
	elseif($ldes->pfudp == '9-')
		$pdf->Cell(0,5,"Pode falar uma ou duas palavras: Antes de 9 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Pode falar uma ou duas palavras: Depois de 12 meses",'LR',1);
}
if($ldes->cas && $ldes->cas != 'NA'){
	if($ldes->cas == 'CI')
		$pdf->Cell(0,5,"A crian�a anda sozinha: Entre 1 ano e 1 ano e 6 meses",'LR',1);
	elseif($ldes->cas == 'C-')
		$pdf->Cell(0,5,"A crian�a anda sozinha: Antes de 1 ano",'LR',1);
	else
		$pdf->Cell(0,5,"A crian�a anda sozinha: Depois de 1 ano e 6 meses",'LR',1);
}
if($ldes->cbld && $ldes->cbld != 'NA'){
	if($ldes->cbld == 'CI')
		$pdf->Cell(0,5,"Compreende bem o que lhe dizem: Entre 1 ano e 1 ano e 6 meses",'LR',1);
	elseif($ldes->cbld == 'C-')
		$pdf->Cell(0,5,"Compreende bem o que lhe dizem: Antes de 1 ano",'LR',1);
	else
		$pdf->Cell(0,5,"Compreende bem o que lhe dizem: Depois de 1 ano e 6 meses",'LR',1);
}
if($ldes->qcs && $ldes->qcs != 'NA'){
	if($ldes->qcs == 'CI')
		$pdf->Cell(0,5,"Quer comer sozinha: Entre 1 ano e 1 ano e 6 meses",'LR',1);
	elseif($ldes->qcs == 'C-')
		$pdf->Cell(0,5,"Quer comer sozinha: Antes de 1 ano",'LR',1);
	elseif($ldes->qcs == '')
		$pdf->Cell(0,5,"Quer comer sozinha: Depois de 1 ano e 6 meses",'LR',1);
}
if($ldes->gehmd && $ldes->gehmd != 'NA'){
	if($ldes->gehmd == 'CI')
		$pdf->Cell(0,5,"Gosta de escutar hist�rias, m�sicas e de dan�ar: Entre 1 ano e 1 ano e 6 meses",'LR',1);
	elseif($ldes->gehmd == 'C-')
		$pdf->Cell(0,5,"Gosta de escutar hist�rias, m�sicas e de dan�ar: Antes de 1 ano",'LR',1);
	else
		$pdf->Cell(0,5,"Gosta de escutar hist�rias, m�sicas e de dan�ar: Depois de 1 ano e 6 meses",'LR',1);
}
if($ldes->cfbqc && $ldes->cfbqc != 'NA'){
	if($ldes->cfbqc == 'CI')
		$pdf->Cell(0,5,"Come�a a fazer birra quando contrariada: Entre 1 ano e 1 ano e 6 meses",'LR',1);
	elseif($ldes->cfbqc == 'C-')
		$pdf->Cell(0,5,"Come�a a fazer birra quando contrariada: Antes de 1 ano",'LR',1);
	else
		$pdf->Cell(0,5,"Come�a a fazer birra quando contrariada: Depois de 1 ano e 6 meses",'LR',1);
}
if($ldes->ffs && $ldes->ffs != 'NA'){
	if($ldes->ffs == 'I2')
		$pdf->Cell(0,5,"Forma frases simples como 'leite n�o': Entre 1 ano e 6 meses e 2 anos",'LR',1);
	elseif($ldes->ffs == 'I-')
		$pdf->Cell(0,5,"Forma frases simples como 'leite n�o': Antes de 1 ano e 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Forma frases simples como 'leite n�o': Depois de 2 anos",'LR',1);
}
if($ldes->dtvp && $ldes->dtvp != 'NA'){
	if($ldes->dtvp == 'I2')
		$pdf->Cell(0,5,"Demonstra ter vontade pr�pria: Entre 1 ano e 6 meses e 2 anos",'LR',1);
	elseif($ldes->dtvp == 'I-')
		$pdf->Cell(0,5,"Demonstra ter vontade pr�pria: Antes de 1 ano e 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Demonstra ter vontade pr�pria: Depois de 2 anos",'LR',1);
}
if($ldes->csde && $ldes->csde != 'NA'){
	if($ldes->csde == 'I2')
		$pdf->Cell(0,5,"Corre, sobe e desce escadas, com adulto perto: Entre 1 ano e 6 meses e 2 anos",'LR',1);
	elseif($ldes->csde == 'I-')
		$pdf->Cell(0,5,"Corre, sobe e desce escadas, com adulto perto: Antes de 1 ano e 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Corre, sobe e desce escadas, com adulto perto: Depois de 2 anos",'LR',1);
}
if($ldes->pasv && $ldes->pasv != 'NA'){
	if($ldes->pasv == 'I2')
		$pdf->Cell(0,5,"Pode ajudar a se vestir: Entre 1 ano e 6 meses e 2 anos",'LR',1);
	elseif($ldes->pasv == 'I-')
		$pdf->Cell(0,5,"Pode ajudar a se vestir: Antes de 1 ano e 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Pode ajudar a se vestir: Depois de 2 anos",'LR',1);
}
if($ldes->acxc && $ldes->acxc != 'NA'){
	if($ldes->acxc == 'I2')
		$pdf->Cell(0,5,"Aprende a controlar o xixi e o coc�: Entre 1 ano e 6 meses e 2 anos",'LR',1);
	elseif($ldes->acxc == 'I-')
		$pdf->Cell(0,5,"Aprende a controlar o xixi e o coc�: Antes de 1 ano e 6 meses",'LR',1);
	else
		$pdf->Cell(0,5,"Aprende a controlar o xixi e o coc�: Depois de 2 anos",'LR',1);
}
if($ldes->secac && $ldes->secac != 'NA'){
	if($ldes->secac == '23')
		$pdf->Cell(0,5,"Sobe escadas, com apoio do corrim�o: Entre 2 e 3 anos",'LR',1);
	elseif($ldes->secac == '2-')
		$pdf->Cell(0,5,"Sobe escadas, com apoio do corrim�o: Antes de 2 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Sobe escadas, com apoio do corrim�o: Depois de 3 anos",'LR',1);
}
if($ldes->cpnt && $ldes->cpnt != 'NA'){
	if($ldes->cpnt == '23')
		$pdf->Cell(0,5,"Come�a a perguntar o nome de tudo: Entre 2 e 3 anos",'LR',1);
	elseif($ldes->cpnt == '2-')
		$pdf->Cell(0,5,"Come�a a perguntar o nome de tudo: Antes de 2 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Come�a a perguntar o nome de tudo: Depois de 3 anos",'LR',1);
}
if($ldes->gboc && $ldes->gboc != 'NA'){
	if($ldes->gboc == '23')
		$pdf->Cell(0,5,"Gosta de brincar com outras crian�as: Entre 2 e 3 anos",'LR',1);
	elseif($ldes->gboc == '2-')
		$pdf->Cell(0,5,"Gosta de brincar com outras crian�as: Antes de 2 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Gosta de brincar com outras crian�as: Depois de 3 anos",'LR',1);
}
if($ldes->vests && $ldes->vests != 'NA'){
	if($ldes->vests == '36')
		$pdf->Cell(0,5,"Veste-se sozinha: Entre 3 e 6 anos",'LR',1);
	elseif($ldes->vests == '3-')
		$pdf->Cell(0,5,"Veste-se sozinha: Antes de 3 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Veste-se sozinha: Depois de 6 anos",'LR',1);
}
if($ldes->ffcc && $ldes->ffcc != 'NA'){
	if($ldes->ffcc == '36')
		$pdf->Cell(0,5,"Fala de forma clara e compreens�vel: Entre 3 e 6 anos",'LR',1);
	elseif($ldes->ffcc == '3-')
		$pdf->Cell(0,5,"Fala de forma clara e compreens�vel: Antes de 3 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Fala de forma clara e compreens�vel: Depois de 6 anos",'LR',1);
	
}
if($ldes->pmpq && $ldes->pmpq != 'NA'){
	if($ldes->pmpq == '36')	
		$pdf->Cell(0,5,"Pergunta muito 'por qu�?': Entre 3 e 6 anos",'LR',1);
	elseif($ldes->pmpq == '3-')	
		$pdf->Cell(0,5,"Pergunta muito 'por qu�?': Antes de 3 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Pergunta muito 'por qu�?': Depois de 6 anos",'LR',1);
}
if($ldes->iaaif && $ldes->iaaif != 'NA'){
	if($ldes->iaaif == '6A')
		$pdf->Cell(0,5,"Tem interesse por amigos e atividades independentes da fam�lia : Entre 6 e 10 anos",'LR',1);
	elseif($ldes->iaaif == '6-')
		$pdf->Cell(0,5,"Tem interesse por amigos e atividades independentes da fam�lia : Antes de 6 anos",'LR',1);
	else
		$pdf->Cell(0,5,"Tem interesse por amigos e atividades independentes da fam�lia : Depois de 10 anos",'LR',1);
}
if($ldes->obs)
	$pdf->Cell(0,5,"Observa��es:$ldes->obs",'LR',1);
$pdf->Cell(0,0,"",'LR',1);
$pdf->Cell(0,0,"",'LR',1);
}

/////////////////////////////////////////////
/*****************Especial******************/
////////////////////////////////////////////
$pdf->SetFont('Arial','B',14);
if(!$dadosEspecial)
	$pdf->Cell(0,10,"Especial - Sem Dados",'LTR',1);
else{
	$pdf->Cell(0,10,"Especial",'LTR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

/**********Cr�nio************/

$pdf->SetFont('Arial','B',10);
if($dadosCranio)
	$pdf->Cell(0,10,"Cr�nio",'LR',1);
else
	$pdf->Cell(0,10,"Cr�nio - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);


if($lcr->tamcranio && $lcr->tamcranio != 'NA'){
	if($lcr->tamcranio == 'N')
		$pdf->Cell(0,5,"Tamanho: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Tamanho: Alterado",'LR',1);
}
if($lcr->formacranio && $lcr->formacranio != 'NA'){
	if($lcr->formacranio == 'N')
		$pdf->Cell(0,5,"Forma: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Forma: Alterada",'LR',1);
}
if($lcr->fontanelas && $lcr->fontanelas != 'NA'){
	if($lcr->fontanelas == 'N')
		$pdf->Cell(0,5,"Fontanelas: Normais",'LR',1);
	else
		$pdf->Cell(0,5,"Fontanelas: Alteradas",'LR',1);
}
if($lcr->suturas && $lcr->suturas != 'NA'){
	if($lcr->suturas == 'P')
		$pdf->Cell(0,5,"Suturas: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Suturas: Ausentes",'LR',1);
}
if($lcr->craneo && $lcr->craneo != 'NA'){
	if($lcr->craneo == 'S')
		$pdf->Cell(0,5,"Craneotabes: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Craneotabes: N�o",'LR',1);
}
if($lcr->cabelo && $lcr->cabelo != 'NA'){
	if($lcr->cabelo == 'P')
		$pdf->Cell(0,5,"Cabelos: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Cabelos: Ausentes",'LR',1);
}
if($lcr->lescab && $lcr->lescab != 'NA'){
	if($lcr->lescab == 'S')
		$pdf->Cell(0,5,"Les�es de Couro Cabeludo: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Les�es de Couro Cabeludo: N�o",'LR',1);
}
if($lcr->obs)
	$pdf->Cell(0,5,"Observa��es:$lcr->obs",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

/**********Olhos************/

$pdf->SetFont('Arial','B',10);
if($dadosOlhos)
	$pdf->Cell(0,10,"Olhos",'LR',1);
else
	$pdf->Cell(0,10,"Olhos - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);


if($leolh->ptose && $leolh->ptose != 'NA'){
	if($leolh->ptose == 'S')
		$pdf->Cell(0,5,"Ptose: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Ptose: N�o",'LR',1);
}
if($leolh->edemapalp  && $leolh->edemapalp  != 'NA'){
	if($leolh->edemapalp == 'S')
		$pdf->Cell(0,5,"Edema Palpebral: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Edema Palpebral: N�o",'LR',1);
}

if($leolh->corescle || $leolh->hemorragias || $leolh->secrecao || $leolh->inflamacao || $leolh->cilios ||  $leolh->movoc || $leolh->pupila ||$leolh->acuidvis) //////AJEITAR/////
	$pdf->Cell(0,5,"Escler�ticas e conjuntiva:",'LR',1);
if($leolh->hemorragias && $leolh->hemorragias != 'NA'){
	if($leolh->hemorragias == 'S')
		$pdf->Cell(0,5,"    Hemorragias: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"    Hemorragias: N�o",'LR',1);
}
if($leolh->corescle && $leolh->corescle != 'NA'){
	if($leolh->corescle == 'B')
		$pdf->Cell(0,5,"    Cor: Branca",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Amarela",'LR',1);
}
if($leolh->inflamacao && $leolh->inflamacao != 'NA'){
	if($leolh->inflamacao == 'P')
		$pdf->Cell(0,5,"    Inflama��o: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Inflama��o: Ausente",'LR',1);
}
if($leolh->secrecao && $leolh->secrecao != 'NA'){
	if($leolh->secrecao == 'N')
		$pdf->Cell(0,5,"    Secre��o: N�o",'LR',1);
	elseif($leolh->secrecao == 'SP')
		$pdf->Cell(0,5,"    Secre��o: Sim, purulenta",'LR',1);
	else
		$pdf->Cell(0,5,"    Secre��o: Sim, hialina",'LR',1);
}
if($leolh->cilios && $leolh->cilios != 'NA'){
	if($leolh->cilios == 'P')
		$pdf->Cell(0,5,"    C�lios: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"    C�lios: Ausentes",'LR',1);
}
if($leolh->movoc && $leolh->movoc != 'NA'){
	if($leolh->movoc == 'A')
		$pdf->Cell(0,5,"    Movimentos Oculares Anormais: Ausentes",'LR',1);
	elseif($leolh->movoc == 'E')
		$pdf->Cell(0,5,"    Movimentos Oculares Anormais: Estrabismo",'LR',1);
	else
		$pdf->Cell(0,5,"    Movimentos Oculares Anormais: Nistagmo",'LR',1);
}
if($leolh->pupila && $leolh->pupila != 'NA'){
	if($leolh->pupila == 'NL')
		$pdf->Cell(0,5,"    Pupilas: Normais, reativas � luz",'LR',1);
	elseif($leolh->pupila == 'OL')
		$pdf->Cell(0,5,"    Pupilas: Opacas, reativas � luz",'LR',1);
	elseif($leolh->pupila == 'NN')
		$pdf->Cell(0,5,"    Pupilas: Normais, n�o reativas",'LR',1);
	else
		$pdf->Cell(0,5,"    Pupilas: Opacas, n�o reativas",'LR',1);
}
if($leolh->acuidvis && $leolh->acuidvis != 'NA'){
	if($leolh->acuidvis == 'S')
		$pdf->Cell(0,5,"    Acuidade visual: Sim",'LR',1);
	elseif($leolh->acuidvis == 'NS')
		$pdf->Cell(0,5,"    Acuidade visual: N�o, sem lentes corretivas",'LR',1);
	else
		$pdf->Cell(0,5,"    Acuidade visual: N�o, com lentes corretivas",'LR',1);
}
if($leolh->obs)
	$pdf->Cell(0,5,"Observa��es:$leolh->obs",'LR',1);


$pdf->Cell(0,0,"",'LR',1);

/**********Otorrinolaringol�gico*********/
$pdf->SetFont('Arial','B',10);
if($dadosOtorrino)
	$pdf->Cell(0,10,"Otorrinolaringol�gico",'LR',1);
else
	$pdf->Cell(0,10,"Otorrinolaringol�gico - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);


//Ouvidos
if($leot->posorelha && $leot->posorelha != 'NA') /////////////////AJEITAR!!!!!!!!!
	$pdf->Cell(0,5,"Ouvidos:",'LR',1);
	
if($leot->posorelha && $leot->posorelha != 'NA'){
	if($leot->posorelha == 'N')
		$pdf->Cell(0,5,"    Posi��o das Orelhas: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Posi��o das Orelhas: Rebaixada",'LR',1);
}
if($leot->formorelha && $leot->formorelha != 'NA'){
	if($leot->formorelha == 'N')
		$pdf->Cell(0,5,"    Forma das Orelhas: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Forma das Orelhas: Alterada",'LR',1);
}
if($leot->dorouvido && $leot->dorouvido != 'NA'){
	if($leot->dorouvido == 'S')
		$pdf->Cell(0,5,"    Dor: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"    Dor: N�o",'LR',1);
}
if($leot->edemamast && $leot->edemamast != 'NA'){
	if($leot->edemamast == 'P')
		$pdf->Cell(0,5,"    Edema Sobre a Mast�ide: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Edema Sobre a Mast�ide: Ausente",'LR',1);
}
if($leot->secrouvido && $leot->secrouvido != 'NA'){
	if($leot->secrouvido == 'N')
		$pdf->Cell(0,5,"    Secre��o: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Secre��o: Purulenta",'LR',1);
}
if($leot->canaudext && $leot->canaudext != 'NA'){
	if($leot->canaudext == 'A')
		$pdf->Cell(0,5,"    Canal auditivo externo: Aberto",'LR',1);
	else
		$pdf->Cell(0,5,"    Canal auditivo externo: Fechado",'LR',1);
}
if($leot->otoscopia && $leot->otoscopia != 'NA'){
	if($leot->otoscopia == 'N')
		$pdf->Cell(0,5,"    Otoscopia: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Otoscopia: Alterada",'LR',1);
}
	
//Nariz
if(($leot->batasanariz && $leot->batasanariz != 'NA') || ($leot->secrnariz && $leot->secrnariz != 'NA') || ($leot->tumornariz && $leot->tumornariz != 'NA') || ($leot->rinoscopia && $leot->rinoscopia != 'NA'))
	$pdf->Cell(0,5,"Nariz:",'LR',1);
if($leot->batasanariz && $leot->batasanariz != 'NA'){
	if($leot->batasanariz == 'P')
		$pdf->Cell(0,5,"    Batimentos de asa do nariz: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Batimentos de asa do nariz: Ausente",'LR',1);
}
if($leot->secrnariz && $leot->secrnariz != 'NA'){
	if($leot->secrnariz == 'N')
		$pdf->Cell(0,5,"    Secre��o: Normal",'LR',1);
	elseif($leot->secrnariz == 'H')
		$pdf->Cell(0,5,"    Secre��o: Hialina",'LR',1);
	else
		$pdf->Cell(0,5,"    Secre��o: Amarelo-Esverdeada",'LR',1);
}	
if($leot->tumornariz && $leot->tumornariz != 'NA'){
	if($leot->tumornariz == 'P')
		$pdf->Cell(0,5,"    Tumora��es: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Tumora��es: Ausente",'LR',1);
}	
if($leot->rinoscopia && $leot->rinoscopia != 'NA'){
	if($leot->rinoscopia == 'N')
		$pdf->Cell(0,5,"    Rinoscopia: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Rinoscopia: Alterado",'LR',1);
}

//Labios
if(($leot->corlabios && $leot->corlabios != 'NA') || ($leot->umidlabios && $leot->umidlabios != 'NA') || ($leot->eruplabios && $leot->eruplabios != 'NA') || ($leot->fisslabios && $leot->fisslabios != 'NA'))
	$pdf->Cell(0,5,"L�bios:",'LR',1);	
if($leot->eruplabios && $leot->eruplabios != 'NA'){
	if($leot->eruplabios == 'P')
		$pdf->Cell(0,5,"    Erup��es: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Erup��es: Ausente",'LR',1);
}
if($leot->corlabios && $leot->corlabios != 'NA'){
	if($leot->corlabios == 'Co')
		$pdf->Cell(0,5,"    Cor: Corado",'LR',1);
	elseif($leot->corlabios == 'P')
		$pdf->Cell(0,5,"    Cor: P�lido",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Cian�tico",'LR',1);
}
if($leot->fisslabios && $leot->fisslabios != 'NA'){
	if($leot->fisslabios == 'P')
		$pdf->Cell(0,5,"    Fissuras: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"    Fissuras: Ausentes",'LR',1);
}
if($leot->umidlabios && $leot->umidlabios != 'NA'){
	if($leot->umidlabios == 'H')
		$pdf->Cell(0,5,"    Umidade: Hidratados",'LR',1);
	elseif($leot->umidlabios == 'U')
		$pdf->Cell(0,5,"    Umidade: �midos",'LR',1);
	else
		$pdf->Cell(0,5,"    Umidade: Ressecados",'LR',1);
}
if($leot->masslabios && $leot->masslabios != 'NA'){
	if($leot->masslabios == 'P')
		$pdf->Cell(0,5,"    Massas: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"    Massas: Ausentes",'LR',1);
}

//Gengivas
if(($leot->corgeng && $leot->corgeng != 'NA') || ($leot->hemorrgeng && $leot->hemorrgeng != 'NA'))
	$pdf->Cell(0,5,"Gengivas:",'LR',1);	
if($leot->corgeng && $leot->corgeng != 'NA'){
	if($leot->corgeng == 'N')
		$pdf->Cell(0,5,"    Cor: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Alterada",'LR',1);
}
if($leot->hemorrgeng && $leot->hemorrgeng != 'NA'){
	if($leot->hemorrgeng == 'S')
		$pdf->Cell(0,5,"    Hemorragias: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"    Hemorragias: N�o",'LR',1);
}

//L�ngua
if(($leot->corlingua && $leot->corlingua != 'NA') || ($leot->umidlingua && $leot->umidlingua != 'NA') || ($leot->exsudatol && $leot->exsudatol != 'NA')|| ($leot->tremlingua && $leot->tremlingua != 'NA')|| ($leot->tumoracoes && $leot->tumoracoes != 'NA'))
	$pdf->Cell(0,5,"L�ngua:",'LR',1);	
if($leot->exsudatol && $leot->exsudatol != 'NA'){
	if($leot->exsudatol == 'P')
		$pdf->Cell(0,5,"    Exsudato: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Exsudato: Ausente",'LR',1);
}
if($leot->corlingua && $leot->corlingua != 'NA'){
	if($leot->corlingua == 'N')
		$pdf->Cell(0,5,"    Cor: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Alterada",'LR',1);
}
if($leot->tremlingua && $leot->tremlingua != 'NA'){
	if($leot->tremlingua == 'P')
		$pdf->Cell(0,5,"    Tremor: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Tremor: Ausente",'LR',1);
}
if($leot->umidlingua && $leot->umidlingua != 'NA'){
	if($leot->umidlingua == 'H')
		$pdf->Cell(0,5,"    Umidade: Hidradada",'LR',1);
	else
		$pdf->Cell(0,5,"    Umidade: Seca",'LR',1);
}
if($leot->tumoracoes && $leot->tumoracoes != 'NA'){
	if($leot->tumoracoes == 'P')
		$pdf->Cell(0,5,"    Tumora��es: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"    Tumora��es: Ausentes",'LR',1);
}

//Dentes
if(($leot->numdentes && $leot->numdentes != 'NA') || ($leot->consdentes && $leot->consdentes != 'NA') || ($leot->impldentes && $leot->impldentes != 'NA'))
	$pdf->Cell(0,5,"Dentes:",'LR',1);	
if($leot->numdentes && $leot->numdentes != 'NA'){
	if($leot->numdentes == 'N')	
		$pdf->Cell(0,5,"    N�mero: Normal para a idade",'LR',1);
	else
		$pdf->Cell(0,5,"    N�mero: Anormal para a idade",'LR',1);
}
if($leot->impldentes && $leot->impldentes != 'NA'){
	if($leot->impldentes == 'N')
		$pdf->Cell(0,5,"    Implata��o: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Implata��o: Alterado",'LR',1);
}
if($leot->consdentes && $leot->consdentes != 'NA'){
	if($leot->consdentes == 'B')
		$pdf->Cell(0,5,"    Conserva��o: Boa",'LR',1);
	elseif($leot->consdentes == 'R')
		$pdf->Cell(0,5,"    Conserva��o: Ruim",'LR',1);
	else
		$pdf->Cell(0,5,"    Conserva��o: P�ssima",'LR',1);
}


//Faringe
if(($leot->corfaringe && $leot->corfaringe != 'NA') || ($leot->exsudatof && $leot->exsudatof != 'NA'))
	$pdf->Cell(0,5,"Faringe:",'LR',1);	
if($leot->corfaringe && $leot->corfaringe != 'NA'){
	if($leot->corfaringe == 'N')
		$pdf->Cell(0,5,"    Cor: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"    Cor: Alterada",'LR',1);
}
if($leot->exsudatof && $leot->exsudatof != 'NA'){
	if($leot->exsudatof == 'P')
		$pdf->Cell(0,5,"    Exsudato: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"    Exsudato: Ausente",'LR',1);
}

if($leot->obs)
	$pdf->Cell(0,5,"Observa��es:$leot->obs",'LR',1);

$pdf->Cell(0,0,"",'LR',1);

/**********Pesco�o************/
$pdf->SetFont('Arial','B',10);
if($dadosPescoco)
	$pdf->Cell(0,10,"Pesco�o",'LR',1);
else
	$pdf->Cell(0,10,"Pesco�o - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($lepes->retracoesp && $lepes->retracoesp != 'NA'){
	if($lepes->retracoesp == 'P')
		$pdf->Cell(0,5,"Retra��es: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Retra��es: Ausentes",'LR',1);
}
if($lepes->torcicolo && $lepes->torcicolo != 'NA'){
	if($lepes->torcicolo == 'P')
		$pdf->Cell(0,5,"Torcicolo: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Torcicolo: Ausente",'LR',1);	
}
if($lepes->claviculas && $lepes->claviculas != 'NA'){
	if($lepes->claviculas == 'N')
		$pdf->Cell(0,5,"Clav�culas: Normal",'LR',1);
	elseif($lepes->claviculas == 'Al')
		$pdf->Cell(0,5,"Clav�culas: Alteradas",'LR',1);
	else
		$pdf->Cell(0,5,"Clav�culas: Ausentes",'LR',1);
}
if($lepes->tireoide && $lepes->tireoide != 'NA'){
	if($lepes->tireoide == 'N')
		$pdf->Cell(0,5,"Tire�ide: Normal",'LR',1);
	elseif($lepes->tireoide == 'Al')
		$pdf->Cell(0,5,"Tire�ide: Consist�ia Aumentada",'LR',1);
	else
		$pdf->Cell(0,5,"Tire�ide: Ausente",'LR',1);
}
if($lepes->massastum && $lepes->massastum != 'NA'){
	if($lepes->massastum == 'P')
		$pdf->Cell(0,5,"Outras massas tumorais: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Outras massas tumorais: Ausentes",'LR',1);
}
if($lepes->fistulas && $lepes->fistulas != 'NA'){
	if($lepes->fistulas == 'P')
		$pdf->Cell(0,5,"F�stulas: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"F�stulas: Ausentes",'LR',1);
}
if($lepes->rigidez && $lepes->rigidez != 'NA'){
	if($lepes->rigidez == 'P')
		$pdf->Cell(0,5,"Rigidez: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Rigidez: Ausente",'LR',1);
}
if($lepes->fosspesc && $lepes->fosspesc != 'NA'){
	if($lepes->fosspesc == 'N')
		$pdf->Cell(0,5,"Fossa supra-clavicular: Normal",'LR',1);
	elseif($lepes->fosspesc == 'A+')
		$pdf->Cell(0,5,"Fossa supra-clavicular: Aumentada",'LR',1);
	else
		$pdf->Cell(0,5,"Fossa supra-clavicular: Ausente",'LR',1);
}
if($lepes->obs)
	$pdf->Cell(0,5,"Observa��es:$lepes->obs",'LR',1);
	
$pdf->Cell(0,0,"",'LR',1);

/**********Respirat�rio************/
$pdf->SetFont('Arial','B',10);
if($dadosResp)
	$pdf->Cell(0,10,"Respirat�rio",'LR',1);
else
	$pdf->Cell(0,10,"Respirat�rio - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($lersp->formtorax && $lersp->formtorax != 'NA'){
	if($lersp->formtorax == 'N')
		$pdf->Cell(0,5,"Forma do T�rax: Normal",'LR',1);
	elseif($lersp->formtorax == 'B')
		$pdf->Cell(0,5,"Forma do T�rax: Em 'barril' ",'LR',1);
	elseif($lersp->formtorax == 'PP')
		$pdf->Cell(0,5,"Forma do T�rax: Em 'Peito de Pombo'",'LR',1);
	else
		$pdf->Cell(0,5,"Forma do T�rax: Outra altera��o",'LR',1);
}
if($lersp->simtorax && $lersp->simtorax != 'NA'){
	if($lersp->simtorax == 'S')
		$pdf->Cell(0,5,"Simetria do T�rax: Sim�trico",'LR',1);
	else
		$pdf->Cell(0,5,"Simetria do T�rax: Assim�trico",'LR',1);
}
if($lersp->contornos && $lersp->contornos != 'NA'){
	if($lersp->contornos == 'N')
		$pdf->Cell(0,5,"Contornos: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Contornos: Alterados",'LR',1);
}
if($lersp->proemi && $lersp->proemi != 'NA'){
	if($lersp->proemi == 'P')
		$pdf->Cell(0,5,"Proemin�ncias: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Proemin�ncias: Ausentes",'LR',1);
}
if($lersp->mamas && $lersp->mamas != 'NA'){
	if($lersp->mamas == 'N')
		$pdf->Cell(0,5,"Mamas: Normal",'LR',1);
	elseif($lersp->mamas == 'A')
		$pdf->Cell(0,5,"Mamas: Aumentadas",'LR',1);
	elseif($lersp->mamas == 'D')
		$pdf->Cell(0,5,"Mamas: Diminu�das",'LR',1);
	else
		$pdf->Cell(0,5,"Mamas: Presen�a de massa/Tumora��o",'LR',1);
}
if($lersp->massasanorm && $lersp->massasanorm != 'NA'){
	if($lersp->massasanorm == 'P')
		$pdf->Cell(0,5,"Massas Anormais: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Massas Anormais: Ausentes",'LR',1);
}
if($lersp->tresp && $lersp->tresp != 'NA'){
	if($lersp->tresp == 'N')
		$pdf->Cell(0,5,"Tipo de respira��o: Normal",'LR',1);
	elseif($lersp->tresp == 'D')
		$pdf->Cell(0,5,"Tipo de respira��o: Dispn�ia",'LR',1);
	elseif($lersp->tresp == 'CS')
		$pdf->Cell(0,5,"Tipo de respira��o: Cheyne-Stokes",'LR',1);
	elseif($lersp->tresp == 'B')
		$pdf->Cell(0,5,"Tipo de respira��o: Biot",'LR',1);
	elseif($lersp->tresp == 'K')
		$pdf->Cell(0,5,"Tipo de respira��o: Kussmaul",'LR',1);
	else
		$pdf->Cell(0,5,"Tipo de respira��o: Suspirosa",'LR',1);
}
if($lersp->tirinterc && $lersp->tirinterc != 'NA'){
	if($lersp->tirinterc == 'P')
		$pdf->Cell(0,5,"Tiragem Intercostal: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Tiragem Intercostal: Ausente",'LR',1);
}
if($lersp->freqresp && $lersp->freqresp != 'NA'){
	if($lersp->freqresp == 'N')
		$pdf->Cell(0,5,"Freq��ncia Respirat�ria: Normal",'LR',1);
	elseif($lersp->freqresp == 'D')
		$pdf->Cell(0,5,"Freq��ncia Respirat�ria: Dimunu�da",'LR',1);
	else
		$pdf->Cell(0,5,"Freq��ncia Respirat�ria: Aumentada",'LR',1);
}
if($lersp->fremtv && $lersp->fremtv != 'NA'){
	if($lersp->fremtv == 'N')
		$pdf->Cell(0,5,"Fr�mito T�raco-vocal: Presente e Normal",'LR',1);
	elseif($lersp->fremtv == 'PD')
		$pdf->Cell(0,5,"Fr�mito T�raco-vocal: Presente e Diminu�do",'LR',1);
	elseif($lersp->fremtv == 'PA')
		$pdf->Cell(0,5,"Fr�mito T�raco-vocal: Presente e Aumentado",'LR',1);
	else
		$pdf->Cell(0,5,"Fr�mito T�raco-vocal: Ausente",'LR',1);
}
if($lersp->frembronq && $lersp->frembronq != 'NA'){
	if($lersp->frembronq == 'P')
		$pdf->Cell(0,5,"Fr�mito Br�nquico: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Fr�mito Br�nquico: Ausente",'LR',1);
}
if($lersp->frempleur && $lersp->frempleur != 'NA'){
	if($lersp->frempleur == 'P')
		$pdf->Cell(0,5,"Fr�mito Pleural: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Fr�mito Pleural: Ausente",'LR',1);
	
}
if($lersp->submacicez && $lersp->submacicez != 'NA'){
	if($lersp->submacicez == 'HA')
		$pdf->Cell(0,5,"Submacicez normal: Em ambos hemi-t�rax",'LR',1);
	elseif($lersp->submacicez == 'HD')
		$pdf->Cell(0,5,"Submacicez normal: Somente hemi-t�rax esquerdo",'LR',1);
	elseif($lersp->submacicez == 'HE')
		$pdf->Cell(0,5,"Submacicez normal: Somente hemi-t�rax direito",'LR',1);
	else
		$pdf->Cell(0,5,"Submacicez normal: Ausente",'LR',1);
}
if($lersp->macicez && $lersp->macicez != 'NA'){
	if($lersp->macicez == 'HA')
		$pdf->Cell(0,5,"Macicez: Em ambos hemi-t�rax",'LR',1);
	elseif($lersp->macicez == 'HD')
		$pdf->Cell(0,5,"Macicez: Somente hemi-t�rax esquerdo",'LR',1);
	elseif($lersp->macicez == 'HE')
		$pdf->Cell(0,5,"Macicez: Somente hemi-t�rax direito",'LR',1);
	else
		$pdf->Cell(0,5,"Macicez: Ausente",'LR',1);
}
if($lersp->timpanico && $lersp->timpanico != 'NA'){
	if($lersp->timpanico == 'HA')
		$pdf->Cell(0,5,"Timp�nico: Em ambos hemi-t�rax",'LR',1);
	elseif($lersp->timpanico == 'HD')
		$pdf->Cell(0,5,"Timp�nico: Somente hemi-t�rax esquerdo",'LR',1);
	elseif($lersp->timpanico == 'HE')
		$pdf->Cell(0,5,"Timp�nico: Somente hemi-t�rax direito",'LR',1);
	else
		$pdf->Cell(0,5,"Timp�nico: Ausente",'LR',1);
}
if($lersp->murmvesic && $lersp->murmvesic != 'NA'){
	if($lersp->murmvesic == 'HA')
		$pdf->Cell(0,5,"Murm�rios Vesiculares: Em ambos hemi-t�rax",'LR',1);
	elseif($lersp->murmvesic == 'HD')
		$pdf->Cell(0,5,"Murm�rios Vesiculares: Somente hemi-t�rax esquerdo",'LR',1);
	elseif($lersp->murmvesic == 'HE')
		$pdf->Cell(0,5,"Murm�rios Vesiculares: Somente hemi-t�rax direito",'LR',1);
	else
		$pdf->Cell(0,5,"Murm�rios Vesiculares: Ausente",'LR',1);
}
if($lersp->estertores && $lersp->estertores != 'NA'){
	if($lersp->estertores == 'P')
		$pdf->Cell(0,5,"Estertores / Crepita��es: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Estertores / Crepita��es: Ausentes",'LR',1);
}
if($lersp->estridores && $lersp->estridores != 'NA'){
	if($lersp->estridores == 'P')
		$pdf->Cell(0,5,"Estridores: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Estridores: Ausentes",'LR',1);
}
if($lersp->sibilos && $lersp->sibilos != 'NA'){
	if($lersp->sibilos == 'P')
		$pdf->Cell(0,5,"Sibilos: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Sibilos: Ausentes",'LR',1);
}
if($lersp->atritopleur && $lersp->atritopleur != 'NA'){
	if($lersp->atritopleur == 'P')
		$pdf->Cell(0,5,"Atrito Pleural: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Atrito Pleural: Ausente",'LR',1);
}
if($lersp->obs)
	$pdf->Cell(0,5,"Observa��es:$lersp->obs",'LR',1);

$pdf->Cell(0,0,"",'LR',1);

/**********Cardiovascular************/
$pdf->SetFont('Arial','B',10);
if($dadosCardio)
	$pdf->Cell(0,10,"Cardiovascular",'LR',1);
else
	$pdf->Cell(0,10,"Cardiovascular - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);
if($lecdvs->precord && $lecdvs->precord != 'NA'){
	if($lecdvs->precord == 'A')	
		$pdf->Cell(0,5,"Prec�rdio: Abaulado",'LR',1);
	else
		$pdf->Cell(0,5,"Prec�rdio: Retra�do",'LR',1);
}	
if($lecdvs->ictuscordi && $lecdvs->ictuscordi != 'NA'){
	if($lecdvs->ictuscordi == 'S')
		$pdf->Cell(0,5,"Ictus Cordis (Inspe��o): Localiza��o Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Ictus Cordis (Inspe��o): Localiza��o Alterado",'LR',1);
}
if($lecdvs->ictuscordp && $lecdvs->ictuscordp != 'NA'){
	if($lecdvs->ictuscordp == 'BN')
		$pdf->Cell(0,5,"Ictus Cordis (Palpa��o): For�a de batimento normal",'LR',1);
	else
		$pdf->Cell(0,5,"Ictus Cordis (Palpa��o): For�a de batimento Alterado",'LR',1);
}
if($lecdvs->artperif && $lecdvs->artperif != 'NA'){
	if($lecdvs->artperif == 'N')
		$pdf->Cell(0,5,"Art�rias perif�ricas: Normais",'LR',1);
	else
		$pdf->Cell(0,5,"Art�rias perif�ricas: Alteradas",'LR',1);
}
if($lecdvs->bulhas && $lecdvs->bulhas != 'NA'){
	if($lecdvs->bulhas == '')
		$pdf->Cell(0,5,"Bulhas : Normofon�ticas",'LR',1);
	elseif($lecdvs->bulhas == '')
		$pdf->Cell(0,5,"Bulhas : Hipofon�ticas",'LR',1);
	else
		$pdf->Cell(0,5,"Bulhas : Hiperfon�ticas",'LR',1);
}
if($lecdvs->sopros && $lecdvs->sopros != 'NA'){
	if($lecdvs->sopros == '')	
		$pdf->Cell(0,5,"Sopros: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Sopros: Ausente",'LR',1);
}
if($lecdvs->pressaoart && $lecdvs->pressaoart != 'NA')
	$pdf->Cell(0,5,"Press�o Arterial:$lecdvs->pressaoartin",'LR',1);
if($lecdvs->freqcard && $lecdvs->freqcard != 'NA')
	$pdf->Cell(0,5,"Freq��ncia Card�aca:$lecdvs->freqcardin",'LR',1);
if($lecdvs->obs)
	$pdf->Cell(0,5,"Observa��es:$lecdvs->obs",'LR',1);

$pdf->Cell(0,0,"",'LR',1);

/**********Gastro-Intestinal************/
$pdf->SetFont('Arial','B',10);
if($dadosGastro)
	$pdf->Cell(0,10,"Gastro-Intestinal",'LR',1);
else
	$pdf->Cell(0,10,"Gastro-Intestinal - Sem Dados",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($legt->formabd && $legt->formabd != 'NA'){
	if($legt->formabd == 'N')
		$pdf->Cell(0,5,"Forma do Abd�men: Normal",'LR',1);
	elseif($legt->formabd == 'A')
		$pdf->Cell(0,5,"Forma do Abd�men: Abaulado",'LR',1);
	else
		$pdf->Cell(0,5,"Forma do Abd�men: Retra�do",'LR',1);
}
if($legt->cicatumb && $legt->cicatumb != 'NA'){
	if($legt->cicatumb == 'N')
		$pdf->Cell(0,5,"Cicatriz Umbilical: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Cicatriz Umbilical: Protusa",'LR',1);
}
if($legt->peristal && $legt->peristal != 'NA'){
	if($legt->peristal == 'N')
		$pdf->Cell(0,5,"Peristaltismo: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Peristaltismo: Alterado",'LR',1);
}
if($legt->distensao && $legt->distensao != 'NA'){
	if($legt->distensao == 'P')
		$pdf->Cell(0,5,"Distens�o: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Distens�o: Ausente",'LR',1);
}
if($legt->tumorgt && $legt->tumorgt != 'NA'){
	if($legt->tumorgt == 'P')
		$pdf->Cell(0,5,"Tumora��es: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Tumora��es: Ausente",'LR',1);
}
if($legt->ondfluidas && $legt->ondfluidas != 'NA'){
	if($legt->ondfluidas == 'P')
		$pdf->Cell(0,5,"Ondas Fluidas: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Ondas Fluidas: Ausentes",'LR',1);
}
if($legt->timpangt && $legt->timpangt != 'NA'){
	if($legt->timpangt == 'N')
		$pdf->Cell(0,5,"Timpanismo: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Timpanismo: Alterado",'LR',1);
}
if($legt->paredesmusc && $legt->paredesmusc != 'NA'){
	if($legt->paredesmusc == 'N')
		$pdf->Cell(0,5,"Estado das Paredes Musculares: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Estado das Paredes Musculares: Alteradas",'LR',1);
}
if($legt->espasmos && $legt->espasmos != 'NA'){
	if($legt->espasmos == 'P')
		$pdf->Cell(0,5,"Espasmos: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Espasmos: Ausentes",'LR',1);
}
if($legt->rigidez && $legt->rigidez != 'NA'){
	if($legt->rigidez == 'P')
		$pdf->Cell(0,5,"Rigidez: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Rigidez: Ausente",'LR',1);
}
if($legt->estomago && $legt->estomago != 'NA'){
	if($legt->estomago == 'N')
		$pdf->Cell(0,5,"Est�mago : Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Est�mago : Alterado",'LR',1);
}
if($legt->figado && $legt->figado != 'NA'){
	if($legt->figado == 'N')
		$pdf->Cell(0,5,"F�gado: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"F�gado: Aumentado",'LR',1);
}
if($legt->baco && $legt->baco != 'NA'){
	if($legt->baco == 'N')
		$pdf->Cell(0,5,"Ba�o: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Ba�o: Aumentado",'LR',1);
}
if($legt->rins && $legt->rins!= 'NA'){
	if($legt->rins == 'N')
		$pdf->Cell(0,5,"Rins: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Rins: Giordano positivo",'LR',1);
}
if($legt->hernias && $legt->hernias != 'NA'){
	if($legt->hernias == 'A')
		$pdf->Cell(0,5,"H�rnias: Ausentes",'LR',1);
	elseif($legt->hernias == 'PR')
		$pdf->Cell(0,5,"H�rnias: Presentes e redut�veis",'LR',1);
	else
		$pdf->Cell(0,5,"H�rnias: Presentes e irredut�veis",'LR',1);
}
if($legt->massastum && $legt->massastum != 'NA'){
	if($legt->massastum == 'P')
		$pdf->Cell(0,5,"Massas Tumorais: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Massas Tumorais: Ausentes",'LR',1);
}
if($legt->ruidosha && $legt->ruidosha != 'NA'){
	if($legt->ruidosha == 'P')
		$pdf->Cell(0,5,"Ru�dos hidro-a�reos: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Ru�dos hidro-a�reos: Ausentes",'LR',1);
}
if($legt->dor && $legt->dor != 'NA'){
	if($legt->dor == 'P')
		$pdf->Cell(0,5,"Dor: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor: Ausente",'LR',1);
}
if($legt->obs)
	$pdf->Cell(0,5,"Observa��es:$legt->obs",'LR',1);



$pdf->Cell(0,0,"",'LR',1);

/**********Genito-Urin�rio************/
$pdf->SetFont('Arial','B',10);
$pdf->Cell(0,10,"Genito-Urin�rio",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);


if($paciente->getSexo() == "M"){
	if($lesm->fimose && $lesm->fimose != 'NA'){
		if($lesm->fimose == 'F')
			$pdf->Cell(0,5,"Fimose: Fisiol�gica",'LR',1);
		elseif($lesm->fimose == 'P')
			$pdf->Cell(0,5,"Fimose: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Fimose: Ausente",'LR',1);
	}
	if($lesm->circuncisao && $lesm->circuncisao != 'NA'){
		if($lesm->circuncisao == 'P')
			$pdf->Cell(0,5,"Circuncis�o: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Circuncis�o: Ausente",'LR',1);
	}
	if($lesm->hidrocele && $lesm->hidrocele != 'NA'){
		if($lesm->hidrocele == 'P')
			$pdf->Cell(0,5,"Hidrocele: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Hidrocele: Ausente",'LR',1);
	}
	if($lesm->varicocele && $lesm->varicocele != 'NA'){
		if($lesm->varicocele == 'P')
			$pdf->Cell(0,5,"Varicocele: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Varicocele: Ausente",'LR',1);
	}
	if($lesm->testiculos && $lesm->testiculos != 'NA'){
		if($lesm->testiculos == 'N')
			$pdf->Cell(0,5,"Test�culos: Normais",'LR',1);
		elseif($lesm->testiculos == 'A+')
			$pdf->Cell(0,5,"Test�culos: Aumentados",'LR',1);
		elseif($lesm->testiculos == 'C')
			$pdf->Cell(0,5,"Test�culos: Criptorquidia",'LR',1);
		elseif($lesm->testiculos == 'AT')
			$pdf->Cell(0,5,"Test�culos: Aus�ncia de 1 test�culo",'LR',1);
		else
			$pdf->Cell(0,5,"Test�culos: Ausentes",'LR',1);
	}
}else{
	if($lesf->peqlabios && $lesf->peqlabios != 'NA'){
		if($lesf->peqlabios == '')
			$pdf->Cell(0,5,"Pequenos L�bios: Normais",'LR',1);
		else
			$pdf->Cell(0,5,"Pequenos L�bios: Coalescentes",'LR',1);
	}
	if($lesf->himen && $lesf->himen != 'NA'){
		if($lesf->himen == 'N')
			$pdf->Cell(0,5,"H�men: Normais",'LR',1);
		else
			$pdf->Cell(0,5,"H�men: Coalescentes",'LR',1);
	}
	if($lesf->secrvag && $lesf->secrvag != 'NA'){
		if($lesf->secrvag == 'P')
			$pdf->Cell(0,5,"Secre��o Vaginal: Presente",'LR',1);
		else
			$pdf->Cell(0,5,"Secre��o Vaginal: Ausente",'LR',1);
	}
}

if($legu->secruret && $legu->secruret != 'NA'){
	if($legu->secruret == 'P')
		$pdf->Cell(0,5,"Secre��o Uretral: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Secre��o Uretral: Ausente",'LR',1);
}
if($legu->pelos && $legu->pelos != 'NA'){
	if($legu->pelos == 'N')
		$pdf->Cell(0,5,"P�los: Normais para a idade",'LR',1);
	else
		$pdf->Cell(0,5,"P�los: Alterados para a idade",'LR',1);
}
if($legu->lojrenais && $legu->lojrenais != 'NA'){
	if($legu->lojrenais == 'N')
		$pdf->Cell(0,5,"Lojas Renais : Normais",'LR',1);
	else
		$pdf->Cell(0,5,"Lojas Renais : Alteradas",'LR',1);
}
if($legu->bexiga && $legu->bexiga != 'NA'){
	if($legu->bexiga == 'N')
		$pdf->Cell(0,5,"Bexiga: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Bexiga: Alterada",'LR',1);
}
if($legu->aspectogu && $legu->aspectogu != 'NA'){
	if($legu->aspectogu == 'N')
		$pdf->Cell(0,5,"Aspecto: Normal",'LR',1);
	elseif($legu->aspectogu == 'As')
		$pdf->Cell(0,5,"Aspecto: Assaduras",'LR',1);
	else
		$pdf->Cell(0,5,"Aspecto: Alterado(escoria��es, fissuras)",'LR',1);
}
if($legu->anus && $legu->anus != 'NA'){
	if($legu->anus == '')
		$pdf->Cell(0,5,"�nus: Normal",'LR',1);
	elseif($legu->anus == '')
		$pdf->Cell(0,5,"�nus: Fissuras",'LR',1);
	elseif($legu->anus == '')
		$pdf->Cell(0,5,"�nus: Prolapso",'LR',1);
	else
		$pdf->Cell(0,5,"�nus: Escoria��es e/ou fissuras",'LR',1);
	
}
if($legu->obs)
	$pdf->Cell(0,5,"Observa��es:$legu->obs",'LR',1);


$pdf->Cell(0,0,"",'LR',1);

/**********M�sculo-Esquel�tico************/
$pdf->SetFont('Arial','B',10);
$pdf->Cell(0,10,"M�sculo-Esquel�tico",'LR',1);
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($leme->anomalias && $leme->anomalias != 'NA'){
	if($leme->anomalias == 'P')
		$pdf->Cell(0,5,"Anomalias: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Anomalias: Ausentes",'LR',1);
}
if($leme->deformidades && $leme->deformidades != 'NA'){
	if($leme->deformidades == 'P')
		$pdf->Cell(0,5,"Deformidades: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Deformidades: Ausentes",'LR',1);
}
if($leme->edemas && $leme->edemas != 'NA'){
	if($leme->edemas == 'P')
		$pdf->Cell(0,5,"Edemas: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Edemas: Ausentes",'LR',1);
}
if($leme->tumoracoes && $leme->tumoracoes != 'NA'){
	if($leme->tumoracoes == 'P')
		$pdf->Cell(0,5,"Tumora��es: Presentes",'LR',1);
	else
		$pdf->Cell(0,5,"Tumora��es: Ausentes",'LR',1);
}
if($leme->forcamusc && $leme->forcamusc != 'NA'){
	if($leme->forcamusc == 'N')
		$pdf->Cell(0,5,"For�a Muscular: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"For�a Muscular: Diminu�da",'LR',1);
}
if($leme->dorossea && $leme->dorossea != 'NA'){
	if($leme->dorossea == 'P')
		$pdf->Cell(0,5,"Dor �ssea e Articular: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor �ssea e Articular: Ausente",'LR',1);
}
if($leme->movativa && $leme->movativa != 'NA'){
	if($leme->movativa == 'N')
		$pdf->Cell(0,5,"Movimenta��o Ativa: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Movimenta��o Ativa: Limitada",'LR',1);
}
if($leme->movpassiva && $leme->movpassiva != 'NA'){
	if($leme->movpassiva == 'N')
		$pdf->Cell(0,5,"Movimenta��o Passiva: Normal",'LR',1);
	else
		$pdf->Cell(0,5,"Movimenta��o Passiva: Limitada",'LR',1);
}
if($leme->escoliose && $leme->escoliose != 'NA'){
	if($leme->escoliose == 'P')
		$pdf->Cell(0,5,"Escoliose: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Escoliose: Ausente",'LR',1);
}
if($leme->lordose && $leme->lordose != 'NA'){
	if($leme->lordose == 'P')
		$pdf->Cell(0,5,"Lordose: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Lordose: Ausente",'LR',1);
}
if($leme->cifose && $leme->cifose != 'NA'){
	if($leme->cifose == 'P')
		$pdf->Cell(0,5,"Cifose: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Cifose: Ausente",'LR',1);
}
if($leme->curvfrente && $leme->curvfrente != 'NA'){
	if($leme->curvfrente == 'P')
		$pdf->Cell(0,5,"Curvatura Para Frente: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Curvatura Para Frente: Ausente",'LR',1);
}
if($leme->espmusc && $leme->espmusc != 'NA'){
	if($leme->espmusc == 'P')
		$pdf->Cell(0,5,"Espasmos Musculares: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Espasmos Musculares: Ausente",'LR',1);
}
if($leme->dorlocal && $leme->dorlocal != 'NA'){
	if($leme->dorlocal == 'P')
		$pdf->Cell(0,5,"Dor Local: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor Local: Ausente",'LR',1);
}
if($leme->anomalias && $leme->anomalias != 'NA'){
	if($leme->anomalias == 'P')
		$pdf->Cell(0,5,"Anomalias: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Anomalias: Ausente",'LR',1);	
}
if($leme->dorreflexa && $leme->dorreflexa != 'NA'){
	if($leme->dorreflexa == 'P')
		$pdf->Cell(0,5,"Dor Reflexa: Presente",'LR',1);
	else
		$pdf->Cell(0,5,"Dor Reflexa: Ausente",'LR',1);
}
if($leme->obs)
	$pdf->Cell(0,5,"Observa��es:$leme->obs",'LR',1);
 
	

$pdf->Cell(0,0,"",'LR',1);

/**********Nervoso************/
$pdf->SetFont('Arial','B',10);
if($dadosNervoso)
	$pdf->Cell(0,10,"Nervoso",'LR',1);
else
	$pdf->Cell(0,10,"Nervoso - Sem Dados",'LR',1);
	
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

if($lenv->nivconsc && $lenv->nivconsc != 'NA'){
	if($lenv->nivconsc == 'A')
		$pdf->Cell(0,5,"Avalia��o do N�vel de Consci�ncia: Alerta",'LR',1);
	else
		$pdf->Cell(0,5,"Avalia��o do N�vel de Consci�ncia: Sonolento",'LR',1);
}
if($lenv->orientacao && $lenv->orientacao != 'NA'){
	if($lenv->orientacao == 'S')
		$pdf->Cell(0,5,"Orienta��o: Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Orienta��o: N�o",'LR',1);
}
if($lenv->sinfocais && $lenv->sinfocais != 'NA'){
	if($lenv->sinfocais == 'N')
		$pdf->Cell(0,5,"Sinais Focais Relativos Aos Pares Cranianos: Normais",'LR',1);
	else
		$pdf->Cell(0,5,"Sinais Focais Relativos Aos Pares Cranianos: Alterados",'LR',1);
}
if($lenv->obs)
	$pdf->Cell(0,5,"Observa��es:$lenv->obs",'LR',1);

$pdf->Cell(0,0,"",'LR',1);
$pdf->Cell(0,0,"",'LRB',1);
$pdf->Ln(5);
}

/////////////////////////////////////////////
/*****************Diagn�sticos e Condutas******************/
////////////////////////////////////////////
$pdf->SetFont('Arial','B',14);
if($listahip)
	$pdf->Cell(0,10,"Diagn�sticos e Condutas",'LTR',1);
else
	$pdf->Cell(0,10,"Diagn�sticos e Condutas - Sem Dados",'LTR',1);
	
$pdf->Cell(0,0,"",'LR',1);

$pdf->SetFont('Arial','',12);

$arrayCond = array();

if($listahip){
	$pdf->Cell(0,5,"Hip�teses e Condutas:",'LR',1);
foreach ($listahip as $lhip){
	
	$auxConduta = $fachada->consultarCD($lhip['idHipotese']);
	$arrayCond = get_object_vars($auxConduta);
	$auxConduta = $arrayCond['conduta'];
	
	$auxHip = $lhip['hipotese'];
	
	$pdf->Cell(0,5,"$auxHip",'LR',1);	
	$pdf->Cell(0,5,"    > Conduta: $auxConduta",'LR',1);	
}
}
/*Fim*/
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);
$pdf->Output("hist�rico$iniciais",'I');
		
?>
