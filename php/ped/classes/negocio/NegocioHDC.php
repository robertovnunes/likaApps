<?php
include_once("classes/repositorio/RepositorioHipCond.php");

class NegocioHDC{
	
	private $repHDC;
	private $repPac;
	private $repAdendo;
	
    public function __construct() {
        $this->repHDC = new RepositorioHipCond();
		$this->repPac = new RepositorioPaciente();
		$this->repAdendo = new RepositorioAdendo();
	}

	public function listaHD($atend){
		return $this->repHDC->listaHD($atend);
	}

	public function removerHD($idAtend){
		$this->repHDC->removerHD($idAtend);
	}

	public function novaHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		if ($hip){
			if ($assinar)
            	$this->repHDC->preencherHipDiag($hip, $idAtendimento,1, $idAluno);
			else
            	$this->repHDC->preencherHipDiag($hip, $idAtendimento,0,$idAluno);
		} else
			throw new CamposInvalidos();
		
	}
	
	public function alterarHipDiag($hip, $idHip, $idAluno){
		$this->repHDC->alterarHipDiag($hip, $idHip, $idAluno);
	}
	
	public function confirmarHip($idHip, $idAluno){
		$this->repHDC->confirmarHip($idHip, $idAluno);
	}

	public function assinarHD($idAtend, $assinar, $idAluno){
		$this->repHDC->assinarHD($idAtend, $assinar, $idAluno);
	}
	
	public function alterarConduta($cond, $idAtendimento, $assinar, $idAluno){
		if ($cond){
			if ($assinar)
            	$this->repHDC->preencherConduta($cond, $idAtendimento,1, $idAluno);
			else
            	$this->repHDC->preencherConduta($cond, $idAtendimento,0,$idAluno);
		} else
			throw new CamposInvalidos();
	}
	
	public function adendo($adendo, $idAtendimento, $idAluno, $nome){
		if ($adendo){
			$this->repHDC->inserirAdendo($adendo, $idAtendimento, $idAluno, $nome);
		} else {
			throw new CamposInvalidos();
		}
	}
	
	public function consultarHD($idhip){
		return $this->repHDC->consultarHD($idhip);
	}
	
	public function getAssHD($idAtend){
		return $this->repHDC->getAssHD($idAtend);
	}
	
	public function consultarCD($idAtendimento){
		if ($this->repPac->existeAtendimento($idAtendimento)){
			return $this->repHDC->consultarCD($idAtendimento);
		} else {
			throw new CamposInvalidos();
		}
	}
	
	public function HDAssinado($idAtendimento) {
		return $this->repHDC->HDAssinado($idAtendimento);
    }

    public function CondAssinado($idAtendimento) {
		return $this->repHDC->CondAssinado($idAtendimento);
    }

	public function __destruct(){}
	
}?>
