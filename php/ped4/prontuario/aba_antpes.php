<?php 
	$linha = verHP($pront);
	if ($flag){
		echo '<br /><table width="590" bgcolor="#E8E8E8">';
		if ($_POST['vac'] == "Inserir Vacina"){ 
			if ($sucvac) echo "<tr><td class='style4'>A vacina foi inserida com sucesso.";
			else if($errvac){
				echo "<tr><td class='erro'>*Alguns dos campos para inser&ccedil;&atilde;o de vacinas, na aba Imuniza&ccedil;&otilde;es n&atilde;o foram preenchidos.";
				if (validaDataVac($_POST['datavacina'],$paciente->dtnasc) != "") 
					echo "<tr><td class='erro'>*".validaDataVac($_POST['datavacina'],$paciente->dtnasc).".";
			} else if($errvac1) echo "<tr><td class='erro'>*Uma mesma vacina n�o pode ter a mesma dose."; 
			echo "</td></tr>";
		} else {
			if ($msge != ""){
				echo "<tr><td class='erro'>*Alguns campos em ".$msge." est&atilde;o incorretos. Destaque em vermelho.</td></tr>";
			}
			if ($ccaba == ""&& $_POST["rVac"] != "RemoverVacina"){
				if (!$assinar)
				echo "<tr><td class='erro'>Nenhum dado foi alterado.</td></tr>";
					
			} else { 
				if (strlen($msgi) == 114)
					echo "<tr><td class='style4'>Todos os campos foram salvos com sucesso.</td></tr>";
				else if ($_POST["rVac"] == "RemoverVacina")
					echo "<tr><td class='style4'>A vacina foi removida com sucesso!</td></tr>";
				else if ($msgi != "")
					echo "<tr><td class='style4'>Dados inseridos com sucesso</td></tr>";
			}
		}
		echo '</table><br />';
	}
?>

<!--	<ul class='abais'>
		<li id="abahp1" onclick="AlternarAbasHP('abahp1','divhp1')"><a>Pr&eacute;-Natal</a></li>
		<li id="abahp2" onclick="AlternarAbasHP('abahp2','divhp2')"><a>Natal</a></li>
		<li id="abahp3" onclick="AlternarAbasHP('abahp3','divhp3')"><a>Neo-Natal</a></li>
		<li id="abahp4" onclick="AlternarAbasHP('abahp4','divhp4')"><a>Alimenta&ccedil;&atilde;o</a></li>
		<li id="abahp5" onclick="AlternarAbasHP('abahp5','divhp5')"><a>Cresc. e Desenv.</a></li>
	</ul>
	<ul class='abais'>
		<li id="abahp6" onclick="AlternarAbasHP('abahp6','divhp6')"><a>H&aacute;bitos</a></li>
		<li id="abahp7" onclick="AlternarAbasHP('abahp7','divhp7')"><a>Imuniza&ccedil;&otilde;es</a></li>
		<li id="abahp8" onclick="AlternarAbasHP('abahp8','divhp8')"><a>Doen&ccedil;as Anteriores</a></li>
		<li id="abahp9" onclick="AlternarAbasHP('abahp9','divhp9')"><a>Outras Info.</a></li>
        		<li id="abahp10" onclick="AlternarAbasHP('abahp10','divhp10')"><a>Familiar</a></li>
		<li></li>
	</ul> !-->
	<table width="300" height="130" cellspacing="0" cellpadding="0" border="0">
  		<tr>
    		<td height="100" class="tb-conteudo" colspan="10">
	  		<div id="divhp1" style="display: none"><?php include("antpes/aba_prenatal.php");?></div>
      		<div id="divhp2" style="display: none"><?php include("antpes/aba_natal.php");?></div>
      		<div id="divhp3" style="display: none"><?php include("antpes/aba_neonatal.php");?></div>
      		<div id="divhp4" style="display: none"><?php include("antpes/aba_aliment.php");?></div>
      		<div id="divhp5" style="display: none"><?php include("antpes/aba_cresdes.php");?></div>
      		<div id="divhp6" style="display: none"><?php include("antpes/aba_habitos.php");?></div>
      		<div id="divhp7" style="display: none"><?php include("antpes/aba_imuniz.php");?></div>
      		<div id="divhp8" style="display: none"><?php include("antpes/aba_doencasant.php");?></div>
      		<div id="divhp9" style="display: none"><?php include("antpes/aba_outrasinfo.php");?></div>
            <div id="divhp10" style="display: none"><?php include("antpes/aba_histfam.php");?></div>
            
	  		<input type="hidden" id="ctrlhp" name="ctrlhp" value="" />
			<input type="hidden" id="ccaba" name="ccaba" value="<?php if ($msge) echo $_POST['ccaba']; ?>" />
           
    		</td>
  		</tr>
	</table>

<br />