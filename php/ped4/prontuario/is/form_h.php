<?php
	$lsm = getValuesTableAt('genmasc',$atend);
	
?>
	<tr>
		<td><fieldset>
			<legend>Pubarca</legend>
			<select name="pubarcah" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
				<option value="-8" <?php echo checkOption("pubarcah", "-8", $lsm->pub); ?>>Menos de 8 Anos</option>
				<option value="814" <?php echo checkOption("pubarcah", "814", $lsm->pub); ?>>Entre 8 e 14 Anos</option>
				<option value="+14" <?php echo checkOption("pubarcah", "+14", $lsm->pub); ?>>Mais de 14 Anos</option>
				<option value="A" <?php echo checkOption("pubarcah", "A", $lsm->pub); ?>>Ausente</option>
				<option value="NA" <?php echo checkOption("pubarcah", "NA", $lsm->pub); ?>>Não Avaliado</option>
			</select>
		</fieldset></td>
		<td><fieldset>
        	<legend>Volume Testicular</legend>
            <select name="voltestic" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
				<option value="N" <?php echo checkOption("voltestic", "N", $lsm->voltest); ?>>Normal</option>
				<option value="MA" <?php echo checkOption("voltestic", "MA", $lsm->voltest); ?>>Maior que o Normal</option>
				<option value="ME" <?php echo checkOption("voltestic", "ME", $lsm->voltest); ?>>Menor que o Normal</option>
				<option value="NA" <?php echo checkOption("voltestic", "NA", $lsm->voltest); ?>>Não Avaliado</option>
            </select>
    	</fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
        	<legend>Ere&ccedil;&atilde;o</legend>
            <input name="erecao" type="radio" value="P" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("erecao", "P", $lsm->erec); ?> onchange="savCampo('8')"/>Presente
            <input name="erecao" type="radio" value="A" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("erecao", "A", $lsm->erec); ?> onchange="savCampo('8')"/>Ausente
            <input name="erecao" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("erecao", "NA", $lsm->erec); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
	    </fieldset></td>
        <td><fieldset>
        	<legend>Tamanho do P&ecirc;nis</legend>
            <select name="tampenis" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
                <option value="N" <?php echo checkOption("tampenis", "N", $lsm->tampen); ?>>Normal</option>
                <option value="MA" <?php echo checkOption("tampenis", "MA", $lsm->tampen); ?>>Maior que o Normal</option>
                <option value="ME" <?php echo checkOption("tampenis", "ME", $lsm->tampen); ?>>Menor que o Normal</option>
                <option value="NA" <?php echo checkOption("tampenis", "NA", $lsm->tampen); ?>>Não Avaliado</option>
        	</select>
	  </fieldset></td>
	</tr>
  	<tr>
		<td><fieldset>
			<legend>Polu&ccedil;&otilde;es</legend>
			<input name="polucoes" type="radio" value="P" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("polucoes", "P", $lsm->poluc); ?> onchange="savCampo('8')"/>Presente
			<input name="polucoes" type="radio" value="A" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("polucoes", "A", $lsm->poluc); ?> onchange="savCampo('8')"/>Ausente
			<input name="polucoes" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("polucoes", "NA", $lsm->poluc); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
		</fieldset><td>
  	</tr>
