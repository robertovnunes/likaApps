<fieldset class="full">
	<legend>Hip�teses</legend>
	<table width="560" align="center">
		<tr class="style51">
			<td>Hip�tese</td>
			<td>Data</td>
			<td>Op��o</td>
		</tr>
	<?php foreach ($listahip as $lhip){?>
		<tr class="style51">
			<td><?php echo substr($lhip['hipotese'],0,20);?></td>
			<td><?php echo $fachada->printData($lhip['dthr']) . " �s " . $fachada->printHora($lhip['dthr']);?></td>
			<td><input type="image" name="vhip" value="Ver Hip�tese" src="images/button_ok.png" onclick="newIDHip('<?php echo $lhip['idHipotese'];?>');" /><input type="image" <?php echo $ass; ?> value="Remover Hip�tese" name="rhip" src="images/lixo.gif" onclick="newIDHip('<?php echo $lhip['idHipotese'];?>');" /></td>
		</tr>
	<?php } ?>
		<input type=hidden name="idhipot" id="idhipot" value="<?php echo $_POST['idhipot']; ?>" />
	</table>
</fieldset>

<fieldset class="full">
	<legend id="lblhd" <?php echo $lblhd; ?>>Hip&oacute;tese*</legend>
	<textarea name="hipdiag" class="txta1" <?php echo $ass; ?> onFocus="mudaLb(lblhd)" id="inputString" onkeyup="lookup(this.value);savCampo();" onblur="fill();" ><?php echo $hipdiag; ?></textarea>
	<div class="suggestionsBox" id="suggestions" style="display: none;">
		<img src="images/upArrow.png" style="position: relative; top: -12px; left: 30px;" alt="upArrow" />
		<div class="suggestionList" id="autoSuggestionsList">&nbsp;</div>
	</div>
	<div align="center" >
	<div style="width:100%">
		<label>(*) Campos Obrigat�rios</label>
	</div>
	<br/>
	<table cellspacing="10" class="style5">
		<tr align="center">
			<td> <input type="submit" <?php echo $ass; ?> value="<?php if ($ass) echo "Hip�tese"; else echo $txthip; ?>" name="nhip" /></td>
		</tr>
	</table>
	</div>
</fieldset>