<fieldset class="full">
	<legend>Ouvidos</legend>
	<fieldset style="width:46%">
		<legend>Posi&ccedil;&atilde;o das Orelhas</legend>
		<select name="posorelha" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $posorelha1; ?>>Normal</option>
			<option value="R" <?php echo $posorelha2; ?>>Rebaixada</option>
			<option value="NA" <?php echo $posorelha3;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Forma das Orelhas</legend>
		<select name="formorelha" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $formorelha1; ?>>Normal</option>
			<option value="R" <?php echo $formorelha2; ?>>Alterada</option>
			<option value="NA" <?php echo $formorelha3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Dor</legend>
		<span>
			<input name="dorouvido" type="radio" value="S" onchange="savCampo('8')" <?php echo $ass." ".$dorouvido1; ?>/><label>Sim</label>
			<input name="dorouvido" type="radio" value="N" onchange="savCampo('8')" <?php echo $ass." ".$dorouvido2; ?>/><label>N&atilde;o</label>
			<input name="dorouvido" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$dorouvido3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Edema Sobre a Mast&oacute;ide</legend>
		<span>
			<input name="edemamast" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$edemamast1; ?>/><label>Presente</label>
			<input name="edemamast" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$edemamast2; ?>/><label>Ausente</label>
			<input name="edemamast" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$edemamast3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Secre&ccedil;&atilde;o</legend>
		<select name="secrouvido" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $secrouv1; ?>>Normal</option>
			<option value="P" <?php echo $secrouv2; ?>>Purulenta</option>
			<option value="NA" <?php echo $secrouv3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Canal auditivo externo</legend>
		<span>
			<input name="canaudext" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$canaudext1; ?>/><label>Aberto</label>
			<input name="canaudext" type="radio" value="F" onchange="savCampo('8')" <?php echo $ass." ".$canaudext2; ?>/><label>Fechado</label>
			<input name="canaudext" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$canaudext3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Otoscopia</legend>
		<select name="otoscopia" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $otoscopia1; ?>>Normal</option>
			<option value="A" <?php echo $otoscopia2; ?>>Alterada</option>
			<option value="NA" <?php echo $otoscopia3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Nariz</legend>
	<fieldset style="width:49%">
		<legend>Batimentos de asa do nariz</legend>
		<span>
			<input name="batasanariz" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$batasanariz1; ?>/><label>Presentes</label>
			<input name="batasanariz" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$batasanariz2; ?>/><label>Ausentes</label>
			<input name="batasanariz" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$batasanariz3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Secre&ccedil;&atilde;o</legend>
		<select name="secrnariz" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="H" <?php echo $secrnariz1; ?>>Hialina</option>
			<option value="A" <?php echo $secrnariz2; ?>>Amarelo-Esverdeada</option>
			<option value="NA" <?php echo $secrnariz3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:49%">
		<legend>Tumora&ccedil;&otilde;es</legend>
		<span>
			<input name="tumornariz" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$tumornariz1; ?>/><label>Presentes</label>
			<input name="tumornariz" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$tumornariz2; ?>/><label>Ausentes</label>
			<input name="tumornariz" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$tumornariz3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Rinoscopia</legend>
		<select name="rinoscopia" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $rinoscopia1; ?>>Normal</option>
			<option value="A" <?php echo $rinoscopia2; ?>>Alterado</option>
			<option value="NA" <?php echo $rinoscopia3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>L&aacute;bios</legend>
	<fieldset style="width:49%">
		<legend>Erup&ccedil;&otilde;es</legend>
		<span>
			<input name="eruplabios" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$eruplabios1; ?>/><label>Presentes</label>
			<input name="eruplabios" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$eruplabios2; ?>/><label>Ausentes</label>
			<input name="eruplabios" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$eruplabios3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Cor</legend>
		<select name="corlabios" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="Co" <?php echo $corlabios1; ?>>Corado</option>
			<option value="P" <?php echo $corlabios2; ?>>P&aacute;lido</option>
			<option value="Ci" <?php echo $corlabios3; ?>>Cianótico</option>
			<option value="NA" <?php echo $corlabios4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:49%">
		<legend>Fissuras</legend>
		<span>
			<input name="fisslabios" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$fisslabios1; ?>/><label>Presentes</label>
			<input name="fisslabios" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$fisslabios2; ?>/><label>Ausentes</label>
			<input name="fisslabios" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$fisslabios3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Umidade</legend>
		<select name="umidlabios" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="H" <?php echo $umidlabios1; ?>>Hidratados</option>
			<option value="U" <?php echo $umidlabios2; ?>>&Uacute;midos</option>
			<option value="R" <?php echo $umidlabios3; ?>>Ressecados</option>
			<option value="NA" <?php echo $umidlabios4;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:49%">
		<legend>Massas</legend>
		<span>
			<input name="masslabios" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$masslabios1; ?>/><label>Presentes</label>
			<input name="masslabios" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$masslabios2; ?>/><label>Ausentes</label>
			<input name="masslabios" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$masslabios3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Gengivas</legend>
	<fieldset style="width:46%">
		<legend>Cor</legend>
		<select name="corgeng" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $corgeng1; ?>>Normal</option>
			<option value="A" <?php echo $corgeng2; ?>>Alterada</option>
			<option value="NA" <?php echo $corgeng3;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Hemorragias</legend>
		<span>
			<input name="hemorrgeng" type="radio" value="S" onchange="savCampo('8')" <?php echo $ass." ".$hemorrgeng1; ?>/><label>Sim</label>
			<input name="hemorrgeng" type="radio" value="N" onchange="savCampo('8')" <?php echo $ass." ".$hemorrgeng2; ?>/><label>N&atilde;o</label>
			<input name="hemorrgeng" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$hemorrgeng3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>L&iacute;ngua</legend>
	<fieldset style="width:49%">
		<legend>Exsudato</legend>
		<span>
			<input name="exsudatol" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$exsudatol1; ?>/><label>Presente</label>
			<input name="exsudatol" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$exsudatol2; ?>/><label>Ausente</label>
			<input name="exsudatol" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$exsudatol3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Cor</legend>
		<select name="corlingua" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $corlingua1; ?>>Normal</option>
			<option value="A" <?php echo $corlingua2; ?>>Alterada</option>
			<option value="NA" <?php echo $corlingua3;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:49%">
		<legend>Tremor</legend>
		<span>
			<input name="tremlingua" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$tremlingua1; ?>/><label>Presente</label>
			<input name="tremlingua" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$tremlingua2; ?>/><label>Ausente</label>
			<input name="tremlingua" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$tremlingua3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:43%">
		<legend>Umidade</legend>
		<select name="umidlingua" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="H" <?php echo $umidlingua1; ?>>Hidratada</option>
			<option value="S" <?php echo $umidlingua2; ?>>Seca</option>
			<option value="NA" <?php echo $umidlingua3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:49%">
		<legend>Tumora&ccedil;&otilde;es</legend>
		<span>
			<input name="tumoracoes" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$tumoracoes1; ?>/><label>Presentes</label>
			<input name="tumoracoes" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$tumoracoes2; ?>/><label>Ausentes</label>
			<input name="tumoracoes" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$tumoracoes3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Dentes</legend>
	<fieldset style="width:46%">
		<legend>N&uacute;mero</legend>
		<select name="numdentes" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $numdentes1; ?>>Normal para a idade</option>
			<option value="A" <?php echo $numdentes2; ?>>Anormal para a idade</option>
			<option value="NA" <?php echo $numdentes3; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Implata&ccedil;&atilde;o</legend>
		<select name="impldentes" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $impldentes1; ?>>Normal</option>
			<option value="A" <?php echo $impldentes2; ?>>Alterado</option>
			<option value="NA" <?php echo $impldentes3;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Conserva&ccedil;&atilde;o</legend>
		<select name="consdentes" <?php echo $ass; ?> onchange="savCampo('8')">
		  <option value="B" <?php echo $consdentes1; ?>>Boa</option>
		  <option value="R" <?php echo $consdentes2; ?>>Ruim</option>
		  <option value="P" <?php echo $consdentes3; ?>>P&eacute;ssima</option>
		  <option value="NA" <?php echo $consdentes4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Faringe</legend>
	<fieldset style="width:46%">
		<legend>Cor</legend>
		<select name="corfaringe" <?php echo $ass; ?> onchange="savCampo('8')">
			<option value="N" <?php echo $corfaringe1; ?>>Normal</option>
			<option value="A" <?php echo $corfaringe2; ?>>Alterada</option>
			<option value="NA" <?php echo $corfaringe3;?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Exsudato</legend>
		<span>
			<input name="exsudatof" type="radio" value="P" onchange="savCampo('8')" <?php echo $ass." ".$exsudatof1; ?>/><label>Presente</label>
			<input name="exsudatof" type="radio" value="A" onchange="savCampo('8')" <?php echo $ass." ".$exsudatof2; ?>/><label>Ausente</label>
			<input name="exsudatof" type="radio" value="NA" onchange="savCampo('8')" <?php echo $ass." ".$exsudatof3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsotor" class="txta1" onkeyup="savCampo('8')" <?php echo $ass; ?>><?php echo $obsotor; ?></textarea>
</fieldset>