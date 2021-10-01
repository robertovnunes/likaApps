<?php
class RepositorioHistorico {

    public function __construct(){}

    function assinar($id, $namehist)
	{
        mysql_query("UPDATE " . $namehist . " SET ass = 1 where idPront='" . $id . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
    }

    function HPAssinado($idPront)
	{
        $sqlhp = mysql_query("SELECT ass FROM historicopessoal WHERE idPront = '" . $idPront . "'");
        $linhahp = mysql_fetch_object($sqlhp);
        return ($linhahf->ass);
    }

    function consultarHP($idPront) {
        $sql = mysql_query("SELECT * FROM historicopessoal WHERE idPront='" . $idPront . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sql);
    }

	function HFAssinado($idPront) {
        $sqlhf = mysql_query("SELECT ass FROM historicofamiliar WHERE idPront = '" . $idPront . "'");
        $linhahf = mysql_fetch_object($sqlhf);
        return ($linhahf->ass);
    }

	function consultarHF($idPront) {
        $sql = mysql_query("SELECT * FROM historicofamiliar WHERE idPront = '" . $idPront . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sql);
    }
	
    function inserirInfoFamiliares($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, 
		$outros, $id)
	{	
        mysql_query("UPDATE familia SET uniaopais = '" . $uniaopais . "', idademae = '" . $idademae . 
			"', profmae = '" . $profmae . "', idadepai = '" . $idadepai . "', profpai = '" . $profpai . 
			"', pais = '" . $pais . "', avos = '" . $avos . "', irmaos = '" . $irmaos . "', outros = '" . 
			$outros . "' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    function inserirCondDomest($tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais,
		$obs, $id)
	{
		mysql_query("UPDATE condicoesdomesticas SET resid = '" . $tiporesid . "', comod = '" . 
			$ncomodos . "', ocup = '" . $nocupantes . "', agua = '" . $agua . "', luz = '" . $luz . 
			"', sanea = '" . $saneamento . "', animais = '" . $animais . "', obs = '" . $obs . "' 
			WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }
	
    function inserirVacina($vacinanome, $vacinadose, $data, $id) {
		$dt = $this->DTFrmt1($data);
        mysql_query("INSERT INTO vacinacao (idDose, idPront, idVacina, dt) VALUES ('" . $vacinadose . 
			"', '" . $id . "', '" . $vacinanome . "', '" . $dt . "')") or die("ERRO no comando SQL : " . 
			mysql_error());
    }
    
    function removerVacina($vacina, $dose, $id) {
		mysql_query("delete from vacinacao where idDose = (select idDose from dose where dose = '" . 
			$dose . "') and idPront = " . $id . " and idVacina = (select idVacina from vacina where 
			vacina = '" . $vacina . "')") or die("ERRO no comando SQL : " . mysql_error());
    }

	function getVacinasPaciente($idPront) {
        $sql = mysql_query("select d.dose, v.vacina, vi.dt FROM vacinacao vi, dose d, vacina v WHERE 
			d.idDose = vi.idDose && v.idVacina = vi.idVacina && idPront = '" . $idPront . "' ORDER BY 
			vi.dt");
		$tabela = array();
		while ($dados =  mysql_fetch_array($sql)){
			$dados['dt'] = $this->DTFrmt2($dados['dt']);
			array_push($tabela, $dados);
		}
		return $tabela;
    }

    function getVacinas() {
        $sql = mysql_query("select * FROM vacina");
		$tabela = array();
		while ($dados =  mysql_fetch_array($sql)){
			array_push($tabela, $dados);
		}
		return $tabela;
    }

    function getDoses() {
        $sql = mysql_query("select * FROM dose");
		$tabela = array();
		while ($dados =  mysql_fetch_array($sql)){
			array_push($tabela, $dados);
		}
		return $tabela;
    }

	function vacinaHasDose($vnome, $vdose, $id){
		$sql = mysql_query("SELECT * FROM vacinacao WHERE idDose = '" . $vdose . "' and idPront = '" . $id . "' and idVacina = '" . 
			$vnome . "'") or die("ERRO no comando SQL : " . mysql_error());
		return (mysql_num_rows($sql) > 0);
	}

    function alterarPNatal($acpmed, $nacpmed, $lacpmed, $durgest, $sangmae, $z21, $a53, $b18, $b58, 
		$imunizmae, $exradion, $medic, $anorm, $doencir, $cirurgdc, $pesograv, $alimgrav, $anemia, $obs, 
		$id)
	{
        mysql_query("UPDATE prenatal SET durgest = '" . $durgest . "', acpmed = '" . $acpmed . 
			"', lacpmed = '" . $lacpmed . "', nacpmed = '" . $nacpmed . "', z21 = '" . $z21 . 
			"', a53 = '" . $a53 . "', b18 = '" . $b18 . "', b58 = '" . $b58 . "', imunizmae = '" . 
			$imunizmae . "', idSang = '" . $sangmae . "', medic = '" . 	$medic . "', anorm = '" . 
			$anorm . "', exradion = '" . $exradion . "', doencir = '" . $doencir . "', cirurgdc = '" . 
			$cirurgdc . "', pesograv = '" . $pesograv . "', anemia = '" . $anemia . "', alimgrav = '" . 
			$alimgrav . "', obs = '" . $obs . "' WHERE idPront = '" . $id . "'") or 
			die("ERRO no comando SQL : ".mysql_error());
    }

	public function alterarNatal($tgrav, $tparto, $tapres, $durparto, $anestesia, $analgesia, $complp, 
		$tcomplp, $obs, $id)
	{
        mysql_query("UPDATE natal SET tgrav = '" . $tgrav . "', tparto = '" . $tparto . "', tapres = '" . 
			$tapres . "', durparto = '" . $durparto . "', anest = '" . $anestesia . "', analg = '" . 
			$analgesia . "', complp = '" . $complp . "', tcomplp = '" . $tcomplp . "', obs = '" . $obs . 
			"' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarNeoNatal($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinorto, 
		$pesoalta, $comp, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe, $fenilcet, $hipotir, $anemfalc, 
		$triaaud, $PEATE, $EOA, $reanim, $icter, $rash, $sang, $vomit, $infec, $anomcong, $paral, 
		$coriza, $convul, $obs, $pesoat, $spesoat, $altat, $id) {
        mysql_query("UPDATE neonatal SET apgar1 = '" . $apgar1 . "', apgar5 = '" . $apgar5 . 
			"', permnasal = '" . $permnasal . "', idadegest = '" . $idadegest . "', triagaud = '" . 
			$triaaud . "', peate = '" . $PEATE . "', eoa = '" . $EOA . "', reanim = '" . $reanim . 
			"', idSang = '" . $sangrn . "', sinorto = '" . $sinorto . "', pesoalta = '" . $pesoalta . 
			"', comp = '" . $comp . "', percef = '" . $percef . "', pertorac = '" . $pertorac . 
			"', pesonasc = '" . $pesonasc . "', vpesonasc = '" . $vpesonasc . "', testepe = '" . $testepe . 
			"', anemfalc = '" . $anemfalc . "', hipotir = '" . $hipotir . "', fenilcet = '" . $fenilcet . 
			"', icter = '" . $icter . "', rash = '" . $rash . "', sang = '" . $sang . "', vomit = '" . $vomit . 
			"', infec = '" . $infec . "', anomcong = '" . $anomcong . "', paral = '" . $paral . "', coriza = '" . 
			$coriza . "', convul = '" . $convul . "', obs = '" . $obs . "', pesoat = '" . $pesoat . "', spesoat = '" . $spesoat .
			"', altat = '" . $altat . "' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }
    

    public function alterarAliment($aleitmat, $alimcomp, $alimpast, $alimfam, $dietaat, $refdia, 
		$horaref, $usomam, $colher, $copo, $alimpastl, $chantafet, $brincref, $obs, $id) {
        mysql_query("UPDATE alimentacao SET aleitmat = '" . $aleitmat . "', alimcomp = '" . $alimcomp . 
			"', alimpast = '" . $alimpast . "', alimfam = '" . $alimfam . "', dietaat = '" . $dietaat . 
			"', refdia = '" . $refdia . "', horaref = '" . $horaref . "', mamadeira = '" . $usomam . 
			"', colher = '" . $colher . "', copo = '" . $copo . "', alimpastl = '" . $alimpastl . 
			"', chantafet = '" . $chantafet . "', brincref = '" . $brincref . "', obs = '" . $obs . 
			"' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarCrescDes($relirm, $idadesc, $aprend, $repetano, $relacol, $partfala, 
		$muddent, $obs, $id) {
        mysql_query("UPDATE crescimento SET relirm = '" . $relirm . "', idadesc = '" . $idadesc . 
			"', aprend = '" . $aprend . "', repetano = '" . $repetano . "', relacol = '" . $relacol . 
			"', partfala = '" . $partfala . "', muddent = '" . $muddent . "', obs = '" . $obs . 
			"' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarHabitos($chupeta, $chupadedo, $roiunha, $tique, $altalim, $geofagia, 
		$enurese, $pertsono, $dormepais, $obs, $id) {
        mysql_query("UPDATE habitos SET chupeta = '" . $chupeta . "', chupadedo = '" . $chupadedo . 
			"', roiunha = '" . $roiunha . "', tique = '" . $tique . "', altalim = '" . $altalim . 
			"', geofagia = '" . $geofagia . "', enurese = '" . $enurese . "', pertsono = '" . $pertsono . 
			"', dormepais = '" . $dormepais . "', obs = '" . $obs . "' WHERE idPront = '" . $id . "'") 
			or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarImuniz($efeitcol, $testmant, $obs, $id) {
        mysql_query("UPDATE imunizacoes SET efeitcol = '" . $efeitcol . "', testmant = '" . $testmant . 
		"', obs='" . $obs . "' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    public function alterarDoencAnt($coquel, $sarampo, $varic, $parot, $dift, $tetano, $diarr, $pneum, 
		$mening, $febrer, $nefro, $tuberc, $asma, $eczema, $alerg, $talerg, $rinite, $cirurg, $transf, 
		$hospit, $trata, $obs, $id) {
        mysql_query("UPDATE doencasanteriores SET coquel = '" . $coquel . "', saramp = '" . $sarampo . 
			"', varic = '" . $varic . "', parot = '" . $parot . "', dift = '" . $dift . "', tetano = '" . 
			$tetano . "', diarr = '" . $diarr . "', pneum = '" . $pneum . "', mening = '" . $mening . 
			"', febrer = '" . $febrer . "', nefro = '" . $nefro . "', tuberc = '" . $tuberc . 
			"', asma = '" . $asma . "', eczema = '" . $eczema . "', alerg = '" . $alerg . 
			"', talerg = '" . $talerg . "', rinite = '" . $rinite . "', cirurg = '" . $cirurg . 
			"', transf = '" . $transf . "', hospit = '" . $hospit . "', trata = '" . $trata . 
			"', obs = '" . $obs . "' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . 
			mysql_error());
    }

    public function alterarOutrasInfo($chagas, $esquist, $agtox, $tagtox, $alergmed, $talergmed, 
		$ctuberc, $obs, $id) {
        mysql_query("UPDATE outrasinformacoes SET chagas = '" . $chagas . "', esquist = '" . $esquist . 
			"', agtox = '" . $agtox . "', tagtox = '" . $tagtox . "', alergmed = '" . $alergmed . 
			"', talergmed = '" . $talergmed . "', ctuberc = '" . $ctuberc . "', obs = '" . $obs . 
			"' WHERE idPront = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
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
	
    public function __destruct() {}
}
?>
