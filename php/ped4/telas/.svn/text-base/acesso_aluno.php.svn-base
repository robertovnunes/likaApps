<?php
	$pront = $_GET['pr'];
	$listaatend = ListaAtendimento($pront);	
?>

<form action="cadastro_paciente.php" method="post" name="cadpaciente" id="cadpaciente">
              <table width="520" border="0" cellspacing="2" cellpadding="4">
                <tr>
                  <td width="566" bgcolor="#60BF4F"><fieldset style="width:500px;">
                  <legend><span class="style5 style11">Atendimentos</span></legend>
                        <table width="488" border="0" cellpadding="0" cellspacing="1">
                        <tr>
                          <td width="174"><span id="labelnome" class="style5" <?php if ($_POST['flag'] == 1 && $_POST['nome'] == ""){ echo 'style="color:#CE0909"'; }?>>*Data do Atendimento:</span></td>
                          <td width="311"><span id="labeldt" class="style5" <?php if ($_POST['flag'] == 1 && ($_POST['dia'] == "0" || $_POST['mes'] == "0" || $_POST['ano'] == "0")){ echo 'style="color:#CE0909"'; }?>>*Prontu&aacute;rio:</span></td>
                        </tr>
						<?php ?>
                        <tr>
                          <td></td>
                          <td>&nbsp;</td>
                        </tr>
						<?php ?>
                      </table>
                        <label for="campo1"></label>
                      <br />
                    </fieldset>
                      <p />
                        <fieldset style="width:500px;">
                          <table width="479" border="0" cellpadding="0" cellspacing="2">
                            <tr>
                              <td align="right"><input name="novoatend" type="submit" value="Novo Atendimento" />
                                <input id="flag" name="flag" type="hidden" value="1" />                          </td>  
                            </tr>
                        </table>
                      </fieldset>
                      <br />
                  </td></tr>
  </table>
</form>