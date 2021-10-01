<?php
	$lepes = getValuesTableAt('examepescoco',$atend);
	include("verAssEx.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Pesco&ccedil;o</td>
    </tr>
</table>

<br />

<table width="580">
	<tr>
		<td width="275"><fieldset style="width:275px">
			<legend>Retra&ccedil;&otilde;es </legend>
			<input name="retrpesc" type="radio" value="P" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("retrpesc", "P", $lepes->retr); ?>/>Presentes
            <input name="retrpesc" type="radio" value="A" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("retrpesc", "A", $lepes->retr); ?>/>Ausentes
            <input name="retrpesc" type="radio" value="NA" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("retrpesc", "NA", $lepes->retr); ?>/>N&atilde;o Avaliado
	  	</fieldset></td>
		<td width="278"><fieldset>
			<legend>Torcicolo</legend>
			<input name="torcpesc" type="radio" value="P" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("torcpesc", "P", $lepes->torc); ?>/>Presente
            <input name="torcpesc" type="radio" value="A" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("torcpesc", "A", $lepes->torc); ?>/>Ausente
            <input name="torcpesc" type="radio" value="NA" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("torcpesc", "NA", $lepes->torc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td width="275"><fieldset>
			<legend>Clav&iacute;culas</legend>
			<select name="clavpesc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('9')">
				<option value="N" <?php echo checkOption("clavpesc", "N", $lepes->clav); ?>>Normal</option>
				<option value="Al" <?php echo checkOption("clavpesc", "Al", $lepes->clav); ?>>Alteradas</option>
				<option value="Au" <?php echo checkOption("clavpesc", "Au", $lepes->clav); ?>>Ausentes</option>
				<option value="NA" <?php echo checkOption("clavpesc","NA",$lepes->clav);?>>N&atilde;o Avaliado</option>
			</select>
	  	</fieldset></td>
		<td width="278"><fieldset>
			<legend>Tire&oacute;ide (aumento, massas, consist&ecirc;ncia)</legend>
			<select name="tirepesc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('9')">
               	<option value="N" <?php echo checkOption("tirepesc", "N", $lepes->tireo); ?>>Normal</option>
               	<option value="Au" <?php echo checkOption("tirepesc", "Au",$lepes->tireo);?>>Consist&ecirc;ia Aumentada</option>
               	<option value="Al" <?php echo checkOption("tirepesc", "Al", $lepes->tireo); ?>>Ausente</option>
               	<option value="NA" <?php echo checkOption("tirepesc", "NA", $lepes->tireo); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
		<td width="275"><fieldset>
			<legend>Outras massas tumorais</legend>
			<input name="mastum" type="radio" value="P" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastum", "P", $lepes->masstum); ?>/>Presentes
            <input name="mastum" type="radio" value="A" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastum", "A", $lepes->masstum); ?>/>Ausentes
            <input name="mastum" type="radio" value="NA" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastum", "NA", $lepes->masstum); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td width="278"><fieldset>
			<legend>F&iacute;stulas</legend>
			<input name="fistpesc" type="radio" value="P" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("fistpesc", "P", $lepes->fist); ?>/>Presentes
            <input name="fistpesc" type="radio" value="A" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("fistpesc", "A", $lepes->fist); ?>/>Ausentes
            <input name="fistpesc" type="radio" value="NA" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("fistpesc", "NA", $lepes->fist); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td width="275"><fieldset>
			<legend>Rigidez</legend>
			<input name="rigidpesc" type="radio" value="P" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidpesc", "P", $lepes->rigid); ?>/>Presente
            <input name="rigidpesc" type="radio" value="A" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidpesc", "A", $lepes->rigid); ?>/>Ausente
            <input name="rigidpesc" type="radio" value="NA" onchange="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidpesc", "NA", $lepes->rigid); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td width="278"><fieldset>
			<legend>Fossa supra-clavicular</legend>
			<select name="fosspesc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('9')">
               	<option value="N" <?php echo checkOption("fosspesc", "N", $lepes->fossupclav); ?>>Normal</option>
               	<option value="A+" <?php echo checkOption("fosspesc", "A+", $lepes->fossupclav); ?>>Aumentada</option>
               	<option value="A" <?php echo checkOption("fosspesc", "A", $lepes->fossupclav); ?>>Ausente</option>
               	<option value="NA" <?php echo checkOption("fosspesc", "NA", $lepes->fossupclav); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obspesc" cols="68" onkeyup="savCampo('9')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($lepes->obs, $_POST['obspesc']); ?></textarea>
	  </fieldset>
	<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>
</td>
	</tr>
</table>
