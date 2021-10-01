<?php
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
	
	public function __destruct(){}
}
?>
