<?php
	$lalim = getValuesTablePr('alimentacao',$pront);
?>


<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Pessoal > Alimenta&ccedil;&atilde;o</td>
    	
    </tr>
</table>
<br/>
<table width="570" class="style5">
	<tr>
  	<td width="274"><fieldset style="width:274px">
			<legend>Aleitamento Materno Exclusivo</legend>
			<select name="alimmatexc" onchange="savCampo('4')">
				<option value='-6m' <?php echo checkOption("alimmatexc", "-6m", $lalim->aleitmatexc); ?>>Menos de 6 Meses</option>
				<option value='6m1a' <?php echo checkOption("alimmatexc", "6m1a", $lalim->aleitmatexc);?>>6 Meses a 1 Ano</option>
				<option value='+1a' <?php echo checkOption("alimmatexc", "+1a", $lalim->aleitmatexc); ?>>Mais de 1 Ano</option>
				<option value='N' <?php echo checkOption("alimmatexc", "N", $lalim->aleitmatexc); ?>>N&atilde;o</option>
				<option value='NA' <?php echo checkOption("alimmatexc", "NA", $lalim->aleitmatexc);?>>N&atilde;o Avaliado</option>
	  </select>
		</fieldset></td>
  	<td width="284"><fieldset>
			<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Complementar</legend>
			<select name="alimcomp" onchange="savCampo('4')">
				<option value='-6m' <?php echo checkOption("alimcomp", "-6m", $lalim->alimcomp); ?>>Menos de 6 Meses</option>
				<option value='6m1a' <?php echo checkOption("alimcomp", "6m1a", $lalim->alimcomp); ?>>6 Meses a 1 Ano</option>
				<option value='+1a' <?php echo checkOption("alimcomp", "+1a", $lalim->alimcomp); ?>>Mais de 1 Ano</option>
				<option value='N' <?php echo checkOption("alimcomp", "N", $lalim->alimcomp); ?>>N&atilde;o</option>
				<option value='NA' <?php echo checkOption("alimcomp", "NA", $lalim->alimcomp); ?>>N&atilde;o Avaliado</option>
			</select>
	 </fieldset></td>
 	</tr>
 	<tr>
  	<td><fieldset>
			<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Pastosa</legend>
			<select name="alimpast" onchange="savCampo('4')">
				<option value='-6m' <?php echo checkOption("alimpast", "-6m", $lalim->alimpast); ?>>Menos de 6 Meses</option>
				<option value='6m1a' <?php echo checkOption("alimpast", "6m1a", $lalim->alimpast); ?>>6 Meses a 1 Ano</option>
				<option value='+1a' <?php echo checkOption("alimpast", "+1a", $lalim->alimpast); ?>>Mais de 1 Ano</option>
				<option value='N' <?php echo checkOption("alimpast", "N", $lalim->alimpast); ?>>N&atilde;o</option>
				<option value='NA' <?php echo checkOption("alimpast", "NA", $lalim->alimpast); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
  	<td><fieldset>
			<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Familiar</legend>
			<select name="alimfam" onchange="savCampo('4')">
				<option value='-6m' <?php echo checkOption("alimfam", "-6m", $lalim->alimfam); ?>>Menos de 6 Meses</option>
				<option value='6m1a' <?php echo checkOption("alimfam", "6m1a", $lalim->alimfam); ?>>6 Meses a 1 Ano</option>
				<option value='+1a' <?php echo checkOption("alimfam", "+1a", $lalim->alimfam); ?>>Mais de 1 Ano</option>
				<option value='N' <?php echo checkOption("alimfam", "N", $lalim->alimfam); ?>>N&atilde;o</option>
				<option value='NA' <?php echo checkOption("alimfam", "NA", $lalim->alimfam); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
 	</tr>
	<tr>
		<td><fieldset>
			<legend>Dieta Atual</legend>
			<select name="dietatu" onchange="savCampo('4')">
				<option value='F' <?php echo checkOption("dietatu", "F", $lalim->dietatual); ?>>Familiar</option>
				<option value='E' <?php echo checkOption("dietatu", "E", $lalim->dietatual); ?>>Especial</option>
				<option value='NA' <?php echo checkOption("dietatu", "NA", $lalim->dietatual); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td><fieldset >
			<legend>N&uacute;mero de Refei&ccedil;&otilde;es Di&aacute;rias</legend>
			<select name="refdiarias" onchange="savCampo('4')">
				 <option value='-3' <?php echo checkOption("refdiarias", "-3", $lalim->refdia); ?>>Menos de Tr&ecirc;s</option>
				 <option value='3' <?php echo checkOption("refdiarias", "3", $lalim->refdia); ?>>Tr&ecirc;s</option>
				 <option value='+3' <?php echo checkOption("refdiarias", "+3", $lalim->refdia); ?>>Mais de Tr&ecirc;s</option>
				 <option value='NA' <?php echo checkOption("refdiarias", "NA", $lalim->refdia); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
	</tr>
 	<tr>
  	<td><fieldset >
			<legend>Hor&aacute;rio das Refei&ccedil;&otilde;es</legend>
			<select name="horaref" onchange="savCampo('4')">
				<option value='N' <?php echo checkOption("horaref","N",$lalim->horref);?>>Normal, tr&ecirc;s refei&ccedil;&otilde;es
				</option>
				<option value='HE' <?php echo checkOption("horaref", "HE", $lalim->horref); ?>>Hor&aacute;rio Familiar Especial
				</option>
				<option value='A' <?php echo checkOption("horaref", "A", $lalim->horref); ?>>Aleat&oacute;rio</option>
				<option value='NA' <?php echo checkOption("horaref", "NA", $lalim->horref); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
  	<td><fieldset>
			<legend>Uso da Mamadeira</legend>
			<input name="usomam" type="radio" value="S" onchange="savCampo('4')" 
				<?php echo checkPOST("usomam", "S", $lalim->usomam); ?>/>Sim
			<input name="usomam" type="radio" value="N" onchange="savCampo('4')" 
				<?php echo checkPOST("usomam", "N", $lalim->usomam); ?>/>N&atilde;o
			<input name="usomam" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("usomam", "NA", $lalim->usomam); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
 	<tr>
  	<td><fieldset>
			<legend>Uso de Colher</legend>
			<input name="colher" type="radio" value="S" onchange="savCampo('4')"
				<?php echo checkPOST("colher", "S", $lalim->usocolh); ?>/>Sim
			<input name="colher" type="radio" value="N" onchange="savCampo('4')"
				<?php echo checkPOST("colher", "N", $lalim->usocolh); ?>/>N&atilde;o
			<input name="colher" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("colher", "NA", $lalim->usocolh); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	<td><fieldset>
			<legend>Uso de Copo</legend>
			<input name="copo" type="radio" value="S" onchange="savCampo('4')"
				<?php echo checkPOST("copo", "S", $lalim->usocopo); ?>/>Sim
			<input name="copo" type="radio" value="N" onchange="savCampo('4')"
				<?php echo checkPOST("copo", "N", $lalim->usocopo); ?>/>N&atilde;o
			<input name="copo" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("copo", "NA", $lalim->usocopo); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
 	<tr>
  	<td><fieldset>
			<legend>Alimenta&ccedil;&atilde;o Pastosa Liquidificada</legend>
			<input name="alimpastliq" type="radio" value="S" onchange="savCampo('4')"
				<?php echo checkPOST("alimpastliq", "S", $lalim->alimpastliq); ?>/>Sim
			<input name="alimpastliq" type="radio" value="N" onchange="savCampo('4')"
				<?php echo checkPOST("alimpastliq", "N", $lalim->alimpastliq); ?>/>N&atilde;o
			<input name="alimpastliq" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("alimpastliq", "NA", $lalim->alimpastliq); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	<td><fieldset>
			<legend>Uso de Chantagem Afetiva</legend>
			<input name="chantafet" type="radio" value="S" onchange="savCampo('4')"
				<?php echo checkPOST("chantafet", "S", $lalim->chantafet); ?>/>Sim
			<input name="chantafet" type="radio" value="N" onchange="savCampo('4')"
				<?php echo checkPOST("chantafet", "N", $lalim->chantafet); ?>/>N&atilde;o
			<input name="chantafet" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("chantafet", "NA", $lalim->chantafet); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
 	<tr>
  	<td colspan="2"><fieldset style="width:274px">
			<legend>Brincadeira na Hora das Refei&ccedil;&otilde;es</legend>
			<input name="brincref" type="radio" value="S" onchange="savCampo('4')"
				<?php echo checkPOST("brincref", "S", $lalim->brincref); ?>/>Sim
			<input name="brincref" type="radio" value="N" onchange="savCampo('4')"
				<?php echo checkPOST("brincref", "N", $lalim->brincref); ?>/>N&atilde;o
			<input name="brincref" type="radio" value="NA" onchange="savCampo('4')"
				<?php echo checkPOST("brincref", "NA", $lalim->brincref); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
 	<tr>
  	<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsaliment" cols="70" onkeyup="savCampo('4')"><?php echo printOBS($lalim->obs, $_POST['obsaliment']); ?></textarea>
		</fieldset></td>
 	</tr>
</table>