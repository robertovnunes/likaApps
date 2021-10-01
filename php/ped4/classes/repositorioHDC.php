<?php
include ("dbconfig.php");

class repositorioHDC
{

    function preencherHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("UPDATE hipotdiagnost SET hip='".$hip."', ass='".$assinar."', dthr='".$data.".', idAlun='".$idAluno."'
			WHERE idAtend='".$idAtendimento."'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function preencherConduta($cond, $idAtendimento, $assinar, $idAluno){
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
        mysql_query("UPDATE conduta SET cond='".$cond."', ass='".$assinar."', dthr='".$data.".', idAlun='".$idAluno."' 
			WHERE idAtend='".$idAtendimento."'") or die("ERRO no comando SQL:" . mysql_error());
    }

    public function __destruct()
    {}

}
?>
