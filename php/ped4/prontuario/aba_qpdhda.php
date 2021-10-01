<?php
	$linha = verQPDHDA($atend);
	if ($flag){
		echo '<br /><table width="620" bgcolor="#E8E8E8"><tr>';
		if ($error){
			
			if($_POST['adendoNovo'] == "" && $linha->ass) echo "<td class='erro'>Preencha o adendo.";
			else if(($_POST['QPD'] == "" && !$linha->ass) && ($_POST['HDA'] == "" && !$linha->ass)){
			echo "<td class='erro'>Nenhum dado foi alterado.";
			}else {
			echo "<td class='style4'> Dados inseridos com sucesso.";
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

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>QPD/HDA</td>
    	
    </tr>
</table>
<br/>
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
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
		echo "<table ><tr><td><font size='2' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoQH($atend); ?>