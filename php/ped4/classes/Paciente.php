<?php
include ("dbconfig.php");

class Paciente {
    private $nome;
    private $data;
    private $cns;
    private $cpf;
    private $sexo;
    private $mae;
    private $pai;
    private $endereco;
    private $complemento;
    private $bairro;
    private $cidade;
    private $estado;
    private $cep;

    public function __construct($nome, $data, $cns, $cpf, $sexo, $mae, $pai, $endereco, $complemento,
        $bairro, $cidade, $estado, $cep) {
        $this->nome = $nome;
        $this->dia = $dia;
        $this->mes = $mes;
        $this->ano = $ano;
        $this->data = $data;
        $this->cns = $cns;
        $this->cpf = $cpf;
        $this->sexo = $sexo;
        $this->mae = $mae;
        $this->pai = $pai;
        $this->endereco = $endereco;
        $this->complemento = $complemento;
        $this->bairro = $bairro;
        $this->cidade = $cidade;
        $this->estado = $estado;
        $this->cep = $cep;
    } //__construct

    public function setNome($nome) {
        $this->nome = $nome;
    }
    public function getNome() {
        return $this->nome;
        $this->nome = $nome;
    }

    public function setDTNasc($data) {
        $this->dtnasc = $data;
    }
    public function getDTNasc() {
        return $this->data;
    }
	
	public function getDTNascFmat(){
		return substr($this->data, 6, 4)."-".substr($this->data, 3, 2)."-".substr($this->data, 0, 2);
	}

    public function getDia() {
        return $this->dia;
    }
    public function getMes() {
        return $this->mes;
    }
    public function getAno() {
        return $this->ano;
    }

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

    public function setEstado($idUF) {
        $this->estado = $idUF;
    }
    public function getEstado() {
        return $this->estado;
    }

    function cadastrar($login) {
    	$query = mysql_query("SHOW TABLE STATUS LIKE 'prontuario'");
        $data = mysql_fetch_array($query);
		$idProntuario = $data['Auto_increment'];
		$query1 = mysql_query("SHOW TABLE STATUS LIKE 'atendimento'");
		$data1 = mysql_fetch_array($query1);
		$idAtendimento = $data1['Auto_increment'];
		$consulta2 = mysql_query("SELECT idEquipe, idAlun from aluno, acesso where idAlun = idAcesso and login = '".$login."'");
		$linha2 = mysql_fetch_object($consulta2);
		mysql_query("insert into prontuario values ('".$idProntuario."','".$linha2->idEquipe."')");
		mysql_query("insert into paciente values ('".$idProntuario."','".$this->getNome()."','".$this->getDTNascFmat()."','".
			$this->getSexo()."','".$this->getCNS()."','".$this->getCPF()."','".$this->getMae()."','".$this->getPai()."','".
			$this->getEndereco()."','".$this->getComplemento()."','".$this->getBairro()."','".$this->getEstado()."','".
			$this->getCidade()."','".$this->getCEP()."')") or die("ERRO no comando SQL:" . mysql_error());
		$data = date(Y)."-".date(m)."-".date(d)." ".date("H:i:s");
		mysql_query("insert into atendimento values ('".$idAtendimento."','".$idProntuario."','".$linha2->idAlun."','".$data."','".
			$data."')");
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
		
		generateRows('antroestpuberal', 5, $idAtendimento);
		generateRows('medind', 9, $idAtendimento);
		
		generateRows('examegastint', 19, $idAtendimento);
		generateRows('exameresp', 21, $idAtendimento);
		generateRows('examecardvasc', 11, $idAtendimento);
		generateRows('examecranio', 8, $idAtendimento);

		generateRows('exameganglinf', 2, $idAtendimento);
		generateRows('desenvneuropsicomotor', 38, $idAtendimento);
		generateRows('examegenurin', 7, $idAtendimento);
		
		if ($this->getSexo() == "M"){
					generateRows('examegenmasc', 5, $idAtendimento);
		}
		else if ($this->getSexo() == "F"){
				generateRows('examegenfem', 3, $idAtendimento);
		}
			
		generateRows('inspecao', 9, $idAtendimento);
		generateRows('examemuscesq', 16, $idAtendimento);
		generateRows('examenervoso', 4, $idAtendimento);
		generateRows('exameolhos', 11, $idAtendimento);
		generateRows('examepele', 15, $idAtendimento);
		generateRows('examepescoco', 9, $idAtendimento);
		generateRows('examesistotorrin', 29, $idAtendimento);
	
		generateRows('conduta', 4, $idAtendimento);
		generateRows('hipotdiagnost', 4, $idAtendimento);

		generateRows('historicofamiliar', 1, $idProntuario);
		generateRows('familia', 9, $idProntuario);
		generateRows('condicoesdomesticas', 8, $idProntuario);
		
		generateRows('historicopessoal', 1, $idProntuario);
		generateRows('prenatal', 19, $idProntuario);
		generateRows('natal', 9, $idProntuario);
		generateRows('neonatal', 29, $idProntuario);
		generateRows('alimentacao', 14, $idProntuario);
		generateRows('crescimento', 8, $idProntuario);
		generateRows('habitos', 10, $idProntuario);
		generateRows('imunizacoes', 3, $idProntuario);
		generateRows('doencasanteriores', 22, $idProntuario);
		generateRows('outrasinformacoes', 8, $idProntuario);
	
		inserirAbasExame($idAtendimento);
		inserirAbasIs($idAtendimento);
		//inserirAntroestpuberal($idAtendimento);
		return $idAtendimento;
    }

    function alterar($idProntuario) {
        mysql_query("update paciente set nome='".$this->getNome()."', dtnasc='".$this->getDTNascFmat()."',mae='".$this->getMae()."',  	
			pai='".$this->getPai()."', ender='".$this->getEndereco()."',compl='".$this->getComplemento()."', bairro='".
			$this->getBairro()."', idEst='".$this->getEstado()."', idCid='".$this->getCidade()."', cep='".$this->getCep().
			"', sexo='".$this->getSexo()."' where idPront='".$idProntuario."'") or die("ERRO no comando SQL:".mysql_error());
    }

    public function __destruct() {
    }
}
?>