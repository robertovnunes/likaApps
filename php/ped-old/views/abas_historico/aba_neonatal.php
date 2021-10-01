<br />
<span class="style7">Pessoal > NeoNatal</span>
<br />
<fieldset style="width:20%">
	<legend>Apgar de 1 Minuto</legend>
	<select name="apgar1" onchange="savCampo('3')">
	<?php $cont1 = 1; while ($cont1 < 12) { 
		$apgar1x = $fachada->checkOption("apgar1", $cont1, $lnnat->apgar1); ?>
		<option value="<?php echo $cont1; ?>" <?php echo $apgar1x; ?>><?php echo $cont1-1; ?></option>
	<?php $cont1++; } ?>
		<option value="NA" <?php echo $apgar11; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:24%">
	<legend>Apgar de 5 Minutos</legend>
	<select name="apgar5" onchange="savCampo('3')">
	<?php $cont1 = 1; while ($cont1 < 12) { 
		$apgar5x = $fachada->checkOption("apgar5", $cont1, $lnnat->apgar5); ?>
		<option value="<?php echo $cont1; ?>" <?php echo $apgar5x; ?>><?php echo $cont1-1; ?></option>
	<?php $cont1++; } ?>
		<option value='NA' <?php echo $apgar51; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:44%" >
	<legend>Permeabilidade Nasal</legend>
	<span>
		<input name="permnasal" type="radio" value="S" onchange="savCampo('3')" <?php echo $permnasal1; ?>/><label>Sim</label>
		<input name="permnasal" type="radio" value="N" onchange="savCampo('3')"	<?php echo $permnasal2; ?>/><label>N&atilde;o</label>
		<input name="permnasal" type="radio" value="NA" onchange="savCampo('3')" <?php echo $permnasal3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:20%">
	<legend>Idade Gestacional</legend>
	<select name="idadegest" onchange="savCampo('3')">
		<option value='PrT' <?php echo $idadegest1; ?>>Pr&eacute;-Termo</option>
		<option value='T' <?php echo $idadegest2; ?>>Termo</option>
		<option value='PoT' <?php echo $idadegest3; ?>>P&oacute;s-Termo</option>
		<option value='NA' <?php echo $idadegest4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:24%">
	<legend>Grupo Sangu&iacute;neo do RN</legend>
	<select name="sangrn" onchange="savCampo('3')">
		<option value='NA' <?php echo $sangrn; ?>>N&atilde;o Avaliado</option>
	<?php foreach ($sang as $s){
		$sangrnx = $fachada->checkOption("sangrn",$s['idSang'],$lnnat->idSang) ?>
		<option value="<?php echo $s['idSang']; ?>" <?php echo $sangrnx;?>><?php echo $s['tipo'];?></option>
	<?php } ?>
	</select>
</fieldset>
<fieldset style="width:44%">
	<legend>Sinal de Ortolani</legend>
	<span>
		<input name="sinorto" type="radio" value="S" onchange="savCampo('3')" <?php echo $sinorto1; ?>/><label>Sim</label>
		<input name="sinorto" type="radio" value="N" onchange="savCampo('3')" <?php echo $sinorto2; ?>/><label>N&atilde;o</label>
		<input name="sinorto" type="radio" value="NA" onchange="savCampo('3')" <?php echo $sinorto3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Dados Antropom&eacute;tricos</legend>
	<fieldset style="width:31%">
		<legend>Peso na Alta</legend>
		<select name="pesoalta" onchange="savCampo('3')">
			<option value='2500' <?php echo $pesoalta1; ?>>2500 a 3000 g</option>
			<option value='3000' <?php echo $pesoalta2; ?>>Mais de 3000 g</option>
			<option value='NA' <?php echo $pesoalta3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:13%">
		<legend>Peso Atual</legend>
		<input style="margin:0" name="pesoat" onchange="savCampo('3')" onkeypress="mascara(this,6)" size="5" maxlength="5" value ="<?php echo $pesoat; ?>"/><label>g</label>
	</fieldset>
	<fieldset style="width:13%">
		<legend>Altura Atual</legend>
		<input style="margin:0" name="altat" onchange="savCampo('3')" onkeypress="mascara(this,6)" size="3" maxlength="3" value ="<?php echo $altat; ?>"/><label>cm</label>
	</fieldset>
	<fieldset style="width:26%">
		<legend>Per&iacute;metro Cef&aacute;lico</legend>
		<select name="percef" onchange="savCampo('3')">
			<option value='-34' <?php echo $percef1; ?>>Menos de 34 cm</option>
			<option value='34' <?php echo $percef2; ?>>34 a 36 cm</option>
			<option value='+36' <?php echo $percef3; ?>>Mais de 36 cm</option>
			<option value='NA' <?php echo $percef4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:31%">
		<legend id="lblPN" <?php echo $lblpeson; ?>>Peso ao Nascer</legend>
		<select style="margin:0 0 0 10" name="spesonasc" onfocus="mudaLb(lblPN)"  onChange="savCampo('3')" style="margin-top:4px;margin-right:10px">
			<option value="NA" <?php echo $pesonasc1; ?>  onclick="habilitaPesoNascer(0)">N&atilde;o Avaliado</option>
			<option value="AV" <?php echo $pesonasc2; ?> onclick="habilitaPesoNascer(1)">Valor</option>
		</select> 
		<input style="margin:0" name="pesonasc" <?php echo $ass." ".$dpesonasc; ?> onchange="savCampo('3')" onkeypress="mascara(this,6)" size="5" maxlength="5" value="<?php echo $pesonasc; ?>" /><label>g</label> 

	   <!-- <select id="pesonasc" name="pesonasc" onchange="savCampo('3')">
			<option value='-1500'<?php //echo $pesonasc1; ?>>Menos de 1500 g</option>
			<option value='-2500'<?php //echo $pesonasc2; ?>>Menos de 2500 g</option>
			<option value='2500' <?php //echo $pesonasc3; ?>>2500 a 3000 g</option>
			<option value='3000' <?php //echo $pesonasc4; ?>>3000 a 3999 g</option>
			<option value='+4000' <?php //echo $pesonasc5; ?>>Mais de 4000 g</option>
			<option value='NA' <?php //echo $pesonasc6; ?>>N&atilde;o Avaliado</option>
		</select>-->
	</fieldset>
	<fieldset style="width:30%">
		<legend >Comprimento</legend>
		<select name="comp" onchange="savCampo('3')">
			<option value='-47' <?php echo $comp1; ?>>Menos de 47 cm</option>
			<option value='47' <?php echo $comp2; ?>>47 a 50 cm</option>
			<option value='+50' <?php echo $comp3; ?>>Mais de 50 cm</option>
			<option value='NA' <?php echo $comp4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:26%">
		<legend>Per&iacute;metro Tor&aacute;cico</legend>
		<select name="pertorac" onchange="savCampo('3')">
			<option value='-30' <?php echo $pertorac1; ?>>Menos de 30 cm</option>
			<option value='34' <?php echo $pertorac2; ?>>30 a 34 cm</option>
			<option value='+34' <?php echo $pertorac3; ?>>Mais de 34 cm</option>
			<option value='NA' <?php echo $pertorac4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>

