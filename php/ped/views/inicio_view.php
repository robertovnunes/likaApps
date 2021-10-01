<?php
	include_once("cabecalho.inc.php");
	include_once("topoped.php");
?>

<!--<div id="tabelaContent">-->

<div id="telainicialContent">
<?php include("views/menudatahora.inc.php"); ?>
    <div id="telaAluno">
        <div id="telaLogin" style="z-index:200">
            <form action="index.php" method="post" name="frmlogin" id="formLogin">
			<?php 
				if (isset ($_GET["x"])) {
					if ($_GET["x"] == "naoautorizado")
						echo "<label class='loginerro'>Voc&ecirc; n&atilde;o est&aacute; logado ao sistema.</label>";
					else if ($_GET["x"] == "enviado")
						echo "<label class='loginerro'>Sua mensagem foi enviada com sucesso.</label>";
					else if ($_GET["x"] == "nsenha")
						echo "<label class='loginerro'>Uma nova senha foi enviada para seu e-mail.</label>";
				}
				if ($error)
					echo "<label class='loginerro'>Usuário ou senha inválidos.</label>";
			?>

				<label class="textoAcesso">Acesso Aluno</label>
                <label class="txtLog">Usu&aacute;rio*:</label>
                <input class="inpLog" type="text" name="login" maxlength ="15">
                <label class="txtPass">Senha*:</label>
                <input class="inpPass" type="password" name="senha" maxlength ="15">
                <input class="labImage" type="image" src="images/botaoTransparente.png" name="logar" value="logar"/>
                <input type="hidden" name="flag" value="logar" />
            </form>
            <label class="labEsq"><a href="esqueceu.php?n=1">Esqueceu a senha?</a></label>
            <label class="labFale"><a href="faleconosco.php?n=1">Fale Conosco</a></label>
			<label class="labObrigatorio">(*) Campos obrigatórios</label>
        </div>
        <div id="sobreoped" style="z-index:200">
    		<img name="ped_r3_c2_r3_c4" src="images/ped_r3_c2_r3_c4.jpg" width="170" height="28" border="0">
            <br><br>
            O PED &eacute; um sistema acadêmico que apresenta um modelo de prontuário eletrônico para a Área de conhecimento de Semiologia Pediátrica do Módulo IN542 - Introdução à Clínica Médica do Curso de Medicina da UFPE.
            <br><br>
            O PED é uma ferramenta didática informatizada que orienta o aluno no preenchimento dos dados clínicos dos pacientes pediátricos.
        </div>
    </div>
    <noscript>Voc&ecirc; deve ativar o JavaScript do seu browser para poder utilizar os recursos do sistema.<p></p></noscript>
    <?php include ("views/rodapeped.inc.php"); ?>

