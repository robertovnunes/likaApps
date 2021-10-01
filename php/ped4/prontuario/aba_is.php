<?php /* 
	
	$linha = verIS($atend);
	if ($flag){
		echo '<br /><table width="590" bgcolor="#E8E8E8">';
		if ($assinatura){
			if ($errad) echo "<tr><td class='erro'>Preencha o adendo.";
			else echo "<tr><td class='style4'>Novo Adendo Inserido.";
			echo "</td></tr>";
		} else if (!$assinatura){
			if ($msge == ""){
				if ($assinar)
					echo "<tr><td class='style4'>Assinatura efetuada com sucesso.</td></tr>";
			} else { 
				echo "<tr><td class='erro'>Alguns campos em ".$msge." est&atilde;o incorretos. Destaque em vermelho.</td></tr>";
			}
			if ($ccaba == ""){
				if (!$assinar)
					echo "<tr><td class='erro'>Nenhum dado foi alterado.</td></tr>";
			} else { 
				if (strlen($msgi) == 121)
					echo "<tr><td class='style4'>Todos os campos foram salvos com sucesso.</td></tr>";
				else if ($msgi != "")
					echo "<tr><td class='style4'>Dados inseridos com sucesso.</td></tr>";
			}
		}
		echo '</table><br />';
	}
?>


<br />
<fieldset style="width:590px;">
	<legend>Interrogat&oacute;rio Sintomatol&oacute;gico</legend>
	<br />
	<ul class='abais'>
		<li id="abais1" onclick="AlternarAbasIS('abais1','divis1')"><a>Geral</a></li>
		<li id="abais2" onclick="AlternarAbasIS('abais2','divis2')"><a>Pele</a></li>
		<li id="abais3" onclick="AlternarAbasIS('abais3','divis3')"><a>Olhos</a></li>
		<li id="abais4" onclick="AlternarAbasIS('abais4','divis4')"><a>Ouvidos</a></li>
		<li id="abais5" onclick="AlternarAbasIS('abais5','divis5')"><a>Respirat&oacute;rio</a></li>
	</ul>
	<ul class='abais'>
		<li id="abais6" onclick="AlternarAbasIS('abais6','divis6')"><a>Cardiovascular</a></li>
		<li id="abais7" onclick="AlternarAbasIS('abais7','divis7')"><a>Gastro-Intestinal</a></li>
		<li id="abais8" onclick="AlternarAbasIS('abais8','divis8')"><a>Genito-Urin&aacute;rio</a></li>
		<li id="abais9" onclick="AlternarAbasIS('abais9','divis9')"><a>M&uacute;sculo Esquel&eacute;tico</a></li>
		<li id="abais10" onclick="AlternarAbasIS('abais10','divis10')"><a>Nervoso</a></li>
	</ul>
	<table width="590">
		<tr>
			<td colspan="10" class="tb-conteudo">
			<br />
			<div id="divis1" style="display: none"><?php include("is/aba_geral.php");?></div>
			<div id="divis2" style="display: none"><?php include("is/aba_pele.php");?></div>
			<div id="divis3" style="display: none"><?php include("is/aba_olhos.php");?></div>
			<div id="divis4" style="display: none"><?php include("is/aba_ouvidos.php");?></div>
			<div id="divis5" style="display: none"><?php include("is/aba_apresp.php");?></div>
			<div id="divis6" style="display: none"><?php include("is/aba_apcardvasc.php");?></div>
			<div id="divis7" style="display: none"><?php include("is/aba_apgastint.php");?></div>
			<div id="divis8" style="display: none"><?php include("is/aba_apgenurin.php");?></div>
			<div id="divis9" style="display: none"><?php include("is/aba_sistmuscesq.php");?></div>
			<div id="divis10" style="display: none"><?php include("is/aba_sistnerv.php");?></div>
			<input type="hidden" id="ctrlis" name="ctrlis" value="" />
			<input type="hidden" id="ccaba" name="ccaba" value="<?php if ($msge) echo $_POST['ccaba']; ?>" />
			</td>
		</tr>
	</table>
</fieldset>
<?php
if(ISAssinado($atend))
	echo "<br /><table class='infoass'><tr><td>Assinatura: ".getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</td></tr></table><br />";?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoIS($atend); */?>