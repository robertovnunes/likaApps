<?php
class Informante{
	private $nome;
	private $sexo;
	private $endereco;
	private $numero;
	private $complemento;
	private $bairro;
	private $cidade;
	private $estado;
	private $cep;
	private $escolaridade;
	private $parentesco;
	private $obs;
	
	public function __construct($nome,$sexo,$endereco,$numero,$complemento,$bairro,$cidade,$estado,$cep,$escolaridade,$parentesco,$obs){
		$this->nome = $nome;
		$this->sexo = $sexo;
		$this->endereco = $endereco;
		$this->numero = $numero;
		$this->complemento = $complemento;
		$this->bairro = $bairro;
		$this->cidade = $cidade;
		$this->estado = $estado;
		$this->cep = $cep;
		$this->escolaridade = $escolaridade;
		$this->parentesco = $parentesco;
		$this->obs = $obs;
	}//__construct
	
	public function setNome($nome){
		$this->nome = $nome;
	}
	public function getNome(){
		return $this->nome;
		$this->nome = $nome;
	}
	
	public function setSexo($sexo){
		$this->sexo = $sexo;
	}
	public function getSexo(){
		return $this->sexo;
	}
	
	public function setEndereco($endereco){
		$this->endereco = $endereco;
	}
	public function getEndereco(){
		return $this->endereco;
	}
	
	public function setNumero($numero){
		$this->numero = $numero;
	}
	public function getNumero(){
		return $this->numero;
		$this->numero = $numero;
	}
	
	public function setComplemento($complemento){
		$this->complemento = $complemento;
	}
	public function getComplemento(){
		return $this->complemento;
	}

	public function setBairro($bairro){
		$this->bairro = $bairro;
	}
	public function getBairro(){
		return $this->bairro;
	}
	
	public function setCEP($cep){
		$this->cep = $cep;
	}
	public function getCEP(){
		return $this->cep;
	}
	
	public function setCidade($cidade){
		$this->cidade = $cidade;
	}
	public function getCidade(){
		return $this->cidade;
	}
	
	public function setEstado($idUF){
		$this->estado = $idUF;
	}
	public function getEstado(){
		return $this->estado;
	}

	
	public function setEscolaridade($escolaridade){
		$this->escolaridade = $escolaridade;
	}
	public function getEscolaridade(){
		return $this->escolaridade;
	}
	
	public function setParentesco($parentesco){
		$this->parentesco = $parentesco;
	}
	public function getParentesco(){
		return $this->parentesco;
	}

	public function setObs($obs){
		$this->obs = $obs;
	}
	public function getObs(){
		return $this->obs;
	}

	public function __destruct(){}
}
?>
