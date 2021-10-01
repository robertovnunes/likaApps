<?php
class Usuario{
	private $login;
	private $senha;
	private $nome;
	private $cpf;
	private $id;
	private $tipo;
    private $email;
	
	public function __construct($login,$senha){
		$this->login = $login;
		$this->senha = $senha;
	}
	
	public function setID($id){
		$this->id = $id;
	}
	public function getID(){
		return $this->id;
	}

	public function setLogin($login){
		$this->login = $login;
	}
	public function getLogin(){
		return $this->login;
	}

	public function setSenha($senha){
		$this->senha = $senha;
	}
	public function getSenha(){
		return $this->senha;
	}
	
	public function setNome($nome){
		$this->nome = $nome;
	}
	public function getNome(){
		return $this->nome;
	}

	public function setCpf($cpf){
		$this->cpf = $cpf;
	}
	public function getCpf(){
		return $this->cpf;
	}

	public function setTipo($tipo){
		$this->tipo = $tipo;
	}
	public function getTipo(){
		return $this->tipo;
	}
	public function getEmail(){
		return $this->email;
	}
	public function setEmail($email){
		$this->email = $email;
	}
	
	public function __destruct(){}
}
?>