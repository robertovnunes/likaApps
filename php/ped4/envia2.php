<?
// Coloque o email que irá receber os valores
 ###################ALTERAR PARA O EMAIL DESEJADO
$nome = $_POST['tfNome'];
$email = $_POST['tfEmail'];
$assunto = $_POST['tfAssunto'];
$msg = $_POST['mensagem'];
$msg = nl2br($msg);
$to = $email;

if($nome == NULL || $email == NULL || $assunto == NULL || $msg == NULL):
?>
<script language="Javascript">alert('Existem campos obrigatórios não preenchidos!');
location.href='faleconosco.php';
</script>
<?

exit;
endif;
/*
$pattern = "^([A-Z_a-z])+@([a-zA-Z])+";
if(ereg($pattern,$email) == false):
?>
<script language="Javascript">alert('O email não é válido');
location.href='faleconosco.php';
</script>
<?

exit;
endif;
*/

$mensagem = "Essa � uma mensagem autom�tica.<br>Recebemos sua mensagem e entraremos em contato assim que poss�vel.<br><br><br><b>Mensagem enviada por:</b> ".$nome." <b>em:</b> ".date("d/m/Y - H:i")."\n <br />
<br/><b>Abaixo seguem os dados do usuário:</b>\n <br/>
<br/><b>E-mail:</b> ".$email."\n <br />
<b>Assunto:</b> ".$assunto."\n <br />
<b>A mensagem enviada foi a seguinte:</b><br/> \n <br/>
".$msg;
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: PED <ped@ideias.ufpe.br>\r\n";
mail($to,"[PED]Resposta Autom�tica",$mensagem,$headers);
?>

<script language="Javascript">alert('Sua mensagem foi enviada com êxito!');
location.href='faleconosco.php';
</script>