<?php
	$linha = verEX($atend);
	if ($flag){
		echo '<br /><table width="590" bgcolor="#629BD2">';
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
				if (strlen($msgi) > 249)
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
	<legend>Exame F&iacute;sico</legend>
	<br />
	<?php /* <ul class='menu-hv'>
		    <li onMouseOver="cDisplay(1);">Exame F&iacute;sico Geral<ul>
			<li id="abaex1" onclick="AlternarAbasEX('abaex1','divex1')"><a>Inspe&ccedil;&atilde;o</a></li>
			<li id="abaex2" onclick="AlternarAbasEX('abaex2','divex2')"><a>Pele e Mucosas</a></li>
			<li id="abaex3" onclick="AlternarAbasEX('abaex3','divex3')"><a>Ganglios Linf&aacute;ticos</a></li>
		</ul></li>
		<li onMouseOver="cDisplay(2)">Antropometria<ul>
			<li id="abaex4" onclick="AlternarAbasEX('abaex4','divex4')"><a>Estadiamento Puberal</a></li>
			<li id="abaex5" onclick="AlternarAbasEX('abaex5','divex5')"><a>Desenv. Neuropsicomotor</a></li>
		</ul></li>
		<li onMouseOver="cDisplay(3)">Exame F&iacute;sico Especial<ul>
			<li id="abaex6" onclick="AlternarAbasEX('abaex6','divex6')"><a>Cr&acirc;nio</a></li>
			<li id="abaex7" onclick="AlternarAbasEX('abaex7','divex7')"><a>Olhos</a></li>
			<li id="abaex8" onclick="AlternarAbasEX('abaex8','divex8')"><a>Sist. Otorrinolaringol&oacute;gico</a></li>
			<li id="abaex9" onclick="AlternarAbasEX('abaex9','divex9')"><a>Pesco&ccedil;o</a></li>
			<li id="abaex10" onclick="AlternarAbasEX('abaex10','divex10')"><a>Ap. Respirat&oacute;rio</a></li>
			<li id="abaex11" onclick="AlternarAbasEX('abaex11','divex11')"><a>Ap. Cardiovascular</a></li>
			<li id="abaex12" onclick="AlternarAbasEX('abaex12','divex12')"><a>Ap. Gastro Intestinal</a></li>
			<li id="abaex13" onclick="AlternarAbasEX('abaex13','divex13')"><a>Ap. Genito-Urin&aacute;rio</a></li>
			<li id="abaex14" onclick="AlternarAbasEX('abaex14','divex14')"><a>Ap. Musc. Esquel&eacute;tico</a></li>
			<li id="abaex15" onclick="AlternarAbasEX('abaex15','divex15')"><a>Sist. Nervoso</a></li>
		</ul></li>
	</ul> */?>
	<table width="590">
		<tr>
			<td colspan="10" class="tb-conteudo">
			<br />
			<div id="divex1" style="display: none"><?php include("exame/aba_inspecao.php");?></div>
			<div id="divex2" style="display: none"><?php include("exame/aba_pele.php");?></div>
			<div id="divex3" style="display: none"><?php include("exame/aba_ganglios.php");?></div>
			<div id="divex4" style="display: none"><?php include("exame/aba_antropom.php");?></div>
			<div id="divex5" style="display: none"><?php include("exame/aba_desneu.php");?></div>
			<div id="divex6" style="display: none"><?php include("exame/aba_cranio.php");?></div>
			<div id="divex7" style="display: none"><?php include("exame/aba_olhos.php");?></div>
			<div id="divex8" style="display: none"><?php include("exame/aba_sistotor.php");?></div>
			<div id="divex9" style="display: none"><?php include("exame/aba_pescoco.php");?></div>
			<div id="divex10" style="display: none"><?php include("exame/aba_apresp.php");?></div>
			<div id="divex11" style="display: none"><?php include("exame/aba_cardvasc.php");?></div>
			<div id="divex12" style="display: none"><?php include("exame/aba_apgastint.php");?></div>
			<div id="divex13" style="display: none"><?php include("exame/aba_genurin.php");?></div>
			<div id="divex14" style="display: none"><?php include("exame/aba_muscesq.php");?></div>
			<div id="divex15" style="display: none"><?php include("exame/aba_nerv.php");?></div>
			<input type="hidden" id="ctrlex" name="ctrlex" value="" />
			<input type="hidden" id="ccaba" name="ccaba" value="<?php if ($msge) echo $_POST['ccaba']; ?>" />
			</td>
		</tr>
	</table>
</fieldset>
<?php
if ($linha->ass)
	echo "<br /><table class='infoass'><tr><td>Assinatura: ".getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</td></tr></table><br />";?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>