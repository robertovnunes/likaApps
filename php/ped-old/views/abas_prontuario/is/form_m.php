<fieldset class="full">
    <legend>Corrimento Vaginal</legend>
	<div><span>
		<input name="corrvag" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$corrvag1; ?> onclick="habilitaCorrVag(1)"/><label>Presente</label>
		<input name="corrvag" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$corrvag2; ?> onclick="habilitaCorrVag(0)"/><label>Ausente</label>
		<input name="corrvag" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$corrvag3; ?> onclick="habilitaCorrVag(0)"/><label>N&atilde;o Avaliado</label>
	</span></div>
	<div style="clear:both;margin-bottom:5px">
		<div style="float:left"><label class="labdir2">Cor:</label>
		<select name="corcorrvag" <?php echo $ass." ".$dcorrvag; ?> onchange="savCampo('8')">
			<option value="C" <?php echo $corcorrvag1; ?>>Claro</option>
			<option value="L" <?php echo $corcorrvag2; ?>>Leitoso</option>
			<option value="E" <?php echo $corcorrvag3; ?>>Esverdeado</option>
			<option value="NA" <?php echo $corcorrvag4; ?>>N&atilde;o Avaliado</option>
		</select>
		</div>
		<div style="float:left;margin-bottom:5px">
		<label class="labdir">Odor:</label>
		<select name="odorcorrvag" <?php echo $ass." ".$dcorrvag; ?> onchange="savCampo('8')">
			<option value="I" <?php echo $odorcorrvag1; ?>>Inodoro</option>
			<option value="F" <?php echo $odorcorrvag2; ?>>F&eacute;tido</option>
			<option value="NA" <?php echo $odorcorrvag3; ?>>N&atilde;o Avaliado </option>
		</select></div>
	</div>
	<div style="clear:both">
		<label class="labdir2">Prurido:</label>
		<span>
			<input name="prucorrvag" type="radio" value="P" <?php echo $ass." ".$dcorrvag." ".$prucorrvag1; ?> onchange="savCampo('8')"/><label>Presente</label>
			<input name="prucorrvag" type="radio" value="A" <?php echo $ass." ".$dcorrvag." ".$prucorrvag2; ?> onchange="savCampo('8')"/><label>Ausente</label>
			<input name="prucorrvag" type="radio" value="NA" <?php echo $ass." ".$dcorrvag." ".$prucorrvag3; ?> onchange="savCampo('8')"/><label>N&atilde;o Avaliado</label>
		</span>
	</div>
</fieldset>
<fieldset style="width:46%">
   	<legend>Telarca</legend>
    <select name="telarca" <?php echo $ass; ?> onchange="savCampo('8')">
		<option value="-8" <?php echo $telarca1; ?>>Menos de 8 Anos</option>
		<option value="813" <?php echo $telarca2; ?>>8 a 13 Anos</option>
		<option value="+13" <?php echo $telarca3; ?>>Mais de 13 Anos</option>
		<option value="A" <?php echo $telarca4; ?>>Ausente</option>
		<option value="NA" <?php echo $telarca5; ?>>N&atilde;o Avaliado</option>
   	</select>
</fieldset>
<fieldset style="width:46%">
    <legend>Pubarca</legend>
    <select name="pubarcam" <?php echo $ass;?> onchange="savCampo('8')">
		<option value="-6" <?php echo $pubarcam1; ?>>Menos de 6 Anos</option>
		<option value="613" <?php echo $pubarcam2; ?>>6 a 13 Anos</option>
		<option value="+13" <?php echo $pubarcam3; ?>>Mais de 13 Anos</option>
		<option value="A" <?php echo $pubarcam4; ?>>Ausente</option>
	    <option value="NA" <?php echo $pubarcam5; ?>>N&atilde;o Avaliado</option>
    </select>
</fieldset>
<fieldset class="full">
    <legend>Hist&oacute;rico Menstrual</legend>
	<div><span>
		<input name="histmenst" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$histmenst1; ?> onclick="habilitaHistMenstr(1)"/><label>Presente</label>
		<input name="histmenst" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$histmenst2; ?> onclick="habilitaHistMenstr(0)"/><label>Ausente</label>
		<input name="histmenst" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$histmenst3; ?> onclick="habilitaHistMenstr(0)"/><label>N&atilde;o Avaliado</label>
	</span></div>
    <div style="clear:both">
		<div style="float:left"><label class="labdir2">Menarca:</label>
		<select name="menarca" <?php echo $ass." ".$dhistmenst; ?> onchange="savCampo('8')">
			<option value="-8" <?php echo $menarca1; ?>>Menos de 8 Anos</option>
			<option value="816" <?php echo $menarca2; ?>>8 a 16 Anos</option>
			<option value="+16" <?php echo $menarca3; ?>>Mais de 16 anos</option>
			<option value="NA" <?php echo $menarca4; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<div style="float:left;margin-bottom:5px"><label class="labdir2">Regularidade:</label>
		<select name="regularidade" <?php echo $ass." ".$dhistmenst; ?> onchange="savCampo('8')">
			<option value="-28" <?php echo $regular1; ?>>Menos de 28 Dias</option>
			<option value="28" <?php echo $regular2; ?>>28 Dias</option>
			<option value="+28" <?php echo $regular3; ?>>Mais de 28 Dias</option>
			<option value="NA" <?php echo $regular4; ?>>N&atilde;o Avaliado</option>
		</select></div>
	</div>
	<div style="clear:both;margin-bottom:5px">
		<label class="labdir2">Fluxo:</label>
		<select name="fluxo" <?php echo $ass." ".$dhistmenst; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $fluxo1; ?>>Normal</option>
			<option value="A" <?php echo $fluxo2; ?>>Aumentado</option>
			<option value="D" <?php echo $fluxo3; ?>>Diminu&iacute;do</option>
			<option value="NA" <?php echo $fluxo4; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
</fieldset>