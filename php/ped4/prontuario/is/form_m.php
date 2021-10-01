<?php
	$lsf = getValuesTableAt('genfem',$atend);
	
?>

<tr>
	<td colspan="2"><fieldset>
		<legend>Corrimento Vaginal</legend>
		<input name="corrvag" type="radio" value="P" onclick="habilitaCorrVag(1)" <?php if(ISAssinado($atend))echo "disabled=true "; 
			echo checkPOST("corrvag", "P", $lsf->corrvg); ?> onchange="savCampo('8')"/>Presente
		<input name="corrvag" type="radio" value="A" onclick="habilitaCorrVag(0)" <?php if(ISAssinado($atend))echo "disabled=true "; 
			echo checkPOST("corrvag", "A", $lsf->corrvg); ?> onchange="savCampo('8')"/>Ausente
		<input name="corrvag" type="radio" value="NA" id="corrvag" onclick="habilitaCorrVag(0)" <?php if(ISAssinado($atend))echo "disabled=true ";
			echo checkPOST("corrvag", "NA", $lsf->corrvg); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
		<table width="443" class="style5">
			<tr>
				<td width="87" align="right">Cor:</td>
				<td width="111"><select name="corcorrvag" <?php if(ISAssinado($atend))echo "disabled=true "; 
					echo checkDisable("corrvag", $lsf->corrvg, "P"); ?> onchange="savCampo('8')">
					<option value="C" <?php echo checkOption("corcorrvag", "C", $lsf->corcv);?>>Claro</option>
					<option value="L" <?php echo checkOption("corcorrvag", "L", $lsf->corcv);?>>Leitoso</option>
					<option value="E" <?php echo checkOption("corcorrvag", "E", $lsf->corcv);?>>Esverdeado</option>
					<option value="NA" <?php echo checkOption("corcorrvag", "NA", $lsf->corcv);?>>N&atilde;o Avaliado</option>
			  </select></td>
			    <td width="36" align="right">Odor:</td>
			    <td width="189"><select name="odorcorrvag" <?php if(ISAssinado($atend))echo "disabled=true "; 
					echo checkDisable("corrvag", $lsf->corrvg, "P"); ?> onchange="savCampo('8')">
                  <option value="I" <?php echo checkOption("odorcorrvag", "I", $lsf->odorcv); ?>>Inodoro</option>
                  <option value="F" <?php echo checkOption("odorcorrvag", "F", $lsf->odorcv); ?>>F&eacute;tido</option>
                  <option value="NA" <?php echo checkOption("odorcorrvag", "NA", $lsf->odorcv); ?>>N&atilde;o Avaliado </option>
                </select></td>
			</tr>
			<tr>
				<td align="right">Prurido:</td>
				<td colspan="3"><input name="prucorrvag" type="radio" value="P" <?php echo checkPOST("prucorrvag","P", $lsf->prucv);
					if(ISAssinado($atend))echo "disabled=true "; echo checkDisable("corrvag", $lsf->corrvg, "P"); ?> onchange="savCampo('8')"/>
					Presente
				<input name="prucorrvag" type="radio" value="A" <?php echo checkPOST("prucorrvag", "A", $lsf->prucv); 
					if(ISAssinado($atend))echo "disabled=true "; echo checkDisable("corrvag", $lsf->corrvg, "P"); ?> onchange="savCampo('8')"/>
					Ausente
				<input name="prucorrvag" type="radio" value="NA" <?php echo checkPOST("prucorrvag", "NA", $lsf->prucv); 
					if(ISAssinado($atend))echo "disabled=true "; echo checkDisable("corrvag", $lsf->corrvg, "P"); ?> onchange="savCampo('8')"/>
					N&atilde;o Avaliado</td>
			</tr>
		</table>
	</fieldset></td>
