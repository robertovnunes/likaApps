<br />
<span class="style7">Familiar</span>
<br />
<fieldset class="full">
	<legend>Pais</legend>
	<div>
		<label class="labdir2">Tipo de Uni&atilde;o:</label>
		<select name="uniaopais" onchange="savCampo('F')">
			<option value="UE" <?php echo $uniaopais1; ?>>Uni&atilde;o Est&aacute;vel</option>
			<option value="C" <?php echo $uniaopais2; ?>>Casamento</option>
			<option value="SJ" <?php echo $uniaopais3; ?>>Separa&ccedil;&atilde;o Judicial</option>
			<option value="O" <?php echo $uniaopais4; ?>>Outros</option>
			<option value='NA' <?php echo $uniaopais5; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="clear:both">
		<label class="labdir2<?php echo (isset($lblidadmae) ? $lblidadmae : ''); ?>" style="margin-top:8" id="lblidadmae">Idade da M&atilde;e:</label>
		<input style="margin:5 0 5 0" name="idademae" size="3" maxlength="2" onkeyup="savCampo('F')" onfocus="mudaLb(lblidadmae)" onkeypress="mascara(this,6);" value="<?php echo $idademae; ?>" />
	</div>
	<div style="clear:both">
		<label class="labdir2<?php echo (isset($ocupmae) ? $ocupmae : ''); ?>">Ocupa&ccedil;&atilde;o da M&atilde;e:</span></label>
		<select style="width:400px;" name="profmae" onchange="savCampo('F')">
			<option value='0'>Selecione</option>
		<?php foreach ($listcbo as $l) { 
			$profmaex = $fachada->checkOpUF("profmae", $l['cod'],$linfam->profmae); ?> 
			<option value="<?php echo $l['cod']; ?>" <?php echo $profmaex; ?>><?php echo $l['descricao']; ?></option>
		<?php } ?>
		</select>
	</label>
	</div>
	<div style="clear:both">
		<label class="labdir2<?php echo (isset($lblidadpai) ? $lblidadpai : ''); ?>" style="margin-top:8" id="lblidadpai">Idade do Pai:</label>
		<input style="margin:5 0 5 0" name="idadepai" size="3" maxlength="2" onkeyup="savCampo('F')" onkeypress="mascara(this,6);" onfocus="mudaLb(lblidadpai)" value="<?php echo $idadepai; ?>"/>
	</div>
	<div style="clear:both">
		<label class="labdir2<?php echo (isset($ocuppai) ? $ocuppai : ''); ?>">Ocupa&ccedil;&atilde;o do Pai:</label>
		<select style="width:400px;" name="profpai" onchange="savCampo('F')">
			<option value='0' style="width:100px;">Selecione</option>
		<?php foreach ($listcbo as $l) { 
			$profpaix = $fachada->checkOpUF("profpai", $l['cod'],$linfam->profpai); ?>
			<option value="<?php echo $l['cod']; ?>" <?php echo $profpaix; ?>><?php echo $l['descricao']; ?></option>
		<?php } ?>
		</select>
	</div>
	<fieldset class="full">
		<legend>Detalhes</legend>
		<textarea class="txta1" name="pais" onkeyup="savCampo('F')" onfocus="mudaLb(lbldet)"><?php echo $pais; ?></textarea>
	</fieldset>
</fieldset>

<fieldset class="full">
	<legend>Parentes</legend>
	<fieldset class="full">
		<legend id="lblavos" <?php //echo $lblavos; onfocus="mudaLb(lblavos)" ?>>Av&oacute;s</legend>
		<textarea class="txta1" name="avos" onkeyup="savCampo('F')"><?php echo $avos; ?></textarea>
	</fieldset>
	<fieldset class="full">
		<legend id="lblirm" <?php //echo $lblirmaos;onfocus="mudaLb(lblirm)" ?>>Irm&atilde;os</legend>
		<textarea class="txta1" name="irmaos" onkeyup="savCampo('F')"><?php echo $irmaos; ?></textarea>
	</fieldset class="full">
	<fieldset class="full">
		<legend id="lblout" <?php // echo $lbloutros;onfocus="mudaLb(lblout)" ?>>Outros</legend>
		<textarea class="txta1" name="outros" onkeyup="savCampo('F')"><?php echo $outros; ?></textarea>
	</fieldset>
