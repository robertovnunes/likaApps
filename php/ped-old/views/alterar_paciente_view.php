<div id="formCadastro">
    <form action="alterar_paciente.php?pr=<?php echo $pront; ?>" method="post" name="cadpaciente">
    <fieldset class="bgFormPaciente">
    	<legend>Alterar Dados do Paciente</legend>
        <table bgcolor="#E8E8E8" width="600"><tr><td>
			<br />
		<?php
			if ($error){
				echo '<div class="msgerro">';
				echo $mensagem;
				echo $campos;
				echo $errData;
				echo $errCEP;
				echo "</div>";
			}
		?>
            <fieldset class="full">
				<span class="">(*) Campos Obrigat&oacute;rios</span>
                <legend>Dados Pessoais</legend>
				<div style="clear:both">
					<label id="lbNome" class="labdir2<?php echo $cerrNome; ?>">Nome*:</label>
					<input class="tam50" name="nome" maxlength="50" onkeyup="savCampo()" onfocus="mudaLb(lbNome)" value="<?php echo $valAlt[0];?>" />
                </div>
				<div style="clear:both">
					<label id="lbSexo" class="labdir2<?php echo $cerrSexo; ?>">Sexo*:</label>
					<span>
						<input name="sexo" type="radio" value="M" <?php if($valAlt[4] == 'M'){ ?> checked="checked" <?php } ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()"/><label>Masculino</label>
						<input name="sexo" type="radio" value="F" <?php if($valAlt[4] == 'F'){ ?> checked="checked" <?php } ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()"/><label>Feminino</label>
					</span>
				</div>
				<div style="clear:both">
					<label id="lbDT" class="labdir2<?php echo $cerrData; ?>">Nascimento*:</label>
					<input class="tam15" name="data" maxlength="10" onkeypress="mascara(this,2)" value="<?php echo $valAlt[1]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbDT)"/>
					<label id="lbdtt">(dd/mm/aaaa)</label>
						<SCRIPT LANGUAGE="JavaScript" ID="js19">
							var cal19 = new CalendarPopup();
							cal19.showYearNavigation();
							cal19.showYearNavigationInput();
						</SCRIPT>
						<SCRIPT LANGUAGE="JavaScript">writeSource("js19");</SCRIPT>
						<a href="#" onClick="cal19.select(document.forms[0].data,'anchor19','dd/MM/yyyy'); mudaLb(lbDT); return false;" title="cal19.select(document.forms[0].data,'anchor19','MM/dd/yyyy'); return false;" name="anchor19" id="anchor19">
						<img style="margin:5 0 0 5" src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
				</div>
				<div style="clear:both">
					<label id="lbCPF" class="labdir2<?php echo $cerrCPF; ?>">CPF:</label>
					<input class="tam15" name="cpf" maxlength="14" OnKeyPress="mascara(this,1)" value="<?php echo $valAlt[3]; ?>" onkeyup="savCampo()"/>
					<label id="lbCNS" class="labdir2">CNS:</label>
					<input class="tam20" name="cns" maxlength="15" value="<?php echo $valAlt[2]; ?>" onkeyup="savCampo()"/>
                </div>
				<div style="clear:both">
					<label id="lbMae" class="labdir2<?php echo $cerrMae; ?>">Nome da M&atilde;e*:</label>
					<input class="tam50" name="mae" maxlength="50" value="<?php echo $valAlt[5]; ?>" onfocus="mudaLb(lbMae)" onkeyup="savCampo()"/>
                </div>
				<div style="clear:both">
					<label id="lbPai" class="labdir2">Nome do Pai:</label>
					<input class="tam50" name="pai" maxlength="50" value="<?php echo $valAlt[6];?>" onkeyup="savCampo()"/>
				</div>
            </fieldset>
            <br />
            <fieldset class="full">
                <legend>Endere&ccedil;o (Caso voc&ecirc; saiba o CEP, o sistema preencher&aacute; automaticamente)</legend>
				<div style="clear:both">
					<label id="lbCEP" class="labdir2<?php echo $cerrCEP; ?>">CEP*:</label>
					<input id="inpCEP" class="tam10" name="cep" maxlength="9" value="<?php echo $valAlt[13]; ?>" onfocus="mudaLb(lbCEP)" onkeyup="savCampo()" OnKeyPress="mascara(this,3)" /><a href="#cepResidencial" onclick="getCEP()"><img src="images/lupa.jpg" style="position:relative; padding-left:5px;padding-top:5px;" alt="Pesquisar Cep/PE"></a>			</div>
				</div>
				<div style="clear:both">
					<label id="lbEnd" class="labdir2<?php echo $cerrEnde; ?>">Logradouro*:</label>
					<input id="inpEnd" class="tam50" name="ende" onkeyup="savCampo()" onfocus="mudaLb(lbEnd)" value="<?php echo $valAlt[7];?>" maxlength="50" />			</div>
				</div>
				<div style="clear:both">
					<label class="labdir2">N&uacute;mero:</label>
					<input class="tam5" name="num" onkeyup="savCampo()" value="<?php echo $valAlt[8]; ?>" maxlength="4" />
					<label class="labdir2">Complemento:</label>
					<input class="tam30" name="comp" onkeyup="savCampo()" value="<?php echo $valAlt[9]; ?>" maxlength="30" />
				</div>
				<div style="clear:both">
					<label id="lbBair" class="labdir2<?php echo $cerrBair; ?>">Bairro*:</label>
					<input id="inpBair" class="tam50" name="bair" value="<?php echo $valAlt[10]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbBair)" maxlength="50"/>
				</div>
				<div style="clear:both">
					<label id="lbCid" class="labdir2<?php echo $cerrCid; ?>">Cidade*:</label>
					<input id="inpCid" class="tam30" name="cidade" value="<?php echo $valAlt[11]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbCid)" maxlength="30"/>
					<label id="lbUF" class="labdir2<?php echo $cerrUF; ?>">UF*:</label>
					<input id="inpUF" class="tam5" name="uf" value="<?php echo $valAlt[12]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbUF)" maxlength="2"/>
				</div>            
     	    </fieldset>
			<br />
            <fieldset class="full">
                <legend>Op&ccedil;&otilde;es</legend>
                <input name="limpar" type="reset" value="Limpar" />
                <input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
                <div class="salvar">
                    <input name="salvar" type="submit" value="Salvar" />
                    <input type="hidden" value="0" id="ctrl" />
                </div>
        	</fieldset>
        </td></tr></table>
    </fieldset>
    </form>
</div>