<fieldset class="full">
	<legend>Teste do Pezinho</legend>
	<div><span>
		<input name="testepe" type="radio" value="S" onclick="habilitaTestePez(1)" onchange="savCampo('1')" <?php echo $testepe1; ?>/><label>Sim</label>
		<input name="testepe" type="radio" value="N" onclick="habilitaTestePez(0)" onchange="savCampo('1')" <?php echo $testepe2; ?>/><label>N&atilde;o</label>
		<input name="testepe" type="radio" value="NA" onclick="habilitaTestePez(0)" onchange="savCampo('1')" <?php echo $testepe3; ?>/><label>N&atilde;o Avaliado</label>
	</span></div>
	<div style="clear:both"></div>
	<div style="float:left;margin:5 0 5 0">
		<label class="labdir1">Fenilceton&uacute;ria:</label>
		<select name="fenilcet" onchange="savCampo('3')" <?php echo $dtestepe; ?>>
			<option value='S' <?php echo $fenilcet1; ?>>Positivo</option>
			<option value='N' <?php echo $fenilcet2; ?>>Negativo</option>
			<option value='NA' <?php echo $fenilcet3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin:5 0 5 0">
		<label class="labdir1">Hipotiroidismo:</label>
		<select class="lab" name="hipotir" onchange="savCampo('3')" <?php echo $dtestepe; ?>>
			<option value='S' <?php echo $hipotir1; ?>>Positivo</option>
			<option value='N' <?php echo $hipotir2; ?>>Negativo</option>
			<option value='NA' <?php echo $hipotir3; ?>>N&atilde;o Avaliado </option>
		</select>
	</div>
	<div style="clear:both">
		<label class="labdir1">Anemia Falciforme:</label>
		<select name="anemfalc" onchange="savCampo('3')" <?php echo $dtestepe; ?>>
			<option value='S' <?php echo $anemfalc1; ?>>Positivo</option>
			<option value='N' <?php echo $anemfalc2; ?>>Negativo</option>
			<option value='NA'<?php echo $anemfalc3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
</fieldset>

<fieldset class="full">
	<legend>Triagem Auditiva</legend>
	<div><span>
		<input name="triagaud" type="radio" value="S" onclick="habilitaTriaAud(1)" onchange="savCampo('3')" <?php echo $triagaud1; ?>/><label>Sim</label>
		<input name="triagaud" type="radio" value="N" onclick="habilitaTriaAud(0)" onchange="savCampo('3')" <?php echo $triagaud2; ?>/><label>N&atilde;o</label>
		<input name="triagaud" type="radio" value="NA" onclick="habilitaTriaAud(0)" onchange="savCampo('3')" <?php echo $triagaud3; ?>/><label>N&atilde;o Avaliado</label>
	</span></div>
	<div style="clear:both"></div>
	<div style="float:left;margin:5 0 5 0">
		<label class="labdir2">PEATE:</label>
		<select name="peate" onchange="savCampo('3')" <?php echo $dtriagaud;?>>
			<option value='P' <?php echo $peate1; ?>>Positivo</option>
			<option value='N' <?php echo $peate2; ?>>Negativo</option>
			<option value='NA' <?php echo $peate3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin:5 0 5 0">
		<label class="labdir2">EOA:</label>
		<select name="eoa" onchange="savCampo('3')" <?php echo $dtriagaud; ?>>
			<option value='N' <?php echo $eoa1; ?>>Normal</option>
			<option value='A' <?php echo $eoa2; ?>>Alterado</option>
			<option value='NA' <?php echo $eoa3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="clear:both"></div>
