<?php
include ("dbconfig.php");

class repositorioEX
{

    function assinar($idAtendimento, $idAluno){
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("update examefisico set ass='1', dthr='".$data.".', idAlun='".$idAluno."' where idAtend='"
			.$idAtendimento."'") or die("ERRO no comando SQL:".mysql_error());
    }

    function inspecao($estger, $tdoenc, $aspdoenc, $desfis,$nutricao, $coop,$facies,$deffis, $anorpt, $obs,$id){
		mysql_query("UPDATE inspecao SET estger='".$estger."', tdoenc='".$tdoenc."', aspdoenc='".$aspdoenc."', desenvfis='".
			$desfis."', nutric='".$nutricao."', coop='".$coop."', deformfis='".$deffis."', anormpost='".$anorpt."', obs='".
			$obs."' WHERE idAtend='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    function pele($cor, $text, $umid, $temp, $cicatriz, $descam, $hemorr, $rash,$circcol,$edema, $consun,$defun, $mancun,$influn, 
		$obs, $id){
		mysql_query("UPDATE examepele SET cor='".$cor."', textu='".$text."', umid='".$umid."', temper='".$temp."',descam='".$descam.
			"', cicat='".$cicatriz."', hemor='".$hemorr."', rash='".$rash."', circcol='".$circcol."', edema='".$edema."', mancun='".
			$mancun."', consun='".$consun."', inflamun='".$influn."', deformun='".$defun."', obs='".$obs."' WHERE idAtend='".$id.
			"'") or die("ERRO no comando SQL : ".mysql_error());
    }

    function ganglios($ganglinf, $obs, $id){
		mysql_query("UPDATE exameganglinf SET ganglios='".$ganglinf."', obs='".$obs."' WHERE idAtend='".$id."'") or die("ERRO no 
			comando SQL : ".mysql_error());
    }

    function puberal($ppub, $mamas, $voltest, $genit, $obs, $id){
		mysql_query("UPDATE antroestpuberal SET voltest='".$voltest."', genit='".$genit."', pelos='".$ppub."', mamas='".$mamas."', 
			obs='".$obs."' WHERE idAtend='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }
	
	function medind($permcef, $permtora, $permab, $pregatric,$pregasubesc,$atend){
	
		mysql_query("UPDATE antroestpuberal SET permcef='".$permcef."', permab='".$permab."', permtora='".$permtora."', pregatric='".
			$pregatric."', pregasubesc='".$pregasubesc."' WHERE idAtend='".$atend."'")or die("ERRO no comando SQL : ".mysql_error());	
	
	}

    function desenvolvimento($brvm,$orpp,$paqos,$rscs, $pblco,$scopo,$bcvtc,$bcmlb,$bmfsa,$vrs,$absf,$qeabtl,$bfssa,$cae,$pomo,$epd,
		$rspm,$bpfpca,$bpacda,$pfudp, $cas,$cbld, $qcs,$gehmd,$cfbqc,$ffs,$dtvp,$csde, $pasv,$acxc, $secac,$cpnt,$gboc,$vests,$ffcc,
		$pmpq,$iaaif, $obs, $id){
		mysql_query("UPDATE desenvneuropsicomotor SET brvm='".$brvm."', orpp='".$orpp."', paqos='".$paqos."', rscs='".$rscs."', 
			pblco='".$pblco."', scopo='".$scopo."', bcvtc='".$bcvtc."', bcmlb='".$bcmlb."', bmfsa='".$bmfsa."', vrs='".$vrs."', 
			absf='".$absf."', qeabtl='".$qeabtl."', bfssa='".$bfssa."', cae='".$cae."', pomo='".$pomo."', epd='".$epd."', rspm='".
			$rspm."', bpfpca='".$bpfpca."', bpacda='".$bpacda."', pfudp='".$pfudp."', cas='".$cas."', cbld='".$cbld."', qcs='".$qcs.
			"', gehmd='".$gehmd."',cfbqc='".$cfbqc."', ffs='".$ffs."', dtvp='".$dtvp."', csde='".$csde."', pasv='".$pasv."', acxc='"
			.$acxc."', secac='".$secac."', cpnt='".$cpnt."', gboc='".$gboc."',vests='".$vests."', ffcc='".$ffcc."', pmpq='".$pmpq.
			"', iaaif='".$iaaif."', obs='".$obs."' WHERE idAtend='".$id."'")or die("ERRO no comando SQL : ".mysql_error());    
	}

    function cranio($tam,$form,$fontan,$sutu,$craneo,$cabelo, $lescab,$obs,$id){
		mysql_query("UPDATE examecranio SET tam='".$tam."', forma='".$form."', fontan='".$fontan."', sutu='".$sutu."', craneo='".
			$craneo."', cabelo='".$cabelo."', lescab='".$lescab."', obs='".$obs."' WHERE idAtend='".$id."'") or die("ERRO no 
			comando SQL : ".mysql_error());
    }
	
	function alterarMedind($peso,$pesoin, $altura,$alturain, $permcef, $permtora, $permab, $pregatric, $pregasubesc, $atend){
		mysql_query("UPDATE medind SET pesoin = '".$pesoin."', peso ='".$peso."', altura='".$altura."', alturain='".$alturain."', permcef='".$permcef."', permtora='".$permtora."', permab='".$permab."', pregatric='".$pregatric."', pregasubesc='".$pregasubesc."'  WHERE idAtend='".$atend."'") or die("ERRO no 
			comando SQL : ".mysql_error());
	}


    function olhos($ptose,$edpalp,$cor, $hemor, $secr, $infl, $cilios, $movocan,$pupila,$acvis,$obs,$id){
		mysql_query("UPDATE exameolhos SET ptose='".$ptose."', edpalp='".$edpalp."', cor='".$cor."', hemor='".$hemor."',secr='".
			$secr."', inflam='".$infl."', cilios='".$cilios."', movoc='".$movocan."', pupila='".$pupila."', acvis='".$acvis."', 
			obs='".$obs."' WHERE idAtend='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    function sistOtor($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop, $batnariz, $secrna, 
		$tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli,$exsuli, $tremli, 
		$tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obs, $id){
		mysql_query("UPDATE examesistotorrin SET posouv='".$posorel."', formouv='".$formorel."', dorouv='".$dororel."', edouv='".
			$edmast."', caudexouv='".$caudex."', secrouv='".$secrorel."', otosc='".$otoscop."', batasasna='".$batnariz."', secrna='"
			.$secrna."', tumna='".$tumorna."', rinscop='".$rinosc."', corla='".$corlab."', umidla='".$umidlab."', erupc='".$eruplab.
			"', fiss='".$fislab."', mass='".$maslab."', corge='".$corgeng."', hemorge='".$hemorge."', corli='".$corli."', umidli='"
			.$umidli."', exsudli='".$exsuli."', tremli='".$tremli."', tumor='".$tumorac."', numdt='".$numdent."',impdt='".$impldent.
			"', consdt='".$consdent."', corfa='".$corfar."', exsudfa='".$exsufar."', obs='".$obs."' WHERE idAtend='".$id."'") or 
			die("ERRO no comando SQL : ".mysql_error());		
    }

	function pescoco($retr, $torc, $clav,$tire,$mastum, $fist, $rigid, $foss, $obs, $id){
		mysql_query("UPDATE examepescoco SET retr='".$retr."', torc='".$torc."', clav='".$clav."', tireo='".$tire."',masstum='".
			$mastum."', fist='".$fist."', rigid='".$rigid."', fossupclav='".$foss."', obs='".$obs."' WHERE idAtend='".$id."'") or 
			die("ERRO no comando SQL : ".mysql_error());
	}
	
	function respiratorio($formtor, $simtor, $contorn, $proem, $masanor, $mamas, $tresp, $tirint,$freqresp,$fremtrvc, 
		$frembronq, $frempleu, $submac, $macic, $timpan, $murves,$estert, $estrid, $sibilos, $atpleu, $obs, $id){
		mysql_query("UPDATE exameresp SET formtrx='".$formtor."', simtrx='".$simtor."', contorn='".$contorn."', proemi='".
			$proem."', masanor='".$masanor."', mamas='".$mamas."', tresp='".$tresp."', tirintc='".$tirint."', frqrespa='".$freqresp.
			"', fremvoc='".$fremtrvc."', frembron='".$frembronq."', frempleu='".$frempleu."', submac='".$submac."', macic='".$macic.
			"', timpan='".$timpan."', murmvesic='".$murves."', estert='".$estert."', estrid='".$estrid."', sibil='".$sibilos."', 
			atrpleu='".$atpleu."', obs='".$obs."' WHERE idAtend='".$id."'") or die("ERRO no comando SQL : ".mysql_error());		
	}
	
	function cardVasc($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart, $pressaoartin, $freqcard, $freqcardin, $obs, $id){
		mysql_query("UPDATE examecardvasc SET precord='".$precord."', ictuscordi='".$ictcrdi."', ictuscordp='".$ictcrdp."', 
			artper='".$artper."', bulhas='".$bulhas."',sopros='".$sopros."', pressaoart='".$pressaoart."', pressaoartin='".$pressaoartin."',  freqcard='".$freqcard."', freqcardin='".$freqcardin."', obs='".$obs."' WHERE 
			idAtend='".$id."'")or die("ERRO no comando SQL : ".mysql_error());	
	}
	
	function gastInt($formabd, $cicumb, $peristal, $distens, $tumor, $ondfluid, $timp, $parmusc, $espasmo, $rigid, $dor, 
		$estomago, $figado, $baco,$rins, $mastum, $hernias, $rhidaer, $obs, $id){
		mysql_query("UPDATE examegastint SET formabd='".$formabd."', cicumb='".$cicumb."', perist='".$peristal."', disten='".
			$distens."', tumora='".$tumor."', ondflui='".$ondfluid."', timpan='".$timp."', paremusc='".$parmusc."', espasm='"
			.$espasmo."', rigid='".$rigid."', dor='".$dor."', estom='".$estomago."', figado='".$figado."', baco='".$baco.
			"', rins='".$rins."', masstum='".$mastum."', hernia='".$hernias."', ruidhidae='".$rhidaer."', obs='".$obs."' WHERE 
			idAtend='".$id."'") or die("ERRO no comando SQL : ".mysql_error());			
	}
	
	function genUrin($secruret,$pelos,$lojren,$bexiga, $asp, $anus,$obs,$id){
		mysql_query("UPDATE examegenurin SET secruret='".$secruret."', pelos='".$pelos."', lojren='".$lojren."', 
			bexiga='".$bexiga."', asp='".$asp."', anus='".$anus."', obs='".$obs."' WHERE idAtend='".$id."'")or die("ERRO no 
			comando SQL : ".mysql_error());	
	}
	
	function genUrinM($fimose, $circunc, $hidroc,$varic,$testic,$secruret,$pelos,$lojren,$bexiga, $asp, $anus,$obs,$id){
		$this->genUrin($secruret,$pelos,$lojren,$bexiga, $asp, $anus,$obs,$id);
		mysql_query("UPDATE examegenmasc SET fimose='".$fimose."', circ='".$circunc."', hidroc='".$hidroc."', varic='".$varic."', 
			test='".$testic."' WHERE idAtend='".$id."'")or die("ERRO no comando SQL : ".mysql_error());	
	}
	
	function genUrinF($peqlab, $himen, $secrvag, $secruret,$pelos,$lojren,$bexiga, $asp, $anus,$obs, $id){
		$this->genUrin($secruret,$pelos,$lojren,$bexiga, $asp, $anus,$obs,$id);
		mysql_query("UPDATE examegenfem SET peqlab='".$peqlab."', himen='".$himen."', secrvg='".$secrvag."' WHERE idAtend='".$id.
			"'")or die("ERRO no comando SQL : ".mysql_error());	
	}
	
	
	
	function muscEsq($anom, $deform, $edema, $tumo, $forc, $dorossea, $movativ, $movpas,$escoliose, $lordose, $cifose, $curvfr, 
		$espmusc, $dorloc, $dorref, $obs, $id){
		mysql_query("UPDATE examemuscesq SET anom='".$anom."', deform='".$deform."', edemas='".$edema."', tumor='".
			$tumo."', forcmusc='".$forc."', dorossart='".$dorossea."', movativ='".$movativ."', movpass='".$movpas."', escol='"
			.$escoliose."', lordo='".$lordose."', cifose='".$cifose."', curvfren='".$curvfr."', espmusc='".$espmusc."', dorloc='".
			$dorloc."',dorrefl='".$dorref."',obs='".$obs."' WHERE idAtend='".$id."'")or die("ERRO no comando SQL : ".mysql_error());			
	}
	
	function nervoso($avnivconsc, $orientnerv, $sinfocc, $obs, $id){
		mysql_query("UPDATE examenervoso SET nivconsc='".$avnivconsc."', orient='".$orientnerv."', sinfoccran='".$sinfocc."', 
			obs='".$obs."' WHERE idAtend='".$id."'")or die("ERRO no comando SQL : ".mysql_error());	
	}

    public function __destruct(){}

}
?>