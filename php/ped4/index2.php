<?php

if ($_POST['flag'] == 1){
    include ("funcoes_bd.php");
    include ("classes/usuario.php");
    $usuario = new Usuario(addslashes($_POST['login']), addslashes($_POST['senha']));
    if ($usuario->autentica())
    {
        if($usuario->getTipo() == 'a')
		{
	        session_start();
	        $_SESSION['usuario'] = serialize($usuario);
	        header("Location: acesso_aluno.php");
		}
		else if($usuario->getTipo() == 'd')
		{
			session_start();
	        $_SESSION['usuario'] = serialize($usuario);
			header("Location: admin/index.php");
		}
		else
		{
			header("Location: index.php");;
		}
    } 
    else
        $erro = 1;
}
else
{
	include ("classes/usuario.php");
	@session_start();
	if (isset($_SESSION['usuario'])) 
	{
		$usuario = unserialize($_SESSION['usuario']);
		if($usuario->getTipo() == 'a')
		{
			header("Location: acesso_aluno.php");
		}
		else if($usuario->getTipo() == 'd')
		{
			header("Location: admin/index.php");
		}
	} 
}
$n = "index"; ?>

<?php
include ("cabecalho.inc.php");
include ("ped.php"); ?>
<div id="tabelaContent">
  
<table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" height="200" width="759"  >
	<tr>
		<td width="810" rowspan="2" valign="top"><p />
		<?php if ($_GET["x"] == "naoautorizado") 
				echo "<div id='loginerro'>Voc&ecirc; n&atilde;o est&aacute; logado ao sistema. Digite um login e senha
				v&aacute;lidos.</div>";
			if ($erro == 1) 
		echo "<div id='loginerro'>O usu&aacute;rio ou senha informados est&atilde;o inv&aacute;lidos.</div>"; ?></td>
		<td>
		<form action="index.php" method="post" name="frmlogin" style="margin-left:20px; margin-right:20px;">
		<div id="textoLogin">Nome do Usu&aacute;rio</div>
<div id="caixaLogin"><img name="ped_r3_c2_r2_c2" src="images/caixaLogin.jpg" width="368" height="190" border="0">
<div id="cadesqueceu"> <b><a href="esqueceu.php?n=1"> >Esqueceu a senha? </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      <a href="faleconosco.php?n=1"> >Fale Conosco</a></b></div>

</div>
<div id="textoSenha">Senha</div>
<div id="sobreoped"><img name="ped_r3_c2_r3_c4" src="images/ped_r3_c2_r3_c4.jpg" width="170" height="28" border="0"><br><br>

 O PED &eacute; um sistema acadêmico que apresenta um modelo de prontuário eletrônico para a Área de conhecimento de Semiologia Pediátrica do Módulo IN542 - Introdução à Clínica Médica do Curso de Medicina da UFPE.
 <br><br>O PED é uma ferramenta didática informatizada que orienta o aluno no preenchimento dos dados clínicos dos pacientes pediátricos.
</div>
		<div id="apDiv1">
		<div id="textoAcesso"><b>Acesso Aluno<b> </div>

		
      		
		<label>
		
     		 <input type="text" name="login" style="margin-top:0px;width:229px;padding:2px;"  maxlength ="15">
      		</label>
        	<label>
        	<input type="password" name="senha"  maxlength ="15" style="top:0px;">
      		</label>
      		  <label>
        	<input type="image" src="images/botaoTransparente.png" name="logar" id="logar" style="margin-top:30px;top:10px;background:#C0C0C0;position:relative;" />
        	<input type="hidden" name="flag" value="1" />
	 
    		  </label>
		
    		
	     </div>
		</form>
		<p />
		
		<noscript>Voc&ecirc; deve ativar o JavaScript do seu browser para poder utilizar os recursos do sistema.<p></p></noscript>
		</td>
	</tr>
</table>
<?php include ("rodapeped.inc"); ?>

