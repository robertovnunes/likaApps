<?php

class Paciente {
    private $nome;
    private $data;
    private $cns;
    private $cpf;
    private $sexo;
    private $mae;
    private $pai;
    private $endereco;
    private $numero;
    private $complemento;
    private $bairro;
    private $cidade;
    private $uf;
    private $cep;
    private $id;
    private $alergmed;
    private $alergias;

    public function __construct($nome, $data, $cns, $cpf, $sexo, $mae, $pai, $endereco, $numero, $complemento,
        $bairro, $cidade, $uf, $cep) {
        $this->setNome($nome);
        $this->setDTNasc($data);
        $this->setCNS($cns);
        $this->setCPF($cpf);
        $this->setSexo($sexo);
        $this->setMae($mae);
        $this->setPai($pai);
        $this->setEndereco($endereco);
        $this->setNumero($numero);
        $this->setComplemento($complemento);
        $this->setBairro($bairro);
        $this->setCidade($cidade);
        $this->setUF($uf);
        $this->setCEP($cep);
    } //__construct

    public function setNome($nome) {
        $this->nome = $nome;
    }
    public function getNome() {
        return $this->nome;
        $this->nome = $nome;
    }

    public function setDTNasc($data) {
        $this->data = $data;
    }
    public function getDTNasc() {
        return $this->data;
    }

    /*public function getDia() {
        return $this->dia;
    }
    public function getMes() {
        return $this->mes;
    }
    public function getAno() {
        return $this->ano;
    }*/

    public function setCNS($cns) {
        $this->cns = $cns;
    }
    public function getCNS() {
        return $this->cns;
    }

    public function setCPF($cpf) {
        $this->cpf = $cpf;
    }
    public function getCPF() {
        return $this->cpf;
    }

    public function setSexo($sexo) {
        $this->sexo = $sexo;
    }
    public function getSexo() {
        return $this->sexo;
    }

    public function setMae($mae) {
        $this->mae = $mae;
    }
    public function getMae() {
        return $this->mae;
    }

    public function setPai($pai) {
        $this->pai = $pai;
    }
    public function getPai() {
        return $this->pai;
    }

    public function setEndereco($endereco) {
        $this->endereco = $endereco;
    }
    public function getEndereco() {
        return $this->endereco;
    }

    public function setNumero($num) {
        $this->numero = $num;
    }
    public function getNumero() {
        return $this->numero;
    }

    public function setComplemento($complemento) {
        $this->complemento = $complemento;
    }
    public function getComplemento() {
        return $this->complemento;
    }

    public function setBairro($bairro) {
        $this->bairro = $bairro;
    }
    public function getBairro() {
        return $this->bairro;
    }

    public function setCEP($cep) {
        $this->cep = $cep;
    }
    public function getCEP() {
        return $this->cep;
    }

    public function setCidade($cidade) {
        $this->cidade = $cidade;
    }
    public function getCidade() {
        return $this->cidade;
    }

    public function setUF($uf) {
        $this->uf = $uf;
    }
    public function getUF() {
        return $this->uf;
    }

    public function setID($id){
        $this->id = $id;
    }
    public function getID(){
        return $this->id;
    }

    public function setAlergMed($alergmed){
        $this->alergmed = $alergmed;
    }
    public function getAlergMed(){
        return $this->alergmed;
    }

    public function setAlergias($alergias){
        $this->alergias = $alergias;
    }
    public function getAlergias(){
        return $this->alergias;
    }

    public function __destruct() {}
}
?>