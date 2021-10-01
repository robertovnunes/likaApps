<?php

include ("dbconfig.php");

class repositorioHP {

    function assinar($id) {
        mysql_query("UPDATE historicopessoal SET ass='1' where idPront='".$id."'") or die("ERRO no comando SQL:".mysql_error());
    }

    function inserirVacina($vacinanome, $vacinadose, $data, $id) {
        mysql_query("INSERT INTO vacinacao VALUES ('".$vacinadose."', '".$id."', '".$vacinanome."', '".$data."')") 
			or die("ERRO no comando SQL : " . mysql_error());
    }
    
    function removerVacina($vacina, $dose, $id) {
             mysql_query("delete from vacinacao where idDose = (select idDose from dose where dose = '".$dose."') and idPront = ".$id." and idVac = (select idVac from vacina where vacina = '".$vacina."')")
			                     or die("ERRO no comando SQL : " . mysql_error());
    }
    
	
	function vacinaHasDose($vnome, $vdose, $id){
	    $sql = mysql_query("SELECT * FROM vacinacao WHERE idDose = '".$vdose."' and idPront = '".$id."' and idVac = '".$vnome."'") 
			or die("ERRO no comando SQL : " . mysql_error());
		if (mysql_num_rows($sql) > 0)
        	return true;
		return false;
	}
	
    function alterarPNatal($acompmed, $consultas, $local, $durgestacao, $sangmae, $z21, $a53, $b18, $b58,
        $imunizmae, $exradion, $medicacoes, $anormalidades, $perdc, $textdc, $pesogravidez, $qaliment, $anemia,
        $obs, $id) {
		echo "---".$consultas;
        mysql_query("UPDATE prenatal SET durgest='".$durgestacao."', acompmed='".$acompmed."', localam='".$local."', consam='".
			$consultas."', z21='".$z21."', a53='".$a53."', b18='".$b18."', b58 = '".$b58."', imunmae='".$imunizmae."', idSang='".
			$sangmae."', medic='".$medicacoes."', anorm='".$anormalidades."', examrad='".$exradion."', doencir='".$perdc."', 
			cirurg='".$textdc."', pesograv='".$pesogravidez."', anemia='".$anemia."', alimgrav='".$qaliment."', obs='".$obs."'	WHERE idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarNatal($tipograv, $tipoparto, $tipoapres, $durparto, $anestesia, $analgesia, $cp,
        $textcp, $obs, $id) {
        mysql_query("UPDATE natal SET tgrav='".$tipograv."', tparto='".$tipoparto."', tapres='".$tipoapres."', durparto='".$durparto 			."', anest='".$anestesia."', analg='".$analgesia."', compl='".$cp."', tcompl='".$textcp."', obs = '".$obs."'  WHERE 	
			idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarNeoNatal($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto, $pesoalta,
        $comprimento, $percef, $pertorac, $pesonasc, $testepe, $fenilcet, $hipotiroid, $anemiafalc, $triaaud,
        $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias,
        $coriza, $convulsoes, $obs,$pesoAtual,$alturaAtual, $id) {
        mysql_query("UPDATE neonatal SET apgar1='".$apgar1."', apgar5='".$apgar5."', permnas='".$permnasal."', idadgest='".
			$idadegest."', triagaud='".$triaaud."', peate='".$PEATE."', eoa = '".$EOA."', reanim='".$reanimacao."', idSang='". 
			$sangrn."', sinort='".$sinalorto."', pesoalta='".$pesoalta."', comp='".$comprimento."', percef='".$percef."', 
			pertor='".$pertorac."', pesonasc='".$pesonasc."', testpe='".$testepe."', anemfalc='".$anemiafalc."', hipot='".
			$hipotiroid."', fenilc='".$fenilcet."', icter='".$ictericia."', rash='".$rash."', sang='".$sangramentos."', vomit='".
			$vomitos."', infec='".$infeccoes."', ancong='".$anomcong."', paral='".$paralisias."', coriz='".$coriza."', conv='". 
			$convulsoes."', obs='".$obs."' , pesoat='".$pesoAtual."', alturat='".$alturaAtual."' WHERE idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarAliment($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu, $refdiarias, $horaref,
        $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref, $obs, $id) {
        mysql_query("UPDATE alimentacao SET aleitmatexc='".$alimmatexc."', alimcomp='".$alimcomp."', alimpast='".$alimpast."', 
			alimfam='".$alimfam."', dietatual='".$dietatu."', refdia='".$refdiarias."', horref='".$horaref."', usomam='".$usomam."',
			usocolh='".$colher."', usocopo='".$copo."', alimpastliq='".$alimpastliq."', chantafet='".$chantafet."', brincref='". 
			$brincref."', obs='".$obs."' WHERE idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarCrescDes($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol, $particfala,
        $muddent, $obs, $id) {
        mysql_query("UPDATE crescimento SET relirm='".$relirmaos."', idadesc='".$idadeescola."', aprend='".$aprendizado."', 
			repetano='".$repetano."', relac='".$relacol."', partfala='".$particfala."', muddent='".$muddent."', obs='".$obs."' 
			WHERE idPront='".$id."'") or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarHabitos($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia, $enurese,
        $pertsono, $dormepais, $obs, $id) {
        mysql_query("UPDATE habitos SET chupeta='".$chupeta."', chupdedo='".$chupadedo."', roiunha='".$roiunhas."', tiques='".
		$tiques."', altalim='".$altalim."', geof='".$geofagia."', enur='".$enurese."', pertsono='".$pertsono."', dormpais='". 
		$dormepais."', obs='".$obs."' WHERE idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarImuniz($efeitcol, $testmantoux, $obs, $id) {
        mysql_query("UPDATE imunizacoes SET efcol='".$efeitcol."', testmant='".$testmantoux."', obs='".$obs."' WHERE idPront='".$id 
		."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarDoencAnt($coqueluche, $sarampo, $varicela, $parotide, $difteria, $tetano, $diarreia,
        $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose, $asma, $eczema, $alergia, $textalergias,
        $rinite, $cirurgia, $transf, $hospital, $tratamentos, $obs, $id) {
        mysql_query("UPDATE doencasanteriores SET coquel='".$coqueluche."', saramp='".$sarampo."', varic='".$varicela."', parot='".
			$parotide."', dift='".$difteria."', tetano='".$tetano."', diarr='".$diarreia."', pneum='".$pneumonia."', mening='".
			$meningite."', febrer='".$febrereum."', nefro='".$nefropatia."', tuberc='".$tuberculose."', asma='".$asma."',            eczema='".$eczema."', alergalim='".$alergia."', talergalim='".$textalergias."', rinite='".$rinite."', cirurg='".
			$cirurgia."', histtransf='".$transf."', hosp='".$hospital."', trat='".$tratamentos."', obs = '".$obs."' WHERE idPront='"
			.$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function alterarOutrasInfo($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed, $textalergmed,
        $conttuberc, $obs, $id) {
        mysql_query("UPDATE outrasinformacoes SET chagas='".$doenchag ."', esquist='".$doenesq."', agtox='".$expagtox."', tagtox='".
			$textexpagtox."', alergmed='".$alergmed."', talergmed='".$textalergmed."', conttub='".$conttuberc."', obs='".$obs."' 
			WHERE idPront='".$id."'") or die("ERRO no comando SQL : ".mysql_error());
    }

    public function __destruct() {}
}
?>
