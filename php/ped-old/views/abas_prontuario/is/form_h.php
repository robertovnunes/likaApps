<fieldset style="width:46%">
   	<legend>Pubarca</legend>
	<select name="pubarcah" <?php echo $ass; ?> onchange="savCampo('8')">
		<option value="-8" <?php echo $pubarcah1; ?>>Menos de 8 Anos</option>
		<option value="814" <?php echo $pubarcah2; ?>>Entre 8 e 14 Anos</option>
		<option value="+14" <?php echo $pubarcah3; ?>>Mais de 14 Anos</option>
		<option value="A" <?php echo $pubarcah4; ?>>Ausente</option>
		<option value="NA" <?php echo $pubarcah5; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
  	<legend>Volume Testicular</legend>
    <select name="voltest" <?php echo $ass; ?> onchange="savCampo('8')">
        <option value="N" <?php echo $voltest1; ?>>Normal</option>
        <option value="MA" <?php echo $voltest2; ?>>Maior que o Normal</option>
        <option value="ME" <?php echo $voltest3; ?>>Menor que o Normal</option>
        <option value="NA" <?php echo $voltest4; ?>>Não Avaliado</option>
    </select>
</fieldset>
<fieldset style="width:46%">
    <legend>Ere&ccedil;&atilde;o</legend>
	<span>
		<input name="erecao" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$erecao1; ?>/><label>Presente</label>
		<input name="erecao" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$erecao2; ?>/><label>Ausente</label>
		<input name="erecao" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$erecao3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
    <legend>Tamanho do P&ecirc;nis</legend>
    <select name="tampenis" <?php echo $ass; ?> onchange="savCampo('8')">
        <option value="N" <?php echo $tampenis1; ?>>Normal</option>
        <option value="MA" <?php echo $tampenis2; ?>>Maior que o Normal</option>
        <option value="ME" <?php echo $tampenis3; ?>>Menor que o Normal</option>
        <option value="NA" <?php echo $tampenis4; ?>>Não Avaliado</option>
    </select>
</fieldset>
<fieldset style="width:46%">
   	<legend>Polu&ccedil;&otilde;es</legend>
	<span>
		<input name="polucoes" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$polucoes1; ?>/><label>Presente</label>
		<input name="polucoes" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$polucoes2; ?>/><label>Ausente</label>
		<input name="polucoes" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$polucoes3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>