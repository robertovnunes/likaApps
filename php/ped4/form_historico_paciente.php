<?php
	function nomeAba($valor) {
		if ($valor == "" || $valor != "historico")
			return "antpessoais";
		else return "historico";
	}
	
	function mSel($valor, $aba){
		if ($valor == $aba)
			return "class='msel'";
	}
	
	$data = substr($paciente->dtnasc,8,2)."/".substr($paciente->dtnasc,5,2)."/".substr($paciente->dtnasc,0,4);
	$aba = nomeAba($_GET['n']);
	
	$nome = "";
	if(strlen($paciente->nome)>30){
		
		$array = explode(" ", $paciente->nome);
		$tamanho = 0;
		
		while(($tamanho + strlen(current($array))) < 30){
			$nome .= current($array).' ';
			$tamanho = $tamanho + strlen(current($array));
			next($array);
		}

	}else{
		$nome = $paciente->nome;
	}
	
	
	
?>
<table width="740" bgcolor='#FFFFFF' >
  <tr> <div id="dadosPessoaisPac" align="left"><b> DADOS PESSOAIS </b></div>
		<div id="nomePaciente" class="style5" align="left"><b><?php echo $nome; ?></b> </td></div>
		
  </tr>
    <tr >
    <td  height="58" class="style5" style="	font-size:12px;" ><b>Sexo</b>: <?php echo $paciente->sexo; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Natural de:</b> <?php echo $paciente->cidade."/".$paciente->estado; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Data Nasc:</b> <?php echo $data; ?></td>
	  <td   class="style5" style="	font-size:12px;" ><b>Alergia a Medicamentos:</b> <?php if ($paciente->alergmed == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Alergia Alimentar:</b> <?php if ($paciente->alergalim == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
  </tr>
</table>
<br />
    <form action="historico_paciente.php?pr=<?php echo $pront; ?>&n=<?php echo $aba; ?>" method="post" name="historico" id="form_historico" >
<ul class='menuh'>
	<li <?php echo mSel('antpessoais', $aba); ?>><a onclick="muda(<?php echo $pront; ?>,'antpessoais','h')">Pessoal</a></li>
 	<li <?php echo mSel('historico', $aba); ?>><a onclick="muda(<?php echo $pront; ?>,'historico','h')">Familiar</a></li>
</ul>
<table width="620" height="200" cellspacing="0" cellpadding="0"	border="0"   >
	<tr>
		<td height="285" class="tb-conteudo" colspan="8"><?php $n = $_GET['n'];
		if ($n == "historico"){
			echo'<div id="div_historico" class="conteudo2" height:500px">';
			include("prontuario/aba_histfam[Movido para pasta antpes].php");
		} else {
			echo'<div id="div_antpessoais" class="conteudo2" height:500px">';
			include("prontuario/aba_antpes.php");
		} ?>
        <br />
		<?php if ($aba == "historico" || $aba == "antpessoais"){ ?>
		<fieldset style="width:500px">
			<legend>Op&ccedil;&otilde;es</legend>
			<table width="473">
				<tr >
					<td width="260" ><input name="limpar" type="reset" value="Limpar" /></td>
					<td width="93" style="float:left;"><input name="voltar" type="submit" onclick="this.form.action='acesso_aluno.php'" value="Voltar"/></td>
					<td width="92" align="right"><input name="salvar" type="submit" id="salvar" value="Salvar" /></td>
				</tr>
				<input type="hidden" value="0" id="ctrl"/>
			</table>
   		  </fieldset>
			<?php } ?>
        	<br />
			<?php echo "</div>"; ?>
			</td>
  		</tr>
	</table>
</form>
