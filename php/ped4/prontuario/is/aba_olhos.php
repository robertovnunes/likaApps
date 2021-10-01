<?php
	$lolh = getValuesTableAt('olhos',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Olhos</td>
    </tr>
</table>

<table width="570">
	
    
    <tr>
		<td width="274"><br /><fieldset style="width:274px">
			<legend>Fotofobia</legend>
			<input name="fotofobia" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fotofobia", "S", $lolh->fotof); ?> onchange="savCampo('3')"/>Sim
			<input name="fotofobia" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fotofobia", "N", $lolh->fotof); ?> onchange="savCampo('3')"/>N&atilde;o
			<input name="fotofobia" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fotofobia", "NA", $lolh->fotof); ?> onchange="savCampo('3')"/>N&atilde;o Avaliado
		</fieldset></td>
        <td width="284"><br /><fieldset>
			<legend>Lacrimejamento</legend>
			<input name="lacrim" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("lacrim", "S", $lolh->lacrim); ?> onchange="savCampo('3')"/>Sim
			<input name="lacrim" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("lacrim", "N", $lolh->lacrim); ?> onchange="savCampo('3')"/>N&atilde;o
			<input name="lacrim" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("lacrim", "NA", $lolh->lacrim); ?> onchange="savCampo('3')"/>N&atilde;o Avaliado
	  </fieldset></td>
   	</tr>
    <tr>
		<td><fieldset>
			<legend>Edema Palpebral</legend>
			<input name="edemapalp" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("edemapalp", "S", $lolh->edpalp); ?> onchange="savCampo('3')"/>Sim
			<input name="edemapalp" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("edemapalp", "N", $lolh->edpalp); ?> onchange="savCampo('3')"/>N&atilde;o
			<input name="edemapalp" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("edemapalp", "NA", $lolh->edpalp); ?> onchange="savCampo('3')"/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Secre&ccedil;&atilde;o</legend>
			<input name="secrecaool" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("secrecaool", "S", $lolh->secr); ?> onchange="savCampo('3')"/>Sim
			<input name="secrecaool" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("secrecaool", "N", $lolh->secr); ?> onchange="savCampo('3')"/>N&atilde;o
			<input name="secrecaool" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("secrecaool", "NA", $lolh->secr); ?> onchange="savCampo('3')"/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
    <tr>
		<td><fieldset>
			<legend>Dor</legend>
			<select name="dorolho" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('3')">
				<option value="OE" <?php echo checkOption("dorolho", "OE", $lolh->dorol); ?>>Olho Esquerdo</option>
				<option value="OD" <?php echo checkOption("dorolho", "OD", $lolh->dorol); ?>>Olho Direito</option>
				<option value="AO" <?php echo checkOption("dorolho", "AO", $lolh->dorol); ?>>Ambos os Olhos</option>
				<option value="N" <?php echo checkOption("dorolho", "N", $lolh->dorol); ?>>Sem Dor</option>
				<option value="NA" <?php echo checkOption("dorolho", "NA", $lolh->dorol); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td><fieldset>
			<legend>Acuidade Visual</legend>
			<select name="acuidvis" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('3')">
				<option value="TN" <?php echo checkOption("acuidvis", "TN", $lolh->acvis); ?>>Teste do Olhinho Normal</option>
				<option value="TA" <?php echo checkOption("acuidvis", "TA", $lolh->acvis); ?>>Teste do Olhinho Anormal</option>
				<option value="S" <?php echo checkOption("acuidvis", "S", $lolh->acvis); ?>>Sim</option>
				<option value="N" <?php echo checkOption("acuidvis", "N", $lolh->acvis); ?>>N&atilde;o</option>
				<option value="C" <?php echo checkOption("acuidvis", "C", $lolh->acvis); ?>>Cegueira</option>
				<option value="NA" <?php echo checkOption("acuidvis", "NA", $lolh->acvis); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
  	</tr>
    <tr>
    	<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsolho" cols="70" onkeyup="savCampo('3')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($lolh->obs, $_POST['obsolho']); ?></textarea>
		</fieldset>
	<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
		echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>


	</td>
 	</tr>
</table>
<?php
include("functions/funcoesimpressoes.php");
printAdendoIS($atend); ?>
