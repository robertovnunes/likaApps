<?php
	$lepele = getValuesTableAt('examepele',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Geral > Pele e Mucosas</td>
    </tr>
</table><br />
<table width="580">
  <tr>
    <td width="275"><fieldset style="width:275px">
      <legend>Cor</legend>
      <select name="corpele" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('2')">
        <option value="Co" <?php echo checkOption("corpele", "C", $lepele->cor); ?>>Corado</option>
        <option value="P" <?php echo checkOption("corpele", "P", $lepele->cor); ?>>P&aacute;lida</option>
        <option value="Ci" <?php echo checkOption("corpele", "Ci", $lepele->cor); ?>>Cian&oacute;tica</option>
        <option value="I" <?php echo checkOption("corpele", "I", $lepele->cor); ?>>Ict&eacute;rica</option>
        <option value="NA" <?php echo checkOption("corpele", "NA", $lepele->cor); ?>>N&atilde;o Avaliado</option>
      </select>
    </fieldset></td>
    <td width="293"><fieldset>
      <legend>Umidade</legend>
      <select name="umidpele" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('2')">
        <option value="H" <?php echo checkOption("umidpele", "H", $lepele->umid); ?>>Hidratada</option>
        <option value="U" <?php echo checkOption("umidpele", "U", $lepele->umid); ?>>&Uacute;mida</option>
        <option value="S" <?php echo checkOption("umidpele", "S", $lepele->umid); ?>>Seca</option>
        <option value="NA" <?php echo checkOption("umidpele", "NA", $lepele->umid); ?>>N&atilde;o Avaliado</option>
   	  </select>
   	</fieldset></td>
  </tr>
  	<tr>
    	<td width="275"><fieldset>
      		<legend>Temperatura</legend>
      		<select name="temppele" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('2')">
        		<option value="N" <?php echo checkOption("temppele", "N", $lepele->temp); ?>>Normal</option>
        		<option value="Q" <?php echo checkOption("temppele", "Q", $lepele->temp); ?>>Quente</option>
        		<option value="F" <?php echo checkOption("temppele", "F", $lepele->temp); ?>>Fria</option>
        		<option value="NA" <?php echo checkOption("temppele", "NA", $lepele->temp); ?>>N&atilde;o Avaliado</option>
      		</select>
   	  </fieldset></td>
    	<td><fieldset>
    		<legend>Cicatrizes</legend>
     		<input name="cicatriz" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cicatriz", "P", $lepele->cicat);?> />Presentes
      <input name="cicatriz" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cicatriz", "A", $lepele->cicat);?>/>Ausentes
      <input name="cicatriz" type="radio" value="NA" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cicatriz", "NA", $lepele->cicat);?>/>N&atilde;o Avaliado
    </fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
	  		<legend>Hemorragias</legend>
	  		<input name="hemorr" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hemorr", "P", $lepele->hemor);?>/>Presentes
	  		<input name="hemorr" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hemorr", "A", $lepele->hemor);?>/>Ausentes
	  		<input name="hemorr" type="radio" value="NA" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hemorr", "NA", $lepele->hemor);?>/>N&atilde;o Avaliado
  	  	</fieldset></td>
		<td><fieldset>
	  		<legend>Rash</legend>
	  		<input name="rash" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rash", "P", $lepele->rash);?>/>Presente
	  		<input name="rash" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rash", "A", $lepele->rash);?>/>Ausente
	  		<input name="rash" type="radio" value="NA" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rash", "NA", $lepele->rash);?>/>N&atilde;o Avaliado
  	  	</fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
	  		<legend>Circula&ccedil;&atilde;o Colateral</legend>
	  		<input name="circcol" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circcol", "P", $lepele->circcol);?>/>Presente
	  		<input name="circcol" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circcol", "A", $lepele->circcol);?>/>Ausente
	  		<input name="circcol" type="radio" value="NA" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circcol", "NA", $lepele->circcol);?>/>N&atilde;o Avaliado
  	  	</fieldset></td>
		<td><fieldset>
	  		<legend>Edema</legend>
	  		<select name="edemapele" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('2')">
				<option value="A" <?php echo checkOption("edemapele", "A", $lepele->edema); ?>>Ausente</option>
				<option value="M" <?php echo checkOption("edemapele", "M", $lepele->edema); ?>>MMII</option>
				<option value="P" <?php echo checkOption("edemapele", "P", $lepele->edema); ?>>Periorbital</option>
				<option value="An" <?php echo checkOption("edemapele", "An", $lepele->edema); ?>>Anasarca</option>
				<option value="NA" <?php echo checkOption("edemapele", "NA", $lepele->edema); ?>>N&atilde;o Avaliado</option>
	  		</select>
  	  </fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Unhas</legend>
			<table width="555">
				<tr>
					<td><fieldset>
						<legend>Consist&ecirc;ncia</legend>
						<select name="consun" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('2')">
							<option value="N" <?php echo checkOption("consun", "N", $lepele->consun);?>>Normal</option>
							<option value="Q" <?php echo checkOption("consun", "Q",$lepele->consun);?>>Quebradi&ccedil;a</option>
							<option value="E" <?php echo checkOption("consun", "E", $lepele->consun);?>>Endurecida</option>
							<option value="NA" <?php echo checkOption("consun", "NA", $lepele->consun);?>>N&atilde;o Avaliado							</option>
						</select>
					</fieldset></td>
					<td width="272"><fieldset>
						<legend>Deformidades</legend>
						<input name="defun" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("defun", "P", $lepele->deformun);?>/>Presentes
						<input name="defun" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("defun", "A", $lepele->deformun);?>/>Ausentes
						<input name="defun" type="radio" value="NA" onChange="savCampo('2')"<?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("defun", "NA", $lepele->deformun);?>/>N&atilde;o Avaliado
			  	  </fieldset></td>
				</tr>
				<tr>
					<td><fieldset>
						<legend>Manchas</legend>
						<input name="mancun" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("mancun", "P", $lepele->mancun); ?>/>Presentes
						<input name="mancun" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("mancun", "A", $lepele->mancun); ?>/>Ausentes
						<input name="mancun" type="radio" value="NA" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("mancun", "NA", $lepele->mancun); ?>/>N&atilde;o Avaliado
					</fieldset></td>
					<td><fieldset>
						<legend>Inflama&ccedil;&otilde;es </legend>
						<input name="influn" type="radio" value="P" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("influn", "P", $lepele->inflamun);?>/>Presentes
						<input name="influn" type="radio" value="A" onChange="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("influn", "A", $lepele->inflamun);?>/>Ausentes
						<input name="influn" type="radio" value="NA" onChange="savCampo('2')"<?php if(EXAssinado($atend)) echo " disabled=true ";
							echo checkPOST("influn", "NA", $lepele->inflamun);?>/>N&atilde;o Avaliado
					</fieldset></td>
				</tr>
		</table>
		</fieldset></td>
  	</tr>
  	<tr>
		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsepele" cols="68" onKeyUp="savCampo('2')" <?php if(EXAssinado($atend)) echo " disabled=true ";?>
				><?php echo printOBS($lepele->obs, $_POST['obsepele']); ?></textarea>
		</fieldset>		
		<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>	</td>
	</tr>
</table>