</tr>
<tr>
	<td><fieldset>
    	<legend>Telarca</legend>
        <select name="telarca" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
			<option value="-8" <?php echo checkOption("telarca", "-8", $lsf->tel); ?> >Menos de 8 Anos</option>
			<option value="813" <?php echo checkOption("telarca", "813", $lsf->tel);?>>8 a 13 Anos</option>
			<option value="+13" <?php echo checkOption("telarca", "+13", $lsf->tel);?>>Mais de 13 Anos</option>
			<option value="A" <?php echo checkOption("telarca", "A", $lsf->tel); ?>>Ausente</option>
			<option value="NA" <?php echo checkOption("telarca", "NA", $lsf->tel); ?>>N&atilde;o Avaliado</option>
       	</select>
    </fieldset></td>
    <td><fieldset>
       	<legend>Pubarca</legend>
       	<select name="pubarcam" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
			<option value="-6" <?php echo checkOption("pubarcam", "-6", $lsf->pub);?>>Menos de 6 Anos</option>
			<option value="613" <?php echo checkOption("pubarcam", "613", $lsf->pub);?>>6 a 13 Anos</option>
			<option value="+13" <?php echo checkOption("pubarcam", "+13", $lsf->pub);?>>Mais de 13 Anos</option>
			<option value="A" <?php echo checkOption("pubarcam", "A", $lsf->pub);?>>Ausente</option>
			<option value="NA" <?php echo checkOption("pubarcam", "NA", $lsf->pub);?>>N&atilde;o Avaliado</option>
       	</select>
	</fieldset></td>
</tr>
<tr>
	<td colspan="2"><fieldset>
		<legend>Hist&oacute;rico Menstrual</legend>
		<input name="histmenst" type="radio" value="P" onclick="habilitaHistMenstr(1)" <?php if(ISAssinado($atend))echo "disabled=true "; 
			echo checkPOST("histmenst", "P", $lsf->menst); ?> onchange="savCampo('8')"/>Presente
		<input name="histmenst" type="radio" value="A" onclick="habilitaHistMenstr(0)" <?php if(ISAssinado($atend))echo "disabled=true "; 
			echo checkPOST("histmenst", "A", $lsf->menst); ?> onchange="savCampo('8')"/>Ausente
		<input name="histmenst" type="radio" value="NA" onclick="habilitaHistMenstr(0)" <?php if(ISAssinado($atend))echo "disabled=true "; 
			echo checkPOST("histmenst", "NA", $lsf->menst); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
		<table width="472" class="style5">
			<tr>
				<td width="97" align="right">Menarca:</td>
				<td width="135"><select name="menarca" <?php if(ISAssinado($atend))echo "disabled=true "; 
					echo checkDisable("histmenst", $lsf->menst, "P"); ?> onchange="savCampo('8')">
					<option value="-8" <?php echo checkOption("menarca", "-8", $lsf->men); ?>>Menos de 8 Anos</option>
					<option value="816" <?php echo checkOption("menarca", "816", $lsf->men); ?>>8 a 16 Anos</option>
					<option value="+16" <?php echo checkOption("menarca", "+16", $lsf->men); ?>>Mais de 16 anos</option>
					<option value="NA" <?php echo checkOption("menarca", "NA", $lsf->men); ?>>N&atilde;o Avaliado</option>
			  </select></td>
			    <td width="82" align="right">Regularidade:</td>
			    <td width="138"><select name="regularidade" <?php if(ISAssinado($atend))echo "disabled=true "; 
					echo checkDisable("histmenst", $lsf->menst, "P"); ?> onchange="savCampo('8')">
                  <option value="-28" <?php echo checkOption("regularidade", "-28", $lsf->reg); ?>>Menos de 28 Dias</option>
                  <option value="28" <?php echo checkOption("regularidade", "28", $lsf->reg); ?>>28 Dias</option>
                  <option value="+28" <?php echo checkOption("regularidade", "+28", $lsf->reg); ?>>Mais de 28 Dias</option>
                  <option value="NA" <?php echo checkOption("corcorrure", "NA", $lsf->reg); ?>>N&atilde;o Avaliado</option>
                </select></td>
		    </tr>
			<tr>
			  <td align="right">Fluxo:</td>
				<td colspan="3"><select name="fluxo" <?php if(ISAssinado($atend))echo "disabled=true "; 
					echo checkDisable("histmenst", $lsf->menst, "P");?> onchange="savCampo('8')">
                  <option value="N" <?php echo checkOption("fluxo", "N", $lsf->fluxo); ?>>Normal</option>
                  <option value="A" <?php echo checkOption("fluxo", "A", $lsf->fluxo); ?>>Aumentado</option>
                  <option value="D" <?php echo checkOption("fluxo", "D", $lsf->fluxo); ?>>Diminu&iacute;do</option>
                  <option value="NA" <?php echo checkOption("fluxo", "NA", $lsf->fluxo); ?>>N&atilde;o Avaliado</option>
                </select></td>
			</tr>
	</table>
	</fieldset></td>
</tr>