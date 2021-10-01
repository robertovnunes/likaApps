<fieldset class="full">
	<legend>Urina</legend>
	<div style="margin-bottom:5px">
		<div style="float:left"><label class="labdir2">Quantidade:</label>
		<select name="qtdurina" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $qtdur1; ?>>Normal</option>
			<option value="A" <?php echo $qtdur2; ?>>Abundante</option>
			<option value="E" <?php echo $qtdur3; ?>>Escassa</option>
			<option value="NA" <?php echo $qtdur4; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<div style="float:left"><label class="labdir2">Jato:</label>
		<select name="jatourina" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="C" <?php echo $jatour1; ?>>Cont&iacute;nuo</option>
			<option value="P" <?php echo $jatour2; ?>>Partido</option>
			<option value="NA" <?php echo $jatour3; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<div style="clear:both"></div>
	</div>
	<div style="margin-bottom:5px">
		<div style="float:left"><label class="labdir2">Cor:</label>
		<select name="corurina" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="C" <?php echo $corur1; ?>>Claro</option>
			<option value="E" <?php echo $corur2; ?>>Escuro</option>
			<option value="NA" <?php echo $corur3; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<div style="float:left"><label class="labdir2">Odor:</label>
		<select name="odorurina" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="C" <?php echo $odorur1; ?>>Característico</option>
			<option value="F" <?php echo $odorur2; ?>>Fétido</option>
			<option value="NA" <?php echo $odorur3; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<div style="clear:both"></div>
	</div>
	<div style="margin-bottom:5px">
		<div style="float:left"><label class="labdir2">Frequ&ecirc;ncia:</label>
		<select name="frequrina" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $frequr1; ?>>Normal</option>
			<option value="MH" <?php echo $frequr2; ?>>Mais que o Habitual</option>
			<option value="NA" <?php echo $frequr3; ?>>Não Avaliado</option>
		</select></div>
		<div style="float:left"><label style="text-align:right;width:80px;margin-top:3px;margin-right:5px;">Urg&ecirc;ncia:</label>
		<span>
			<input name="urgurina" type="radio" value="S" <?php echo $ass." ".$urgur1; ?> onchange="savCampo('8')"/><label>Sim</label>
			<input name="urgurina" type="radio" value="N" <?php echo $ass." ".$urgur2; ?> onchange="savCampo('8')"/><label>N&atilde;o</label>
			<input name="urgurina" type="radio" value="NA" <?php echo $ass." ".$urgur3; ?> onchange="savCampo('8')"/><label>N&atilde;o Avaliado</label>
		</span>
		</div>
		<div style="clear:both"></div>
	</div>
</fieldset>
<div style="float:left;width:50%">
	<fieldset style="width:95%">
		<legend>Corrimento Uretral</legend>
		<span>
			<input name="corruret" type="radio" value="P" <?php echo $ass." ".$curet1; ?> onchange="savCampo('8')" onclick="habilitaCorrUret(1)"/><label>Presente</label>
			<input name="corruret" type="radio" value="A" <?php echo $ass." ".$curet2; ?> onchange="savCampo('8')" onclick="habilitaCorrUret(0)"/><label>Ausente</label>
			<input name="corruret" type="radio" value="NA" <?php echo $ass." ".$curet3; ?> onchange="savCampo('8')" onclick="habilitaCorrUret(0)"/><label>N&atilde;o Avaliado</label>
		</span>
		<div style="margin-top:5px">
			<label class="labdir">Cor:</label>
			<select name="corcorruret" <?php echo $ass." ".$dcuret; ?> onchange="savCampo('8')">
				<option value="C" <?php echo $ccuret1; ?>>Claro</option>
				<option value="L" <?php echo $ccuret2; ?>>Leitoso</option>
				<option value="NA" <?php echo $ccuret3; ?>>N&atilde;o Avaliado</option>
			</select>
		</div>
		<div style="margin-top:5px">
			<label class="labdir">Odor:</label>
			<select name="odorcorruret" onchange="savCampo('8')" <?php echo $ass." ".$dcuret; ?>>
				<option value="I" <?php echo $ocuret1; ?>>Inodoro</option>
				<option value="F" <?php echo $ocuret2; ?>>F&eacute;tido</option>
				<option value="NA" <?php echo $ocuret3; ?>>N&atilde;o Avaliado</option>
			</select>
		</div>
	</fieldset>
</div>
<div style="float:left;width:50%">
	<fieldset style="width:95%">
		<legend>Dis&uacute;ria</legend>
		<span>
			<input name="disuria" type="radio" value="S" onchange="savCampo('8')" <?php echo $ass." ".$disuria1; ?> /><label>Sim</label>
			<input name="disuria" type="radio" value="N" onchange="savCampo('8')" <?php echo $ass." ".$disuria2; ?> /><label>N&atilde;o</label>
			<input name="disuria" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$disuria3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<div style="height:49px"></div>
	<fieldset style="width:95%">
		<legend>Atividade Sexual</legend>
		<span>
			<input name="ativsex" type="radio" value="S" onchange="savCampo('8')" <?php echo $ass." ".$ativsex1; ?>/><label>Sim</label>
			<input name="ativsex" type="radio" value="N" onchange="savCampo('8')" <?php echo $ass." ".$ativsex2; ?>/><label>N&atilde;o</label>
			<input name="ativsex" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$ativsex3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</div>
<div style="clear:both"></div>
<?php
	if ($paciente->getSexo() == "F") include_once("views/abas_prontuario/is/form_m.php");
	else include_once("views/abas_prontuario/is/form_h.php");
?>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsgu" class="txta1" <?php echo $ass; ?> onkeyup="savCampo('8')"><?php echo $obsgu; ?></textarea>
</fieldset>