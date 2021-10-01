<?php
	$idProntuario = $_GET['idProntuario'];
	$listaatend = ListaAtendimento($idProntuario);	
?>

<form action="cadastro_paciente.php" method="post" name="cadpaciente" id="cadpaciente">
              <table width="520" border="0" cellspacing="2" cellpadding="4">
                <tr>
                  <td width="566" bgcolor="#60BF4F"><fieldset style="width:500px;">
                  <legend><span class="style5 style11">Atendimentos</span></legend>
                        <table width="490" border="0" cellpadding="0" cellspacing="1">
                        <tr>
                          <td width="224"><span class="style5">*Criado Por: </span></td>
                          <td width="64"><span class="style5">*Cria&ccedil;&atilde;o:</span></td>
                          <td width="118"><span class="style5">*&Uacute;ltima Altera&ccedil;&atilde;o:</span></td>
                          <td width="77"><span class="style5">*Prontu&aacute;rio:</span></td>
                        </tr>
						<?php while ($arrayatendimentos = mysql_fetch_array($listaatend)){ ?>
                        <tr>
                          <td><?php echo $arrayatendimentos['datahora']; ?></td>
                          <td><?php echo $arrayatendimentos['idProntuario']; ?></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
						<?php ?>
                  </table>
                        <label for="campo1"></label>
                      <br />
                      <table width="490" border="0" cellpadding="0" cellspacing="2">
                        <tr>
                          <td align="right"><input name="novoatend" type="submit" value="Novo Atendimento" />
                          <input id="flag" name="flag" type="hidden" value="1" /></td>
                        </tr>
                      </table>
                  </fieldset>
                      <p />
                  </td></tr>
  </table>
</form>