<?php
	$lpnat = getValuesTablePr('prenatal',$pront);
	$sql_sang = SQLGrupoSanguineo();
?>

<table width="570" class="style5">
	<tr>
    	<td width="258"><fieldset>
      		<legend>Acompanhamento M&eacute;dico</legend>
        	<input name="acpmed" type="radio" value="S" onclick="habilitaAcompMedico(1)" onchange="savCampo('1')"
				<?php echo checkPOST("acpmed", "S", $lpnat->acompmed); ?>/>Sim
        	<input name="acpmed" type="radio" value="N" onclick="habilitaAcompMedico(0)" onchange="savCampo('1')"
				<?php echo checkPOST("acpmed", "N", $lpnat->acompmed); ?>/>N&atilde;o
        	<input name="acpmed" type="radio" value="NA" onclick="habilitaAcompMedico(0)" onchange="savCampo('1')"
				<?php echo checkPOST("acpmed", "NA", $lpnat->acompmed); ?>/>N&atilde;o Avaliado
      		<table width="350" class="style5">
        		<tr>
          			<td width="53" id="lbllmed" <?php if ($errpnt && $_POST['acpmed'] == "S" && $_POST['lacpmed'] == "") 
						echo 'class="erro"';?>>Local:</td> 
					<td width="305"><input name="lacpmed" size="50" maxlength="40" onfocus="mudaLb(lbllmed)" onkeyup="savCampo('1')"
						value="<?php echo printOBS($lpnat->localam, $_POST['lacpmed']); ?>" 
						<?php echo checkDisable("acpmed", $lpnat->acompmed, "S"); ?>/></td>
   		  		</tr>
        		<tr>
          			<td colspan="2">N&ordm; de Consultas: <select name="nacpmed" onchange="savCampo('1')" 
						<?php echo checkDisable("acpmed", $lpnat->acompmed, "S"); ?>>
						<option value='+6' <?php echo checkOption("nacpmed", "+6", $lpnat->consam); ?>>Mais de 6</option>
						<option value='-6' <?php echo checkOption("nacpmed", "-6", $lpnat->consam); ?>>Menos de 6</option>
						<option value='NA' <?php echo checkOption("nacpmed", "NA", $lpnat->consam);?>>N&atilde;o Avaliado</option>
          			</select></td>
        		</tr>
   			</table>
    	</fieldset></td>
    	<td width="240" valign="middle"><fieldset>
			<legend>Dura&ccedil;&atilde;o da Gesta&ccedil;&atilde;o </legend>
    		<select name="durgest" onchange="savCampo('1')">
				<option value='PrT' <?php echo checkOption("durgest", "PrT", $lpnat->durgest); ?>>Pr&eacute;-Termo</option>
				<option value='T' <?php echo checkOption("durgest", "T", $lpnat->durgest); ?>>Termo</option>
				<option value='PoT' <?php echo checkOption("durgest", "PoT", $lpnat->durgest); ?>>P&oacute;s-Termo</option>
				<option value='NA' <?php echo checkOption("durgest", "NA", $lpnat->durgest); ?>>N&atilde;o Avaliado</option>
    		</select>
    	</fieldset>
		<fieldset>
      		<legend>Grupo Sangu&iacute;neo da M&atilde;e</legend>
      		<select name="sangmae" onchange="savCampo('1')">
      			<option value='NA' <?php echo checkOption("sangmae", "NA", $lpnat->idSang); ?>>N&atilde;o Avaliado</option>
			<?php while ($dados = mysql_fetch_array($sql_sang)){ ?>
				<option value="<?php echo $dados['idSang']; ?>" <?php echo checkOption("sangmae",$dados['idSang'],$lpnat->idSang);
					?>><?php echo $dados['tipo']; ?></option>
			<? } ?>
		
		
	      	</select>
      	</fieldset></td>
  	</tr>