</fieldset>

<fieldset class="full">
	<legend>Condi&ccedil;&otilde;es Dom&eacute;sticas</legend>
	<fieldset class="full">
		<legend>Resid&ecirc;ncia</legend>
		<div style="float:left">
			<label class="labdir" style="margin-top:3px">Tipo:</label>
			<select name="resid" onchange="savCampo('F')" onfocus="mudaLb(lbltipores)">
				<option value='A' <?php echo $resid1; ?>>Alvenaria</option>
				<option value='T' <?php echo $resid2; ?>>Taipa</option>
				<option value='B' <?php echo $resid3; ?>>Barraco</option>
				<option value='NA' <?php echo $resid4; ?>>N&atilde;o Avaliado</option>
			</select>
		</div>
		<div style="float:left">
			<label class="labdir2<?php echo (isset($lblncom) ? $lblncom : '');?>" id="lblncom">N&ordm; de C&ocirc;modos:</label>
			<input style="margin:0" name="comod" size="4" maxlength="3" onkeypress="mascara(this,6);" onfocus="mudaLb(lblncom)" onkeyup="savCampo('F')" value="<?php echo $comod; ?>"/>
		</div>
		<div style="float:left">
			<label class="labdir2<?php echo (isset($lblnocup) ? $lblnocup : '');?>" id="lblnocup">N&ordm; de Ocupantes:</label>
			<input style="margin:0" name="ocup" size="4" maxlength="3" onkeypress="mascara(this,6);" onfocus="mudaLb(lblnocup)" onkeyup="savCampo('F')" value="<?php echo $ocup; ?>"/>
		</div>
		<div style="clear:both"></div>
	</fieldset>
	
	<fieldset style="width:53%">
		<legend>&Aacute;gua</legend>
		<span>
			<input name="agua" type="radio" value="E" onchange="savCampo('F')" <?php echo $agua1; ?>/><label>Encanada</label>
			<input name="agua" type="radio" value="NE" onchange="savCampo('F')" <?php echo $agua2; ?>/><label>N&atilde;o-Encanada</label>
			<input name="agua" type="radio" value="NA" onchange="savCampo('F')" <?php echo $agua3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:39%">
		<legend>Saneamento</legend>
		<select name="sanea" onchange="savCampo('F')">
			<option value="EE" <?php echo $sanea1; ?>>Esgoto Encanado</option>
			<option value="FS" <?php echo $sanea2; ?>>Fossa S&eacute;ptica</option>
			<option value="EA" <?php echo $sanea3; ?>>Esgoto a C&eacute;u Aberto</option>
			<option value="NA" <?php echo $sanea4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	
	<fieldset style="width:46%">
		<legend>Luz</legend>
		<span>
			<input name="luz" type="radio" value="S" onchange="savCampo('F')" <?php echo $luz1; ?>/><label>Sim</label>
			<input name="luz" type="radio" value="N" onchange="savCampo('F')" <?php echo $luz2; ?>/><label>N&atilde;o</label>
			<input name="luz" type="radio" value="NA" onchange="savCampo('F')" <?php echo $luz3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Presen&ccedil;a de Animais</legend>
		<span>
			<input name="animais" type="radio" value="S" onchange="savCampo('F')" <?php echo $animais1; ?>/><label>Sim</label>
			<input name="animais" type="radio" value="N" onchange="savCampo('F')" <?php echo $animais2; ?>/><label>N&atilde;o</label>
			<input name="animais" type="radio" value="NA" onchange="savCampo('F')" <?php echo $animais3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsconddom" onkeyup="savCampo('F')"><?php echo $obsconddom; ?></textarea>
</fieldset>