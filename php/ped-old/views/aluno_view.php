<?php
    include_once("views/cabecalho.inc.php");
    include_once("views/topoped.php");
?>
<div id="contentAluno">
    <?php include_once("views/menudatahora.inc.php");?>
	<div id="abasTelaAluno">
		<div id="abasTelaAluno1" style="background-image: url('images/Tela_01_r4_c3.gif');">
			<ul><a id="textoListaPaciente" onclick="muda('','','a')">Lista de Pacientes</a></ul></div>
		<div id="abasTelaAluno2" style="background-image: url('images/Tela_01_r4_c6.gif');">
			<ul><a id="textoCadastrarPaciente" onclick="muda('','','n');">Cadastrar Paciente</a></ul></div>
		<?php if ($n == "altp" || $n == "hstp" || $n == "prtp"){ ?>
		<div id="abasTelaAluno3" style="background-image: url('images/Tela_01_r4_c62.png');">
			<ul><a id="textoAtendimentoPaciente" onclick="muda('<?php echo $pront; ?>','','t');">Atendimentos</a></ul></div>
		<?php } ?>
	</div>