</table>
<table width="300" class="style5">
	<tr>
    	<td ><fieldset style="width: 400px;">
      		<legend>Testes Sorol&oacute;gicos (CID-10)</legend>
      		<table width="300" class="style5">
        		<tr>
          			<td width="249"><fieldset>
            			<legend>Z21 (HIV Positivo)</legend>
						<select name="z21" onchange="savCampo('1')">
						  	<option value='P1' <?php echo checkOption("z21", "P1", $lpnat->z21);?>>Positivo, 1&ordm; trimestre</option>
						  	<option value='P2' <?php echo checkOption("z21", "P2", $lpnat->z21);?>>Positivo, 2&ordm; trimestre</option>
						  	<option value='P3' <?php echo checkOption("z21", "P3", $lpnat->z21);?>>Positivo, 3&ordm; trimestre</option>
						  	<option value='N' <?php echo checkOption("z21", "N", $lpnat->z21); ?>>Negativo</option>
						  	<option value='NA' <?php echo checkOption("z21", "NA", $lpnat->z21); ?>>N&atilde;o Avaliado</option>
						</select>
       			  </fieldset></td>
          			<td width="250"><fieldset>
            			<legend>A53 (S&iacute;filis)</legend>
            			<select name="a53" onchange="savCampo('1')">
							<option value='P1' <?php echo checkOption("a53", "P1", $lpnat->a53);?>>Positivo, 1&ordm; trimestre</option>
							<option value='P2' <?php echo checkOption("a53", "P2", $lpnat->a53);?>>Positivo, 2&ordm; trimestre</option>
							<option value='P3' <?php echo checkOption("a53", "P3", $lpnat->a53);?>>Positivo, 3&ordm; trimestre</option>
							<option value='N' <?php echo checkOption("a53", "N", $lpnat->a53); ?>>Negativo</option>
							<option value='NA' <?php echo checkOption("a53", "NA", $lpnat->a53); ?>>N&atilde;o Avaliado</option>
            			</select>
       			  </fieldset></td>
        		</tr>
        		<tr>
          			<td width="249"><fieldset>
            			<legend>B18 (Hepatite Viral)</legend>
            			<select name="b18" onchange="savCampo('1')">
              				<option value='P1' <?php echo checkOption("b18", "P1", $lpnat->b18);?>>Positivo, 1&ordm; trimestre</option>
							<option value='P2' <?php echo checkOption("b18", "P2", $lpnat->b18);?>>Positivo, 2&ordm; trimestre</option>
							<option value='P3' <?php echo checkOption("b18", "P3", $lpnat->b18);?>>Positivo, 3&ordm; trimestre</option>
							<option value='N' <?php echo checkOption("b18", "N", $lpnat->b18); ?>>Negativo</option>
							<option value='NA' <?php echo checkOption("b18", "NA", $lpnat->b18); ?>>N&atilde;o Avaliado</option>
            			</select>
       			  </fieldset></td>
          			<td width="250"><fieldset>
            			<legend>B58 (Toxoplasmose)</legend>
			            <select name="b58" onchange="savCampo('1')">
             	 			<option value='P1' <?php echo checkOption("b58", "P1", $lpnat->b58);?>>Positivo, 1&ordm; trimestre</option>
							<option value='P2' <?php echo checkOption("b58", "P2", $lpnat->b58);?>>Positivo, 2&ordm; trimestre</option>
							<option value='P3' <?php echo checkOption("b58", "P3", $lpnat->b58);?>>Positivo, 3&ordm; trimestre</option>
							<option value='N' <?php echo checkOption("b58", "N", $lpnat->b58); ?>>Negativo</option>
							<option value='NA' <?php echo checkOption("b58", "NA", $lpnat->b58); ?>>N&atilde;o Avaliado</option>
            			</select>
       			  </fieldset></td>
        		</tr>
   		</table>
    	</fieldset></td>
  	</tr>
  	<tr>
    	<td width="150"><fieldset>
      		<legend>Imuniza&ccedil;&otilde;es da M&atilde;e</legend>
      		<select name="imunizmae" onchange="savCampo('1')">
        		<option value='EC' <?php echo checkOption("imunizmae", "EC", $lpnat->imunmae); ?>>Esquema Completo</option>
        		<option value='EI' <?php echo checkOption("imunizmae", "EI", $lpnat->imunmae); ?>>Esquema Incompleto</option>
        		<option value='NR' <?php echo checkOption("imunizmae", "NR", $lpnat->imunmae); ?>>N&atilde;o Realizou</option>
        		<option value='NA' <?php echo checkOption("imunizmae", "NA", $lpnat->imunmae); ?>>N&atilde;o Avaliado</option>
      		</select>
   	  </fieldset></td>
    	<td width="296"><fieldset>
      		<legend>Exames com Radia&ccedil;&atilde;o Ionizante</legend>
      		<select name="exradion" onchange="savCampo('1')">
        		<option value='1T' <?php echo checkOption("exradion", "1T", $lpnat->examrad);?>>Sim, durante o 1&ordm; trimestre</option>
        		<option value='GR' <?php echo checkOption("exradion", "GR", $lpnat->examrad); ?>>Sim, durante a gravidez</option>
        		<option value='N' <?php echo checkOption("exradion", "N", $lpnat->examrad); ?>>N&atilde;o</option>
        		<option value='NA' <?php echo checkOption("exradion", "NA", $lpnat->examrad); ?>>N&atilde;o Avaliado</option>
      		</select>
   	  </fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend id="lblmedic" <?php if ($errpnt && !$linha->ass && $_POST['medic'] == "")  ?>>
				Medica&ccedil;&otilde;es</legend>
			<textarea name="medic" cols="70" onkeyup="savCampo('1')" onfocus="mudaLb(lblmedic)"><?php echo printOBS($lpnat->medic, $_POST['medic']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend id="lblanorm" <?php if ($errpnt && !$linha->ass && $_POST['anorm'] == "")  ?>>
				Anormalidades</legend>
			<textarea name="anorm" cols="70" onkeyup="savCampo('1')" onfocus="mudaLb(lblanorm)" ><?php echo printOBS($lpnat->anorm, $_POST['anorm']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Doen&ccedil;as Cir&uacute;rgicas</legend>
            <select name="pdoencir" onchange="savCampo('1');habilitaCirurgia2(this.selectedIndex);">
            	<option value='NT' <?php echo checkOption("pdoencir", "NT", $lpnat->doencir);?>>
					N&atilde;o teve</option>
            	<option value='1T' <?php echo checkOption("pdoencir", "1T", $lpnat->doencir);?>>
					No 1&ordm; trimestre</option>
            	<option value='2T' <?php echo checkOption("pdoencir", "2T", $lpnat->doencir);?>>
					No 2&ordm; trimestre</option>
            	<option value='3T' <?php echo checkOption("pdoencir", "3T", $lpnat->doencir);?>>
					No 3&ordm; trimestre ou posterior</option>
				
            	<option value='NA' onclick="habilitaCirurgia(0)" <?php echo checkOption("pdoencir", "NA", $lpnat->doencir);?>>
					N&atilde;o Avaliado</option>
            </select>
                        
            <p />
    	    <table width="530" class="style5">
            	<tr class="style5">
                	<td width="57" id="lblcirug" <?php if ($errpnt && $_POST['pdoencir'] != "NA" && $_POST['pdoencir'] != "NT" && $_POST['tdoencir'] == "") 
						echo "class='erro'"; ?> valign="top">Cirurgias:</td>
                	<td width="461"><textarea name="tdoencir" id="tdoencir" cols="70" onkeyup="savCampo('1')" onfocus="mudaLb(lblcirug)"
						<?php echo checkDisable3("pdoencir",$lpnat->doencir,"1T", "2T", "3T"); ?> 
						><?php echo printOBS($lpnat->cirurg, $_POST['tdoencir']); ?></textarea></td>
              </tr>
            </table>
   	    </fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Estado Nutricional Durante a Gravidez</legend>
			<table width="529" border="0" cellspacing="1" cellpadding="0" class="style5">
				<tr class="style5">
					<td width="252" id="lblpesgr" >
					
					
				
					
					Peso Durante a Gravidez (Kg):
					<input name="pesograv" size="5" maxlength="4" onkeyup="savCampo('1')" onfocus="mudaLb(lblpesgr)" 
						value="<?php echo printCampo($lpnat->pesograv, $_POST['pesograv']); ?>" /></td>
					<td width="274">Anemia:
					<input name="anemia" type="radio" value="S" onchange="savCampo('1')" 
						<?php echo checkPOST("anemia", "S", $lpnat->anemia); ?>/>Sim
					<input name="anemia" type="radio" value="N" onchange="savCampo('1')" 
						<?php echo checkPOST("anemia", "N", $lpnat->anemia); ?>/>N&atilde;o
					<input name="anemia" type="radio" value="NA" onchange="savCampo('1')" 
						<?php echo checkPOST("anemia", "NA", $lpnat->anemia); ?>/>N&atilde;o Avaliado</td>
				</tr>
				<tr class="style5">
					<td colspan="2">Alimenta&ccedil;&atilde;o:
					<select name="qaliment" onchange="savCampo('1')">
						<option value='B' <?php echo checkOption("qaliment", "B", $lpnat->alimgrav); ?>>Boa (Normal)</option>
						<option value='R' <?php echo checkOption("qaliment", "R", $lpnat->alimgrav); ?>>Ruim (Normal)</option>
						<option value='E' <?php echo checkOption("qaliment", "E", $lpnat->alimgrav); ?>>Excesso</option>
						<option value='F' <?php echo checkOption("qaliment", "F", $lpnat->alimgrav); ?>>Falta</option>
						<option value='NA' <?php echo checkOption("qaliment", "NA", $lpnat->alimgrav); ?>>N&atilde;o Avaliado						
						</option>
					</select></td>
				</tr>
			</table>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsprenat" cols="80" onkeyup="savCampo('1')"><?php echo printOBS($lpnat->obs, $_POST['obsprenat']); ?></textarea>
		</fieldset></td>
	</tr>
</table>
