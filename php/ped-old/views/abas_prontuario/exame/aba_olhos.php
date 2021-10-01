<fieldset style="width:46%">
	<legend>Ptose</legend>
	<span>
		<input name="ptose" type="radio" value="S" onchange="savCampo('7')" <?php echo $ass." ".$ptose1; ?> /><label>Sim</label>
		<input name="ptose" type="radio" value="N" onchange="savCampo('7')" <?php echo $ass." ".$ptose2; ?>/><label>N&atilde;o</label>
		<input name="ptose" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$ptose3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Edema Palpebral</legend>
	<span>
		<input name="edemapalp" type="radio" value="S" onchange="savCampo('7')" <?php echo $ass." ".$edemapalp1; ?>/><label>Sim</label>
		<input name="edemapalp" type="radio" value="N" onchange="savCampo('7')" <?php echo $ass." ".$edemapalp2; ?>/><label>N&atilde;o</label>
		<input name="edemapalp" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$edemapalp3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Escler&oacute;ticas e conjuntiva</legend>
	<fieldset style="width:48%">
		<legend>Hemorragias</legend>
		<span>
			<input name="hemorragiasol" type="radio" value="S" onchange="savCampo('7')" <?php echo $ass." ".$hemorragiasol1; ?>/><label>Sim</label>
			<input name="hemorragiasol" type="radio" value="N" onchange="savCampo('7')" <?php echo $ass." ".$hemorragiasol2; ?>/><label>N&atilde;o</label>
			<input name="hemorragiasol" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$hemorragiasol3; ?> /><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:44%">
		<legend>Cor</legend>
		<select name="corescle" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="B" <?php echo $corescle1; ?>>Branca</option>
			<option value="A" <?php echo $corescle2; ?>>Amarela</option>
			<option value="NA" <?php echo $corescle3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:48%">
		<legend>Inflama&ccedil;&atilde;o</legend>
		<span>
			<input name="inflamacaool" type="radio" value="P" onchange="savCampo('7')" <?php echo $ass." ".$inflamacaool1; ?>/><label>Presente</label>
			<input name="inflamacaool" type="radio" value="A" onchange="savCampo('7')" <?php echo $ass." ".$inflamacaool2; ?>/><label>Ausente</label>
			<input name="inflamacaool" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$inflamacaool3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:44%">
		<legend>Secre&ccedil;&atilde;o</legend>
		<select name="secrecaool" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="N" <?php echo $secrecaool1; ?>>N&atilde;o</option>
			<option value="SP" <?php echo $secrecaool2; ?>>Sim, purulenta</option>
			<option value="SH" <?php echo $secrecaool3; ?>>Sim, hialina</option>
			<option value="NA" <?php echo $secrecaool4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:48%">
		<legend>C&iacute;lios</legend>
		<span>
			<input name="cilios" type="radio" value="P" onchange="savCampo('7')" <?php echo $ass." ".$cilios1; ?>/><label>Presentes</label>
			<input name="cilios" type="radio" value="A" onchange="savCampo('7')" <?php echo $ass." ".$cilios2; ?>/><label>Ausentes</label>
			<input name="cilios" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$cilios3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:44%">
		<legend>Movimentos Oculares Anormais</legend>
		<select name="movocularesa" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="A" <?php echo $movocularesa1; ?>>Ausentes</option>
			<option value="E" <?php echo $movocularesa2; ?>>Estrabismo</option>
			<option value="N" <?php echo $movocularesa3; ?>>Nistagmo</option>
			<option value="NA" <?php echo $movocularesa4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:48%">
		<legend>Pupilas</legend>
		<select name="pupila" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="NL" <?php echo $pupila1; ?>>Normais, reativas &agrave; luz</option>
			<option value="OL" <?php echo $pupila2; ?>>Opacas, reativas &agrave; luz</option>
			<option value="NN" <?php echo $pupila3; ?>>Normais, n&atilde;o reativas</option>
			<option value="LN" <?php echo $pupila4; ?>>Opacas, n&atilde;o reativas</option>
			<option value="NA" <?php echo $pupila5; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:44%">
		<legend>Acuidade visual</legend>
		<select name="acuidvis" <?php echo $ass; ?> onchange="savCampo('7')">
		  <option value="S" <?php echo $acuidvis1; ?>>Sim</option>
		  <option value="NS" <?php echo $acuidvis2; ?>>N&atilde;o, sem lentes corretivas</option>
		  <option value="NL" <?php echo $acuidvis3; ?>>N&atilde;o, com lentes corretivas</option>
		  <option value="NA" <?php echo $acuidvis4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsolho" class="txta1" onkeyup="savCampo('7')" <?php echo $ass; ?>><?php echo $obsolho; ?></textarea>
</fieldset>