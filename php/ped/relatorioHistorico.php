<?php

include_once("controllers/ControllerGeral.php");
include_once("classes/basicas/Paciente.php");
include_once("controllers/ControllerHistoricoPaciente.php");
require_once('fpdf/fpdf.php');


$pront = $_GET['pr'];
$paciente = $fachada->obterPacientePr($pront);

$valPac = array('','','','');

$valPac[0] = $fachada->printCampo($paciente->getNome(), $valPac[0]);
$valPac[1] = $fachada->printCampo($fachada->printData($paciente->getDTNasc()), $valPac[1]);
$valPac[2] = $fachada->printCampo($paciente->getSexo(), $valPac[2]);
$valPac[3] = $fachada->printCampo($paciente->getBairro(),$valPac[3]);
//var_dump($refdia);
//Função que retorna as iniciais do nome do paciente
$aux = explode(' ',$valPac[0]);

$i = 0;
while($aux[$i] != NULL ){
	
	$iniciais = $iniciais . substr($aux[$i],0,1);
	$i = $i + 1;
}

/*Configuração do PDF*/

$pdf=new FPDF('P','mm','A4');
$pdf->AddPage();
$pdf->SetDrawColor(205,205,205);
$pdf->SetLineWidth(0.3);

/*---------------------Histórico do Paciente------------------------*/
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,"Histórico do Paciente",0,1);

/*---------------------Dados do Paciente------------------------*/
$pdf->SetFont('Arial','B',14);
$pdf->Cell(0,10,"Dados do Paciente",'LTR',1);
$pdf->SetFont('Arial','',12);

$pdf->Cell(0,5,"Prontuário: $pront",'LR',1);
$pdf->Cell(0,5,"Nome: $iniciais",'LR',1);
$pdf->Cell(0,5,"Data Nascimento: $valPac[1]",'LR',1);
if($valPac[2] == 'F')
	$pdf->Cell(0,5,"Sexo: Feminino",'LR',1);
else
	$pdf->Cell(0,5,"Sexo: Masculino",'LR',1);
$pdf->Cell(0,5,"Bairro: $valPac[3]",'LR',1);
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);

/*---------------------Pré-Natal------------------------*/
$pdf->SetFont('Arial','B',14);

if(($lpnat->alimgrav && $lpnat->alimgrav != 'NA') || ($lpnat->obs)|| ($lpnat->pesograv && $lpnat->pesograv != 'NA') || ($lpnat->anemia && $lpnat->anemia != 'NA') || ($lpnat->cirurgdc && $lpnat->cirurgdc != 'NA') ||($lpnat->doencir && $lpnat->doencir != 'NA')  || ($lpnat->anorm && $lpnat->anorm != 'NA') || ($lpnat->medic && $lpnat->medic != 'NA') ||  $acpmed1 || ($lpnat->nacpmed && $lpnat->nacpmed != 'NA') ||($lpnat->durgest && $lpnat->durgest != 'NA')  || $acpmed2 ||($lpnat->a53 && $lpnat->a53 != 'NA') ||($lpnat->b58 && $lpnat->b58 != 'NA') || ($lpnat->imunizmae && $lpnat->imunizmae != 'NA')||($lpnat->exradion && $lpnat->exradion != 'NA') || ($lpnat->z21 && $lpnat->z21 != 'NA') )
	$pdf->Cell(0,5,"Pré-Natal",'LTR',1);
