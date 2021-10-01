<fieldset class="full">
	<legend id="lblcd" <?php echo (isset($lblcd) ? $lblcd : ''); ?>>Conduta*</legend>
	<textarea name="conduta" class="txta1" <?php echo $ass; ?> onFocus="mudaLb(lblcd)" onkeyup="savCampo()"><?php echo (isset($conduta) ? $conduta : ''); ?></textarea>
</fieldset>
<div style="margin-left: 10px;">
	<label><b>(*) Campos obrigatórios</b></label>
</div>