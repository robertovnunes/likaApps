<?php
	$linha = verHD($atend);
	if ($flag){
		echo '<br /><table width="620" bgcolor="#E8E8E8"><tr>';
		if ($error){
			echo "<td class='erro'>";
			if($_POST['hipdiag'] == "" && !$linha->ass) echo "Nenhum dado foi alterado.";
			if($_POST['adendoNovo'] == "" && $linha->ass) echo "Preencha o adendo.";
		} else {
			echo '<td class="style4">';
			if($insert) echo "Novo Adendo Inserido.";
			else echo "Dados inseridos com sucesso.";
		}	
		echo "</td></tr></table><br />";
	}

?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Hip&oacute;tese de Diagn&oacute;stico</td>
    	
    </tr>
</table>
<br/>
<fieldset style="width:590px;">
	<legend id="lblhd" >
		Hip&oacute;tese</legend>
        








	<div>
		<form>
			<div>
				
				<br />
				<textarea name="hipdiag" cols="70" <?php echo checkAssinado($linha->ass); ?> onFocus="mudaLb(lblhd)" id="inputString" onkeyup="lookup(this.value);savCampo();" onblur="fill();" ><?php echo printOBS($linha->hip, $_POST['hipdiag']); ?></textarea> 
			</div>
			
			<div class="suggestionsBox" id="suggestions" style="display: none;">
				<img src="upArrow.png" style="position: relative; top: -12px; left: 30px;" alt="upArrow" />
				<div class="suggestionList" id="autoSuggestionsList">
					&nbsp;
				</div>
			</div>
		</form>
	</div>

<?php /*        
	<textarea name="hipdiag" cols="70" <?php echo checkAssinado($linha->ass); ?> onFocus="mudaLb(lblhd)" onkeyup="savCampo()"
		><?php echo printOBS($linha->hip, $_POST['hipdiag']); ?></textarea> */ ?>
</fieldset>
<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
		echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoHD($atend); ?>