</fieldset>

<fieldset style="width:46%">
	<legend>Icter&iacute;cia</legend>
	<select name="icter"  onchange="savCampo('3')">
	<?php for ($i = 1; $i <= 5; $i++){
		$icterx = $fachada->checkOption("icter", $i, $lnnat->icter);
		echo '<option value="'.$i.'" '.$icterx.'>Zona '.$i.' de Kramer</option>';
	} ?>
		<option value="A" <?php echo $icter1; ?>>Ausente</option>
		<option value="NA" <?php echo $icter2; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Reanima&ccedil;&atilde;o</legend>
	<span>
		<input name="reanim" type="radio" value="S" onchange="savCampo('3')" <?php echo $reanim1; ?>/><label>Sim</label>
		<input name="reanim" type="radio" value="N" onchange="savCampo('3')" <?php echo $reanim2; ?>/><label>N&atilde;o</label>
		<input name="reanim" type="radio" value="NA" onchange="savCampo('3')" <?php echo $reanim3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Rash</legend>
	<span>
		<input name="rash" type="radio" value="S" onchange="savCampo('3')" <?php echo $rash1; ?>/><label>Sim</label>
		<input name="rash" type="radio" value="N" onchange="savCampo('3')" <?php echo $rash2; ?>/><label>N&atilde;o</label>
		<input name="rash" type="radio" value="NA" onchange="savCampo('3')" <?php echo $rash3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Sangramentos</legend>
	<span>
		<input name="sang" type="radio" value="S" onchange="savCampo('3')" <?php echo $sang1; ?>/><label>Sim</label>
		<input name="sang" type="radio" value="N" onchange="savCampo('3')" <?php echo $sang2; ?>/><label>N&atilde;o</label>
		<input name="sang" type="radio" value="NA" onchange="savCampo('3')" <?php echo $sang3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>V&ocirc;mitos</legend>
	<span>
		<input name="vomit" type="radio" value="S" onchange="savCampo('3')" <?php echo $vomit1; ?>/><label>Sim</label>
		<input name="vomit" type="radio" value="N" onchange="savCampo('3')" <?php echo $vomit2; ?>/><label>N&atilde;o</label>
		<input name="vomit" type="radio" value="NA" onchange="savCampo('3')" <?php echo $vomit3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Infec&ccedil;&otilde;es</legend>
	<span>
		<input name="infec" type="radio" value="S" onchange="savCampo('3')" <?php echo $infec1; ?>/><label>Sim</label>
		<input name="infec" type="radio" value="N" onchange="savCampo('3')" <?php echo $infec2; ?>/><label>N&atilde;o</label>
		<input name="infec" type="radio" value="NA" onchange="savCampo('3')" <?php echo $infec3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Anomalias Cong&ecirc;nitas </legend>
	<span>
		<input name="anomcong" type="radio" value="S" onchange="savCampo('3')" <?php echo $anomcong1; ?>/><label>Sim</label>
		<input name="anomcong" type="radio" value="N" onchange="savCampo('3')" <?php echo $anomcong2; ?>/><label>N&atilde;o</label>
		<input name="anomcong" type="radio" value="NA" onchange="savCampo('3')" <?php echo $anomcong3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Paralisias</legend>
	<span>
		<input name="paral" type="radio" value="S" onchange="savCampo('3')" <?php echo $paral1; ?>/><label>Sim</label>
		<input name="paral" type="radio" value="N" onchange="savCampo('3')" <?php echo $paral2; ?>/><label>N&atilde;o</label>
		<input name="paral" type="radio" value="NA" onchange="savCampo('3')" <?php echo $paral3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Coriza</legend>
	<span>
		<input name="coriza" type="radio" value="S" onchange="savCampo('3')" <?php echo $coriza1; ?>/><label>Sim</label>
		<input name="coriza" type="radio" value="N" onchange="savCampo('3')" <?php echo $coriza2; ?>/><label>N&atilde;o</label>
		<input name="coriza" type="radio" value="NA" onchange="savCampo('3')" <?php echo $coriza3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Convuls&otilde;es</legend>
	<span>
		<input name="convul" type="radio" value="S" onchange="savCampo('3')" <?php echo $convul1; ?>/><label>Sim</label>
		<input name="convul" type="radio" value="N" onchange="savCampo('3')" <?php echo $convul2; ?>/><label>N&atilde;o</label>
		<input name="convul" type="radio" value="NA" onchange="savCampo('3')" <?php echo $convul3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsnnatal" onkeyup="savCampo('2')"><?php echo $obsnnatal; ?></textarea>
</fieldset>