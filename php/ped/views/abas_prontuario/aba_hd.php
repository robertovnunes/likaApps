<?php // include_once("controllers/ControllerProntuarioPaciente.php");?>
<fieldset class="full">
	<legend>Diagnósticos/Condutas</legend>
	<table width="560" align="center">
		<tr class="style51">
			<td>Descrição</td>
			<td>Data</td>
			<td colspan="3">Opção</td>
		</tr>
	<form>
	<?php foreach ($listahip as $lhip){ ?>
		<tr class="style51">
			<td><?php echo substr($lhip['hipotese'],0,20);?></td>
			<td><?php echo $fachada->printData($lhip['dthr']) . " às " . $fachada->printHora($lhip['dthr']);?></td>
			<td><a href="javascript:mudaConduta(<?php echo $atend .','. $lhip['idHipotese']; ?>)"><img src="images/conduta.png" ></a></td>
			<td><input style="float:none;" type="image" name="chip" value="Confirmar Hipótese" <?php if($lhip['HipConfirmada'] == 1){ ?> src='images/button_ok.png' <?php }else{?> src="images/button_nok.png"<?php }; ?>onClick="OpcaoHip('<?php echo $lhip['idHipotese'];?>','chip');"  /></td>
			<td><input style="float:none;" type="image" <?php echo $ass; ?> value="Remover Hipótese" name="rhip" src="images/lixo.gif" onClick="OpcaoHip('<?php echo $lhip['idHipotese'];?>','rhip');"  />
			</td>
			<td id="tdHD"><!--Aqui é adicionado o input: Confirmar ou Remover--></td>
		</tr>
	<?php } ?>
		<input type="hidden" name="idhipot" id="idhipot" value="<?php echo (isset($_POST['idhipot']) ? $_POST['idhipot'] : ''); ?>" />
	</table>
</fieldset>

<fieldset class="full">
	<legend id="lblhd" <?php echo (isset($lblhd) ? $lblhd : ''); ?>>Hip&oacute;tese*</legend>
	<textarea name="hipdiag" class="txta1" <?php echo $ass; ?> onFocus="mudaLb(lblhd)" id="inputString" onkeyup="lookup(this.value);savCampo();" onblur="fill();" ><?php echo (isset($hipdiag) ? $hipdiag : ''); ?></textarea>
	<div class="suggestionsBox" id="suggestions" style="display: none;">
		<img src="images/upArrow.png" style="position: relative; top: -12px; left: 30px;" alt="upArrow" />
		<div class="suggestionList" id="autoSuggestionsList">&nbsp;</div>
	</div>
	<div align="center" >
	<div style="width:100%">
		<label>(*) Campos Obrigatórios</label>
	</div>
	<br/>
	<table cellspacing="10" class="style5">
		<tr align="center">
			<td> <input type="submit" <?php echo $ass; ?> value="<?php if ($ass) echo "Hipótese"; else echo $txthip; ?>" name="nhip" /></td>
		</tr>
	</table>
	</div>
</fieldset>