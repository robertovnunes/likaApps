<?php
include_once("classes/repositorio/RepositorioCidadeEstado.php");

class NegocioCidadeEstado {
	
	private $repCidEst;
	
	public function __construct(){
		$this->repCidEst = new RepositorioCidadeEstado();
	}

	function listarEstados(){
		return $this->repCidEst->listarEstados();
	}
	
	function listarCidades($estado){
		return $this->repCidEst->listarCidades($estado);
	}

	function getEstado($id){
		return $this->repCidEst->getEstado($id);
	}
	
	function getCidade($id){
		return $this->repCidEst->getCidade($id);
	}

	public function __destruct() {}

} ?>
