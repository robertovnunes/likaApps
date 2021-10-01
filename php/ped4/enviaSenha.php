<?php
// Coloque o email que irÃ’Â¡ receber os valores
 ###################ALTERAR PARA O EMAIL DESEJADO

include ("cabecalho.inc.php");
include ("ped.php");
include("dbconfig.php");
include("funcoes_bd.php");

$login = $_POST['tfNome'];
$email = $_POST['tfEmail'];

?>
<div id="tabelaContent2">
<table bgcolor="#FFFFFF" id="tbForm"><tr><td>
  <div id="middle">
  	<br />
    <h2>Recuperação de Senha</h2>
    <br />
    <div id="content"> 
    
 
<?php
if($login == NULL || $email == NULL):
	echo "<script language='Javascript'>";
	if($login == NULL && $email) echo "location.href='esqueceu.php?n=0&l=0&e=$email'";
	else if($login && $email == NULL) echo "location.href='esqueceu.php?n=0&l=$login&e=0'";
	else echo "location.href='esqueceu.php?n=0&l=0&e=0'";
/*

<script language="Javascript">
location.href='esqueceu.php?l=1&e=1';

//alert(unescape("Campos 'Login' e 'E-mail devem ser preenchidos"));
//alert(unescape("Existem campos obrigat%F3rios n%E3o preenchidos!"));


*/
echo "</script>";
echo "<div id = 'mensagensErro'> <font color='#FF0000'> Os campos 'Login' e 'E-mail' devem ser preenchidos! </font> </div>";
exit;
endif;

$senha = recuperaSenha($login, $email);

$novaSenha = md5(date("D M j G:i: s T Y"));


if(strlen($senha) > 0)
{	
	$novaSenha = substr($novaSenha,1,10);
	alteraSenha($login, $email, $novaSenha);
	$to = $email;
	$mensagem = "Você solicitou a recuperação e uma nova senha foi gerada pelo sistema PED\n\n
	Data da solicitação: ".date("d/m/Y - H:i")."\n 
	Login: ".$login."\n 
	Nova senha: ".$novaSenha."\n\nÉ recomendável que, ao logar no sistema PED, o usuário altere sua senha pelo menu 'Editar Perfil'";
	
	$headers = "MIME-Version: 1.0\r\n";
	$headers = "Content-type: text/html; charset=iso-8859-1\r\n";
	$headers = "From: PED <rosalie.belian@ufpe.br>\r\n";
	mail($to,"[PED]Recuperação de senha",$mensagem,$headers);
	echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Senha enviada para o e-mail $email<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favor checar sua caixa de entrada em instantes.";
	
}
	else echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login / E-mail inv&aacute;lido(s)!"; ?>
	</div>

</div>
</td></tr></table>

<?


include("rodapeped.inc");



?>

