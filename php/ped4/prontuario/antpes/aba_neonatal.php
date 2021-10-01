<?php
	$lnnat = getValuesTablePr('neonatal',$pront);
	$sql_sang = SQLGrupoSanguineo();
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Pessoal > Neo-Natal</td>
    	
    </tr>
</table>
<br/>
<table width="570" class="style5">
	<tr>
		<td width="133"><fieldset>
      		<legend>Apgar de 1 Minuto</legend>
      		<select name="apgar1" onchange="savCampo('3')">
			<?php $cont1 = 1; while ($cont1 < 12) { ?>
        		<option value="<? echo $cont1; ?>" <?php echo checkOption("apgar1", $cont1, $lnnat->apgar1); ?>><? echo $cont1-1; ?>
				</option>
        	<? $cont1++; } ?>
				<option value='NA' <?php echo checkOption("apgar1", "NA", $lnnat->apgar1); ?>>N&atilde;o Avaliado</option>
      		</select>
   	  </fieldset></td>
    	<td width="168"><fieldset>
			<legend>Apgar de 5 Minutos</legend>
			<select name="apgar5" onchange="savCampo('3')">
			<?php $cont1 = 1; while ($cont1 < 12) { ?>
				<option value="<? echo $cont1; ?>" <?php echo checkOption("apgar5", $cont1, $lnnat->apgar5); ?>><? echo $cont1-1; ?>
				</option>
			<? $cont1++; } ?>
				<option value='NA' <?php echo checkOption("apgar5", "NA", $lnnat->apgar5); ?>>N&atilde;o Avaliado</option>
		  	</select>
	  </fieldset></td>
		<td width="253"><fieldset>
  			<legend>Permeabilidade Nasal</legend>
   			<input name="permnasal" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("permnasal", "S", $lnnat->permnas); ?>/>Sim
      		<input name="permnasal" type="radio" value="N" onchange="savCampo('3')" 
	  			<?php echo checkPOST("permnasal", "N", $lnnat->permnas); ?>/>N&atilde;o
      		<input name="permnasal" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("permnasal", "NA", $lnnat->permnas); ?>/>N&atilde;o Avaliado
   	  </fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
			<legend>Idade Gestacional</legend>
			<select name="idadegest" onchange="savCampo('3')">
				<option value='PrT' <?php echo checkOption("idadegest", "PrT", $lnnat->idadgest); ?>>Pr&eacute;-Termo</option>
				<option value='T' <?php echo checkOption("idadegest", "T", $lnnat->idadgest); ?>>Termo</option>
				<option value='PoT' <?php echo checkOption("idadegest", "PoT", $lnnat->idadgest); ?>>P&oacute;s-Termo</option>
				<option value='NA' <?php echo checkOption("idadegest", "NA", $lnnat->idadgest); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
		<td><fieldset>
			<legend>Grupo Sangu&iacute;neo do RN</legend>
			<select name="sangrn" onchange="savCampo('3')">
				<option value='NA' <?php echo checkOption("sangrn", "NA", $lnnat->idSang); ?>>N&atilde;o Avaliado</option>
			<?php while ($dados = mysql_fetch_array($sql_sang)) { ?>
				<option value="<?php echo $dados['idSang'];?>" <?php echo checkOption("sangrn",$dados['idSang'],$lnnat->idSang);?>
					><?php echo $dados['tipo']; ?></option>
			<? } ?>
			</select>
		</fieldset></td>
		<td><fieldset>
			<legend>Sinal de Ortolani</legend>
			<input name="sinalorto" type="radio" value="S" onchange="savCampo('3')"
				<?php echo checkPOST("sinalorto", "S", $lnnat->sinort); ?>/>Sim
			<input name="sinalorto" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("sinalorto", "N", $lnnat->sinort); ?>/>N&atilde;o
			<input name="sinalorto" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("sinalorto", "NA", $lnnat->sinort); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
			<legend>Dados Antropom&eacute;tricos</legend>
			<table width="512" class="style5">
        	<tr>
            	<td width="163"><fieldset>
              		<legend>Peso ao Nascer</legend>
              		<select name="pesonasc" onchange="savCampo('3')">
                		<option value='-1500'<?php echo checkOption("pesonasc","-1500",$lnnat->pesonasc);?>>Menos de 1500 g</option>
                		<option value='-2500'<?php echo checkOption("pesonasc","-2500",$lnnat->pesonasc);?>>Menos de 2500 g</option>
                		<option value='2500' <?php echo checkOption("pesonasc","2500",$lnnat->pesonasc); ?>>2500 a 3000 g</option>
                		<option value='3000' <?php echo checkOption("pesonasc", "3000", $lnnat->pesonasc); ?>>3000 a 3999 g</option>
                		<option value='+4000' <?php echo checkOption("pesonasc","+4000",$lnnat->pesonasc);?>>Mais de 4000 g</option>
                		<option value='NA' <?php echo checkOption("pesonasc", "NA",$lnnat->pesonasc);?>>N&atilde;o Avaliado</option>
              		</select>
            </fieldset></td>
            <td width="163"><fieldset>
              		<legend>Peso Atual</legend>
              		<input name="pesoAtual" onchange="savCampo('3')" size="3" maxlength="3" value ="<?php echo printOBS($lnnat->pesoat,$_POST['pesoAtual']); ?>"/>&nbsp;kg
                		
              		
            </fieldset></td>
            
            	<td width="160"><fieldset>
              		<legend>Comprimento</legend>
              		<select name="comprimento" onchange="savCampo('3')">
                		<option value='-47' <?php echo checkOption("comprimento", "-47", $lnnat->comp); ?>>Menos de 47 cm</option>
                		<option value='47' <?php echo checkOption("comprimento", "47", $lnnat->comp); ?>>47 a 50 cm</option>
                		<option value='+50' <?php echo checkOption("comprimento", "+50", $lnnat->comp); ?>>Mais de 50 cm</option>
                		<option value='NA' <?php echo checkOption("comprimento", "NA", $lnnat->comp); ?>>N&atilde;o Avaliado
						</option>
              		</select>
           	  </fieldset></td>
            	<td width="173"><fieldset>
              		<legend>Per&iacute;metro Cef&aacute;lico</legend>
              		<select name="percef" onchange="savCampo('3')">
                		<option value='-34' <?php echo checkOption("percef", "-34", $lnnat->percef); ?>>Menos de 34 cm</option>
                		<option value='34' <?php echo checkOption("percef", "34", $lnnat->percef); ?>>34 a 36 cm</option>
                		<option value='+36' <?php echo checkOption("percef", "+36", $lnnat->percef); ?>>Mais de 36 cm</option>
                		<option value='NA' <?php echo checkOption("percef", "NA", $lnnat->percef); ?>>N&atilde;o Avaliado</option>
              		</select>
           	  </fieldset></td>
          	</tr>
          	<tr>
            <td width="163"><fieldset>
              		<legend>Altura Atual</legend>
              		<input name="alturaAtual" onchange="savCampo('3')" size="3" maxlength="3" value ="<?php echo printOBS($lnnat->alturat,$_POST['alturaAtual']); ?>"/>&nbsp;cm
                		
              		
            </fieldset></td>
            	<td colspan="2"><fieldset>
            		<legend>Per&iacute;metro Tor&aacute;cico</legend>
              		<select name="pertorac" onchange="savCampo('3')">
                		<option value='-30' <?php echo checkOption("pertorac", "-30", $lnnat->pertor); ?>>Menos de 30 cm</option>
                		<option value='34' <?php echo checkOption("pertorac", "34", $lnnat->pertor); ?>>30 a 34 cm</option>
                		<option value='+34' <?php echo checkOption("pertorac", "+34", $lnnat->pertor); ?>>Mais de 34 cm</option>
                		<option value='NA' <?php echo checkOption("pertorac", "NA", $lnnat->pertor); ?>>N&atilde;o Avaliado
						</option>
              		</select>
            	</fieldset></td>
            	<td><fieldset>
            	<legend>Peso na Alta</legend>
              		<select name="pesoalta" onchange="savCampo('3')">
                		<option value='2500' <?php echo checkOption("pesoalta", "2500", $lnnat->pesoalta);?>>2500 a 3000 g</option>
                		<option value='3000' <?php echo checkOption("pesoalta", "3000", $lnnat->pesoalta);?>>Mais de 3000 g</option>
                		<option value='NA' <?php echo checkOption("pesoalta", "NA", $lnnat->pesoalta); ?>>N&atilde;o Avaliado
						</option>
              		</select>
              	</fieldset></td>
       	</tr></table>
		</fieldset></td>
   	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
			<legend>Teste do Pezinho</legend>
			<input name="testepe" type="radio" value="S" onclick="habilitaTestePez(1)" onchange="savCampo('3')"
				<?php echo checkPOST("testepe", "S", $lnnat->testpe); ?>/>Sim
			<input name="testepe" type="radio" value="N" onclick="habilitaTestePez(0)" onchange="savCampo('3')"
				<?php echo checkPOST("testepe", "N", $lnnat->testpe); ?>/>N&atilde;o
			<input name="testepe" type="radio" value="NA" onclick="habilitaTestePez(0)" onchange="savCampo('3')"
				<?php echo checkPOST("testepe", "NA", $lnnat->testpe); ?>/>N&atilde;o Avaliado
			<br />
			<table width="512" class="style5">
				<tr>
					<td width="127" align="right">Fenilceton&uacute;ria:</td>
					<td width="115"><select name="fenilcet" onchange="savCampo('3')" <?php echo checkDisable("testepe", $lnnat->testpe, "S"); ?>>
                      	<option value='S' <?php echo checkOption("fenilcet", "S", $lnnat->fenilcet); ?>>Positivo</option>
                      	<option value='N' <?php echo checkOption("fenilcet", "N", $lnnat->fenilcet); ?>>Negativo</option>
                      	<option value='NA' <?php echo checkOption("fenilcet", "NA",$lnnat->fenilcet);?>>N&atilde;o Avaliado</option>
                    </select></td>
				    <td width="92" align="right">Hipotiroidismo:</td>
				    <td width="158"><select name="hipotiroid" onchange="savCampo('3')" <?php echo checkDisable("testepe", $lnnat->testpe, "S"); ?>>
                      <option value='S' <?php echo checkOption("hipotiroid", "S", $lnnat->hipot); ?>>Positivo</option>
                      <option value='N' <?php echo checkOption("hipotiroid", "N", $lnnat->hipot); ?>>Negativo</option>
                      <option value='NA' <?php echo checkOption("hipotiroid", "NA", $lnnat->hipot); ?>>N&atilde;o Avaliado </option>
                    </select></td>
				</tr>
				<tr>
					<td align="right">Anemia Falciforme:</td>
					<td colspan="3"><select name="anemiafalc" onchange="savCampo('3')" <?php echo checkDisable("testepe", $lnnat->testpe, "S"); ?>>
                      	<option value='S' <?php echo checkOption("anemiafalc", "S", $lnnat->anemfalc); ?>>Positivo</option>
                      	<option value='N' <?php echo checkOption("anemiafalc", "N", $lnnat->anemfalc); ?>>Negativo</option>
                      	<option value='NA'<?php echo checkOption("anemiafalc","NA",$lnnat->anemfalc);?>>N&atilde;o Avaliado</option>
                    </select></td>
				</tr>
			</table>
		</fieldset></td>
 	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
			<legend>Triagem Auditiva</legend>
			<input name="triaaud" type="radio" value="S" onclick="habilitaTriaAud(1)" onchange="savCampo('3')"
				<?php echo checkPOST("triaaud", "S", $lnnat->triagaud); ?>/>Sim
			<input name="triaaud" type="radio" value="N" onclick="habilitaTriaAud(0)" onchange="savCampo('3')"
				<?php echo checkPOST("triaaud", "N", $lnnat->triagaud); ?>/>N&atilde;o
			<input name="triaaud" type="radio" value="NA" onclick="habilitaTriaAud(0)" onchange="savCampo('3')"
				<?php echo checkPOST("triaaud", "NA", $lnnat->triagaud); ?>/>N&atilde;o Avaliado
			<br>
			<table width="383" class="style5">
				<tr>
					<td width="75" align="right">PEATE:</td>
					<td width="135"><select name="PEATE" onchange="savCampo('3')" 
						<?php echo checkDisable("triaaud", $lnnat->triagaud, "S");?>>
                    	<option value='N' <?php echo checkOption("PEATE", "N", $lnnat->peate); ?>>Positivo</option>
                    	<option value='A' <?php echo checkOption("PEATE", "A", $lnnat->peate); ?>>Negativo</option>
                    	<option value='NA' <?php echo checkOption("PEATE", "NA", $lnnat->peate); ?>>N&atilde;o Avaliado</option>
                    </select></td>
				    <td width="38" align="right">EOA:</td>
				    <td width="115"><select name="EOA" onchange="savCampo('3')" 
						<?php echo checkDisable("triaaud", $lnnat->triagaud, "S");?>>
                      	<option value='N' <?php echo checkOption("EOA", "N", $lnnat->eoa); ?>>Normal</option>
                    	<option value='A' <?php echo checkOption("EOA", "A", $lnnat->eoa); ?>>Alterado</option>
                    	<option value='NA' <?php echo checkOption("EOA", "NA", $lnnat->eoa); ?>>N&atilde;o Avaliado</option>
                    </select></td>
				</tr>
			</table>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Reanima&ccedil;&atilde;o</legend>
			<input name="reanimacao" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("reanimacao", "S", $lnnat->reanim); ?>/>Sim
			<input name="reanimacao" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("reanimacao", "N", $lnnat->reanim); ?>/>N&atilde;o
			<input name="reanimacao" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("reanimacao", "NA", $lnnat->reanim); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Icter&iacute;cia</legend>
			<select name="ictericia"  onchange="savCampo('3')">
			<?php for ($i = 1; $i <= 5; $i++){
				echo '<option value="'.$i.'" '.checkOption("ictericia", $i, $lnnat->icter).'>Zona '.$i.' de Kramer</option>';
			} ?>
				<option value="A" <?php echo checkOption("ictericia", "A", $lnnat->icter); ?>>Ausente</option>
				<option value="NA" <?php echo checkOption("ictericia", "NA", $lnnat->icter); ?>>N&atilde;o Avaliado</option>
			</select>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Rash</legend>
			<input name="rash" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("rash", "S", $lnnat->rash); ?>/>Sim
			<input name="rash" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("rash", "N", $lnnat->rash); ?>/>N&atilde;o
			<input name="rash" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("rash", "NA", $lnnat->rash); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Sangramentos</legend>
			<input name="sangramentos" type="radio" value="S" onchange="savCampo('3')"
				<?php echo checkPOST("sangramentos", "S", $lnnat->sang); ?>/>Sim
			<input name="sangramentos" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("sangramentos", "N", $lnnat->sang); ?>/>N&atilde;o
			<input name="sangramentos" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("sangramentos", "NA", $lnnat->sang); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>V&ocirc;mitos</legend>
			<input name="vomitos" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("vomitos", "S", $lnnat->vomit); ?>/>Sim
			<input name="vomitos" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("vomitos", "N", $lnnat->vomit); ?>/>N&atilde;o
			<input name="vomitos" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("vomitos", "NA", $lnnat->vomit); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Infec&ccedil;&otilde;es</legend>
			<input name="infeccoes" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("infeccoes", "S", $lnnat->infec); ?>/>Sim
			<input name="infeccoes" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("infeccoes", "N", $lnnat->infec); ?>/>N&atilde;o
			<input name="infeccoes" type="radio" value="NA" onchange="savCampo('3')" 
			   <?php echo checkPOST("infeccoes", "NA", $lnnat->infec); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Anomalias Cong&ecirc;nitas </legend>
			<input name="anomcong" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("anomcong", "S", $lnnat->anocong); ?>/>Sim
			<input name="anomcong" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("anomcong", "N", $lnnat->anocong); ?>/>N&atilde;o
			<input name="anomcong" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("anomcong", "NA", $lnnat->anocong); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Paralisias</legend>
			<input name="paralisias" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("paralisias", "S", $lnnat->paral); ?>/>Sim
			<input name="paralisias" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("paralisias", "N", $lnnat->paral); ?>/>N&atilde;o
			<input name="paralisias" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("paralisias", "NA", $lnnat->paral); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Coriza</legend>
			<input name="coriza" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("coriza", "S", $lnnat->coriz); ?>/>Sim
			<input name="coriza" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("coriza", "N", $lnnat->coriz); ?>/>N&atilde;o
			<input name="coriza" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("coriza", "NA", $lnnat->coriz); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Convuls&otilde;es</legend>
			<input name="convulsoes" type="radio" value="S" onchange="savCampo('3')" 
				<?php echo checkPOST("convulsoes", "S", $lnnat->conv); ?>/>Sim
			<input name="convulsoes" type="radio" value="N" onchange="savCampo('3')" 
				<?php echo checkPOST("convulsoes", "N", $lnnat->conv); ?>/>N&atilde;o
			<input name="convulsoes" type="radio" value="NA" onchange="savCampo('3')" 
				<?php echo checkPOST("convulsoes", "NA", $lnnat->conv); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsnnatal" cols="70" onkeyup="savCampo('3')" 
				><?php echo printOBS($lnnat->obs, $_POST['obsnnatal']); ?></textarea>
		</fieldset></td>
  	</tr>
</table>

