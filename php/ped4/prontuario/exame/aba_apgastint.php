<?php
	$legt = getValuesTableAt('examegastint',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Gastro-Intestinal</td>
    </tr>
</table>

<br />

<table width="580">
	<tr>
		<td width="276"><fieldset>
			<legend>Forma do Abd&ocirc;men</legend>
			<select name="formabd" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
				<option value="N" <?php echo checkOption("formabd", "N", $legt->formabd); ?>>Normal</option>
				<option value="A" <?php echo checkOption("formabd", "A", $legt->formabd); ?>>Abaulado</option>
				<option value="R" <?php echo checkOption("formabd", "R", $legt->formabd); ?>>Retra&iacute;do</option>
				<option value="NA" <?php echo checkOption("formabd","NA",$legt->formabd);?>>N&atilde;o Avaliado</option>
			</select>
  	  	</fieldset></td>
		<td width="292"><fieldset>
			<legend>Cicatriz Umbilical</legend>
			<select name="cicumb" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
               	<option value="S" <?php echo checkOption("cicumb", "N", $legt->cicumb); ?>>Normal</option>
               	<option value="A" <?php echo checkOption("cicumb", "P", $legt->cicumb);?>>Protrusa</option>
               	<option value="NA" <?php echo checkOption("cicumb", "NA", $legt->cicumb); ?>>N&atilde;o Avaliado</option>
            </select>
	  	</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Peristaltismo</legend>
			<select name="peristal" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("peristal", "N", $legt->perist); ?>>Normal</option>
              <option value="A" <?php echo checkOption("peristal", "A", $legt->perist); ?>>Alterado</option>
              <option value="NA" <?php echo checkOption("peristal","NA",$legt->perist);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Distens&atilde;o</legend>
			<input name="distens" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("distens", "P", $legt->disten); ?>/>Presente
            <input name="distens" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("distens", "A", $legt->disten); ?>/>Ausente
            <input name="distens" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("distens", "NA", $legt->disten); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Tumora&ccedil;&otilde;es</legend>
			<input name="tumorgt" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumorgt", "P", $legt->tumora); ?>/>Presente
            <input name="masanor" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumorgt", "A", $legt->tumora); ?>/>Ausente
            <input name="tumorgt" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumorgt", "NA", $legt->tumora); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Ondas Fluidas</legend>
			<input name="ondfluid" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ondfluid", "P", $legt->ondflui); ?>/>Presentes
            <input name="ondfluid" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ondfluid", "A", $legt->ondflui); ?>/>Ausentes
            <input name="ondfluid" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ondfluid", "NA", $legt->ondflui); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Timpanismo</legend>
			<select name="timpgt" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("timpgt", "N", $legt->timpan); ?>>Normal</option>
              <option value="A" <?php echo checkOption("timpgt", "A", $legt->timpan); ?>>Alterado</option>
              <option value="NA" <?php echo checkOption("timpgt","NA",$legt->timpan);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Estado das Paredes Musculares</legend>
			<select name="parmusc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("parmusc", "N", $legt->paremusc); ?>>Normal</option>
              <option value="A" <?php echo checkOption("parmusc", "A", $legt->paremusc); ?>>Alteradas</option>
              <option value="NA" <?php echo checkOption("parmusc","NA",$legt->paremusc);?>>N&atilde;o Avaliado</option>
            </select>			
		</fieldset></td>
	</tr>
	<tr>
		<td width="276"><fieldset>
			<legend>Espasmos</legend>
			<input name="espasmo" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espasmo", "P", $legt->espasm); ?>/>Presentes
            <input name="espasmo" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espasmo", "A", $legt->espasm); ?>/>Ausentes
            <input name="espasmo" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espasmo", "NA", $legt->espasm); ?>/>N&atilde;o Avaliado
  	  </fieldset></td>
		<td width="292"><fieldset>
			<legend>Rigidez</legend>
			<input name="rigidgt" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidgt", "P", $legt->rigid); ?>/>Presentes
            <input name="rigidgt" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidgt", "A", $legt->rigid); ?>/>Ausentes
            <input name="rigidgt" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rigidgt", "NA", $legt->rigid); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Dor</legend>
			<input name="dorgt" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorgt", "P", $legt->dor); ?>/>Presente
            <input name="dorgt" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorgt", "A", $legt->dor); ?>/>Ausente
            <input name="dorgt" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorgt", "NA", $legt->dor); ?>/>N&atilde;o Avaliado
        </fieldset></td>
		<td><fieldset>
			<legend>Est&ocirc;mago</legend>
			<select name="estomago" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("estomago", "N", $legt->estom); ?>>Normal</option>
              <option value="A" <?php echo checkOption("estomago", "A", $legt->estom); ?>>Alterado</option>
              <option value="NA" <?php echo checkOption("estomago","NA",$legt->estom);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
 	</tr>
	<tr>
		<td><fieldset>
			<legend>F&iacute;gado</legend>
			<select name="figado" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("figado", "N", $legt->figado); ?>>Normal</option>
              <option value="A" <?php echo checkOption("figado", "A", $legt->figado); ?>>Aumentado</option>
              <option value="NA" <?php echo checkOption("figado","NA",$legt->figado);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Ba&ccedil;o</legend>
			<select name="baco" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("baco", "N", $legt->baco); ?>>Normal</option>
              <option value="A" <?php echo checkOption("baco", "A", $legt->baco); ?>>Aumentado</option>
              <option value="NA" <?php echo checkOption("baco","NA",$legt->baco);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Rins</legend>
			<select name="rins" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="N" <?php echo checkOption("rins", "N", $legt->rins); ?>>Normal</option>
              <option value="G" <?php echo checkOption("rins", "G", $legt->rins); ?>>Giordano positivo</option>
              <option value="NA" <?php echo checkOption("rins","NA",$legt->rins);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Massas Tumorais</legend>
			<input name="mastumgt" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastumgt", "P", $legt->masstum); ?>/>Presentes
            <input name="mastumgt" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastumgt", "A", $legt->masstum); ?>/>Ausentes
            <input name="mastumgt" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("mastumgt", "NA", $legt->masstum); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>H&eacute;rnias</legend>
			<select name="hernias" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('C')">
              <option value="A" <?php echo checkOption("hernias", "A", $legt->hernia); ?>>Ausentes</option>
              <option value="N" <?php echo checkOption("hernias", "N", $legt->hernia);?>>Presentes e redut&iacute;veis</option>
              <option value="N" <?php echo checkOption("hernias","N",$legt->hernia);?>>Presentes e irredut&iacute;veis</option>
              <option value="NA" <?php echo checkOption("hernias","NA",$legt->hernia);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Ru&iacute;dos hidro-a&eacute;reos</legend>
			<input name="rhidaer" type="radio" value="P" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rhidaer", "P", $legt->ruidhidae); ?>/>Presentes
            <input name="rhidaer" type="radio" value="A" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rhidaer", "A", $legt->ruidhidae); ?>/>Ausentes
            <input name="rhidaer" type="radio" value="NA" onChange="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("rhidaer", "NA", $legt->ruidhidae); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsgtint" cols="68" onKeyUp="savCampo('C')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($legt->obs, $_POST['obsgtint']); ?></textarea>
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
