<?php $n1 = (isset($_GET['n'])) ? $_GET['n'] : ''; ?>
<div id="dadosPessoaisPac">
    <fieldset class="bgFormPaciente">
       <legend>Dados Pessoais</legend>
       <table class="bgFormPaciente1"><tr><td>
            <fieldset class="infoPac">
                <legend>Paciente: <?php echo (isset($name)) ? $name : ''; ?></legend>
                <label class="style5">
					<span><b>Sexo:</b> <?php echo (isset($sexo)) ? $sexo : ''; ?></span>
                    <span><b>Natural de:</b> <?php echo (isset($natural)) ? $natural : ''; ?></span>
                    <span><b>Data de Nascimento:</b> <?php echo (isset($data)) ? $data : ''; ?></span>
                </label>
                <br />
                <label class="style5">
                    <span ><b>Alergia a Medicamentos:</b> <?php echo (isset($alergmed)) ? $alergmed : ''; ?></span>
                    <span ><b>Alergia Alimentar:</b> <?php echo (isset($alerg)) ? $alerg : ''; ?></span>
                </label>
        </fieldset>
        </td></tr></table>
    </fieldset>
</div>

<br />
<form action="prontuario_paciente.php?at=<?php echo $atend; ?>&aba=<?php echo $aba.(isset($idHipotese)?"&hd=$idHipotese":""); ?>" method="post" name="<?php echo $aba; ?>" id="pront">
<div id="menuBarr">
	<fieldset>
        <legend>Menu</legend>
        <ul id="MenuBar1" class="MenuBarVertical">
            <li><a onclick="muda('<?php echo $atend; ?>','informante','p')">Informante</a> </li>
            <li><a onclick="muda('<?php echo $atend; ?>','qpdhda','p')">QPD/HDA</a></li>
            <li><a class="MenuBarItemSubmenu">Interrogatório Sintomatológico</a><ul>
                <li><a onclick="muda('<?php echo $atend; ?>','geral','p')">Geral</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','pele','p')">Pele</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','olhos','p')">Olhos</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','ouvidos','p')">Ouvidos</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','respiratorio','p')">Respirat&oacute;rio</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','cardiovascular','p')">Cardiovascular</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','gastrointestinal','p')">Gastro-Intestinal</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','genitourinario','p')">Genito-Urin&aacute;rio</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','musculoesqueletico','p')">M&uacute;sculo-Esquel&eacute;tico</a></li>
                <li><a onclick="muda('<?php echo $atend; ?>','nervoso','p')">Nervoso</a></li>
            </ul></li>
            <li><a>Exame F&iacute;sico</a><ul>
		        <li class="MenuBarItemSubmenu"><a>Exame F&iacute;sico Geral </a><ul>
			        <li><a onclick="muda('<?php echo $atend; ?>','exame_inspec','p')">Inspe&ccedil;&atilde;o </a></li>
			        <li><a onclick="muda('<?php echo $atend; ?>','exame_pele','p')">Pele e Mucosas </a></li>
			        <li><a onclick="muda('<?php echo $atend; ?>','exame_gang','p')">Ganglios Linf&aacute;ticos </a></li>
		        </ul></li>
		        <li class="MenuBarItemSubmenu"><a>Antropometria</a><ul>
            	    <li><a onclick="muda('<?php echo $atend; ?>','exame_medind','p')">Medidas e &iacute;ndices</a></li>
    			    <li><a onclick="muda('<?php echo $atend; ?>','exame_estpub','p')">Estadiamento Puberal</a></li>
    			    <li><a onclick="muda('<?php echo $atend; ?>','exame_desneuro','p')">Neuropsicomotor</a></li>
                </ul></li>
    		    <li class="MenuBarItemSubmenu"><a>Especial</a><ul>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_cranio','p')">Cr&acirc;nio</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_olhos','p')">Olhos</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_sistotor','p')">Otorrinolaringol&oacute;gico</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_pescoco','p')">Pesco&ccedil;o</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_apresp','p')">Respirat&oacute;rio</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_cardio','p')">Cardiovascular</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_apgast','p')">Gastro-Intestinal</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_genurin','p')">Genito-Urin&aacute;rio</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_muscesq','p')">Músculo-Esquel&eacute;tico</a></li>
        			<li><a onclick="muda('<?php echo $atend; ?>','exame_nervoso','p')">Nervoso</a></li>
    		    </ul></li>
	        </ul></li>
            <li><a onclick="muda('<?php echo $atend; ?>','hd','p')">Diagnósticos e<br>Condutas</a></li>
            <li><a onclick="muda('<?php echo $atend; ?>','','rp')">Impressão<br>Atendimento</a></li>
        </ul>
        <script type="text/javascript">
            var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
        </script>
    </fieldset>
</div>
<div id="formcadastro1">
    <fieldset>
        <legend>Prontu&aacute;rio</legend>
		<div id="<?php echo $div; ?>" class="conteudo2">
		<?php include_once("views/abas_prontuario/verAss.php");?>
			<div id="tPront">
			<br />
			<span class="style7"><?php echo isset($titulopront) ? $titulopront : ''; ?></span>
			<br />
		<?php include_once("views/abas_prontuario/".$dir.".php"); ?>
			</div>
		<?php if ($dir == "aba_informante"){ ?>
			<fieldset class="full" style="margin-left:1%;">
				<legend>Op&ccedil;&otilde;es</legend>
				<input name="limpar" type="reset" value="Limpar" />
				<input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
				<div class="salvar">
					<input name="salvar" type="submit" value="Salvar" />
					<input type="hidden" value="0" id="ctrl" />
				</div>
			</fieldset>	
	<?php } else { 
			if ($linha->ass) { ?>
			<fieldset class="full" style="margin-left:1%;">
				<legend>Assinatura</legend>
				<label><span style='color:#666666'><?php echo $assinatura; ?></span></label>
			</fieldset>
			<br />
		<?php } 
			include_once("views/funcoesimpressoes.php");
			if (isset($adendoad)) printAdendo($adendoad, $fachada);
		?>
			<br />
			<fieldset class="full" style="margin-left:1%;">
				<legend>Op&ccedil;&otilde;es</legend>
				<div id="myDiv"></div>
				<input name="limpar" type="reset" value="Limpar" />
				
				<?php if($_GET['aba'] != conduta){ ?>
				<input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
				<?php }else{?>
				<input name="voltar" type="submit" value="Voltar" onclick="this.form.action='prontuario_paciente.php?at=<?php echo "$atend"; ?>&aba=hd'" />
				<?php }; ?>
				<div class="salvar">
					<input name="adendo" type="button" id="adendo" value="Adendo" <?php echo $dadendo; ?> onclick="addAdendo();" />
					<input name="assinar" type="button" value="Assinar" <?php echo $ass." ".$jsabas; ?>/>
					<?php if ($aba == "hd") $ass = "disabled='true'" ?>
					<input name="salvar" id="salvar" type="submit" value="Salvar" <?php echo $ass; ?>/>
					<input type="hidden" value="0" id="ctrl" />
					<input type="hidden" name="gamb" value="false" id="gamb" />
				</div>
			</fieldset>
	<?php } ?>
			<br />
		</div>
    </fieldset>
</div>
<div id="aa"></div>
</form>
