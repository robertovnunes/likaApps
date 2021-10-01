<fieldset class="full">
	<legend>Dados Pessoais</legend>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrNome; ?>" id="lbNome" >Nome*:</label>
		<input class="tam50" name="nome" onfocus="mudaLb(lbNome)" onkeyup="savCampo()" value="<?php echo $valInfo[0]; ?>" maxlength="50" />
	</div>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrSexo; ?>" id="lbSexo">Sexo*:</label>
		<span>
			<input name="sexo" type="radio" value="M" <?php echo $sexoM; ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()" /><label>Masculino</label>
			<input name="sexo" type="radio" value="F" <?php echo $sexoF; ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()" /><label>Feminino</label>
		</span>
	</div>
</fieldset>
<fieldset class="full">
	<legend>Endere&ccedil;o (Caso você saiba o CEP, o sistema preencherá automaticamente)</legend>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrCEP; ?>" id="lbCEP">CEP*:</label>
		<input id="inpCEP" class="tam10" name="cep" maxlength="9" value="<?php echo $valInfo[13]; ?>" onfocus="mudaLb(lbCEP)" onkeyup="savCampo()" OnKeyPress="mascara(this,3)" /><a href="#cepResidencial" onclick="getCEP()"><img src="images/lupa.jpg" style="position:relative; padding-left:5px;padding-top:5px;" alt="Pesquisar Cep/PE"></a>
	</div>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrEnde; ?>" id="lbEnd">Logradouro*:</label>
		<input id="inpEnd" class="tam50" name="ende" onkeyup="savCampo()" onfocus="mudaLb(lbEnd)" value="<?php echo $valInfo[7];?>" maxlength="50" />
	</div>
	<div style="clear:both">
		<label class="labdir2">Complemento:</label>
		<input class="tam50" name="compl" onkeyup="savCampo()" value="<?php echo $valInfo[9]; ?>" maxlength="30" />
	</div>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrBair; ?>" id="lbBair">Bairro*:</label>
		<input id="inpBair" class="tam50" name="bairro" value="<?php echo $valInfo[10]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbBair)" maxlength="50"/>
	</div>
	<div style="clear:both">
		<label class="labdir2 <?php echo $cerrCid; ?>" id="lbCid">Cidade*:</label>
		<input id="inpCid" class="tam30" name="cidade" value="<?php echo $valInfo[11]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbCid)" maxlength="30"/>
		<label class="labdir2 <?php echo $cerrUF; ?>" id="lbUF">UF*:</label>
		<input id="inpUF" class="tam5" name="uf" value="<?php echo $valInfo[12]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbUF)" maxlength="2"/>
	</div>
</fieldset>
<fieldset class="full">
	<legend>Outros</legend>
	<div style="clear:both; margin:5 0 5 0">
		<label class="labdir2 <?php echo $cerrParent; ?>" id="lbpar">Parentesco*:</label>
		<select name="parent" onfocus="mudaLb(lbpar)" onchange="savCampo()">
			<option value='0'>Selecione o Grau de Parentesco</option>
		<?php foreach ($parentesco as $dados) { 
			$par = $fachada->checkOption("parent", $dados['idParent'], $informante->idParent); ?>
			<option value="<?php echo $dados['idParent']; ?>" <?php echo $par; ?>><?php echo $dados['tipo']; ?></option>
		<?php } ?>
		</select>
	</div>
	<div style="clear:both; margin:5 0 5 0">
		<label class="labdir2 <?php echo $cerrEsc; ?>" id="lbesc">Escolaridade*:</label>
		<select name="escol" onfocus="mudaLb(lbesc)" onchange="savCampo()">
			<option value='0'>Selecione o N&iacute;vel Escolar</option>
	   <?php foreach ($escolaridade as $dados1) { 
			$esc = $fachada->checkOption("escol", $dados1['idEsc'], $informante->idEsc); ?>
			<option value="<?php echo $dados1['idEsc']; ?>" <?php echo $esc; ?>><?php echo $dados1['tipo']; ?></option>
		<?php } ?>
		</select>
	</div>
	<div style="clear:both; margin:5 0 5 0">
		<label class="labdir2">Observa&ccedil;&otilde;es:</label>
		<textarea name="obsinfo" rows="4" cols="50" onkeyup="savCampo()"><?php echo $valInfo[14]; ?></textarea>
	</div>
</fieldset>