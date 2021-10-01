<?php
	$linha = verQPDHDA($atend);
	if ($flag){
		echo '<br /><table width="620" bgcolor="#629BD2"><tr>';
		if ($error){
			echo "<td class='erro'>";
			if($_POST['adendoNovo'] == "" && $linha->ass) echo "Preencha o adendo.";
			else if(($_POST['QPD'] == "" && !$linha->ass) && ($_POST['HDA'] == "" && !$linha->ass)){
			echo "Nenhum dado foi alterado.";
			}else {
			echo "Dados inseridos com sucesso.";
			}
			
						
			
		} else if (!$error){
			echo '<td class="style4">';
			if($insert) echo "Novo Adendo Inserido.";
			else echo "Dados inseridos com sucesso.";
		}	
		echo "</td></tr></table><br />";
	}
?>
<!--onfocus="mudaLb(lblqpd); verCampos(this.form)"-->
<br />
<fieldset style="width:590px">
	<legend id="lblqpd" <?php if ($error && $_POST['QPD'] == "" && !$linha->ass)?>>
		Queixa Principal</legend>
  	<textarea name="QPD" cols="70" onfocus="mudaLb(lblqpd)" onkeyup="contre(this);savCampo()"<?php echo checkAssinado($linha->ass); 		?>><?php echo printOBS($linha->queix, $_POST['QPD']);?></textarea>
</fieldset>
<fieldset style="width:590px">
   	<legend id="lblhda" <?php if ($error && $_POST['HDA'] == "" && !$linha->ass)?>>
		Hist&oacute;rico da Doen&ccedil;a Atual</legend>
   	<textarea name="HDA" cols="70" onfocus="mudaLb(lblhda)" onkeyup="contre(this);savCampo()" <?php echo checkAssinado($linha->ass);
		?>><?php echo printOBS($linha->hist, $_POST['HDA']); ?></textarea>
</fieldset>
<?php
if ($linha->ass) 
	echo "<br /><table class='infoass'><tr><td>Assinatura: ".getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</td></tr></table><br />";?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoQH($atend); ?>