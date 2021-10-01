<?php

include ("dbconfig.php");

class RepositorioAtend {



	function novoAtendimento($idAluno, $idPront, $sexo){
		$query1 = mysql_query("SHOW TABLE STATUS LIKE 'atendimento'");
		$data1 = mysql_fetch_array($query1);
		$idAtendimento = $data1['Auto_increment'];
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
		mysql_query("insert into atendimento values ('".$idAtendimento."','".$idPront."','".$idAluno."','".$data."','".$data."')");
		generateRows('informante', 13, $idAtendimento);
		generateRows('qpdhda', 5, $idAtendimento);
		generateRows('interrogsintomatologico', 3, $idAtendimento);
		generateRows('geral', 5, $idAtendimento);
		generateRows('pele', 4, $idAtendimento);
		generateRows('olhos', 7, $idAtendimento);
		generateRows('ouvidos', 5, $idAtendimento);
		generateRows('aprespiratorio', 12, $idAtendimento);
		generateRows('apgastrointestinal', 8, $idAtendimento);
		generateRows('apgenitourinario', 12, $idAtendimento);
		if ($sexo == "M")
		generateRows('genmasc', 5, $idAtendimento);
		else if ($sexo == "F")
		generateRows('genfem', 10, $idAtendimento);
		generateRows('apcardiovascular', 5, $idAtendimento);
		generateRows('sistmusculoesqueletico', 5, $idAtendimento);
		generateRows('sistnervoso', 11, $idAtendimento);

		generateRows('examefisico', 3, $idAtendimento);
		generateRows('antroestpuberal', 4, $idAtendimento);
		generateRows('examegastint', 19, $idAtendimento);
		generateRows('exameresp', 21, $idAtendimento);
		generateRows('examecardvasc', 8, $idAtendimento);
		generateRows('examecranio', 8, $idAtendimento);

		generateRows('exameganglinf', 2, $idAtendimento);
		generateRows('desenvneuropsicomotor', 38, $idAtendimento);
		generateRows('examegenurin', 7, $idAtendimento);
		if ($sexo == "M")
		generateRows('examegenmasc', 5, $idAtendimento);
		else if ($sexo == "F")
		generateRows('examegenmasc', 3, $idAtendimento);
		generateRows('inspecao', 9, $idAtendimento);
		generateRows('examemuscesq', 16, $idAtendimento);
		generateRows('examenervoso', 4, $idAtendimento);
		generateRows('exameolhos', 11, $idAtendimento);
		generateRows('examepele', 15, $idAtendimento);
		generateRows('examepescoco', 9, $idAtendimento);
		generateRows('examesistotorrin', 29, $idAtendimento);

		generateRows('conduta', 4, $idAtendimento);
		generateRows('hipotdiagnost', 4, $idAtendimento);

		//tabelas para verificar se as abas já foram salvas.

		inserirAbasExame($idAtendimento);
		inserirAbasIS($idAtendimento);
		
		header('Location:prontuario_paciente.php?at='.$idAtendimento);
	}





	public function __destruct() {
	}

}
?>