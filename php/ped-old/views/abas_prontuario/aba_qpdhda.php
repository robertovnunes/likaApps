<fieldset class="full">
	<legend id="lbqpd" <?php echo $lbqpd; ?>>Queixa Principal*</legend>
	<textarea name="QPD" class="txta1" onfocus="mudaLb(lbqpd)" onkeyup="contre(this);savCampo()" <?php echo $ass; ?>><?php echo $queix; ?></textarea>
</fieldset>
<fieldset class="full">
	<legend id="lblhda" <?php echo $lblhda; ?>>Hist&oacute;rico da Doen&ccedil;a Atual*</legend>
	<textarea name="HDA" class="txta1" onfocus="mudaLb(lblhda)" onkeyup="contre(this);savCampo()" <?php echo $ass; ?>><?php echo $hist; ?></textarea>
</fieldset>
<div>
	<label style="margin-left: 10px;">(*) Campos Obrigatórios</label>
</div>
