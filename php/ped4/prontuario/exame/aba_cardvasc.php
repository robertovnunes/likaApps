<?php
	$lecdvs = getValuesTableAt('examecardvasc',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Cardiovascular</td>
    </tr>
</table>

<br />
<table width="580">
	<tr>
		<td width="275"><fieldset style="width:275px">
			<legend>Prec&oacute;rdio</legend>
			<select name="precord" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
				<option value="A" <?php echo checkOption("precord", "A", $lecdvs->precord); ?>>Abaulado</option>
				<option value="R" <?php echo checkOption("precord", "R", $lecdvs->precord); ?>>Retra&iacute;do</option>
				<option value="NA" <?php echo checkOption("precord","NA",$lecdvs->precord);?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
		<td width="293"><fieldset>
			<legend>Ictus Cordis (Inspe&ccedil;&atilde;o) </legend>
			<select name="ictcrdi" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
               	<option value="S" <?php echo checkOption("ictcrdi","S", $lecdvs->ictuscordi);?>>Localiza&ccedil;&atilde;o normal
				</option>
               	<option value="A" <?php echo checkOption("ictcrdi","A",$lecdvs->ictuscordi);?>>Localiza&ccedil;&atilde;o alterado
				</option>
               	<option value="NA" <?php echo checkOption("ictcrdi", "NA", $lecdvs->ictuscordi); ?>>N&atilde;o Avaliado</option>
            </select>
	  </fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Ictus Cordis (Palpa&ccedil;&atilde;o)</legend>
			<select name="ictcrdp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
              <option value="BN" <?php echo checkOption("ictcrdp","BN",$lecdvs->ictuscordp);?>>For&ccedil;a de batimento normal
			  </option>
              <option value="BA" <?php echo checkOption("ictcrdp","BA",$lecdvs->ictuscordp);?>>For&ccedil;a de batimento alterado
			  </option>
              <option value="NA" <?php echo checkOption("ictcrdp","NA",$lecdvs->ictuscordp);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Art&eacute;rias perif&eacute;ricas (pulso, ritmo, tens&atilde;o)</legend>
			<select name="artper" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
              <option value="N" <?php echo checkOption("artper", "N", $lecdvs->artper); ?>>Normais</option>
              <option value="A" <?php echo checkOption("artper", "A",$lecdvs->artper);?>>Alteradas</option>
              <option value="NA" <?php echo checkOption("artper", "NA", $lecdvs->artper); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Bulhas</legend>
			<select name="bulhas" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
              <option value="NF" <?php echo checkOption("bulhas", "NF", $lecdvs->bulhas); ?>>Normofon&eacute;ticas</option>
              <option value="+F" <?php echo checkOption("bulhas", "+F", $lecdvs->bulhas); ?>>Hipofon&eacute;ticas</option>
              <option value="-F" <?php echo checkOption("bulhas", "-F", $lecdvs->bulhas); ?>>Hiperfon&eacute;ticas</option>
              <option value="NA" <?php echo checkOption("bulhas","NA",$lecdvs->bulhas);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Sopros</legend>
			<input name="sopros" type="radio" value="P" onChange="savCampo('B')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sopros", "P", $lecdvs->sopros); ?>/>Presente
            <input name="sopros" type="radio" value="A" onChange="savCampo('B')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sopros", "A", $lecdvs->sopros); ?>/>Ausente
            <input name="sopros" type="radio" value="NA" onChange="savCampo('B')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sopros", "NA", $lecdvs->sopros); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
    	<td>
<fieldset style="width:275px;">   
   
    	<legend> Press&atilde;o Arterial </legend>
    	<select name="pressaoart" onChange="savCampo('B')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>  >
				<option value="NA" <?php echo checkOption("pressaoart", "NA", $lecdvs->pressaoart); ?>   onclick="habilitaExCardioPres(0)">N&atilde;o Avaliado</option>
				<option value="AV" <?php echo checkOption("pressaoart", "AV", $lecdvs->pressaoart); ?>  onclick="habilitaExCardioPres(1)">Valor</option>
				
			</select> 
                 
			<input name="pressaoartin" <?php if(EXAssinado($atend) ) echo " disabled=true "; ?> onchange="savCampo('B')" onkeypress="mascara(this,5)" size="4" maxlength="4" value="<?php echo printOBS($lecdvs->pressaoartin, $_POST['pressaoartin']); ?>" <?php echo checkDisable("pressaoart", $lecdvs->pressaoart, "AV"); ?> /> mmHg
   
        </fieldset>
        </td>
        
		<td colspan="2"><fieldset style="width:275px">
			<legend>Freq&uuml;&ecirc;ncia Card&iacute;aca</legend>
			<select name="freqcard" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('B')">
            <option value="NA" <?php echo checkOption("freqcard","NA",$lecdvs->freqcard);?> onclick="habilitaExCardioFreq(0)">N&atilde;o Avaliado</option>
				<option value="AV" <?php echo checkOption("freqcard", "AV", $lecdvs->freqcard); ?> onclick="habilitaExCardioFreq(1)">Valor</option>
				
			</select>
            <input name="freqcardin" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('B')" size="3" maxlength="3" value="<?php echo printOBS($lecdvs->freqcardin, $_POST['freqcardin']); ?>"   <?php echo checkDisable("freqcard", $lecdvs->freqcard, "AV"); ?>  /> bpm
  	  </fieldset></td>
  	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obscdvs" cols="68" onKeyUp="savCampo('B')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($lecdvs->obs, $_POST['obscdvs']); ?></textarea>
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
