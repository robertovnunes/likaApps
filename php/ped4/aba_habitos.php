<?php
	$lhab = getValuesTablePr('habitos',$pront);
?>
<table width="570" class="style5">
  	<tr>
    	<td width="274"><fieldset style="width:274px">
			<legend>Chupeta</legend>
			<input name="chupeta" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("chupeta", "S", $lhab->chupeta); ?>/>Sim
			<input name="chupeta" type="radio" value="N" onchange="savCampo('6')" 
				<?php echo checkPOST("chupeta", "N", $lhab->chupeta); ?>/>N&atilde;o
			<input name="chupeta" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("chupeta", "NA", $lhab->chupeta); ?>/>N&atilde;o Avaliado
		</fieldset></td>
    	<td width="284"><fieldset>
      		<legend>Chupa Dedo</legend>
      		<input name="chupadedo" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("chupadedo", "S", $lhab->chupdedo); ?> />Sim
      		<input name="chupadedo" type="radio" value="N" onchange="savCampo('6')" 
				<?php echo checkPOST("chupadedo", "N", $lhab->chupdedo); ?>/>N&atilde;o
      		<input name="chupadedo" type="radio" value="NA" onchange="savCampo('6')" 
				<?php echo checkPOST("chupadedo", "NA", $lhab->chupdedo); ?>/>N&atilde;o Avaliado
   	  </fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
      		<legend>R&oacute;i Unhas</legend>
      		<input name="roiunhas" type="radio" value="S" onchange="savCampo('6')"
				<?php echo checkPOST("roiunhas", "S", $lhab->roiunha); ?>/>Sim
      		<input name="roiunhas" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("roiunhas", "N", $lhab->roiunha); ?>/>N&atilde;o
    		<input name="roiunhas" type="radio" value="NA" onchange="savCampo('6')" 
				<?php echo checkPOST("roiunhas", "NA", $lhab->roiunha); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Tiques</legend>
			<input name="tiques" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("tiques", "S", $lhab->tiques); ?>/>Sim
			<input name="tiques" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("tiques", "N", $lhab->tiques); ?>/>N&atilde;o
			<input name="tiques" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("tiques", "NA", $lhab->tiques); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
      		<legend>Altera&ccedil;&otilde;es na Alimenta&ccedil;&atilde;o</legend>
      		<input name="altalim" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("altalim", "S", $lhab->altalim); ?>/>Sim
      		<input name="altalim" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("altalim", "N", $lhab->altalim); ?>/>N&atilde;o
      		<input name="altalim" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("altalim", "NA", $lhab->altalim); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td><fieldset>
      		<legend>Geofagia</legend>
			<input name="geofagia" type="radio" value="S" onchange="savCampo('6')"
				<?php echo checkPOST("geofagia", "S", $lhab->geof); ?>/>Sim
			<input name="geofagia" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("geofagia", "N", $lhab->geof); ?>/>N&atilde;o
			<input name="geofagia" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("geofagia", "NA", $lhab->geof); ?> onchange="savCampo('6')"/>N&atilde;o Avaliado
    	</fieldset></td>
  	</tr>
  	<tr>
    	<td><fieldset>
			<legend>Enurese</legend>
			<input name="enurese" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("enurese", "S", $lhab->enur); ?>/>Sim
			<input name="enurese" type="radio" value="N" onchange="savCampo('6')" 
				<?php echo checkPOST("enurese", "N", $lhab->enur); ?>/>N&atilde;o
			<input name="enurese" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("enurese", "NA", $lhab->enur); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td><fieldset>
      		<legend>Perturba&ccedil;&otilde;es  do Sono</legend>
      		<input name="pertsono" type="radio" value="S" onchange="savCampo('6')"
				<?php echo checkPOST("pertsono", "S", $lhab->pertsono); ?>/>Sim
      		<input name="pertsono" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("pertsono", "N", $lhab->pertsono); ?>/>N&atilde;o
      		<input name="pertsono" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("pertsono", "NA", $lhab->pertsono); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset style="width:274px">
      		<legend>Dorme na Cama dos Pais</legend>
      		<input name="dormepais" type="radio" value="S" onchange="savCampo('6')" 
				<?php echo checkPOST("dormepais", "S", $lhab->dormpais); ?>/>Sim
      		<input name="dormepais" type="radio" value="N" onchange="savCampo('6')"
				<?php echo checkPOST("dormepais", "N", $lhab->dormpais); ?>/>N&atilde;o
      		<input name="dormepais" type="radio" value="NA" onchange="savCampo('6')"
				<?php echo checkPOST("dormepais", "NA", $lhab->dormpais); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
      		<legend>Observa&ccedil;&otilde;es</legend>
      		<textarea name="obshab" cols="80" onkeyup="savCampo('6')"><?php echo printOBS($lhab->obs,$_POST['obshab']);?></textarea>
    	</fieldset></td>
  	</tr>
</table>