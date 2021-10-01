<?php setlocale(LC_CTYPE,"pt_BR"); ?>
<div id="divpedt">

    <div id="divpedh" >
        <div id="pedr1c1"><img name="ped_r1_c1" src="images/ped_r1_c1.jpg" width="260" height="150" border="0"></div>
        <a href="javascript:void(0);" onclick="muda('','','a')"><div id="pedr1c2"><img name="ped_r1_c2" src="images/ped_r1_c2.jpg" width="306" height="150" border="0"></div></a>
        <div id="pedr1c3"><img name="ped_r1_c3" src="images/ped_r1_c3.jpg" width="210" height="150" border="0"></div>
        <div id="pedr1c4"><img name="ped_r1_c4" src="images/ped_r1_c4.jpg" width="241" height="150" border="0"></div>
        <div id="pedr1c5"><img name="ped_r1_c5" src="images/ped_r1_c5.jpg" width="263" height="150" border="0"></div>
    </div>

<!-- Se o usuário estiver logado, então o painel aparece. -->
<?php if (isset($_SESSION['user'])){ ?>
    <div id='sairr2c2'>
        <img name='sair_r2_c2' src='images/sair_r2_c2.gif' width='195' height='57' border='0'>
    </div>
    <div id='sairr3c2'>
        <img name='sair_r3_c2' src='images/sair_r3_c2.gif' width='20' height='30' border='0'>
    </div>
    <div id='sairr3c3'>
        <img name='sair_r3_c3' src='images/sair_r3_c3.gif' width='12' height='14' border='0'>
    </div>
    <div id='sairr3c4'>
        <img name='sair_r3_c4' src='images/sair_r3_c4.gif' width='43' height='30' border='0'>
    </div>
    <div id='sairr3c5'>
        <img name='sair_r3_c5' src='images/sair_r3_c5.gif' width='13' height='14' border='0'>
    </div>
    <div id='sairr3c6'>
        <img name='sair_r3_c6' src='images/sair_r3_c6.gif' width='107' height='30' border='0'>
    </div>
    <div id='sairr4c3'>
        <img name='sair_r4_c3' src='images/sair_r4_c3.gif' width='12' height='16' border='0'>
    </div>
    <div id='sairr4c5'>
        <img name='sair_r4_c5' src='images/sair_r4_c5.gif' width='13' height='16' border='0'>
    </div>
    <div id='textoSair'>
        <a href='logout.php'><span class='style4' style="font-size:14px">Sair</span></a>
    </div>
    <div id='textoEditarPerfil'>
        <a onclick="muda('<?php echo $user->getID(); ?>','','e');"><span class='style4' style="cursor:pointer;font-size:14px">Editar Perfil</span></a>
    </div>

    <?php
		$show = '';
        if ($show == "al"){
        	$msg = "PED > Aluno";
        } else if ($show == "alp"){
        	$msg = "PED > Aluno > Paciente";
        } else if ($show == "ad"){
        	$msg = "PED > Administrador";
        } else if ($show == "pr"){
        	$msg = "PED > Professor";
        } else $msg= "";

        $equipe = $fachada->getEquipeAluno($user->getLogin());
        $nome = "<b>Aluno:  </b>".$user->getNome();
    	$equipe = "<b>Equipe:</b>  ".$equipe->equipe;
        echo "<div id='textoAluno'>".$nome."<br>".$equipe."</div>";
} ?>

    <div id="linhaLogado">
       <div id="textoLogado" class="style4">
            <?php echo $msg;?>
        </div>
    </div>