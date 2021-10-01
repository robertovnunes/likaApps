<fieldset style="width:33%">
	<legend id="lblpeso" <?php echo (isset($lblpeso) ? $lblpeso : ''); ?>>Peso</legend>
	<select style="margin:4 0 0 10" name="pesomed" onfocus="mudaLb(lblpeso)" onChange="savCampo('M')" <?php echo $ass;?> style="margin-top:4px;margin-right:10px">
		<option value="NA" <?php echo $pesomed1; ?>  onclick = "habilitaPesoMedind(0)">Não Avaliado</option>
		<option value="AV" <?php echo $pesomed2; ?> onclick = "habilitaPesoMedind(1)">Valor</option>
	</select> 
	<input name="pesomedin" <?php echo $ass; ?> onchange="savCampo('M')" onkeypress="mascara(this,6)" size="5" maxlength="5" value="<?php echo $pesomedin; ?>"  <?php echo $dpesomed; ?> /><span class="lbdtt1">g</span> 
</fieldset>
<fieldset style="width:34%">
	<legend id="lblaltmed" <?php echo (isset($lblaltmed) ? $lblaltmed : ''); ?>>Altura</legend>
	<select style="margin:4 0 0 10" name="alturamed" onfocus="mudaLb(lblaltmed)" onChange="savCampo('M')" <?php echo $ass; ?> style="margin-top:4px;margin-right:10px">
		<option value="NA" <?php echo $alturamed1; ?> onclick="habilitaAlturaMedind(0)">Não Avaliado</option>
		<option value="AV" <?php echo $alturamed2; ?> onclick="habilitaAlturaMedind(1)">Valor</option>
	</select> 
	<input name="alturamedin" <?php echo $ass; ?> onchange="savCampo('M')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $alturamedin; ?>" <?php echo $dalturamed; ?> /><span class="lbdtt1">cm</span>  
</fieldset>
<fieldset style="width:21%">
	<legend>Gr&aacute;ficos</legend>
	<input style="margin:0" type="button" onchange="savCampo('M')" value="Ver Gr&aacute;ficos" onclick="window.open('graficos.php?at=<?php echo $atend; ?>','Tabela','location=1,status=1,scrollbars=1,height=450, width=1024');" />
</fieldset>
<br />
<fieldset style="width:33%">
	<legend id="lblpcef" <?php echo (isset($lblpcef) ? $lblpcef : ''); ?>>Per&iacute;metro Cef&aacute;lico*</legend>
	<input name="permcef" <?php echo $ass;?> onfocus="mudaLb(lblpcef)" onchange="savCampo('M')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $permcef; ?>" /><span class="lbdtt1">cm</span>
</fieldset>
<fieldset style="width:34%">
	<legend id="lblptor" <?php echo (isset($lblptor) ? $lblptor : ''); ?>>Per&iacute;metro Tor&aacute;cico*</legend>
	<input name="permtora" <?php echo $ass;?> onfocus="mudaLb(lblptor)" onchange="savCampo('M')" onkeypress="mascara(this,6)"size="3" maxlength="3" value="<?php echo $permtora; ?>" /><span class="lbdtt1">cm</span> 	
</fieldset>
<fieldset style="width:21%">
	<legend id="lblpmab" <?php echo (isset($lblpmab) ? $lblpmab : ''); ?>>Per&iacute;metro Abdominal*</legend>
	<input name="permab" <?php echo $ass;?> onfocus="mudaLb(lblpmab)" onchange="savCampo('M')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $permab; ?>" /><span class="lbdtt1">cm</span>   
</fieldset>
<br />
<fieldset style="width:33%">
	<legend id="lblptric" <?php echo (isset($lblptric) ? $lblptric : ''); ?>>Prega Tricipital*</legend>
	<input name="pregatric" <?php echo $ass;?> onfocus="mudaLb(lblptric)" onchange="savCampo('M')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $pregatric; ?>" /><span class="lbdtt1">cm</span>
</fieldset>  
<fieldset style="width:34%">
	<legend id="lblpsesc" <?php echo (isset($lblpsesc) ? $lblpsesc : ''); ?>>Prega Sub-escapular*</legend>
	<input name="pregasubesc" <?php echo $ass;?> onfocus="mudaLb(lblpsesc)" onchange="savCampo('M')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $pregasubesc; ?>" /><span class="lbdtt1">cm</span>
</fieldset>
<div style="float: left; width: 100%; margin-left: 10px;">
	<label><b>(*) Campos obrigatórios.</b></label>
	<br/>
	<??>
</div>
