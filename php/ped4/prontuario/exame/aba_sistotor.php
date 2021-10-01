<?php
	$leot = getValuesTableAt('examesistotorrin',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame F�sico > Especial > Otorrinolaringol&oacute;gico</td>
    </tr>
</table>

<br />

<table width="580">
	<tr>
		<td colspan="2"><fieldset>
			<legend>Ouvidos</legend>
			<table width="557">
			  <tr>
				<td width="275"><fieldset style="width:275px">
					<legend>Posi&ccedil;&atilde;o das Orelhas </legend>
					<select name="posorel" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("posorel", "N", $leot->posouv); ?>>Normal</option>
						<option value="R" <?php echo checkOption("posorel", "R", $leot->posouv); ?>>Rebaixada</option>
						<option value="NA" <?php echo checkOption("posorel","NA",$leot->posouv);?>>N&atilde;o Avaliado</option>
					</select>
			  	</fieldset></td>
				<td width="278"><fieldset>
					<legend>Forma das Orelhas</legend>
					<select name="formorel" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
                    	<option value="N" <?php echo checkOption("formorel", "N", $leot->formouv); ?>>Normal</option>
                    	<option value="R" <?php echo checkOption("formorel", "R", $leot->formouv); ?>>Alterada</option>
                    	<option value="NA" <?php echo checkOption("formorel", "NA", $leot->formouv); ?>>N&atilde;o Avaliado
						</option>
                    </select>
			  	</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Dor</legend>
					<input name="dororel" type="radio" value="S" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("dororel", "S", $leot->dorouv); ?>/>Sim
					<input name="dororel" type="radio" value="N" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("dororel", "N", $leot->dorouv); ?>/>N&atilde;o
					<input name="dororel" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("dororel", "NA", $leot->dorouv); ?>/>N&atilde;o Avaliado
				</fieldset></td>
				<td><fieldset>
					<legend>Edema Sobre a Mast&oacute;ide</legend>
					<input name="edmast" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("edmast", "P", $leot->edouv); ?>/>Presente
					<input name="edmast" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("edmast", "A", $leot->edouv); ?>/>Ausente
					<input name="edmast" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("edmast", "NA", $leot->edouv); ?>/>N&atilde;o Avaliado
				</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Canal auditivo externo</legend>
					<input name="caudex" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("caudex", "A", $leot->caudexouv);?>/>Aberto
					<input name="caudex" type="radio" value="F" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("caudex", "F", $leot->caudexouv);?>/>Fechado
					<input name="caudex" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("caudex", "NA", $leot->caudexouv);?>/>N&atilde;o Avaliado
				</fieldset></td>
				<td><fieldset>
					<legend>Secre&ccedil;&atilde;o</legend>
					<select name="secrorel" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("secrorel", "N", $leot->secrouv); ?>>Normal</option>
						<option value="P" <?php echo checkOption("secrorel", "P", $leot->secrouv); ?>>Purulenta</option>
						<option value="NA" <?php echo checkOption("secrorel", "NA", $leot->secrouv); ?>>N&atilde;o Avaliado
						</option>
					</select>
				</fieldset></td>
			</tr>
			<tr>
				<td colspan="2"><fieldset style="width:275px">
					<legend>Otoscopia</legend>
					<select name="otoscop" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("otoscop", "N", $leot->otosc); ?>>Normal</option>
						<option value="A" <?php echo checkOption("otoscop", "A", $leot->otosc); ?>>Alterada</option>
						<option value="NA" <?php echo checkOption("otoscop", "NA", $leot->otosc); ?>>N&atilde;o Avaliado
						</option>
					</select>
				</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Nariz</legend>
			<table width="557">
			  <tr>
				<td width="276"><fieldset>
					<legend>Batimentos de asa do nariz</legend>
					<input name="batnariz" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("batnariz", "P", $leot->batasasna); ?>/>Presentes
					<input name="batnariz" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("batnariz", "A", $leot->batasasna); ?>/>Ausentes
					<input name="batnariz" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("batnariz", "NA", $leot->batasasna); ?>/>N&atilde;o Avaliado
			  	</fieldset></td>
				<td width="277"><fieldset>
					<legend>Secre&ccedil;&atilde;o</legend>
					<select name="secrna" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="H" <?php echo checkOption("secrna", "H", $leot->secrna); ?>>Hialina</option>
						<option value="A" <?php echo checkOption("secrna", "A", $leot->secrna); ?>>Amarelo-Esverdeada</option>
						<option value="NA" <?php echo checkOption("secrna", "NA", $leot->secrna); ?>>N&atilde;o Avaliado
						</option>
					</select>
			  	</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Tumora&ccedil;&otilde;es</legend>
					<input name="tumorna" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorna", "P", $leot->tumna); ?>/>Presentes
					<input name="tumorna" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorna", "A", $leot->tumna); ?>/>Ausentes
					<input name="tumorna" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorna", "NA", $leot->tumna); ?>/>N&atilde;o Avaliado
				</fieldset></td>
				<td><fieldset>
					<legend>Rinoscopia</legend>
					<select name="rinosc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("rinosc", "N", $leot->rinscop); ?>>Normal</option>
						<option value="A" <?php echo checkOption("rinosc", "A", $leot->rinscop); ?>>Alterado</option>
						<option value="NA" <?php echo checkOption("rinosc", "NA", $leot->rinscop); ?>>N&atilde;o Avaliado
						</option>
					</select>
				</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>L&aacute;bios</legend>
			<table width="557">
			<tr>
				<td width="275"><fieldset style="width:275px">
					<legend>Cor</legend>
					<select name="corlab" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="Co" <?php echo checkOption("corlab", "Co", $leot->corla); ?>>Corado</option>
						<option value="P" <?php echo checkOption("corlab", "P", $leot->corla); ?>>P&aacute;lido</option>
						<option value="Ci" <?php echo checkOption("corlab", "Ci", $leot->corla); ?>>Cian�tico</option>
						<option value="NA" <?php echo checkOption("corlab", "NA", $leot->corla);?>>N&atilde;o Avaliado</option>
					</select>
			  	</fieldset></td>
				<td width="278"><fieldset>
					<legend>Umidade</legend>
					<select name="umidlab" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
                      <option value="H" <?php echo checkOption("umidlab", "H", $leot->umidla); ?>>Hidratados</option>
                      <option value="U" <?php echo checkOption("umidlab", "U", $leot->umidla); ?>>&Uacute;midos</option>
                      <option value="R" <?php echo checkOption("umidlab", "R", $leot->umidla); ?>>Ressecados</option>
                      <option value="NA" <?php echo checkOption("umidlab", "NA", $leot->umidla);?>>N&atilde;o Avaliado</option>
                    </select>
				</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Erup&ccedil;&otilde;es</legend>
					<input name="eruplab" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("eruplab", "P", $leot->erupc); ?>/>Presentes
					<input name="eruplab" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("eruplab", "A", $leot->erupc); ?>/>Ausentes
                    <input name="eruplab" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("eruplab", "NA", $leot->erupc); ?>/>N&atilde;o Avaliado
                </fieldset></td>
				<td><fieldset>
					<legend>Fissuras</legend>
					<input name="fislab" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("fislab", "P", $leot->fiss); ?>/>Presentes
					<input name="fislab" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("fislab", "A", $leot->fiss); ?>/>Ausentes
					<input name="fislab" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("fislab", "NA", $leot->fiss); ?>/>N&atilde;o Avaliado
				</fieldset></td>
			</tr>
			<tr>
				<td colspan="2"><fieldset style="width:275px">
					<legend>Massas</legend>
					<input name="maslab" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("maslab", "P", $leot->mass);?>/>Presentes
					<input name="maslab" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("maslab", "A", $leot->mass);?>/>Ausentes
					<input name="maslab" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("maslab", "NA", $leot->mass);?>/>N&atilde;o Avaliado
				</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Gengivas</legend>
			<table width="557">
			<tr>
				<td width="276"><fieldset>
					<legend>Cor</legend>
					<select name="corgeng" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("corgeng", "N", $leot->corge); ?>>Normal</option>
						<option value="A" <?php echo checkOption("corgeng", "A", $leot->corge); ?>>Alterada</option>
						<option value="NA" <?php echo checkOption("corgeng","NA",$leot->corge);?>>N&atilde;o Avaliado</option>
					</select>
			 	</fieldset></td>
				<td width="277"><fieldset>
					<legend>Hemorragias</legend>
					<input name="hemorge" type="radio" value="S" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorge", "S", $leot->hemorge); ?>/>Sim
					<input name="hemorge" type="radio" value="N" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorge", "N", $leot->hemorge); ?>/>N&atilde;o
					<input name="hemorge" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorge", "NA", $leot->hemorge); ?>/>N&atilde;o Avaliado
			  	</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>L&iacute;ngua</legend>
			<table width="557">
			<tr>
				<td width="275"><fieldset style="width:275px">
					<legend>Cor</legend>
					<select name="corli" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("corli", "N", $leot->corli); ?>>Normal</option>
						<option value="A" <?php echo checkOption("corli", "A", $leot->corli); ?>>Alterada</option>
						<option value="NA" <?php echo checkOption("corli","NA",$leot->corli);?>>N&atilde;o Avaliado</option>
					</select>
		  	  </fieldset></td>
				<td width="278"><fieldset>
					<legend>Umidade</legend>
					<select name="umidli" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
                    	<option value="H" <?php echo checkOption("umidli", "H", $leot->umidli); ?>>Hidratada</option>
                    	<option value="S" <?php echo checkOption("umidli", "S", $leot->umidli); ?>>Seca</option>
                    	<option value="NA" <?php echo checkOption("umidli","NA",$leot->umidli);?>>N&atilde;o Avaliado</option>
                    </select>
		  	  </fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Exsudato</legend>
					<input name="exsuli" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsuli", "P", $leot->exsudli); ?>/>Presente
                    <input name="exsuli" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsuli", "A", $leot->exsudli); ?>/>Ausente
                    <input name="exsuli" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsuli", "NA", $leot->exsudli); ?>/>N&atilde;o Avaliado
				</fieldset></td>
				<td><fieldset>
					<legend>Tremor</legend>
					<input name="tremli" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tremli", "P", $leot->tremli); ?>/>Presente
					<input name="tremli" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tremli", "A", $leot->tremli); ?>/>Ausente
					<input name="tremli" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tremli", "NA", $leot->tremli); ?>/>N&atilde;o Avaliado
				</fieldset></td>
			</tr>
			<tr>
              <td colspan="2"><fieldset style="width:275px">
                <legend>Tumora&ccedil;&otilde;es</legend>
                <input name="tumorac" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorac", "P", $leot->tumor); ?>/>Presentes
                <input name="tumorac" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorac", "A", $leot->tumor); ?>/>Ausentes
                <input name="tumorac" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("tumorac", "NA", $leot->tumor); ?>/>N&atilde;o Avaliado
              </fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Dentes</legend>
			<table width="557">
			<tr>
				<td width="275"><fieldset style="width:275px">
					<legend>N&uacute;mero</legend>
					<select name="numdent" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("numdent", "N", $leot->numdt); ?>>Normal para a idade</option>
						<option value="A" <?php echo checkOption("numdent", "A", $leot->numdt);?>>Anormal para a idade</option>
						<option value="NA" <?php echo checkOption("numdent", "NA",$leot->numdt);?>>N&atilde;o Avaliado</option>
					</select>
			  </fieldset></td>
				<td width="278"><fieldset>
					<legend>Implata&ccedil;&atilde;o</legend>
					<select name="impldent" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("impldent", "N", $leot->impdt); ?>>Normal</option>
						<option value="A" <?php echo checkOption("impldent", "A", $leot->impdt); ?>>Alterado</option>
						<option value="NA" <?php echo checkOption("impldent","NA",$leot->impdt);?>>N&atilde;o Avaliado</option>
                    </select>
				</fieldset></td>
			</tr>
			<tr>
				<td colspan="2"><fieldset style="width:275px">
					<legend>Conserva&ccedil;&atilde;o</legend>
					<select name="consdent" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
					  <option value="B" <?php echo checkOption("consdent", "B", $leot->consdt); ?>>Boa</option>
					  <option value="R" <?php echo checkOption("consdent", "R", $leot->consdt); ?>>Ruim</option>
					  <option value="P" <?php echo checkOption("consdent", "P", $leot->consdt); ?>>P&eacute;ssima</option>
					  <option value="NA" <?php echo checkOption("consdent", "NA",$leot->consdt); ?>>N&atilde;o Avaliado</option>
					</select>
				</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Faringe</legend>
			<table width="557">
			  <tr>
				<td width="275"><fieldset style="width:275px">
					<legend>Cor</legend>
					<select name="corfar" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("corfar", "N", $leot->corfa); ?>>Normal</option>
						<option value="A" <?php echo checkOption("corfar", "A", $leot->corfa); ?>>Alterada</option>
						<option value="NA" <?php echo checkOption("corfar","NA",$leot->corfa);?>>N&atilde;o Avaliado</option>
					</select>
		  	  	</fieldset></td>
				<td><fieldset>
					<legend>Exsudato</legend>
					<input name="exsufar" type="radio" value="P" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsufar", "P", $leot->exsudfa); ?>/>Presente
                    <input name="exsufar" type="radio" value="A" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsufar", "A", $leot->exsudfa); ?>/>Ausente
                    <input name="exsufar" type="radio" value="NA" onchange="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("exsufar", "NA", $leot->exsudfa); ?>/>N&atilde;o Avaliado
				</fieldset></td>
		</tr></table>
		</fieldset>
	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsotor" cols="68" onkeyup="savCampo('8')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($leot->obs, $_POST['obsotor']); ?></textarea>
	  </fieldset>
<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>
		</td>
	</tr>
</table>