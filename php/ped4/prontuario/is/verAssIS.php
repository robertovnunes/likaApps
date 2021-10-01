<?php
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
			/*if ($ccaba == ""){
				//if (!$assinar)
					//echo "<tr><td class='erro'>Nenhum dado foi alterado.</td></tr>";
			} else { */
				if (strlen($msgi) == 121)
					echo "<tr><td class='style4'>Todos os campos foram salvos com sucesso.</td></tr>";
				else if ($msgi != "")
					echo "<tr><td class='style4'>Dados inseridos com sucesso.</td></tr>";
			//}
		}
		echo '</table><br />';
	}
?>