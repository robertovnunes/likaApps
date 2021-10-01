<?php
	$lnat = getValuesTablePr('natal',$pront);
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Pessoal > Natal</td>
    	
    </tr>
</table>
<br/>
<table width="570" class="style5">
	<tr>
    	<td width="207"><fieldset>
			<legend>Tipo de Gravidez</legend>
			<select name="tipograv" onchange="savCampo('2')">
				<option value='S' <?php echo checkOption("tipograv", "S", $lnat->tgrav); ?>>Simples</option>
				<option value='M' <?php echo checkOption("tipograv", "M", $lnat->tgrav); ?>>M&uacute;ltipla</option>
				<option value='NA' <?php echo checkOption("tipograv", "NA", $lnat->tgrav); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset>
  	  <td width="171"><fieldset>
			<legend>Tipo de Parto</legend>
			<select name="tipoparto" onchange="savCampo('2')">
				<option value='E' <?php echo checkOption("tipoparto", "E", $lnat->tparto); ?>>Espont&acirc;neo</option>
				<option value='I' <?php echo checkOption("tipoparto", "I", $lnat->tparto); ?>>Instrumental</option>
				<option value='C' <?php echo checkOption("tipoparto", "C", $lnat->tparto); ?>>Cir&uacute;rgico</option>
				<option value='NA' <?php echo checkOption("tipoparto", "NA", $lnat->tparto); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset>
  	  <td width="176"><fieldset>
			<legend>Tipo de Apresenta&ccedil;&atilde;o</legend>
			<select name="tipoapres" onchange="savCampo('2')">
				<option value='C' <?php echo checkOption("tipoapres", "C", $lnat->tapres); ?>>Cef&aacute;lica</option>
				<option value='P' <?php echo checkOption("tipoapres", "P", $lnat->tapres); ?>>P&eacute;lvica</option>
				<option value='O' <?php echo checkOption("tipoapres", "O", $lnat->tapres); ?>>Outra</option>
				<option value='NA' <?php echo checkOption("tipoapres", "NA", $lnat->tapres); ?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
	</tr>
  	<tr>
		<td><fieldset>
			<legend id="lbltrpart" <?php if ($errnt && !validaHora($_POST['durtrabparto'])){ echo 'class="erro"'; }?>>
				Dura&ccedil;&atilde;o Trabalho de Parto</legend>
			<input name="durtrabparto" size="6" maxlength="5" onkeyup="savCampo('2')" value="<?php echo printCampo($lnat->durparto, $_POST['durtrabparto']);?>" onfocus="mudaLb(lbltrpart)" onkeypress="mascara(this,4)"/> (hh:mm)
		</fieldset></td>
		<td colspan="2"><fieldset>
			<legend>Anestesia</legend>
			<input name="anestesia" type="radio" value="S" onchange="savCampo('2')" 
				<?php echo checkPOST("anestesia", "S", $lnat->anest); ?>/>Sim
			<input name="anestesia" type="radio" value="N" onchange="savCampo('2')" 
				<?php echo checkPOST("anestesia", "N", $lnat->anest); ?>/>N&atilde;o
			<input name="anestesia" type="radio" value="NA" onchange="savCampo('2')" 
				<?php echo checkPOST("anestesia", "NA", $lnat->anest); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
			<legend id="lblanalg" <?php if ($errnt && !$linha->ass && $_POST['analgesia'] == "")?>>
				Analgesia</legend>
			<textarea name="analgesia" cols="70" onkeyup="savCampo('2')" onfocus="mudaLb(lblanalg)"><?php echo printOBS($lnat->analg,$_POST['analgesia']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
		<td colspan="3"><fieldset>
			<legend id="lblcomp" <?php if ($errnt && $_POST['comparto'] == "S" && $_POST['tcomparto'] == "") echo 'class="erro"';?>>
				Complica&ccedil;&otilde;es</legend>
			<input name="comparto" type="radio" value="S" onclick="habilitaCompParto(1); mudaLb(lblcomp)" onchange="savCampo('2')"
				<?php echo checkPOST("comparto", "S", $lnat->compl); ?>/>Sim
			<input name="comparto" type="radio" value="N" onclick="habilitaCompParto(0); mudaLb(lblcomp)" onchange="savCampo('2')"
				<?php echo checkPOST("comparto", "N", $lnat->compl); ?>/>N&atilde;o
			<input name="comparto" type="radio" value="NA" onclick="habilitaCompParto(0); mudaLb(lblcomp)" onchange="savCampo('2')" 
				<?php echo checkPOST("comparto", "NA", $lnat->compl); ?>/>N&atilde;o Avaliado
			<br />
			<textarea name="tcomparto" cols="70" onkeyup="savCampo('2')" onfocus="mudaLb(lblcomp)" 
				<?php echo checkDisable("comparto", $lnat->compl, "S"); ?>
				><?php echo printOBS($lnat->tcompl, $_POST['tcomparto']); ?></textarea>
		</fieldset></td>
	</tr>
	<tr>
    	<td colspan="3"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsnatal" cols="70" onkeyup="savCampo('2')"><?php echo printOBS($lnat->obs, $_POST['obsnatal']); ?></textarea>
		</fieldset></td>
  	</tr>
</table>