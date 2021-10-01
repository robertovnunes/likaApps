<?php
	$lersp = getValuesTableAt('exameresp',$atend);
		include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame F�sico > Especial > Respirat&oacute;rio</td>
    </tr>
</table>

<br />

<table width="580">
	<tr>
		<td width="276"><fieldset>
			<legend>Forma do T&oacute;rax</legend>
			<select name="formtor" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
				<option value="N" <?php echo checkOption("formtor", "N", $lersp->formtrx); ?>>Normal</option>
				<option value="B" <?php echo checkOption("formtor", "B", $lersp->formtrx); ?>>Em &quot;Barril&quot;</option>
				<option value="PP" <?php echo checkOption("formtor", "PP",$lersp->formtrx);?>>Em &quot;peito de pombo&quot;</option>
				<option value="A" <?php echo checkOption("formtor", "A", $lersp->formtrx); ?>>Outra Altera&ccedil;&atilde;o</option>
				<option value="NA" <?php echo checkOption("formtor","NA",$lersp->formtrx);?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
		<td width="292"><fieldset>
			<legend>Simetria do T&oacute;rax</legend>
			<select name="simtor" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
               	<option value="S" <?php echo checkOption("simtor", "S", $lersp->simtrx); ?>>Sim&eacute;trico</option>
               	<option value="A" <?php echo checkOption("simtor", "A",$lersp->simtrx);?>>Assim&eacute;trico</option>
               	<option value="NA" <?php echo checkOption("simtor", "NA", $lersp->simtrx); ?>>N&atilde;o Avaliado</option>
            </select>
	  </fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Contornos</legend>
			<select name="contorn" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
              <option value="N" <?php echo checkOption("contorn", "N", $lersp->contorn); ?>>Normal</option>
              <option value="Al" <?php echo checkOption("contorn", "Al", $lersp->contorn); ?>>Alterados</option>
              <option value="NA" <?php echo checkOption("contorn","NA",$lersp->contorn);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Proemin&ecirc;ncias</legend>
			<input name="proem" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("proem", "P", $lersp->proemi); ?>/>Presentes
            <input name="proem" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("proem", "A", $lersp->proemi); ?>/>Ausentes
            <input name="proem" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("proem", "NA", $lersp->proemi); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Massas Anormais</legend>
			<input name="masanorrsp" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("masanorrsp", "P", $lersp->masanor); ?>/>Presentes
            <input name="masanorrsp" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("masanorrsp", "A", $lersp->masanor); ?>/>Ausentes
            <input name="masanorrsp" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("masanorrsp", "NA", $lersp->masanor); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Mamas</legend>
			<select name="mamasrsp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('A')">
            	<option value="N" <?php echo checkOption("mamasrsp", "N", $lersp->mamas); ?>>Normal</option>
            	<option value="A" <?php echo checkOption("mamasrsp", "A", $lersp->mamas); ?>>Aumentadas</option>
            	<option value="D" <?php echo checkOption("mamasrsp", "D", $lersp->mamas); ?>>Diminu&iacute;das</option>
            	<option value="PM" <?php echo checkOption("mamasrsp", "PM", $lersp->mamas); ?>>
			  		Presen&ccedil;a de Massa/Tumora&ccedil;&atilde;o</option>
              	<option value="NA" <?php echo checkOption("mamasrsp","NA",$lersp->mamas);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Tipo de respira&ccedil;&atilde;o</legend>
			<select name="tresp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
              <option value="N" <?php echo checkOption("tresp", "N", $lersp->tresp); ?>>Normal</option>
              <option value="D" <?php echo checkOption("tresp", "D", $lersp->tresp); ?>>Dispn&eacute;ia</option>
              <option value="CS" <?php echo checkOption("tresp", "CS", $lersp->tresp); ?>>Cheyne-Stokes</option>
              <option value="B" <?php echo checkOption("tresp", "B", $lersp->tresp); ?>>Biot</option>
              <option value="K" <?php echo checkOption("tresp", "K", $lersp->tresp); ?>>Kussmaul</option>
              <option value="S" <?php echo checkOption("tresp", "S", $lersp->tresp); ?>>Suspirosa</option>
              <option value="NA" <?php echo checkOption("tresp","NA",$lersp->tresp);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Tiragem Intercostal</legend>
			<input name="tirint" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tirint", "P", $lersp->tirintc); ?>/>Presente
            <input name="tirint" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tirint", "A", $lersp->tirintc); ?>/>Ausente
            <input name="tirint" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tirint", "NA", $lersp->tirintc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td width="276"><fieldset>
			<legend>Freq&uuml;&ecirc;ncia Respirat&oacute;ria</legend>
			<select name="freqresp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
				<option value="N" <?php echo checkOption("freqresp", "N", $lersp->frqrespa); ?>>Normal</option>
				<option value="D" <?php echo checkOption("freqresp", "D", $lersp->frqrespa); ?>>Diminu&iacute;da</option>
				<option value="A" <?php echo checkOption("freqresp", "A", $lersp->frqrespa); ?>>Aumentada</option>
				<option value="NA" <?php echo checkOption("freqresp","NA",$lersp->frqrespa);?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
		<td width="292"><fieldset>
			<legend>Fr&ecirc;mito T&oacute;raco-vocal</legend>
			<select name="fremtrvc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
				<option value="N" <?php echo checkOption("fremtrvc", "N", $lersp->fremvoc); ?>>Presente e normal</option>
				<option value="PD" <?php echo checkOption("fremtrvc", "PD", $lersp->fremvoc);?>>Presente e diminu&iacute;do</option>
				<option value="PA" <?php echo checkOption("fremtrvc", "PA", $lersp->fremvoc); ?>>Presente e aumentado</option>
				<option value="A" <?php echo checkOption("fremtrvc", "A", $lersp->fremvoc); ?>>Ausente</option>
				<option value="NA" <?php echo checkOption("fremtrvc","NA",$lersp->fremvoc);?>>N&atilde;o Avaliado</option>
            </select>
	  </fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Fr&ecirc;mito Br&ocirc;nquico</legend>
			<input name="frembronq" type="radio" value="P" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frembronq", "P", $lersp->frembron); ?>/>Presente
            <input name="frembronq" type="radio" value="A" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frembronq", "A", $lersp->frembron); ?>/>Ausente
            <input name="frembronq" type="radio" value="NA" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frembronq", "NA", $lersp->frembron); ?>/>N&atilde;o Avaliado
        </fieldset></td>
		<td><fieldset>
			<legend>Fr&ecirc;mito pleural</legend>
			<input name="frempleu" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frempleu", "P", $lersp->frempleu); ?>/>Presente
            <input name="frempleu" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frempleu", "A", $lersp->frempleu); ?>/>Ausente
            <input name="frempleu" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("frempleu", "NA", $lersp->frempleu); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
	<tr>
		<td><fieldset>
			<legend>Submacicez normal</legend>
			<select name="submac" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
              <option value="AH" <?php echo checkOption("submac", "AH", $lersp->submac); ?>>Em ambos hemi-t&oacute;rax</option>
              <option value="HE" <?php echo checkOption("submac","HE",$lersp->submac);?>>Somente hemi-t&oacute;rax esquerdo</option>
              <option value="HD" <?php echo checkOption("submac","HD",$lersp->submac);?>>Somente hemi-t&oacute;rax direito</option>
              <option value="A" <?php echo checkOption("submac", "A", $lersp->submac); ?>>Ausente</option>
              <option value="NA" <?php echo checkOption("submac","NA",$lersp->submac);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Macicez</legend>
			<select name="macic" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('A')">
              <option value="AH" <?php echo checkOption("macic", "AH", $lersp->macic); ?>>Em ambos hemi-t&oacute;rax</option>
              <option value="HE" <?php echo checkOption("macic", "HE", $lersp->macic);?>>Somente hemi-t&oacute;rax esquerdo</option>
              <option value="HD" <?php echo checkOption("macic", "HD", $lersp->macic);?>>Somente hemi-t&oacute;rax direito</option>
              <option value="A" <?php echo checkOption("macic", "A", $lersp->macic); ?>>Ausente</option>
              <option value="NA" <?php echo checkOption("macic","NA",$lersp->macic);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
  	</tr>
	<tr>
		<td width="276"><fieldset>
			<legend>Timp&acirc;nico</legend>
			<select name="timpan" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
              <option value="AH" <?php echo checkOption("timpan", "AH", $lersp->timpan); ?>>Em ambos hemi-t&oacute;rax</option>
              <option value="HE" <?php echo checkOption("timpan","HE",$lersp->timpan);?>>Somente hemi-t&oacute;rax esquerdo</option>
              <option value="HD" <?php echo checkOption("timpan", "HD",$lersp->timpan);?>>Somente hemi-t&oacute;rax direito</option>
              <option value="A" <?php echo checkOption("timpan", "A", $lersp->timpan); ?>>Ausente</option>
              <option value="NA" <?php echo checkOption("timpan","NA",$lersp->timpan);?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
		<td width="292"><fieldset>
			<legend>Murm&uacute;rios Vesiculares</legend>
			<select name="murves" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('A')">
              <option value="AH" <?php echo checkOption("murves","AH",$lersp->murmvesic); ?>>Em ambos hemi-t&oacute;rax</option>
              <option value="HE" <?php echo checkOption("murves","HE", $lersp->murmvesic); ?>>Somente hemi-t&oacute;rax esquerdo
			  </option>
              <option value="HD" <?php echo checkOption("murves", "HD", $lersp->murmvesic); ?>>Somente hemi-t&oacute;rax direito
			  </option>
              <option value="A" <?php echo checkOption("murves", "A", $lersp->murmvesic); ?>>Ausente</option>
              <option value="NA" <?php echo checkOption("murves","NA",$lersp->murmvesic);?>>N&atilde;o Avaliado</option>            </select>
	  </fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Estertores / Crepita&ccedil;&otilde;es</legend>
			<input name="estert" type="radio" value="P" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estert", "P", $lersp->estert); ?>/>Presentes
            <input name="estert" type="radio" value="A" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estert", "A", $lersp->estert); ?>/>Ausentes
            <input name="estert" type="radio" value="NA" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estert", "NA", $lersp->estert); ?>/>N&atilde;o Avaliado
        </fieldset></td>
		<td><fieldset>
			<legend>Estridores</legend>
			<input name="estrid" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estrid", "P", $lersp->estrid); ?>/>Presentes
            <input name="estrid" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estrid", "A", $lersp->estrid); ?>/>Ausentes
            <input name="estrid" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("estrid", "NA", $lersp->estrid); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Sibilos</legend>
			<input name="sibilos" type="radio" value="P" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sibilos", "P", $lersp->sibil); ?>/>Presentes
            <input name="sibilos" type="radio" value="A" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sibilos", "A", $lersp->sibil); ?>/>Ausentes
            <input name="sibilos" type="radio" value="NA" onchange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sibilos", "NA", $lersp->sibil); ?>/>N&atilde;o Avaliado
        </fieldset></td>
		<td><fieldset>
			<legend>Atrito Pleural</legend>
			<input name="atpleu" type="radio" value="P" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("atpleu", "P", $lersp->atrpleu); ?>/>Presente
            <input name="atpleu" type="radio" value="A" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("atpleu", "A", $lersp->atrpleu); ?>/>Ausente
            <input name="atpleu" type="radio" value="NA" onChange="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("atpleu", "NA", $lersp->atrpleu); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsresp" cols="68" onKeyUp="savCampo('A')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($lersp->obs, $_POST['obsresp']); ?></textarea>
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