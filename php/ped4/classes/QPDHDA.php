<?php
include("dbconfig.php");

class QPDHDA{
	private $qpd;
	private $hda;
	
	public function __construct($qpd,$hda){
		$this->qpd = $qpd;
		$this->hda = $hda;
	}
	
	public function setQPD($qpd){
		$this->qpd = $qpd;
	}
	public function getQPD(){
		return $this->qpd;
		$this->qpd = $qpd;
	}
	
	public function setHDA($hda){
		$this->hda = $hda;
	}
	public function getHDA(){
		return $this->hda;
	}
	
	function alterar($idAtendimento, $assinar, $idAluno){
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
		mysql_query("UPDATE qpdhda SET hist='".$this->getHDA()."', queix='".$this->getQPD()."', ass='".$assinar."', 
			dthr='".$data."', idAlun='".$idAluno."' WHERE idAtend='".$idAtendimento."'")
			or die("ERRO no comando SQL:".mysql_error());
	}

	public function __destruct(){}
}
?>
