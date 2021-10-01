<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>


<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />


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
	  <td  class="style5" style="	font-size:12px;" ><b>Natural de:</b> <?php echo $paciente->descricao."/".$paciente->sigla; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Data Nasc:</b> <?php echo $data; ?></td>
	  <td   class="style5" style="	font-size:12px;" ><b>Alergia a Medicamentos:</b> <?php if ($paciente->alergmed == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Alergia Alimentar:</b> <?php if ($paciente->alergalim == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
  </tr>
</table>
<br />
    <form action="historico_paciente.php?pr=<?php echo $pront; ?>&n=<?php echo $aba; ?>" method="post" name="historico" id="form_historico" >

<?php /* <ul class='menuh'>
	<li <?php echo mSel('antpessoais', $aba); ?>><a onclick="muda(<?php echo $pront; ?>,'antpessoais','h')">Pessoal</a></li>
 	<li <?php echo mSel('historico', $aba); ?>><a onclick="muda(<?php echo $pront; ?>,'historico','h')">Familiar</a></li>
</ul> */?>






<table width="300"  cellspacing="0" cellpadding="0"	border="0"  >
	<tr><td valign="top"><fieldset> <legend> Menu </legend><ul id="MenuBar1" class="MenuBarVertical">
    <li><a class="MenuBarItemSubmenu">Pessoal</a>
          <ul>
             <li id="abahp1" onclick="AlternarAbasHP('abahp1','divhp1')"><a>Pr&eacute;-Natal</a></li>
             <li id="abahp2" onclick="AlternarAbasHP('abahp2','divhp2')"><a>Natal</a></li>
             <li id="abahp3" onclick="AlternarAbasHP('abahp3','divhp3')"><a>Neo-Natal</a></li>
             <li id="abahp4" onclick="AlternarAbasHP('abahp4','divhp4')"><a>Alimenta&ccedil;&atilde;o</a></li>
             <li id="abahp5" onclick="AlternarAbasHP('abahp5','divhp5')"><a>Crescimento e Desenvolvimento</a></li>
             <li id="abahp6" onclick="AlternarAbasHP('abahp6','divhp6')"><a>H&aacute;bitos</a></li>
             <li id="abahp7" onclick="AlternarAbasHP('abahp7','divhp7')"><a>Imuniza&ccedil;&otilde;es</a></li>
             <li id="abahp8" onclick="AlternarAbasHP('abahp8','divhp8')"><a>Doen&ccedil;as Anteriores</a></li>
             <li id="abahp9" onclick="AlternarAbasHP('abahp9','divhp9')"><a>Outras Informa&ccedil;&otilde;es</a></li>
           </ul>
    </li>
	<li id="abahp10" onclick="AlternarAbasHP('abahp10','divhp10')"><a>Familiar</a></li>
</ul>

<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script></fieldset> </td>
		<td height="285" class="tb-conteudo" colspan="0"><fieldset style="width:590px;">
	<legend>Hist&oacute;rico Pessoal</legend><?php $n = $_GET['n']; 
		if ($n == "antpessoais"){
			echo'<div id="div_historico" class="conteudo2" height:200px">';
			include("prontuario/aba_antpes.php");
		} else {
			echo'<div id="div_antpessoais" class="conteudo2" height:200px">';
			include("prontuario/aba_antpes.php");
		} ?>
        <br />
		<?php if ($aba == "historico" || $aba == "antpessoais"){ ?>
		<fieldset style="width:585px">
			
			<table width="470">
				<tr >
					<td width="100" ><input name="limpar" type="reset" value="Limpar" /></td>
					<td width="93" style="float:left;"><input name="voltar" type="submit" onclick="this.form.action='acesso_aluno.php'" value="Voltar"/></td>
					<td width="210" align="right"><input name="salvar" type="submit" id="salvar" value="Salvar" /></td>
				</tr>
				<input type="hidden" value="0" id="ctrl"/>
			</table>
   		  </fieldset>
			<?php } ?>
        	<br />
			<?php echo "</div>"; ?>
			</fieldset></td>
  		</tr>
	</table>
</form>