else
	$pdf->Cell(0,5,"Pré-Natal - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

	if($acpmed1){
	
		if($lpnat->acpmed == 'S')
			$pdf->Cell(0,5,"Acompanhamento Médico: Sim",'LR',1);
		else 
			$pdf->Cell(0,5,"Acompanhamento Médico: Não",'LR',1);
			
	 	$pdf->Cell(0,5,"Local: $lpnat->lacpmed",'LR',1);
		
		if($lpnat->nacpmed && $lpnat->nacpmed != 'NA'){
			
			if($lpnat->nacpmed == -6){
	 		$pdf->Cell(0,5,"Nº de Consultas: Menos de 6",'LR',1);	
			}else{
			$pdf->Cell(0,5,"Nº de Consultas: Mais de 6",'LR',1);	
			}
		}
	}
	elseif($acpmed2){
	
		$pdf->Cell(0,5,"Acompanhamento Médico: Não",'LR',1);
	}
	if($lpnat->durgest && $lpnat->durgest != 'NA'){
	
		if($lpnat->durgest == 'PrT')
	 		$pdf->Cell(0,5,"Duração da Gestação: Pré-Termo",'LR',1);
	 	elseif ($lpnat->durgest == 'T')
	 		$pdf->Cell(0,5,"Duração da Gestação: Termo",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"Duração da Gestação: Pós-Termo",'LR',1);
	}
	 if($lpnat->idSang != '0'){	
	 
	 	foreach ($sang as $s){
	 		
	 		if($s['idSang'] == $lpnat->idSang)
	 			$sangmaeAUX = $s['tipo']; 	
		}
		
	if($sangmaeAUX)
	 	$pdf->Cell(0,5,"Grupo Sanguíneo da Mãe: $sangmaeAUX",'LR',1);	
	 }
	 
	if($lpnat->z21 && $lpnat->z21 != 'NA'){
	
		if($lpnat->z21 == 'P1')
	 		$pdf->Cell(0,5,"Z21: Positivo, 1º Semestre",'LR',1);
	 	elseif($lpnat->z21 == 'P2')
	 		$pdf->Cell(0,5,"Z21: Positivo, 2º Semestre",'LR',1);
	 	elseif($lpnat->z21 == 'P3')
	 		$pdf->Cell(0,5,"Z21: Positivo, 3º Semestre",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"Z21: Negativo",'LR',1);
	}	
	if($lpnat->a53 && $lpnat->a53 != 'NA'){
	
		if($lpnat->a53 == 'P1')
	 		$pdf->Cell(0,5,"A53: Positivo, 1º Semestre",'LR',1);
	 	elseif($lpnat->a53 == 'P2')
	 		$pdf->Cell(0,5,"A53: Positivo, 2º Semestre",'LR',1);
	 	elseif($lpnat->a53 == 'P3')
	 		$pdf->Cell(0,5,"A53: Positivo, 3º Semestre",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"A53: Negativo",'LR',1);
	}
	if($lpnat->b18 && $lpnat->b18 != 'NA'){
	
		if($lpnat->b18 == 'P1')
	 		$pdf->Cell(0,5,"B18: Positivo, 1º Semestre",'LR',1);
	 	elseif($lpnat->b18 == 'P2')
	 		$pdf->Cell(0,5,"B18: Positivo, 2º Semestre",'LR',1);
	 	elseif($lpnat->b18 == 'P3')
	 		$pdf->Cell(0,5,"B18: Positivo, 3º Semestre",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"B18: Negativo",'LR',1);
	}
	if($lpnat->b58 && $lpnat->b58 != 'NA'){
		
		if($lpnat->b58 == 'P1')
		 	$pdf->Cell(0,5,"B58: Positivo, 1º Semestre",'LR',1);
		 elseif($lpnat->b58 == 'P2')
		 	$pdf->Cell(0,5,"B58: Positivo, 2º Semestre",'LR',1);	
		 elseif($lpnat->b58 == 'P3')
		 	$pdf->Cell(0,5,"B58: Positivo, 3º Semestre",'LR',1);	
		 else
		 	$pdf->Cell(0,5,"B58: Negativo",'LR',1);	
	}
	 if($lpnat->imunizmae && $lpnat->imunizmae != 'NA'){
	
	 	if($lpnat->imunizmae == 'EC')
	 		$pdf->Cell(0,5,"Imunizações da Mãe: Esquema Completo",'LR',1);	
	 	elseif($lpnat->imunizmae == 'EI')
	 		$pdf->Cell(0,5,"Imunizações da Mãe: Esquema Incompleto",'LR',1);	
	 	else
	 		$pdf->Cell(0,5,"Imunizações da Mãe: Não Realizou",'LR',1);	
	 }
	if($lpnat->exradion && $lpnat->exradion != 'NA'){
	
		if($lpnat->exradion == '1T')
	 		$pdf->Cell(0,5,"Exames Radiação Ionizante: Sim, durante o 1º semestre",'LR',1);
	 	elseif($lpnat->exradion == 'GR')
	 		$pdf->Cell(0,5,"Exames Radiação Ionizante: Sim, durante a gravidez",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"Exames Radiação Ionizante: Não",'LR',1);
	}
	if($lpnat->medic && $lpnat->medic != 'NA'){
	
	 	$pdf->MultiCell(0,5,"Medicações: $lpnat->medic",'LR',1);
	}	
	if($lpnat->anorm && $lpnat->anorm != 'NA'){
	 
	 	$pdf->MultiCell(0,5,"Anormalidades: $lpnat->anorm",'LR',1);
	}	
	if($lpnat->doencir && $lpnat->doencir != 'NA'){
	
		if($lpnat->doencir == '1T')
	 		$pdf->Cell(0,5,"Doenças Cirúrgicas: No 1º Trimestre",'LR',1);
	 	elseif($lpnat->doencir == '2T')
	 		$pdf->Cell(0,5,"Doenças Cirúrgicas: No 2º Trimestre",'LR',1);
	 	elseif($lpnat->doencir == '3T')
	 		$pdf->Cell(0,5,"Doenças Cirúrgicas: No 3º Trimestre",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"Doenças Cirúrgicas: Não teve",'LR',1);
	 		
	}
	 if($lpnat->cirurgdc && $lpnat->cirurgdc != 'NA'){
	 	
		$pdf->MultiCell(0,5,"Cirurgias: $lpnat->cirurgdc",'LR',1);
	 }	
	if($lpnat->pesograv && $lpnat->pesograv != 'NA'){
	 	$pdf->Cell(0,5,"Peso na Gravidez: $lpnat->pesograv",'LR',1);
	
	}	
	if($lpnat->anemia && $lpnat->anemia != 'NA'){
	 	$pdf->Cell(0,5,"Anemia: $lpnat->anemia",'LR',1);
	
	}
	if($lpnat->alimgrav && $lpnat->alimgrav != 'NA'){
	
		if($lpnat->alimgrav == 'B')
	 		$pdf->Cell(0,5,"Alimentação da Gravidez: Boa (Normal)",'LR',1);
	 	elseif($lpnat->alimgrav == 'R')
	 		$pdf->Cell(0,5,"Alimentação da Gravidez: Ruim(Normal)",'LR',1);
	 	elseif($lpnat->alimgrav == 'E')
	 		$pdf->Cell(0,5,"Alimentação da Gravidez: Excesso",'LR',1);
	 	else
	 		$pdf->Cell(0,5,"Alimentação da Gravidez: Falta",'LR',1);
	}
	if($lpnat->obs && $lpnat->obs != 'NA'){
	 	$pdf->MultiCell(0,5,"Observações:  $lpnat->obs",'LR',1);
		
	}
	 $pdf->Cell(0,0,"",'LBR');
	 $pdf->Ln(5);
	// $pdf->Ln(5);

/*---------------------Natal------------------------*/
$pdf->SetFont('Arial','B',14);

if( $lnat->obs||$lnat->complp ||$lnat->analg ||($lnat->anest != 'NA' && $lnat->anest) ||($lnat->durparto  && $lnat->durparto != 'NA') ||($lnat->tapres != 'NA' && $lnat->tapres) ||($lnat->tparto != 'NA' && $lnat->tparto) ||($lnat->tgrav != 'NA' && $lnat->tgrav) || ($lnat->tgrav != 'NA' && $lnat->tgrav))
	$pdf->Cell(0,5,"Natal",'LTR',1);
else
	$pdf->Cell(0,5,"Natal - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

	if($lnat->tgrav != 'NA' && $lnat->tgrav){
	
		if($lnat->tgrav == 'S')
			$pdf->Cell(0,5,"Tipo de Gravidez:  Simples",'LR',1);
		else
			$pdf->Cell(0,5,"Tipo de Gravidez:  Múltipla",'LR',1);
	}
	if($lnat->tparto != 'NA' && $lnat->tparto){
	
		if($lnat->tparto == 'E')
			$pdf->Cell(0,5,"Tipo de Parto:  Espontâneo",'LR',1);
		elseif($lnat->tparto == 'I')
			$pdf->Cell(0,5,"Tipo de Parto:  Instrumental",'LR',1);
		else
			$pdf->Cell(0,5,"Tipo de Parto:  Cigúrgico",'LR',1);
	}
	if($lnat->tapres != 'NA' && $lnat->tapres){
	
		if($lnat->tapres == 'C')
			$pdf->Cell(0,5,"Tipo de Apresentação:  Cefálica",'LR',1);
		elseif($lnat->tapres == 'P')
			$pdf->Cell(0,5,"Tipo de Apresentação:  Pélvica",'LR',1);
		else
			$pdf->Cell(0,5,"Tipo de Apresentação:  Outra",'LR',1);
	}
	if($lnat->durparto  && $lnat->durparto != 'NA'){
	
		$pdf->Cell(0,5,"Duração Trabalho de Parto:  $lnat->durparto",'LR',1);
		$countN = $countN + 1;
	}
	if($lnat->anest != 'NA' && $lnat->anest){
	
		if($lnat->anest == 'S')
			$pdf->Cell(0,5,"Anestesia:  Sim",'LR',1);
		else
			$pdf->Cell(0,5,"Anestesia:  Não",'LR',1);
	}
	if($lnat->analg){
		
		$pdf->MultiCell(0,5,"Analgesia:  $lnat->analg",'LR',1);
	}
	if($lnat->complp == 'S'){
		
		$pdf->MultiCell(0,5,"Complicações:  $lnat->tcomplp",'LR',1);
	}
	elseif($lnat->compl == 'N'){
	
		$pdf->MultiCell(0,5,"Complicações:  Não",'LR',1);
	}
	if($lnat->obs){
		
		$pdf->MultiCell(0,5,"Observações:  $lnat->obs",'LR',1);
	}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);
	
/*---------------------Neo-Natal------------------------*/
$pdf->SetFont('Arial','B',14);


if(($lnnat->obs) || ($lnnat->convul != 'NA' && $lnnat->convul)|| ($lnnat->coriza != 'NA' && $lnnat->coriza)||($lnnat->paral != 'NA' && $lnnat->paral) || ($lnnat->anomcong != 'NA' && $lnnat->anomcong)||($lnnat->infec != 'NA' && $lnnat->infec) || ($lnnat->vomit != 'NA' && $lnnat->vomit)||($lnnat->sang != 'NA' && $lnnat->sang) || ($lnnat->rash != 'NA' && $lnnat->rash)|| ($lnnat->reanim != 'NA' && $lnnat->reanim)||($lnnat->icter != 'NA' && $lnnat->icter) ||$lnnat->triagaud == 'N'|| $lnnat->triagaud == 'S'|| $lnnat->testepe == 'N'|| ($lnnat->anemfalc && $lnnat->anemfalc != 'NA')||($lnnat->hipotir && $lnnat->hipotir != 'NA') ||$lnnat->testepe == 'S' || ($lnnat->pertorac != 'NA' && $lnnat->pertorac)|| ($lnnat->percef != 'NA'  && $lnnat->percef)|| ($lnnat->altat && $lnnat->altat)||($lnnat->pesoat && $lnnat->pesoat) || ($lnnat->pesoalta != 'NA' && $lnnat->pesoalta)|| ($lnnat->comp != 'NA' && $lnnat->comp)|| ($lnnat->comp != 'NA' && $lnnat->comp) || ($lnnat->pesonasc != 'NA' && $lnnat->pesonasc) ||($lnnat->sinorto != 'NA' && $lnnat->sinorto) ||($lnnat->permnasal != 'NA' && $lnnat->permnasal) ||($lnnat->idSang != '0' && $lnnat->idSang) ||($lnnat->idadegest != 'NA' && $lnnat->idadegest) || ($lnnat->apgar5 != 'NA' && $lnnat->apgar5)|| ($lnnat->apgar1 != 'NA' && $lnnat->apgar1))
	$pdf->Cell(0,5,"Neo-Natal",'LTR',1);
else
	$pdf->Cell(0,5,"Neo-Natal - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

	if($lnnat->apgar1 != 'NA' && $lnnat->apgar1){
		
		$pdf->Cell(0,5,"Apgar de 1 Minuto:  $lnnat->apgar1",'LR',1);
	}
	if($lnnat->apgar5 != 'NA' && $lnnat->apgar5){
		
		$pdf->Cell(0,5,"Apgar de 5 Minutos:  $lnnat->apgar5",'LR',1);
	}
	if($lnnat->idadegest != 'NA' && $lnnat->idadegest){
		
		if($lnnat->idadegest == 'PrT')
			$pdf->Cell(0,5,"Idade Gestacional:  Pré-Termo",'LR',1);
		elseif($lnnat->idadegest == 'T')
			$pdf->Cell(0,5,"Idade Gestacional:  Termo",'LR',1);
		else
			$pdf->Cell(0,5,"Idade Gestacional:  Pós-Termo",'LR',1);
	}
	if($lnnat->idSang != '0' && $lnnat->idSang){	
		
	 	foreach ($sang as $s){
	 		
	 		if($s['idSang'] == $lnnat->idSang)
	 			$sangrnAUX = $s['tipo']; 	
		}
		
	 	$pdf->Cell(0,5,"Grupo Sanguíneo do RN: $sangrnAUX",'LR',1);	
	 }
	if($lnnat->permnasal != 'NA' && $lnnat->permnasal){
	
		if($lnnat->permnasal == 'S')
			$pdf->Cell(0,5,"Permeabilidade Nasal:  Sim",'LR',1);
		else
			$pdf->Cell(0,5,"Permeabilidade Nasal:  Não",'LR',1);
	}
	if($lnnat->sinorto != 'NA' && $lnnat->sinorto){
		
		if($lnnat->sinorto == 'S')
			$pdf->Cell(0,5,"Sinal de Ortolani:  Sim",'LR',1);
		else
			$pdf->Cell(0,5,"Sinal de Ortolani:  Não",'LR',1);
	}
	if($lnnat->pesonasc != 'NA' && $lnnat->pesonasc){
			
		$pdf->Cell(0,5,"Peso ao Nascer:  $lnnat->vpesonasc g",'LR',1);
	}
	if($lnnat->comp != 'NA' && $lnnat->comp){
			
		$pdf->Cell(0,5,"Comprimento ao Nascer:  $lnnat->comp",'LR',1);
	}
	if($lnnat->pesoalta != 'NA' && $lnnat->pesoalta){
		
		$pdf->Cell(0,5,"Peso na Alta:  $lnnat->pesoalta",'LR',1);
	}
	if($lnnat->pesoat && $lnnat->pesoat){
		
		$pdf->Cell(0,5,"Peso Atual:  $lnnat->pesoat",'LR',1);
	}
	if($lnnat->altat && $lnnat->altat){
		
		$pdf->Cell(0,5,"Altura Atual:  $lnnat->altat",'LR',1);
	}
	if($lnnat->percef != 'NA'  && $lnnat->percef){
		
		$pdf->Cell(0,5,"Perímetro Cefálico:  $lnnat->percef",'LR',1);
	}
	if($lnnat->pertorac != 'NA' && $lnnat->pertorac){
	
		$pdf->Cell(0,5,"Perímetro Torácico:  $lnnat->pertorac",'LR',1);
	}
	if($lnnat->testepe == 'S'){
		
		$pdf->Cell(0,5,"Teste do Pezinho: Sim ",'LR',1);
		if($lnnat->fenilcet && $lnnat->fenilcet != 'NA'){
			if($lnnat->fenilcet == 'S')
				$pdf->Cell(0,5,"    Fenilcetonúria:  Positivo",'LR',1);
			else
				$pdf->Cell(0,5,"    Fenilcetonúria:  Negativo",'LR',1);
		}
		if($lnnat->hipotir && $lnnat->hipotir != 'NA'){
			
			if( $lnnat->hipotir == 'S')
				$pdf->Cell(0,5,"    Hipotiroidismo:  Positivo",'LR',1);
			else 
				$pdf->Cell(0,5,"    Hipotiroidismo:  Negativo",'LR',1);
		}
		if($lnnat->anemfalc && $lnnat->anemfalc != 'NA'){
			
			if($lnnat->anemfalc == 'S')
				$pdf->Cell(0,5,"    Anemia Falciforme: Positivo",'LR',1);
			else
				$pdf->Cell(0,5,"    Anemia Falciforme: Negativo",'LR',1);
		}
	}
	elseif($lnnat->testepe == 'N'){
		
		$pdf->Cell(0,5,"Teste do Pezinho: Não ",'LR',1);
	}
	
	if($lnnat->triagaud == 'S'){
			
			$pdf->Cell(0,5,"Triagem Auditiva:  Sim",'LR',1);
			if($lnnat->peate != 'NA' && $lnnat->peate){
				if($lnnat->peate == 'P')
					$pdf->Cell(0,5,"	PEATE:  Positivo",'LR',1);
				else
					$pdf->Cell(0,5,"	PEATE:  Negativo",'LR',1);
			}
			if($lnnat->eoa != 'NA' && $lnnat->eoa){
					
				if($lnnat->eoa == 'N')
					$pdf->Cell(0,5,"	EOA: Normal",'LR',1);
				else
					$pdf->Cell(0,5,"	EOA: Alterado",'LR',1);
			}
	}
	elseif($lnnat->triagaud == 'N'){
		
		$pdf->Cell(0,5,"Triagem Auditiva: Não ",'LR',1);
	}
		
	if($lnnat->icter != 'NA' && $lnnat->icter){
			
				$pdf->Cell(0,5,"Icterícia: Zona $lnnat->icter de Kramer",'LR',1);
	}
	if($lnnat->reanim != 'NA' && $lnnat->reanim){
		
		if($lnnat->reanim == 'S')
				$pdf->Cell(0,5,"Reanimação: Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Reanimação: Não",'LR',1);
	}
	if($lnnat->rash != 'NA' && $lnnat->rash){
	
		if($lnnat->rash == 'S')
				$pdf->Cell(0,5,"Rash:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Rash:  Não",'LR',1);
	}
	if($lnnat->sang != 'NA' && $lnnat->sang){
	
		if($lnnat->sang == 'S')	
				$pdf->Cell(0,5,"Sangramentos:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Sangramentos:  Não",'LR',1);
	}
	if($lnnat->vomit != 'NA' && $lnnat->vomit){
		
		if($lnnat->vomit == 'S')
				$pdf->Cell(0,5,"Vomitos:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Vomitos:  Não",'LR',1);
	}
	if($lnnat->infec != 'NA' && $lnnat->infec){
	
		if($lnnat->infec == 'S')
				$pdf->Cell(0,5,"Infecções:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Infecções:  Não",'LR',1);
	}
	if($lnnat->anomcong != 'NA' && $lnnat->anomcong){
	
		if($lnnat->anomcong == 'S')
					$pdf->Cell(0,5,"Anomalias Congênitas:  Sim",'LR',1);
				else
					$pdf->Cell(0,5,"Anomalias Congênitas:  Não",'LR',1);
	}
	if($lnnat->paral != 'NA' && $lnnat->paral){
		
		if($lnnat->paral == 'S')
					$pdf->Cell(0,5,"Paralisias:  Sim",'LR',1);
				else
					$pdf->Cell(0,5,"Paralisias:  Não",'LR',1);
	}
	if($lnnat->coriza != 'NA' && $lnnat->coriza){
		
		if($lnnat->coriza == 'S')
				$pdf->Cell(0,5,"Coriza:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Coriza:  Não",'LR',1);
	}
	if($lnnat->convul != 'NA' && $lnnat->convul){
		
		if($lnnat->convul == 'S')
				$pdf->Cell(0,5,"Convulções:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Convulções:  Não",'LR',1);
	}			
	if($lnnat->obs){
				$pdf->MultiCell(0,5,"Observações:  $lnnat->obs",'LR',1);
	}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);
				
/*---------------------Alimentação------------------------*/

$pdf->SetFont('Arial','B',14);

if((($lalim->obs) || ($lalim->brincref != 'NA' && $lalim->brincref)|| ($lalim->alimpastl != 'NA' && $lalim->alimpastl)|| ($lalim->chantafet != 'NA' && $lalim->chantafet)||($lalim->copo != 'NA' && $lalim->copo) || ($lalim->colher != 'NA'  && $lalim->colher)|| ($lalim->mamadeira  && $lalim->mamadeira != 'NA')|| ($lalim->horaref != 'NA' && $lalim->horaref)|| ($lalim->refdia && $lalim->refdia !='NA')|| ($lalim->dietaat != 'NA' && $lalim->dietaat)|| ($lalim->alimfam != 'NA' && $lalim->alimfam)||($lalim->alimpast != 'NA' && $lalim->alimpast) ||($lalim->alimcomp != 'NA' && $lalim->alimcomp) || ($lalim->aleitmat != 'NA' && $lalim->aleitmat)))
	$pdf->Cell(0,5,"Alimentação",'LTR',1);
else
	$pdf->Cell(0,5,"Alimentação - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

	if($lalim->aleitmat != 'NA' && $lalim->aleitmat){
	
		if($lalim->aleitmat == '-6m')	
			$pdf->Cell(0,5,"Aleitamento Materno Exclusivo:  Menos de 6 meses",'LR',1);
		elseif($lalim->aleitmat == '-6m1a')	
			$pdf->Cell(0,5,"Aleitamento Materno Exclusivo:  De 6 meses a 1 ano",'LR',1);
		elseif($lalim->aleitmat == '-1a')	
			$pdf->Cell(0,5,"Aleitamento Materno Exclusivo:  Mais de 1 ano",'LR',1);
		else
			$pdf->Cell(0,5,"Aleitamento Materno Exclusivo:  Não",'LR',1);
	}
	if($lalim->alimcomp != 'NA' && $lalim->alimcomp){
		
		if($lalim->alimcomp == '-6m')
			$pdf->Cell(0,5,"Início Alimentação Complementar:  Menos de 6 meses",'LR',1);
		elseif($lalim->alimcomp == '-6m1a')
			$pdf->Cell(0,5,"Início Alimentação Complementar:  De 6 meses a 1 ano",'LR',1);
		elseif($lalim->alimcomp == '-1a')
			$pdf->Cell(0,5,"Início Alimentação Complementar:  Mais de 1 ano",'LR',1);
		else
			$pdf->Cell(0,5,"Início Alimentação Complementar:  Não",'LR',1);
			
	}
	if($lalim->alimpast != 'NA' && $lalim->alimpast){
	
		if($lalim->alimpast == '-6m')
			$pdf->Cell(0,5,"Início da Alimentação Pastosa:  Menos de 6 meses",'LR',1);
		elseif($lalim->alimpast == '-6m1a')
			$pdf->Cell(0,5,"Início da Alimentação Pastosa:  De 6 meses a 1 ano",'LR',1);
		elseif($lalim->alimpast == '-1a')
			$pdf->Cell(0,5,"Início da Alimentação Pastosa:  Mais de 1 ano",'LR',1);
		else
			$pdf->Cell(0,5,"Início da Alimentação Pastosa:  Não",'LR',1);
	}
	if($lalim->alimfam != 'NA' && $lalim->alimfam){
	
		if($lalim->alimfam == '-6m')
			$pdf->Cell(0,5,"Início da Alimentação Familiar:  Menos de 6 meses",'LR',1);
		elseif($lalim->alimfam == '-6m1a')
			$pdf->Cell(0,5,"Início da Alimentação Familiar:  De 6 meses a 1 ano",'LR',1);
		elseif($lalim->alimfam == '-1a')
			$pdf->Cell(0,5,"Início da Alimentação Familiar:  Mais de 1 ano",'LR',1);
		else
			$pdf->Cell(0,5,"Início da Alimentação Familiar:  Não",'LR',1);
	}
	if($lalim->dietaat != 'NA' && $lalim->dietaat){
	
		if($lalim->dietaat == 'F')
			$pdf->Cell(0,5,"Dieta Atual:  Familiar",'LR',1);
		else
			$pdf->Cell(0,5,"Dieta Atual:  Especial",'LR',1);
	}
	if($lalim->refdia && $lalim->refdia !='NA'){
		
		if($lalim->refdia == '-3')
			$pdf->Cell(0,5,"Número de Refeições Diárias:  Menos de 3",'LR',1);
		elseif($lalim->refdia == '3')
			$pdf->Cell(0,5,"Número de Refeições Diárias:  Três",'LR',1);
		else
			$pdf->Cell(0,5,"Número de Refeições Diárias:  Mais de Três",'LR',1);
	}
	if($lalim->horaref != 'NA' && $lalim->horaref){
		
		if($lalim->horaref = 'N')
			$pdf->Cell(0,5,"Horário das Refeições:  Normal, três refeições",'LR',1);
		elseif($lalim->horaref = 'HE')
			$pdf->Cell(0,5,"Horário das Refeições:  Horário Familiar Especial",'LR',1);
		else
			$pdf->Cell(0,5,"Horário das Refeições:  Aleatório",'LR',1);
	}
	if($lalim->mamadeira  && $lalim->mamadeira != 'NA'){
		
		if($lalim->mamadeira == 'S')
					$pdf->Cell(0,5,"Uso da Mamadeira:  Sim",'LR',1);
				else
					$pdf->Cell(0,5,"Uso da Mamadeira:  Não",'LR',1);
	}
	if($lalim->colher != 'NA'  && $lalim->colher){
	
		if($lalim->colher == 'S')	
				$pdf->Cell(0,5,"Uso de Colher:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Uso de Colher:  Não",'LR',1);
	}
	if($lalim->copo != 'NA' && $lalim->copo){
		
		if($lalim->copo == 'S')
					$pdf->Cell(0,5,"Uso de Copo:  Sim",'LR',1);
				else
					$pdf->Cell(0,5,"Uso de Copo:  Não",'LR',1);
	}
	if($lalim->chantafet != 'NA' && $lalim->chantafet){
		
		if($lalim->chantafet == 'S')
					$pdf->Cell(0,5,"Uso de Chantagem Afetiva:  Sim",'LR',1);
				else
					$pdf->Cell(0,5,"Uso de Chantagem Afetiva:  Não",'LR',1);
	}
	if($lalim->alimpastl != 'NA' && $lalim->alimpastl){
		
		if($lalim->alimpastl == 'S')
				$pdf->Cell(0,5,"Alimentação Pastosa Liquidificada:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Alimentação Pastosa Liquidificada:  Não",'LR',1);
	}
	if($lalim->brincref != 'NA' && $lalim->brincref){
		
		if($lalim->brincref == 'S')
				$pdf->Cell(0,5,"Brincadeira na Hora das Refeições:  Sim",'LR',1);
			else
				$pdf->Cell(0,5,"Brincadeira na Hora das Refeições:  Não",'LR',1);
	}
	if($lalim->obs){
				
				$pdf->MultiCell(0,5,"Observações:  $lalim->obs",'LR',1);
	}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);
				

/*---------------------"Crescimento e Desenvolvimento------------------------*/

$pdf->SetFont('Arial','B',14);

if((($lcd->obs) || ($lcd->muddent && $lcd->muddent != 'NA')|| ($lcd->partfala && $lcd->partfala != 'NA')|| ($lcd->relacol && $lcd->relacol != 'NA')|| ($lcd->repetano && $lcd->repetano != 'NA')||($lcd->aprend && $lcd->aprend != 'NA') || ($lcd->relirm && $lcd->relirm != 'NA')|| ($lcd->idadesc && $lcd->idadesc != 'NA')))
	$pdf->Cell(0,5,"Crescimento e Desenvolvimento",'LTR',1);
else
	$pdf->Cell(0,5,"Crescimento e Desenvolvimento - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

	if($lcd->relirm && $lcd->relirm != 'NA'){
					
					$pdf->MultiCell(0,5,"Relação com os Irmãos:  $lcd->relirm",'LR',1);
	}
	if($lcd->idadesc && $lcd->idadesc != 'NA'){
	
		if($lcd->idadesc == '610')	
			$pdf->Cell(0,5,"Idade que Foi à Escola: Entre 6 e 10 anos",'LR',1);
		elseif($lcd->idadesc == '-6')	
			$pdf->Cell(0,5,"Idade que Foi à Escola:  Antes dos 6 anos",'LR',1);
		elseif($lcd->idadesc == '+10')	
			$pdf->Cell(0,5,"Idade que Foi à Escola:  Depois dos 10 anos",'LR',1);
		else
			$pdf->Cell(0,5,"Idade que Foi à Escola: Não foi",'LR',1);
	}
	if($lcd->aprend && $lcd->aprend != 'NA'){
	
				$pdf->MultiCell(0,5,"Aprendizado:  $lcd->aprend",'LR',1);
	}
	if($lcd->repetano && $lcd->repetano != 'NA'){
	
				$pdf->MultiCell(0,5,"Repetência de Ano:  $lcd->repetano",'LR',1);
	}
	if($lcd->relacol && $lcd->relacol != 'NA'){
	
				$pdf->MultiCell(0,5,"Relacionamento com Colegas e Professores:  $lcd->relacol",'LR',1);
	}
	if($lcd->partfala && $lcd->partfala != 'NA'){
	
				$pdf->MultiCell(0,5,"Particularidades da Fala:  $lcd->partfala",'LR',1);
	}
	if($lcd->muddent && $lcd->muddent != 'NA'){
	
				$pdf->MultiCell(0,5,"Erupção e Mudança Dentária:  $lcd->muddent",'LR',1);
	}
	if($lcd->obs){
	
				$pdf->MultiCell(0,5,"Observações:  $lcd->obs",'LR',1);
	}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);

/*---------------------Hábitos------------------------*/	

$pdf->SetFont('Arial','B',14);

if((($lhab->obs) ||($lhab->dormepais != 'NA' && $lhab->dormepais) || ($lhab->pertsono != 'NA' && $lhab->pertsono)||($lhab->enurese != 'NA' && $lhab->enurese) || ($lhab->geofagia != 'NA' && $lhab->geofagia)||($lhab->altalim != 'NA' && $lhab->altalim) || ($lhab->tique != 'NA' && $lhab->tique)|| ($lhab->roiunha != 'NA' && $lhab->roiunha)|| ($lhab->chupadedo != 'NA' && $lhab->chupadedo)|| ($lhab->chupeta != 'NA' && $lhab->chupeta)))
	$pdf->Cell(0,5,"Hábitos",'LTR',1);
else
	$pdf->Cell(0,5,"Hábitos - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);


if($lhab->chupeta != 'NA' && $lhab->chupeta){

	if($lhab->chupeta == 'S')
		$pdf->Cell(0,5,"Chupeta:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Chupeta:  Não",'LR',1);
}
if($lhab->chupadedo != 'NA' && $lhab->chupadedo){

	if($lhab->chupadedo == 'S')
		$pdf->Cell(0,5,"Chupa Dedo:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Chupa Dedo:  Não",'LR',1);
}
if($lhab->roiunha != 'NA' && $lhab->roiunha){

	if($lhab->roiunha == 'S')
		$pdf->Cell(0,5,"Rói Unhas:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Rói Unhas:  Não",'LR',1);
}
if($lhab->tique != 'NA' && $lhab->tique){
	
	if($lhab->tique == 'S')
		$pdf->Cell(0,5,"Tiques:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Tiques:  Não",'LR',1);
}
if($lhab->altalim != 'NA' && $lhab->altalim){
	
	if($lhab->altalim == 'S')
		$pdf->Cell(0,5,"Alterações na Alimentação:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Alterações na Alimentação:  Não",'LR',1);
}
if($lhab->geofagia != 'NA' && $lhab->geofagia){
	
	if($lhab->geofagia == 'S')
		$pdf->Cell(0,5,"Geofagia:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Geofagia:  Não",'LR',1);
}
if($lhab->enurese != 'NA' && $lhab->enurese){
	
	if($lhab->enurese == 'S')
		$pdf->Cell(0,5,"Enurese:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Enurese:  Não",'LR',1);
}
if($lhab->pertsono != 'NA' && $lhab->pertsono){
	
	if($lhab->pertsono == 'S')
		$pdf->Cell(0,5,"Pertubações do Sono:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Pertubações do Sono:  Não",'LR',1);
}
if($lhab->dormepais != 'NA' && $lhab->dormepais){
	
	if($lhab->dormepais == 'S')
		$pdf->Cell(0,5,"Dorme na Cama dos Pais:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Dorme na Cama dos Pais:  Não",'LR',1);
}
if($lhab->obs){
	
	$pdf->MultiCell(0,5,"Observações:  $lhab->obs",'LR',1);
}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);


/*---------------------Imunizações------------------------*/

$pdf->SetFont('Arial','B',14);

if((($limun->obs) || ($limun->testmant && $limun->testmant != 'NA')|| $limun->efeitcol|| $vacpac))
	$pdf->Cell(0,5,"Imunizações",'LTR',1);
else
	$pdf->Cell(0,5,"Imunizações - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

if($vacpac){
	
	foreach($vacpac as $lvac){
	 
	$vacina = $lvac['vacina'];
	$dose = $lvac['dose'];
	$datavac = $lvac['dt'];
		
	$pdf->Cell(40,5,"Vacina: $vacina",'L',0);
	$pdf->Cell(40,5,"Dose: $dose",'',0,'L');
	$pdf->Cell(0,5,"Data: $datavac",'R',1,'L');
	
	}
}
if($limun->efeitcol ){
	
	$pdf->MultiCell(0,5,"Efeitos Colaterais:  $limun->efeitcol",'LR',1);
}
if($limun->testmant && $limun->testmant != 'NA'){
	
	if($limun->testmant == 'P')
		$pdf->Cell(0,5,"Teste de Mantoux:  Positivo",'LR',1);
	else
		$pdf->Cell(0,5,"Teste de Mantoux:  Negativo",'LR',1);
}
if($limun->obs){
	
	$pdf->Cell(0,5,"Observações:  $limun->obs",'LR',1);
}
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);
	
/*---------------------Doenças Anteriores------------------------*/

$pdf->SetFont('Arial','B',14);

if((($ldoenc->obs)|| ($ldoenc->trata)|| ($ldoenc->hospit != 'NA' && $ldoenc->hospit)||($ldoenc->transf != 'NA' && $ldoenc->transf) || ($ldoenc->cirurg != 'NA' && $ldoenc->cirurg)||($ldoenc->rinite != 'NA' && $ldoenc->rinite) || ($ldoenc->alerg == 'S')|| ($ldoenc->eczema != 'NA' && $ldoenc->eczema)|| ($ldoenc->asma != 'NA' && $ldoenc->asma)|| ($ldoenc->tuberc != 'NA' && $ldoenc->tuberc)|| ($ldoenc->nefro != 'NA' && $ldoenc->nefro)|| ($ldoenc->febrer != 'NA' && $ldoenc->febrer)|| ($ldoenc->mening != 'NA' && $ldoenc->mening)|| ($ldoenc->pneum != 'NA' && $ldoenc->pneum)||($ldoenc->diarr != 'NA' && $ldoenc->diarr) || ($ldoenc->tetano != 'NA' && $ldoenc->tetano)|| ($ldoenc->dift != 'NA' && $ldoenc->dift)|| ($ldoenc->parot != 'NA' && $ldoenc->parot)|| ($ldoenc->varic != 'NA' && $ldoenc->varic)|| ($ldoenc->saramp !='NA' && $ldoenc->saramp)|| ($ldoenc->coquel != 'NA' && $ldoenc->coquel)))
	$pdf->Cell(0,5,"Doenças Anteriores",'LTR',1);
else
	$pdf->Cell(0,5,"Doenças Anteriores - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

if($ldoenc->coquel != 'NA' && $ldoenc->coquel){
	
	if($ldoenc->coquel == 'S')
		$pdf->Cell(0,5,"Coqueluche:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Coqueluche:  Não",'LR',1);
}
if($ldoenc->saramp !='NA' && $ldoenc->saramp){
	
	if($ldoenc->saramp == 'S')
		$pdf->Cell(0,5,"Sarampo:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Sarampo:  Não",'LR',1);
}
if($ldoenc->varic != 'NA' && $ldoenc->varic){
	
	if($ldoenc->varic == 'S')
		$pdf->Cell(0,5,"Varicela:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Varicela:  Não",'LR',1);
}
if($ldoenc->parot != 'NA' && $ldoenc->parot){
	
	if($ldoenc->parot == 'S')
		$pdf->Cell(0,5,"Parotide:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Parotide:  Não",'LR',1);
}
if($ldoenc->dift != 'NA' && $ldoenc->dift){
	
	if($ldoenc->dift == 'S')
		$pdf->Cell(0,5,"Difteria:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Difteria:  Não",'LR',1);
}
if($ldoenc->tetano != 'NA' && $ldoenc->tetano){
	
	if($ldoenc->tetano == 'S')
		$pdf->Cell(0,5,"Tétano:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Tétano:  Não",'LR',1);
}
if($ldoenc->diarr != 'NA' && $ldoenc->diarr){
	
	if($ldoenc->diarr == 'S')
		$pdf->Cell(0,5,"Diarréia:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Diarréia:  Não",'LR',1);
}
if($ldoenc->pneum != 'NA' && $ldoenc->pneum){
	
	if($ldoenc->pneum == 'S')
		$pdf->Cell(0,5,"Pneumonia:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Pneumonia:  Não",'LR',1);
}
if($ldoenc->mening != 'NA' && $ldoenc->mening){
	
	if($ldoenc->mening == 'S')
		$pdf->Cell(0,5,"Meningite:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Meningite:  Não",'LR',1);
}
if($ldoenc->febrer != 'NA' && $ldoenc->febrer){
	
	if($ldoenc->febrer == 'S')
		$pdf->Cell(0,5,"Febre Reumática:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Febre Reumática:  Não",'LR',1);
}
if($ldoenc->nefro != 'NA' && $ldoenc->nefro){
	
	if($ldoenc->nefro == 'S')
		$pdf->Cell(0,5,"Nefropatia:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Nefropatia:  Não",'LR',1);
}	
if($ldoenc->tuberc != 'NA' && $ldoenc->tuberc){
	
	if($ldoenc->tuberc == 'S')
		$pdf->Cell(0,5,"Tuberculose:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Tuberculose:  Não",'LR',1);
}
if($ldoenc->asma != 'NA' && $ldoenc->asma){
	
	if($ldoenc->asma == 'S')
		$pdf->Cell(0,5,"Asma:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Asma:  Não",'LR',1);
}
if($ldoenc->eczema != 'NA' && $ldoenc->eczema){
	
	if($ldoenc->eczema == 'S')
		$pdf->Cell(0,5,"Eczema:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Eczema:  Não",'LR',1);
}
if($ldoenc->alerg == 'S'){
	
	$pdf->MultiCell(0,5,"Alergia Alimentar: $ldoenc->talerg",'LR',1);
}elseif($ldoenc->alerg == 'N'){

	$pdf->Cell(0,5,"Alergia Alimentar:  Não",'LR',1);
}
if($ldoenc->rinite != 'NA' && $ldoenc->rinite){

	if($ldoenc->rinite == 'S')
		$pdf->Cell(0,5,"Rinite Alérgica:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Rinite Alérgica:  Não",'LR',1);
}
if($ldoenc->cirurg != 'NA' && $ldoenc->cirurg){

	if($ldoenc->cirurg == 'S')
		$pdf->Cell(0,5,"Cirurgias e Acidentes:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Cirurgias e Acidentes:  Não",'LR',1);
}
if($ldoenc->transf != 'NA' && $ldoenc->transf){

	if($ldoenc->transf == 'S')
		$pdf->Cell(0,5,"Histórico de Transfusões:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Histórico de Transfusões:  Não",'LR',1);
}
if($ldoenc->hospit != 'NA' && $ldoenc->hospit){

	if($ldoenc->hospit == 'S')
		$pdf->Cell(0,5,"Hospitalizações Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Hospitalizações Não",'LR',1);
}
if($ldoenc->trata){
	$pdf->MultiCell(0,5,"Tratamentos Realizados:  $ldoenc->trata",'LR',1);
}
if($ldoenc->obs){
	$pdf->MultiCell(0,5,"Observações:  $ldoenc->obs",'LR',1);
}
$pdf->Cell(0,0,"",'LBR',1);
$pdf->Ln(5);

/*---------------------Outras Informações------------------------*/

$pdf->SetFont('Arial','B',14);

if((($linfo->obs) ||($linfo->ctuberc != "NA" && $linfo->ctuberc) ||($linfo->alergmed != "NA" && $linfo->alergmed) ||($linfo->agtox != "NA" && $linfo->agtox) || ($linfo->esquist != "NA" && $linfo->esquist)|| ($linfo->chagas != "NA" && $linfo->chagas)))
	$pdf->Cell(0,5,"Outras Informações",'LTR',1);
else	
	$pdf->Cell(0,5,"Outras Informações - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

if($linfo->chagas != "NA" && $linfo->chagas){
	
	if($linfo->chagas == 'S')
		$pdf->Cell(0,5,"Epidemiologia Para Doença de Chagas:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Epidemiologia Para Doença de Chagas:  Não",'LR',1);
}
if($linfo->esquist != "NA" && $linfo->esquist){
	
	if($linfo->esquist == 'S')
		$pdf->Cell(0,5,"Epidemiologia Para Esquistossomose:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Epidemiologia Para Esquistossomose:  Não",'LR',1);
}
if($linfo->agtox != "NA" && $linfo->agtox){
	
	if($linfo->agtox == "S"){
		$pdf->Cell(0,5,"Exposição à Agentes Tóxicos: Sim",'LR',1);
		$pdf->MultiCell(0,5,"	>> $linfo->tagtox",'LR',1);
	}else
		$pdf->Cell(0,5,"Exposição à Agentes Tóxicos: Não",'LR',1);
}
if($linfo->alergmed != "NA" && $linfo->alergmed){
	
	if($linfo->alergmed == "S"){
		$pdf->Cell(0,5,"Alergia à Medicamento:  Sim",'LR',1);
		$pdf->MultiCell(0,5,"	>> $linfo->talergmed",'LR',1);
	}else
		$pdf->Cell(0,5,"Alergia à Medicamento:  Não",'LR',1);
}
if($linfo->ctuberc != "NA" && $linfo->ctuberc){
	
	if($linfo->ctuberc == 'S')
		$pdf->Cell(0,5,"Contato com Tuberculose:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Contato com Tuberculose:  Não",'LR',1);
}
if($linfo->obs){
		
	$pdf->MultiCell(0,5,"Observações:  $linfo->obs",'LR',1);
}
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);
	
/*---------------------Histórico Familiar------------------------*/

$pdf->SetFont('Arial','B',14);

if((($lindom->obs)|| ($lindom->animais && $lindom->animais != 'NA')|| ($lindom->luz && $lindom->luz != 'NA')|| ($lindom->sanea && $lindom->sanea != 'NA')|| ($lindom->agua && $lindom->agua != 'NA')|| ($lindom->ocup && $lindom->ocup != 'NA')|| ($lindom->comod && $lindom->comod != 'NA')|| ($lindom->resid && $lindom->resid != 'NA')|| ($linfam->outros && $linfam->outros != 'NA')|| ($linfam->irmaos && $linfam->irmaos != 'NA')|| ($linfam->avos && $linfam->avos != 'NA')|| ($linfam->pais && $linfam->pais != 'NA')|| ($linfam->profpai && $linfam->profpai != 'NA')|| ($linfam->idadepai && $linfam->idadepai != 'NA')||($linfam->profmae && $linfam->profmae != 'NA') || ($linfam->idademae && $linfam->idademae != 'NA')|| ($linfam->uniaopais && $linfam->uniaopais != 'NA')))
	$pdf->Cell(0,5,"Histórico Familiar",'LTR',1);
else
	$pdf->Cell(0,5,"Histórico Familiar - Sem Dados",'LTR',1);

$pdf->SetFont('Arial','',12);

if($linfam->uniaopais && $linfam->uniaopais != 'NA'){

	
	if($linfam->uniaopais == 'UE')
		$pdf->Cell(0,5,"Tipo de União dos Pais:  União Estável",'LR',1);
	elseif($linfam->uniaopais == 'C')
		$pdf->Cell(0,5,"Tipo de União dos Pais:  Casamento",'LR',1);
	elseif($linfam->uniaopais == 'SJ')
		$pdf->Cell(0,5,"Tipo de União dos Pais:  Separação Judicial",'LR',1);
	else
		$pdf->Cell(0,5,"Tipo de União dos Pais:  Outros",'LR',1);
}
if($linfam->idademae && $linfam->idademae != 'NA'){
	
	$pdf->Cell(0,5,"Idade da Mãe:  $linfam->idademae",'LR',1);
}
if($linfam->profmae && $linfam->profmae != 'NA'){
	
	foreach($listcbo as $l){
		
		if($l['cod'] == $linfam->profmae)
			$profmaeAUX = $l['descricao'];
	}
	$pdf->Cell(0,5,"Ocupação da Mãe:  $profmaeAUX",'LR',1);
}
if($linfam->idadepai && $linfam->idadepai != 'NA'){
	
	$pdf->Cell(0,5,"Idade do Pai:  $linfam->idadepai",'LR',1);
}
if($linfam->profpai && $linfam->profpai != 'NA'){
	
	foreach($listcbo as $l){
		
		if($l['cod'] == $linfam->profpai)
			$profpaiAUX = $l['descricao'];
	}
	$pdf->Cell(0,5,"Ocupação do Pai: $profpaiAUX",'LR',1);
}

if($linfam->pais && $linfam->pais != 'NA'){
	
	$pdf->MultiCell(0,5,"Detalhes:  $linfam->pais",'LR',1);
}
if($linfam->avos && $linfam->avos != 'NA'){
	
	$pdf->MultiCell(0,5,"Avós:  $linfam->avos",'LR',1);
}
if($linfam->irmaos && $linfam->irmaos != 'NA'){
	
	$pdf->MultiCell(0,5,"Irmãos:  $linfam->irmaos",'LR',1);
}
if($linfam->outros && $linfam->outros != 'NA'){
	
	$pdf->MultiCell(0,5,"Outros:  $linfam->outros",'LR',1);
}
if($lindom->resid && $lindom->resid != 'NA'){
	
	if($lindom->resid == 'A')
		$pdf->Cell(0,5,"Tipo de Residência:  Alvenaria",'LR',1);
	elseif($lindom->resid == 'T')
		$pdf->Cell(0,5,"Tipo de Residência:  Taipa",'LR',1);
	else
		$pdf->Cell(0,5,"Tipo de Residência:  Barraco",'LR',1);
}
if($lindom->comod && $lindom->comod != 'NA'){
	
	$pdf->Cell(0,5,"Nº de Cômodos:  $lindom->comod",'LR',1);
}
if($lindom->ocup && $lindom->ocup != 'NA'){}
	$pdf->Cell(0,5,"Nº de Ocupantes:  $lindom->ocup",'LR',1);
if($lindom->agua && $lindom->agua != 'NA'){
	if($lindom->agua == 'E')
		$pdf->Cell(0,5,"Água:  Encanada",'LR',1);
	else
		$pdf->Cell(0,5,"Água:  Não-encanada",'LR',1);
}
if($lindom->sanea && $lindom->sanea != 'NA'){
	if($lindom->sanea == 'EE')
		$pdf->Cell(0,5,"Saneamento:  Esgoto Encanado",'LR',1);
	elseif($lindom->sanea == 'FS')
		$pdf->Cell(0,5,"Saneamento:  Fossa Séptca",'LR',1);
	else
		$pdf->Cell(0,5,"Saneamento:  Esgoto a Céu Aberto",'LR',1);
}
if($lindom->luz && $lindom->luz != 'NA'){
	if($lindom->luz == 'S')
		$pdf->Cell(0,5,"Luz:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Luz:  Não",'LR',1);
}
if($lindom->animais && $lindom->animais != 'NA'){
	if($lindom->animais == 'S')
		$pdf->Cell(0,5,"Presença de Animais:  Sim",'LR',1);
	else
		$pdf->Cell(0,5,"Presença de Animais:  Não",'LR',1);
}
if($lindom->obs)
	$pdf->Cell(0,5,"Observações:  $lindom->obs",'LR',1);
	$pdf->Cell(0,0,"",'LBR',1);
	$pdf->Ln(5);
	


$pdf->Output("histórico$iniciais",'I');
?>
