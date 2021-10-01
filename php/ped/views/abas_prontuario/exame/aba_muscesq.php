<fieldset style="width:46%">
	<legend>Anomalias</legend>
	<span>
		<input name="anomaliasme" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$anomalias1; ?> /><label>Presentes</label>
		<input name="anomaliasme" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$anomalias2; ?> /><label>Ausentes</label>
		<input name="anomaliasme" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$anomalias3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Deformidades</legend>
	<span>
		<input name="deformidadesme" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$deformidades1; ?> /><label>Presentes</label>
		<input name="deformidadesme" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$deformidades2; ?> /><label>Ausentes</label>
		<input name="deformidadesme" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$deformidades3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Edemas</legend>
	<span>
		<input name="edemasme" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$edemas1; ?> /><label>Presentes</label>
		<input name="edemasme" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$edemas2; ?> /><label>Ausentes</label>
		<input name="edemasme" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$edemas3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tumora&ccedil;&otilde;es</legend>
	<span>
		<input name="tumoracoesme" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$tumoracoes1; ?> /><label>Presentes</label>
		<input name="tumoracoesme" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$tumoracoes2; ?> /><label>Ausentes</label>
		<input name="tumoracoesme" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$tumoracoes3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>For&ccedil;a Muscular</legend>
	<select name="forcamusc" <?php echo $ass; ?> onChange="savCampo('E')">
		<option value="N" <?php echo $forcamusc1; ?>>Normal</option>
		<option value="D" <?php echo $forcamusc2; ?>>Diminu&iacute;da</option>
		<option value="NA" <?php echo $forcamusc3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor &Oacute;ssea e Articular </legend>
	<span>
		<input name="dorossea" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$dorossea1; ?> /><label>Presentes</label>
		<input name="dorossea" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$dorossea2; ?> /><label>Ausentes</label>
		<input name="dorossea" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$dorossea3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Movimenta&ccedil;&atilde;o Ativa</legend>
	<select name="movativa" <?php echo $ass; ?> onChange="savCampo('E')">
		<option value="N" <?php echo $movativa1; ?>>Normal</option>
		<option value="L" <?php echo $movativa2; ?>>Limitada</option>
		<option value="NA" <?php echo $movativa3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Movimenta&ccedil;&atilde;o Passiva</legend>
	<select name="movpassiva" <?php echo $ass; ?> onChange="savCampo('E')">
		<option value="N" <?php echo $movpassiva1; ?>>Normal</option>
		<option value="L" <?php echo $movpassiva2; ?>>Limitada</option>
		<option value="NA" <?php echo $movpassiva3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Escoliose</legend>
	<span>
		<input name="escoliose" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$escoliose1; ?> /><label>Presente</label>
		<input name="escoliose" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$escoliose2; ?> /><label>Ausente</label>
		<input name="escoliose" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$escoliose3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Lordose</legend>
	<span>
		<input name="lordose" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$lordose1; ?> /><label>Presente</label>
		<input name="lordose" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$lordose2; ?> /><label>Ausente</label>
		<input name="lordose" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$lordose3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Cifose</legend>
	<span>
		<input name="cifose" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$cifose1; ?> /><label>Presente</label>
		<input name="cifose" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$cifose2; ?> /><label>Ausente</label>
		<input name="cifose" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$cifose3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Curvatura Para Frente (simetria de esc&aacute;pulas)</legend>
	<span>
		<input name="curvfrente" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$curvfrente1; ?> /><label>Presente</label>
		<input name="curvfrente" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$curvfrente2; ?> /><label>Ausente</label>
		<input name="curvfrente" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$curvfrente3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Espasmos Musculares</legend>
	<span>
		<input name="espmusc" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$espmusc1; ?> /><label>Presente</label>
		<input name="espmusc" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$espmusc2; ?> /><label>Ausente</label>
		<input name="espmusc" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$espmusc3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor Local</legend>
	<span>
		<input name="dorlocal" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$dorlocalme1; ?> /><label>Presente</label>
		<input name="dorlocal" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$dorlocalme2; ?> /><label>Ausente</label>
		<input name="dorlocal" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$dorlocalme3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor Reflexa</legend>
	<span>
		<input name="dorreflexa" type="radio" value="P" onChange="savCampo('E')" <?php echo $ass." ".$dorreflexame1; ?> /><label>Presente</label>
		<input name="dorreflexa" type="radio" value="A" onChange="savCampo('E')" <?php echo $ass." ".$dorreflexame2; ?> /><label>Ausente</label>
		<input name="dorreflexa" type="radio" value="NA" onChange="savCampo('E')" <?php echo $ass." ".$dorreflexame3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsmusc" class="txta1" onKeyUp="savCampo('E')"  <?php echo $ass; ?>><?php echo $obsmusc; ?></textarea>
</fieldset>