<?php
	$ldes = getValuesTableAt('desenvneuropsicomotor',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame F�sico > Antropometria > Desenvolvimento Neuropsicomotor</td>
    </tr>
</table>

<br />
<table width="580">
	<tr>
   		<td width="274"><fieldset>
			<legend>O Beb&ecirc; reconhece a voz da m&atilde;e</legend>
			<select name="brvm" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="2" <?php echo checkOption("brvm", "2", $ldes->brvm); ?>>At&eacute; 2 meses</option>
				<option value="2+" <?php echo checkOption("brvm", "2+", $ldes->brvm); ?>>Depois de 2 meses</option>
				<option value="NA" <?php echo checkOption("brvm", "NA", $ldes->brvm); ?>>N&atilde;o Avaliado</option>
			</select>
   		</fieldset></td>
  		<td width="294"><fieldset>
   			<legend>Olha o rosto das pessoas  pr&oacute;ximas</legend>
	  		<select name="orpp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
   				<option value="2" <?php echo checkOption("orpp", "2", $ldes->orpp); ?>>At&eacute; 2 meses</option>
   				<option value="2+" <?php echo checkOption("orpp", "2+", $ldes->orpp); ?>>Depois de 2 meses</option>
        		<option value="NA" <?php echo checkOption("orpp", "NA", $ldes->orpp); ?>>N&atilde;o Avaliado</option>
	  		</select>
   		</fieldset></td>
  	</tr>
  	<tr>
    	<td width="274"><fieldset>
      		<legend>Presta aten&ccedil;&atilde;o quando ouve sons</legend>
			<select name="paqos" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="2" <?php echo checkOption("paqos", "2", $ldes->paqos); ?>>At&eacute; 2 meses</option>
				<option value="2+" <?php echo checkOption("paqos", "2+", $ldes->paqos); ?>>Depois de 2 meses</option>
				<option value="NA" <?php echo checkOption("paqos", "NA", $ldes->paqos); ?>>N&atilde;o Avaliado</option>
			</select>
   	  	</fieldset></td>
   	  	<td width="294"><fieldset>
   			<legend>Responde ao sorriso com um sorriso</legend>
	  		<select name="rscs" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
   				<option value="2" <?php echo checkOption("rscs", "2", $ldes->rscs); ?>>At&eacute; 2 meses</option>
   				<option value="2+" <?php echo checkOption("rscs", "2+", $ldes->rscs); ?>>Depois de 2 meses</option>
        		<option value="NA" <?php echo checkOption("rscs", "NA", $ldes->rscs); ?>>N&atilde;o Avaliado</option>
	  		</select>
   	  	</fieldset></td>
	</tr>
  	<tr>
    	<td width="274"><fieldset>
      		<legend>Posto de bru&ccedil;os, levanta  cabe&ccedil;a e ombros</legend>
			<select name="pblco" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="24" <?php echo checkOption("pblco", "24", $ldes->pblco); ?>>Entre 2 e 4 meses</option>
				<option value="2-" <?php echo checkOption("pblco", "2-", $ldes->pblco); ?>>Antes de 2 meses</option>
				<option value="4+" <?php echo checkOption("pblco", "4+", $ldes->pblco); ?>>Depois de 4 meses</option>
				<option value="NA" <?php echo checkOption("pblco", "NA", $ldes->pblco); ?>>N&atilde;o Avaliado</option>
			</select>
   	  	</fieldset></td>		
    	<td width="294"><fieldset>
      		<legend>Segue com os olhos pessoas e objetos</legend>
			<select name="scopo" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="24" <?php echo checkOption("scopo", "24", $ldes->scopo); ?>>Entre 2 e 4 meses</option>
				<option value="2-" <?php echo checkOption("scopo", "2-", $ldes->scopo); ?>>Antes de 2 meses</option>
				<option value="4+" <?php echo checkOption("scopo", "4+", $ldes->scopo); ?>>Depois de 4 meses</option>
				<option value="NA" <?php echo checkOption("scopo", "NA", $ldes->scopo); ?>>N&atilde;o Avaliado</option>
			</select>
	  	</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
      		<legend>brinca com a voz e tenta &quot;conversar&quot;</legend>
			<select name="bcvtc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="24" <?php echo checkOption("bcvtc", "24", $ldes->bcvtc); ?>>Entre 2 e 4 meses</option>
				<option value="2-" <?php echo checkOption("bcvtc", "2-", $ldes->bcvtc); ?>>Antes de 2 meses</option>
				<option value="4+" <?php echo checkOption("bcvtc", "4+", $ldes->bcvtc); ?>>Depois de 4 meses</option>
				<option value="NA" <?php echo checkOption("bcvtc", "NA", $ldes->bcvtc); ?>>N&atilde;o Avaliado</option>
			</select>
   	  	</fieldset></td>		
    	<td width="294"><fieldset>
      		<legend>brinca com as m&atilde;os  e as leva &agrave; boca</legend>
			<select name="bcmlb" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="24" <?php echo checkOption("bcmlb", "24", $ldes->bcmlb); ?>>Entre 2 e 4 meses</option>
				<option value="2-" <?php echo checkOption("bcmlb", "2-", $ldes->bcmlb); ?>>Antes de 2 meses</option>
				<option value="4+" <?php echo checkOption("bcmlb", "4+", $ldes->bcmlb); ?>>Depois de 4 meses</option>
				<option value="NA" <?php echo checkOption("bcmlb", "NA", $ldes->bcmlb); ?>>N&atilde;o Avaliado</option>
			</select>
	  	</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
      		<legend>O beb&ecirc; est&aacute; mais firme e j&aacute; senta com apoio.</legend>
			<select name="bmfsa" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="46" <?php echo checkOption("bmfsa", "46", $ldes->bmfsa); ?>>Entre 4 e 6 meses</option>
				<option value="4-" <?php echo checkOption("bmfsa", "4-", $ldes->bmfsa); ?>>Antes de 4 meses</option>
				<option value="6+" <?php echo checkOption("bmfsa", "6+", $ldes->bmfsa); ?>>Depois de 6 meses</option>
				<option value="NA" <?php echo checkOption("bmfsa", "NA", $ldes->bmfsa); ?>>N&atilde;o Avaliado</option>
			</select>
   		</fieldset></td>		
    	<td width="294"><fieldset>
      		<legend>Vira-se e rola sozinho</legend>
			<select name="vrs" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="46" <?php echo checkOption("vrs", "46", $ldes->vrs); ?>>Entre 4 e 6 meses</option>
				<option value="4-" <?php echo checkOption("vrs", "4-", $ldes->vrs); ?>>Antes de 4 meses</option>
				<option value="6+" <?php echo checkOption("vrs", "6+", $ldes->vrs); ?>>Depois de 6 meses</option>
				<option value="NA" <?php echo checkOption("vrs", "NA", $ldes->vrs); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
			<legend>Agarra brinquedos, segurando firme</legend>
          	<select name="absf" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="46" <?php echo checkOption("absf", "46", $ldes->absf); ?>>Entre 4 e 6 meses</option>
			    <option value="4-" <?php echo checkOption("absf", "4-", $ldes->absf); ?>>Antes de 4 meses</option>
			    <option value="6+" <?php echo checkOption("absf", "6+", $ldes->absf); ?>>Depois de 6 meses</option>
			    <option value="NA" <?php echo checkOption("absf", "NA", $ldes->absf); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td width="294"><fieldset>
      		<legend>Quando escuta algum barulho, tenta localiz&aacute;-lo</legend>
			<select name="qeabtl" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
				<option value="46" <?php echo checkOption("qeabtl", "46", $ldes->qeabtl); ?>>Entre 4 e 6 meses</option>
				<option value="4-" <?php echo checkOption("qeabtl", "4-", $ldes->qeabtl); ?>>Antes de 4 meses</option>
				<option value="6+" <?php echo checkOption("qeabtl", "6+", $ldes->qeabtl); ?>>Depois de 6 meses</option>
				<option value="NA" <?php echo checkOption("qeabtl", "NA", $ldes->qeabtl); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
			<legend>O beb&ecirc; fica sentado sem apoio</legend>
          	<select name="bfssa" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="69" <?php echo checkOption("bfssa", "69", $ldes->bfssa); ?>>Entre 6 e 9 meses</option>
          		<option value="6-" <?php echo checkOption("bfssa", "6-", $ldes->bfssa); ?>>Antes de 6 meses</option>
          		<option value="9+" <?php echo checkOption("bfssa", "9+", $ldes->bfssa); ?>>Depois de 9 meses</option>
          		<option value="NA" <?php echo checkOption("bfssa", "NA", $ldes->bfssa); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td width="294"><fieldset>
      		<legend>Come&ccedil;a a se arrastar ou engatinhar</legend>
          	<select name="cae" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="69" <?php echo checkOption("cae", "69", $ldes->cae); ?>>Entre 6 e 9 meses</option>
          		<option value="6-" <?php echo checkOption("cae", "6-", $ldes->cae); ?>>Antes de 6 meses</option>
          		<option value="9+" <?php echo checkOption("cae", "9+", $ldes->cae); ?>>Depois de 9 meses</option>
          		<option value="NA" <?php echo checkOption("cae", "NA", $ldes->cae); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
			<legend>Passa objetos de uma m&atilde;o para a outra</legend>
          	<select name="pomo" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="69" <?php echo checkOption("pomo", "69", $ldes->pomo); ?>>Entre 6 e 9 meses</option>
          		<option value="6-" <?php echo checkOption("pomo", "6-", $ldes->pomo); ?>>Antes de 6 meses</option>
          		<option value="9+" <?php echo checkOption("pomo", "9+", $ldes->pomo); ?>>Depois de 9 meses</option>
          		<option value="NA" <?php echo checkOption("pomo", "NA", $ldes->pomo); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td width="294"><fieldset>
      		<legend>Estranha pessoas desconhecidas</legend>
          	<select name="epd" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="69" <?php echo checkOption("epd", "69", $ldes->epd); ?>>Entre 6 e 9 meses</option>
          		<option value="6-" <?php echo checkOption("epd", "6-", $ldes->epd); ?>>Antes de 6 meses</option>
          		<option value="9+" <?php echo checkOption("epd", "9+", $ldes->epd); ?>>Depois de 9 meses</option>
          		<option value="NA" <?php echo checkOption("epd", "NA", $ldes->epd); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
  		<td width="274"><fieldset>
			<legend>Repete sons como &quot;pa-pa&quot;, &quot;ma-ma&quot;</legend>
          	<select name="rspm" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="69" <?php echo checkOption("rspm", "69", $ldes->rspm); ?>>Entre 6 e 9 meses</option>
          		<option value="6-" <?php echo checkOption("rspm", "6-", $ldes->rspm); ?>>Antes de 6 meses</option>
          		<option value="9+" <?php echo checkOption("rspm", "9+", $ldes->rspm); ?>>Depois de 9 meses</option>
          		<option value="NA" <?php echo checkOption("rspm", "NA", $ldes->rspm); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td width="294"><fieldset>
      		<legend>O beb&ecirc; pode ficar em p&eacute; com apoio</legend>
          	<select name="bpfpca" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="9C" <?php echo checkOption("bpfpca", "9C", $ldes->bpfpca); ?>>Entre 9 e 12 meses</option>
          		<option value="9-" <?php echo checkOption("bpfpca", "9-", $ldes->bpfpca); ?>>Antes de 9 meses</option>
          		<option value="C+" <?php echo checkOption("bpfpca", "C+", $ldes->bpfpca); ?>>Depois de 12 meses</option>
          		<option value="NA" <?php echo checkOption("bpfpca", "NA", $ldes->bpfpca); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Bate palmas, aponta com o dedo, acena</legend>
          	<select name="bpacda" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="9C" <?php echo checkOption("bpacda", "9C", $ldes->bpacda); ?>>Entre 9 e 12 meses</option>
          		<option value="9-" <?php echo checkOption("bpacda", "9-", $ldes->bpacda); ?>>Antes de 9 meses</option>
          		<option value="C+" <?php echo checkOption("bpacda", "C+", $ldes->bpacda); ?>>Depois de 12 meses</option>
          		<option value="NA" <?php echo checkOption("bpacda", "NA", $ldes->bpacda); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Pode falar uma ou duas palavras</legend>
          	<select name="pfudp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="9C" <?php echo checkOption("pfudp", "9C", $ldes->pfudp); ?>>Entre 9 e 12 meses</option>
          		<option value="9-" <?php echo checkOption("pfudp", "9-", $ldes->pfudp); ?>>Antes de 9 meses</option>
          		<option value="C+" <?php echo checkOption("pfudp", "C+", $ldes->pfudp); ?>>Depois de 12 meses</option>
          		<option value="NA" <?php echo checkOption("pfudp", "NA", $ldes->pfudp); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>A crian�a anda sozinha</legend>
          	<select name="cas" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="CI" <?php echo checkOption("cas", "CI", $ldes->cas); ?>>Entre 1 ano e 1 ano e 6 meses</option>
          		<option value="C-" <?php echo checkOption("cas", "C-", $ldes->cas); ?>>Antes de 1 ano</option>
          		<option value="I+" <?php echo checkOption("cas", "I+", $ldes->cas); ?>>Depois de 1 ano e 6 meses</option>
          		<option value="NA" <?php echo checkOption("cas", "NA", $ldes->cas); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>compreende bem o que lhe dizem</legend>
          	<select name="cbld" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="CI" <?php echo checkOption("cbld", "CI", $ldes->clbd); ?>>Entre 1 ano e 1 ano e 6 meses</option>
          		<option value="C-" <?php echo checkOption("cbld", "C-", $ldes->clbd); ?>>Antes de 1 ano</option>
          		<option value="I+" <?php echo checkOption("cbld", "I+", $ldes->clbd); ?>>Depois de 1 ano e 6 meses</option>
          		<option value="NA" <?php echo checkOption("cbld", "NA", $ldes->clbd); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Quer comer sozinha</legend>
          	<select name="qcs" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="CI" <?php echo checkOption("qcs", "CI", $ldes->qcs); ?>>Entre 1 ano e 1 ano e 6 meses</option>
          		<option value="C-" <?php echo checkOption("qcs", "C-", $ldes->qcs); ?>>Antes de 1 ano</option>
          		<option value="I+" <?php echo checkOption("qcs", "I+", $ldes->qcs); ?>>Depois de 1 ano e 6 meses</option>
          		<option value="NA" <?php echo checkOption("qcs", "NA", $ldes->qcs); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Gosta de escutar  hist&oacute;rias, m&uacute;sicas e de dan&ccedil;ar</legend>
          	<select name="gehmd" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="CI" <?php echo checkOption("gehmd", "CI", $ldes->gehmd);?>>Entre 1 ano e 1 ano e 6 meses</option>
          		<option value="C-" <?php echo checkOption("gehmd", "C-", $ldes->gehmd); ?>>Antes de 1 ano</option>
          		<option value="I+" <?php echo checkOption("gehmd", "I+", $ldes->gehmd); ?>>Depois de 1 ano e 6 meses</option>
          		<option value="NA" <?php echo checkOption("gehmd", "NA", $ldes->gehmd); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Come&ccedil;a a fazer birra quando contrariada</legend>
          	<select name="cfbqc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="CI" <?php echo checkOption("cfbqc", "CI", $ldes->cfbqc);?>>Entre 1 ano e 1 ano e 6 meses</option>
          		<option value="C-" <?php echo checkOption("cfbqc", "C-", $ldes->cfbqc); ?>>Antes de 1 ano</option>
          		<option value="I+" <?php echo checkOption("cfbqc", "I+", $ldes->cfbqc); ?>>Depois de 1 ano e 6 meses</option>
          		<option value="NA" <?php echo checkOption("cfbqc", "NA", $ldes->cfbqc); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
		    <legend>Forma frases simples como &quot;leite n&atilde;o&quot;</legend>
          	  <select name="ffs" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          	    <option value="I2" <?php echo checkOption("ffs", "I2", $ldes->ffs); ?>>Entre 1 ano e 6 meses e 2 anos</option>
          	    <option value="I-" <?php echo checkOption("ffs", "I-", $ldes->ffs); ?>>Antes de 1 ano e 6 meses</option>
          	    <option value="2+" <?php echo checkOption("ffs", "2+", $ldes->ffs); ?>>Depois de 2 anos</option>
          	    <option value="NA" <?php echo checkOption("ffs", "NA", $ldes->ffs); ?>>N&atilde;o Avaliado</option>
   	      </select>
      	</fieldset></td>
  	</tr>
  	<tr>
		<td width="274"><fieldset>
		    <legend>Demonstra ter vontade pr&oacute;pria</legend>
          	  <select name="dtvp" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          	    <option value="I2" <?php echo checkOption("dtvp", "I2", $ldes->dtvp); ?>>Entre 1 ano e 6 meses e 2 anos</option>
          	    <option value="I-" <?php echo checkOption("dtvp", "I-", $ldes->dtvp); ?>>Antes de 1 ano e 6 meses</option>
          	    <option value="2+" <?php echo checkOption("dtvp", "2+", $ldes->dtvp); ?>>Depois de 2 anos</option>
          	    <option value="NA" <?php echo checkOption("dtvp", "NA", $ldes->dtvp); ?>>N&atilde;o Avaliado</option>
   	      </select>
   	  </fieldset></td>
		<td width="294"><fieldset>
      		<legend>Corre, sobe e desce escadas, com adulto perto </legend>
          	<select name="csde" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="I2" <?php echo checkOption("csde", "I2", $ldes->csde);?>>Entre 1 ano e 6 meses e 2 anos</option>
          		<option value="I-" <?php echo checkOption("csde", "I-", $ldes->csde); ?>>Antes de 1 ano e 6 meses</option>
          		<option value="2+" <?php echo checkOption("csde", "2+", $ldes->csde); ?>>Depois de 2 anos</option>
          		<option value="NA" <?php echo checkOption("csde", "NA", $ldes->csde); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Pode ajudar a se vestir</legend>
          	<select name="pasv" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="I2" <?php echo checkOption("pasv", "I2", $ldes->pasv);?>>Entre 1 ano e 6 meses e 2 anos</option>
          		<option value="I-" <?php echo checkOption("pasv", "I-", $ldes->pasv); ?>>Antes de 1 ano e 6 meses</option>
          		<option value="2+" <?php echo checkOption("pasv", "2+", $ldes->pasv); ?>>Depois de 2 anos</option>
          		<option value="NA" <?php echo checkOption("pasv", "NA", $ldes->pasv); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Aprende a controlar o xixi e o coc&ocirc;</legend>
          	<select name="acxc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="I2" <?php echo checkOption("acxc", "I2", $ldes->acxc);?>>Entre 1 ano e 6 meses e 2 anos</option>
          		<option value="I-" <?php echo checkOption("acxc", "I-", $ldes->acxc); ?>>Antes de 1 ano e 6 meses</option>
          		<option value="2+" <?php echo checkOption("acxc", "2+", $ldes->acxc); ?>>Depois de 2 anos</option>
          		<option value="NA" <?php echo checkOption("acxc", "NA", $ldes->acxc); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Sobe escadas, com  apoio do corrim&atilde;o</legend>
          	<select name="secac" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="23" <?php echo checkOption("secac", "23", $ldes->secac);?>>Entre 2 e 3 anos</option>
          		<option value="2-" <?php echo checkOption("secac", "2-", $ldes->secac); ?>>Antes de 2 anos</option>
          		<option value="3+" <?php echo checkOption("secac", "3+", $ldes->secac); ?>>Depois de 3 anos</option>
          		<option value="NA" <?php echo checkOption("secac", "NA", $ldes->secac); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Come&ccedil;a a perguntar o nome de tudo</legend>
          	<select name="cpnt" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="23" <?php echo checkOption("cpnt", "23", $ldes->cpnt);?>>Entre 2 e 3 anos</option>
          		<option value="2-" <?php echo checkOption("cpnt", "2-", $ldes->cpnt); ?>>Antes de 2 anos</option>
          		<option value="3+" <?php echo checkOption("cpnt", "3+", $ldes->cpnt); ?>>Depois de 3 anos</option>
          		<option value="NA" <?php echo checkOption("cpnt", "NA", $ldes->cpnt); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Gosta de brincar com outras crian&ccedil;as</legend>
          	<select name="gboc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="23" <?php echo checkOption("gboc", "23", $ldes->gboc);?>>Entre 2 e 3 anos</option>
          		<option value="2-" <?php echo checkOption("gboc", "2-", $ldes->gboc); ?>>Antes de 2 anos</option>
          		<option value="3+" <?php echo checkOption("gboc", "3+", $ldes->gboc); ?>>Depois de 3 anos</option>
          		<option value="NA" <?php echo checkOption("gboc", "NA", $ldes->gboc); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Veste-se sozinha</legend>
          	<select name="vests" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="36" <?php echo checkOption("vests", "36", $ldes->vests);?>>Entre 3 e 6 anos</option>
          		<option value="3-" <?php echo checkOption("vests", "3-", $ldes->vests); ?>>Antes de 3 anos</option>
          		<option value="6+" <?php echo checkOption("vests", "6+", $ldes->vests); ?>>Depois de 6 anos</option>
          		<option value="NA" <?php echo checkOption("vests", "NA", $ldes->vests); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td width="274"><fieldset>
      		<legend>Fala de forma clara e compreens&iacute;vel</legend>
          	<select name="ffcc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="36" <?php echo checkOption("ffcc", "36", $ldes->ffcc);?>>Entre 3 e 6 anos</option>
          		<option value="3-" <?php echo checkOption("ffcc", "3-", $ldes->ffcc); ?>>Antes de 3 anos</option>
          		<option value="6+" <?php echo checkOption("ffcc", "6+", $ldes->ffcc); ?>>Depois de 6 anos</option>
          		<option value="NA" <?php echo checkOption("ffcc", "NA", $ldes->ffcc); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
		<td width="294"><fieldset>
      		<legend>Pergunta muito &quot;por qu&ecirc;?&quot;</legend>
          	<select name="pmpq" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="36" <?php echo checkOption("pmpq", "36", $ldes->pmpq);?>>Entre 3 e 6 anos</option>
          		<option value="3-" <?php echo checkOption("pmpq", "3-", $ldes->pmpq); ?>>Antes de 3 anos</option>
          		<option value="6+" <?php echo checkOption("pmpq", "6+", $ldes->pmpq); ?>>Depois de 6 anos</option>
          		<option value="NA" <?php echo checkOption("pmpq", "NA", $ldes->pmpq); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
  	</tr>
  	<tr>
		<td colspan="2"><fieldset>
      		<legend>Tem interesse por amigos e atividades independentes da fam&iacute;lia </legend>
          	<select name="iaaif" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('5')">
          		<option value="6A" <?php echo checkOption("iaaif", "6A", $ldes->iaaif);?>>Entre 6 e 10 anos</option>
          		<option value="6-" <?php echo checkOption("iaaif", "6-", $ldes->iaaif); ?>>Antes de 6 anos</option>
          		<option value="A+" <?php echo checkOption("iaaif", "A+", $ldes->iaaif); ?>>Depois de 10 anos</option>
          		<option value="NA" <?php echo checkOption("iaaif", "NA", $ldes->iaaif); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>		
	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
      		<legend>Observa&ccedil;&otilde;es</legend>
      		<textarea name="obsdes" cols="68" onkeyup="savCampo('5')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($ldes->obs, $_POST['obsdes']); ?></textarea>
    		</fieldset>
<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?></td>
	</tr>
</table>