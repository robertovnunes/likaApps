<?php
/* O ctrlhp armazena uma variável correspondente a aba, ou seja, cada valor de ctrlhp faz referência a 
	uma aba diferente. Assim, quando o usuário insere um valor na tela, o ctrlhp "segura" o valor 
	correspondente para quando a página carregar novamente, a aba apareça (se não fosse assim, nada 
	iria aparecer na tela).*/
	if (isset($flag)){
		if (isset($_POST['vac'])) {
			if ($_POST['vac'] == "Inserir Vacina"){
				if ($sucvac) echo "<div class='msgTelaAluno'>A vacina foi inserida com sucesso.</div>";
				else if($errvac){
					echo "<div class='msgerro'>Alguns dos dados para inser&ccedil;&atilde;o de vacinas, na aba Imuniza&ccedil;&otilde;es n&atilde;o foram corretamente preenchidos.</div>";
					$valDT = $fachada->validaDataVac($_POST['datavacina'],$paciente->getDTNasc());
					if ($valDT != "") echo "<div class='msgerro'>".$valDT.".</div>";
				} else if($errvac1) echo "<div class='msgerro'>Uma mesma vacina não pode ter a mesma dose.</div>"; 

			} else if ($_POST['vac'] == "Remover Vacina"){
				if ($removeuVacina) 
					echo "<div class='msgTelaAluno'>A vacina foi removida com sucesso.</div>";
			}
		}
		if ($_POST['salvar'] == "Salvar"){
			if ($msge && $msgi){
				echo "<div class='msgTelaAluno'>Os dados em ".$msgi." foram inseridos com sucesso.</div>";
				echo "<div class='msgerro'>Alguns dados em ".$msge." est&atilde;o incorretos. Destaque em vermelho.</div>";
			} else if (!$msge && $msgi){
				echo "<div class='msgTelaAluno'>Os dados em " . $msgi . " foram inseridos com sucesso</div>";
			} else if ($msge){
				echo "<div class='msgerro'>Alguns dados em ".$msge." est&atilde;o incorretos. Destaque em vermelho.</div>";
			} else if (!$msge && !$msgi)
				echo "<div class='msgerro'>Preencha algum campo para salvar os dados.</div>";
		}
	}
?>
<div id="tPront">
<div id="divhp1" <?php if ($ctrlhp != '1'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_prenatal.php");?></div>
<div id="divhp2" <?php if ($ctrlhp != '2'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_natal.php");?></div>
<div id="divhp3" <?php if ($ctrlhp != '3'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_neonatal.php");?></div>
<div id="divhp4" <?php if ($ctrlhp != '4'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_aliment.php");?></div>
<div id="divhp5" <?php if ($ctrlhp != '5'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_cresdes.php");?></div>
<div id="divhp6" <?php if ($ctrlhp != '6'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_habitos.php");?></div>
<div id="divhp7" <?php if ($ctrlhp != '7'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_imuniz.php");?></div>
<div id="divhp8" <?php if ($ctrlhp != '8'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_doencasant.php");?></div>
<div id="divhp9" <?php if ($ctrlhp != '9'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_outrasinfo.php");?></div>
<div id="divhp10" <?php if ($ctrlhp != '10'){ echo 'style="display: none"'; }?>><?php include_once("views/abas_historico/aba_histfam.php");?></div>
</div>

<input type="hidden" id="ctrlhp" name="ctrlhp" value="<?php echo $ctrlhp; ?>" />
<input type="hidden" id="ccaba" name="ccaba" value="<?php echo (isset($_POST['ccaba']) ? $_POST['ccaba'] : ''); ?>" />