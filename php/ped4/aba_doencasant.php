<?php
	$ldoenc = getValuesTablePr('doencasanteriores',$pront);
?>
<table width="570" class="style5">
	<tr>
		<td width="274"><fieldset style="width:274px">
			<legend>Coqueluche</legend>
			<input name="coqueluche" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("coqueluche", "S", $ldoenc->coquel); ?>/>Sim
			<input name="coqueluche" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("coqueluche", "N", $ldoenc->coquel); ?>/>N&atilde;o
			<input name="coqueluche" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("coqueluche", "NA", $ldoenc->coquel); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td width="284"><fieldset>
			<legend>Sarampo</legend>
			<input name="sarampo" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("sarampo", "S", $ldoenc->saramp); ?>/>Sim
			<input name="sarampo" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("sarampo", "N", $ldoenc->saramp); ?>/>N&atilde;o
			<input name="sarampo" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("sarampo", "NA", $ldoenc->saramp); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
			<legend>Varicela</legend>
			<input name="varicela" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("varicela", "S", $ldoenc->varic); ?>/>Sim
			<input name="varicela" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("varicela", "N", $ldoenc->varic); ?>/>N&atilde;o
			<input name="varicela" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("varicela", "NA", $ldoenc->varic); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		
		<td><fieldset>
			<legend>Parotide</legend>
			<input name="parotide" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("parotide", "S", $ldoenc->parot); ?>/>Sim
			<input name="parotide" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("parotide", "N", $ldoenc->parot); ?>/>N&atilde;o
			<input name="parotide" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("parotide", "NA", $ldoenc->parot); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Difteria</legend>
			<input name="difteria" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("difteria", "S", $ldoenc->dift); ?>/>Sim
			<input name="difteria" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("difteria", "N", $ldoenc->dift); ?>/>N&atilde;o
			<input name="difteria" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("difteria", "NA", $ldoenc->dift); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>T&eacute;tano</legend>
			<input name="tetano" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("tetano", "S", $ldoenc->tetano); ?>/>Sim
			<input name="tetano" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("tetano", "N", $ldoenc->tetano); ?>/>N&atilde;o
			<input name="tetano" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("tetano", "NA", $ldoenc->tetano); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
			<legend>Diarr&eacute;ia</legend>
			<input name="diarreia" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("diarreia", "S", $ldoenc->diarr); ?>/>Sim
			<input name="diarreia" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("diarreia", "N", $ldoenc->diarr); ?>/>N&atilde;o
			<input name="diarreia" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("diarreia", "NA", $ldoenc->diarr); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Pneumonia</legend>
			<input name="pneumonia" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("pneumonia", "S", $ldoenc->pneum); ?>/>Sim
			<input name="pneumonia" type="radio" value="N" onchange="savCampo('8')"
			 	<?php echo checkPOST("pneumonia", "N", $ldoenc->pneum); ?>/>N&atilde;o
			<input name="pneumonia" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("pneumonia", "NA", $ldoenc->pneum); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Meningite</legend>
			<input name="meningite" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("meningite", "S", $ldoenc->mening); ?>/>Sim
			<input name="meningite" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("meningite", "N", $ldoenc->mening); ?>/>N&atilde;o
			<input name="meningite" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("meningite", "NA", $ldoenc->mening); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Febre Reum&aacute;tica</legend>
			<input name="febrereum" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("febrereum", "S", $ldoenc->febrer); ?>/>Sim
			<input name="febrereum" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("febrereum", "N", $ldoenc->febrer); ?>/>N&atilde;o
			<input name="febrereum" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("febrereum", "NA", $ldoenc->febrer); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Nefropatia</legend>
			<input name="nefropatia" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("nefropatia", "S", $ldoenc->nefro); ?>/>Sim
			<input name="nefropatia" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("nefropatia", "N", $ldoenc->nefro); ?>/>N&atilde;o
			<input name="nefropatia" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("nefropatia", "NA", $ldoenc->nefro); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Tuberculose</legend>
			<input name="tuberculose" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("tuberculose", "S", $ldoenc->tuberc); ?>/>Sim
			<input name="tuberculose" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("tuberculose", "N", $ldoenc->tuberc); ?>/>N&atilde;o
			<input name="tuberculose" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("tuberculose", "NA", $ldoenc->tuberc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Asma</legend>
			<input name="asma" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("asma", "S", $ldoenc->asma); ?>/>Sim
			<input name="asma" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("asma", "N", $ldoenc->asma); ?>/>N&atilde;o
			<input name="asma" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("asma", "NA", $ldoenc->asma); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Eczema</legend>
			<input name="eczema" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("eczema", "S", $ldoenc->eczema); ?>/>Sim
			<input name="eczema" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("eczema", "N", $ldoenc->eczema); ?>/>N&atilde;o
			<input name="eczema" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("eczema", "NA", $ldoenc->eczema); ?>/>N&atilde;o Avaliado
		</fieldset>
		</td>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend id="lblalerg" <?php if ($errda && $_POST['alerg'] == "S" && $_POST['talerg'] == ""){ echo "class='erro'"; }?>>
				Alergia Alimentar</legend>
			<input name="alerg" type="radio" value="S" onclick="habilitaAlergia(1)" onfocus="mudaLb(lblalerg)"
				<?php echo checkPOST("alerg", "S", $ldoenc->alergalim); ?> onchange="savCampo('8')"/>Sim
			<input name="alerg" type="radio" value="N" onclick="habilitaAlergia(0)" onfocus="mudaLb(lblalerg)"
				<?php echo checkPOST("alerg", "N", $ldoenc->alergalim);?> onchange="savCampo('8')"/>N&atilde;o
			<input name="alerg" type="radio" value="NA" onclick="habilitaAlergia(0)" onfocus="mudaLb(lblalerg)"
				<?php echo checkPOST("alerg", "NA", $ldoenc->alergalim); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
			<textarea name="talerg" cols="80" onkeyup="savCampo('8')" onfocus="mudaLb(lblalerg)" 
				<?php echo checkDisable("alerg", $ldoenc->alergalim, "S"); ?>><?php echo printOBS($ldoenc->talergalim, $_POST['talerg']); ?></textarea>
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Rinite Al&eacute;rgica</legend>
			<input name="rinite" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("rinite", "S", $ldoenc->rinite); ?>/>Sim
			<input name="rinite" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("rinite", "N", $ldoenc->rinite); ?>/>N&atilde;o
			<input name="rinite" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("rinite", "NA", $ldoenc->rinite); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Cirurgias e Acidentes</legend>
			<input name="cirurgia" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("cirurgia", "S", $ldoenc->cirurg); ?>/>Sim
			<input name="cirurgia" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("cirurgia", "N", $ldoenc->cirurg); ?>/>N&atilde;o
			<input name="cirurgia" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("cirurgia", "NA", $ldoenc->cirurg); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Hist&oacute;rico de Transfus&otilde;es</legend>
			<input name="transf" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("transf", "S", $ldoenc->histtransf); ?>/>Sim
			<input name="transf" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("transf", "N", $ldoenc->histtransf); ?>/>N&atilde;o
			<input name="transf" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("transf", "NA", $ldoenc->histtransf); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Hospitaliza&ccedil;&otilde;es</legend>
			<input name="hospit" type="radio" value="S" onchange="savCampo('8')"
				<?php echo checkPOST("hospit", "S", $ldoenc->hosp); ?>/>Sim
			<input name="hospit" type="radio" value="N" onchange="savCampo('8')"
				<?php echo checkPOST("hospit", "N", $ldoenc->hosp); ?>/>N&atilde;o
			<input name="hospit" type="radio" value="NA" onchange="savCampo('8')"
				<?php echo checkPOST("hospit", "NA", $ldoenc->hosp); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend id="lbltreal" <?php if ($errda && $_POST['tratamentos'] == "")?>>Tratamentos Realizados</legend>
			<textarea name="tratamentos" cols="80" onkeyup="savCampo('8')" onfocus="mudaLb(lbltreal)"><?php echo printOBS($ldoenc->trat, $_POST['tratamentos']); ?></textarea>
		</fieldset></td>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsdoenant" cols="80" onkeyup="savCampo('8')"><?php echo printOBS($ldoenc->obs, $_POST['obsdoenant']);?></textarea>
		</fieldset></td>
	</tr>
</table>




	



