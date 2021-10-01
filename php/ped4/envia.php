

<?
// Coloque o email que irÃ¡ receber os valores
 ###################ALTERAR PARA O EMAIL DESEJADO
$nome = $_POST['tfNome'];
$email = $_POST['tfEmail'];
$assunto = $_POST['tfAssunto'];
$msg = $_POST['mensagem'];
$msg = nl2br($msg);
$to = $email;

if($nome == NULL || $email == NULL || $assunto == NULL || $msg == NULL):
	echo "<script type='text/javascript'>";
		echo "location.href='faleconosco.php?nome=$nome&email=$email&assunto=$assunto'";
	echo "</script>";
/*
<script type="text/javascript">

alert(unescape("Existem campos obrigat%F3rios n%E3o preenchidos."));

</script>
*/

exit;
endif;

$pattern = "^([A-Z_a-z])+.+@([a-zA-Z])+";
if(ereg($pattern,$email) == false):
	
	echo "<script type='text/javascript'>";
		echo "location.href='faleconosco.php?nome=$nome&email=$email&assunto=$assunto&badmail=1'";
	echo "</script>";


exit;
endif;


$mensagem = "Essa é uma mensagem automática.<br>Recebemos sua mensagem e entraremos em contato assim que possível.<br><br><br><b>Mensagem enviada por:</b> ".$nome." <b>em:</b> ".date("d/m/Y - H:i")."\n <br />
<br/><b>Abaixo seguem os dados do usuário:</b>\n <br/>
<br/><b>E-mail:</b> ".$email."\n <br />
<b>Assunto:</b> ".$assunto."\n <br />
<b>A mensagem enviada foi a seguinte:</b><br/> \n <br/>
".$msg;
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: PED <rosalie.belian@ufpe.br>\r\n";
mail($to,"[PED]Resposta Automática",$mensagem,$headers);


$mensagem = "Nova mensagem para o sistema PED.<br><br><b>Mensagem enviada por:</b> ".$nome." <b>em:</b> ".date("d/m/Y - H:i")."\n <br />
<br/><b>Abaixo seguem os dados do usuÃ¡rio:</b>\n <br/>
<br/><b>E-mail:</b> ".$email."\n <br />
<b>Assunto:</b> ".$assunto."\n <br />
<b>A mensagem enviada foi a seguinte:</b><br/> \n <br/>
".$msg;
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: $nome <$email>\r\n";
mail("rosalie.belian@ufpe.br","[PED]Resposta Automática",$mensagem,$headers);


/*

<script type="text/javascript">

alert(unescape("Sua mensagem foi enviada com sucesso."));
location.href="faleconosco.php?n=1";
</script>'; */
?>