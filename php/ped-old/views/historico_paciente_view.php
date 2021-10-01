<?php $n1 = $_GET['n']; ?>
<div id="dadosPessoaisPac">
    <fieldset class="bgFormPaciente">
       <legend>Dados Pessoais</legend>
       <table class="bgFormPaciente1"><tr><td>
            <fieldset class="infoPac">
                <legend>Paciente: <?php echo $name; ?></legend>
                <label class="style5">
                    <span><b>Sexo:</b> <?php echo $sexo; ?></span>
                    <span><b>Natural de:</b> <?php echo $natural; ?></span>
                    <span><b>Data de Nascimento:</b> <?php echo $data; ?></span>
                </label>
                <br />
                <label class="style5">
                    <span ><b>Alergia a Medicamentos:</b> <?php echo $alergmed; ?></span>
                    <span ><b>Alergia Alimentar:</b> <?php echo $alerg; ?></span>
                </label>
        </fieldset>
        </td></tr></table>
    </fieldset>
</div>

<br />
<form action="historico_paciente.php?pr=<?php echo $pront; ?>" method="post" name="historico" id="form_historico" >

<div id="menuBarr">
	<fieldset>
        <legend>Menu</legend>
		<ul id="MenuBar1" class="MenuBarVertical">
            <li><a class="MenuBarItemSubmenu">Pessoal</a>
                <ul>
                    <li id="abahp1" onclick="AlternarAbasHP('abahp1','divhp1')"><a>Pr&eacute;-Natal</a></li>
                    <li id="abahp2" onclick="AlternarAbasHP('abahp2','divhp2')"><a>Natal</a></li>
                    <li id="abahp3" onclick="AlternarAbasHP('abahp3','divhp3')"><a>Neo-Natal</a></li>
                    <li id="abahp4" onclick="AlternarAbasHP('abahp4','divhp4')"><a>Alimenta&ccedil;&atilde;o</a></li>
                    <li id="abahp5" onclick="AlternarAbasHP('abahp5','divhp5')"><a>Crescimento e Desenvolvimento</a></li>
                    <li id="abahp6" onclick="AlternarAbasHP('abahp6','divhp6')"><a>H&aacute;bitos</a></li>
                    <li id="abahp7" onclick="AlternarAbasHP('abahp7','divhp7')"><a>Imuniza&ccedil;&otilde;es</a></li>
                    <li id="abahp8" onclick="AlternarAbasHP('abahp8','divhp8')"><a>Doen&ccedil;as Anteriores</a></li>
                    <li id="abahp9" onclick="AlternarAbasHP('abahp9','divhp9')"><a>Outras Informa&ccedil;&otilde;es</a></li>
                </ul>
            </li>
    	    <li id="abahp10" onclick="AlternarAbasHP('abahp10','divhp10')"><a>Familiar</a></li>
        </ul>
        <script type="text/javascript">
            var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
        </script>
    </fieldset>
</div>
<div id="formCadastro1">
    <fieldset>
        <legend>Hist&oacute;rico Pessoal</legend>
	<?php
        echo '<div id="div_antpessoais" class="conteudo2">';
        include_once("views/abas_historico/aba_antpes.php");
    ?>
		<br />
        <fieldset class="full">
            <legend>Op&ccedil;&otilde;es</legend>
            <label><input name="limpar" type="reset" value="Limpar" /></label>
            <label><input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" /></label>
            <label class="salvar">
                <input name="salvar" type="submit" value="Salvar" />
                <input type="hidden" value="0" id="ctrl" />
            </label>
    	</fieldset>
        <br />
	<?php echo "</div>"; ?>
    </fieldset>
</div>
<div id="aa"></div>
</form>