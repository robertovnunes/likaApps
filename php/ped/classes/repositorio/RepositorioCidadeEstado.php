<?php
class RepositorioCidadeEstado{

	public function __construct() {}

	function listarEstados() {
		$sql = mysql_query("SELECT * FROM tb_estados ORDER BY nome ASC") 
		or die("ERRO no comando SQL:" . mysql_error());
		$tabela = array();
		while ($dados = mysql_fetch_array($sql)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}

	function listarCidades($estado) {
		$sql = mysql_query("SELECT * FROM tb_cidades WHERE estado = $estado ORDER BY nome ASC")
		or die("ERRO no comando SQL:" . mysql_error());
		$tabela = array();
		while ($dados = mysql_fetch_array($sql)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}
	
	function getEstado($id) {
		$sql = mysql_query("SELECT * FROM tb_estados WHERE id = $id LIMIT 1") 
		or die("ERRO no comando SQL:" . mysql_error());
		$dados = mysql_fetch_array($sql);
		return $dados;
	}

	function getCidade($id) {
		$sql = mysql_query("SELECT * FROM tb_cidades WHERE id = $id LIMIT 1")
		or die("ERRO no comando SQL:" . mysql_error());
		$dados = mysql_fetch_array($sql);
		return $dados;
	}

    public function __destruct(){}

}
?>
