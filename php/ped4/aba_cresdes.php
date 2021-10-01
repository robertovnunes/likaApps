<?php
	$lcd = getValuesTablePr('crescimento',$pront);
?>
<table width="570" class="style5">
	<tr>
    	<td><fieldset>
			<legend>Rela&ccedil;&atilde;o com os Irm&atilde;os</legend>
			<textarea name="relirm" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->relirm, $_POST['relirm']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset style="width:274px;">
			<legend>Idade que Foi &agrave; Escola</legend>
			<select name="idadesc" onchange="savCampo('5')">
				<option value='610' <?php echo checkOption("idadesc", "610", $lcd->idadesc); ?>>Entre 6 e 10 anos</option>
				<option value='-6' <?php echo checkOption("idadesc", "-6", $lcd->idadesc); ?>>Antes dos 6 anos</option>
				<option value='+10' <?php echo checkOption("idadesc", "+10", $lcd->idadesc); ?>>Depois dos 10 anos</option>
				<option value='NF' <?php echo checkOption("idadesc", "NF", $lcd->idadesc); ?>>N&atilde;o foi</option>
				<option value='NA' <?php echo checkOption("idadesc", "NA", $lcd->idadesc); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
  	</tr>
	<tr>
    	<td><fieldset>
			<legend>Aprendizado</legend>
			<textarea name="aprend" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->aprend, $_POST['aprend']);?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Repet&ecirc;ncia de Ano</legend>
			<textarea name="repetano" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->repetano, $_POST['repetano']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Relacionamento com Colegas e Professores</legend>
			<textarea name="relacol" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->relac, $_POST['relacol']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Particularidades da Fala</legend>
			<textarea name="particfala" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->partfala, $_POST['particfala']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Erup&ccedil;&atilde;o e Mudan&ccedil;a Dent&aacute;ria</legend>
			<textarea name="muddent" cols="80" onkeyup="savCampo('5')" ><?php echo printOBS($lcd->muddent, $_POST['muddent']); ?></textarea>
		</fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obscrescdes" cols="80" onkeyup="savCampo('5')"><?php echo printOBS($lcd->obs, $_POST['obscrescdes']);?></textarea>
		</fieldset></td>
	</tr>
</table>
