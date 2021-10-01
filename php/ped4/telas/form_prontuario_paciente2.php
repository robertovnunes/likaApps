<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>


<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<?php

function nomeAba($valor) {
	if ($valor == "" || ($valor != "qpdhda" && $valor != "olhos" && $valor != "geral" && $valor != "pele" && $valor != "pele" && $valor != "musculoesqueletico" && $valor != "respiratorio" && $valor != "cardiovascular" && $valor != "gastrointestinal" && $valor != "genitourinario" && $valor != "nervoso" && $valor != "exame" && $valor != "exame_inspec" && $valor != "exame_pele" && $valor != "exame_gang"&& $valor != "exame_desneuro" &&  $valor != "exame_estpub" && $valor != "exame_olhos" && $valor != "exame_cranio" && $valor != "exame_sistotor" && $valor != "exame_apresp" && $valor != "exame_cardio" && $valor != "exame_pescoco" && $valor != "exame_apgast" && $valor != "exame_genurin"&& $valor != "exame_muscesq" && $valor != "exame_nervoso" && $valor != "hd" && $valor != "conduta" && $valor != "ouvidos"))
	return "informante";
	else return $valor;
}

function mSel($valor, $aba){
	if ($valor == $aba)
	return "class='msel'";
}

$paciente = getDadosPaciente($atend);

$data = substr($paciente->dtnasc,8,2)."/".substr($paciente->dtnasc,5,2)."/".substr($paciente->dtnasc,0,4);
$aba = nomeAba($_GET['n']);

$nome = "";
if(strlen($paciente->nome)>30){

	$array = explode(" ", $paciente->nome);
	$tamanho = 0;

	while(($tamanho + strlen(current($array))) < 30){
		$nome .= current($array).' ';
		$tamanho = $tamanho + strlen(current($array));
		next($array);
	}

}else{
	$nome = $paciente->nome;
}
?>
<table width="735" bgcolor='#FFFFFF' >
  <tr> <div id="dadosPessoaisPac" align="left"><b> DADOS PESSOAIS </b></div>
		<div id="nomePaciente" class="style5" align="left"><b><?php echo $nome; ?></b> </td></div>
		
  </tr>
    <tr >
    <td  height="58" class="style5" style="	font-size:12px;" ><b>Sexo</b>: <?php echo $paciente->sexo; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Natural de:</b> <?php echo $paciente->cidade."/".$paciente->estado; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Data Nasc:</b> <?php echo $data; ?></td>
	  <td   class="style5" style="	font-size:12px;" ><b>Alergia a Medicamentos:</b> <?php if ($paciente->alergmed == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
	  <td  class="style5" style="	font-size:12px;" ><b>Alergia Alimentar:</b> <?php if ($paciente->alergalim == "S") echo "Sim"; else echo "N&atilde;o"; ?></td>
  </tr>
</table>
<br />



<form
	action="prontuario_paciente.php?at=<?php echo $atend; ?>&n=<?php echo $aba; ?>"
	method="post" name="<?php echo $aba; ?>" id="pront">

 <?php /* MENU AQUI */?>

<table width="620" cellspacing="0" cellpadding="0" border="0">
	<tr>
    	<td colspan="4" valign="top" class="tb-conteudo" >  <fieldset> <legend> Menu </legend><ul id="MenuBar1" class="MenuBarVertical">
  <li><a onclick="muda(<?php echo $atend; ?>,'informante','p')">  Informante</a> </li>
  <li><a onclick="muda(<?php echo $atend; ?>,'qpdhda','p')">  QPD/HDA</a></li>
  <li><a class="MenuBarItemSubmenu"> Interrogatório Sintomatológico</a>
      <ul>
              <li <?php echo mSel('geral', 'geral');?>><a onclick="muda(<?php echo $atend; ?>,'geral','p')">Geral</a></li>
              <li <?php echo mSel('pele', 'pele');?> ><a onclick="muda(<?php echo $atend; ?>,'pele','p')">Pele</a></li>
              <li <?php echo mSel('olhos', 'olhos');?>><a onclick="muda(<?php echo $atend; ?>,'olhos','p')">Olhos</a></li>
              <li <?php echo mSel('ouvidos', 'ouvidos');?>><a onclick="muda(<?php echo $atend; ?>,'ouvidos','p')">Ouvidos</a></li>
              <li <?php echo mSel('respiratorio', 'respiratorio');?> ><a onclick="muda(<?php echo $atend; ?>,'respiratorio','p')">Respirat&oacute;rio</a></li>
              <li <?php echo mSel('cardiovascular', 'cardiovascular');?>><a onclick="muda(<?php echo $atend; ?>,'cardiovascular','p')">Cardiovascular</a></li>
              <li <?php echo mSel('gastrointestinal', 'gastrointestinal');?>><a onclick="muda(<?php echo $atend; ?>,'gastrointestinal','p')">Gastro-Intestinal</a></li>
              <li <?php echo mSel('genitourinario', 'genitourinario');?>><a onclick="muda(<?php echo $atend; ?>,'genitourinario','p')">Genito-Urin&aacute;rio</a></li>
              <li <?php echo mSel('musculoesqueletico', 'musculoesqueletico');?>><a onclick="muda(<?php echo $atend; ?>,'musculoesqueletico','p')">M&uacute;sculo-Esquel&eacute;tico</a></li>
              <li <?php echo mSel('nervoso', 'nervoso');?>><a onclick="muda(<?php echo $atend; ?>,'nervoso','p')">Nervoso</a></li>
             
      </ul>
  </li>
  <li><a>   Exame F&iacute;sico</a>
  	<ul >
		    <li  class="MenuBarItemSubmenu"><a> Exame F&iacute;sico Geral </a><ul>
            <li> </li>
			<li> <a onclick="muda(<?php echo $atend; ?>,'exame_inspec','p')"> Inspe&ccedil;&atilde;o </a></li>
			<li> <a onclick="muda(<?php echo $atend; ?>,'exame_pele','p')"> Pele e Mucosas </a></li>
			<li> <a onclick="muda(<?php echo $atend; ?>,'exame_gang','p')"> Ganglios Linf&aacute;ticos </a></li>
		</ul></li>
		<li class="MenuBarItemSubmenu"><a>Antropometria</a><ul>
			<li> <a onclick="muda(<?php echo $atend; ?>,'exame_estpub','p')">Estadiamento Puberal</a></li>
			<li > <a onclick="muda(<?php echo $atend; ?>,'exame_desneuro','p')">Neuropsicomotor</a></li>
		</ul></li>
		<li class="MenuBarItemSubmenu"><a>Especial</a><ul>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_cranio','p')">Cr&acirc;nio</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_olhos','p')">Olhos</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_sistotor','p')">Otorrinolaringol&oacute;gico</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_pescoco','p')">Pesco&ccedil;o</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_apresp','p')">Respirat&oacute;rio</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_cardio','p')">Cardiovascular</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_apgast','p')">Gastro-Intestinal</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_genurin','p')">Genito-Urin&aacute;rio</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_muscesq','p')">Músculo-Esquel&eacute;tico</a></li>
			<li  ><a onclick="muda(<?php echo $atend; ?>,'exame_nervoso','p')">Nervoso</a></li>
		</ul></li>
	</ul>
  
  </li>
  <li><a onclick="muda(<?php echo $atend; ?>,'hd','p')">  Hipótese Diagn&oacute;stico </a></li>
  <li><a onclick="muda(<?php echo $atend; ?>,'conduta','p')">  Conduta </a></li>
</ul>
<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script></fieldset></td>

			<td colspan="8" valign="top" class="tb-conteudo"><fieldset><legend> Prontuário</legend><?php $n = $_GET['n'];
		if ($n == "qpdhda"){
			echo'<div id="div_qpdhda" class="conteudo" height:500px">';
			include("prontuario/aba_qpdhda.php");
		} else if ($n == "is"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/aba_is.php");
			
		}else if ($n == "geral"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_geral.php");
		
			
		} 
		 else if ($n == "pele"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_pele.php");			
		}else if ($n == "olhos"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_olhos.php");			
		} else if ($n == "ouvidos"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_ouvidos.php");			
		} else if ($n == "respiratorio"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_apresp.php");			
		} else if ($n == "cardiovascular"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_apcardvasc.php");			
		} else if ($n == "gastrointestinal"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_apgastint.php");			
		} else if ($n == "genitourinario"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_apgenurin.php");			
		} else if ($n == "musculoesqueletico"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_sistmuscesq.php");			
		} else if ($n == "nervoso"){
			echo'<div id="div_is" class="conteudo" height:500px">';
			include("prontuario/is/aba_sistnerv.php");			
		}			
		 else if ($n == "exame"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/aba_exame.php");
		}  else if ($n == "exame_inspec"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_inspecao.php");
		}else if ($n == "exame_pele"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_pele.php");
		}else if ($n == "exame_gang"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_ganglios.php");
		}else if ($n == "exame_estpub"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_antropom.php");
		}else if ($n == "exame_desneuro"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_desneu.php");
		}
		
		else if ($n == "exame_cranio"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_cranio.php");
		}
		else if ($n == "exame_olhos"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_olhos.php");
		}
		else if ($n == "exame_sistotor"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_sistotor.php");
		}else if ($n == "exame_pescoco"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_pescoco.php");
		}else if ($n == "exame_cardio"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_cardvasc.php");
		}else if ($n == "exame_apresp"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_apresp.php");
		}
		else if ($n == "exame_apgast"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_apgastint.php");
		}else if ($n == "exame_genurin"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_genurin.php");
		}else if ($n == "exame_muscesq"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_muscesq.php");
		}
		else if ($n == "exame_nervoso"){
			echo'<div id="div_exame" class="conteudo" height:500px">';
			include("prontuario/exame/aba_nerv.php");
		}
				
		else if ($n == "conduta"){
			echo'<div id="div_conduta" class="conteudo" height:500px">';
			include("prontuario/aba_condutas.php");
		} else if ($n == "hd"){
			echo'<div id="div_hd" class="conteudo" height:500px">';
			include("prontuario/aba_hd.php");
		} else {
			echo'<div id="div_paciente" class="conteudo" height:500px">';
			include("prontuario/aba_informante.php");
		} ?> <br />
		<?php if ($n == "is" || $n == "hd" || $n == "exame" || $n == "exame_inspec"|| $n == "exame_gang"|| $n == "exame_pele" ||$n == "exame_estpub"||$n == "exame_desneuro"||$n == "exame_olhos" ||$n == "exame_cranio"||$n == "exame_sistotor"||$n == "exame_apresp"||$n == "exame_cardio"||$n == "exame_pescoco"||$n == "exame_apgast"||$n == "exame_genurin"||$n == "exame_muscesq"||$n == "exame_nervoso"||$n == "conduta" || $n == "qpdhda" || $n == "pele" || $n == "olhos" || $n == "ouvidos" || $n == "respiratorio" || $n == "cardiovascular" || $n == "gastrointestinal" || $n == "genitourinario" || $n == "musculoesqueletico" || $n == "nervoso" || $n == "geral"){ ?> 	
		<div id="myDiv"></div>
		<fieldset style="width: 590px">
     
		<table width="590">
			<tr >
				
				<td align="left"><input name="limpar" type="reset"
					value="Limpar" /></td>
				<td  align="left"><input name="voltar" type="submit"
					onclick="action='acesso_aluno.php'" value="Voltar" /></td>
				
				<td align="right" width="550"><input name="adendo" type="button" value="Adendo" 
				<?php 
				    if($n == "pele" || $n == "olhos" || $n == "ouvidos" || $n == "respiratorio" || $n == "cardiovascular" || $n == "gastrointestinal" || $n == "genitourinario" || $n == "musculoesqueletico" || $n == "nervoso" || $n == "geral"){
						if(!ISAssinado($atend)) echo " disabled=true ";
				     }
				     else if (!$linha->ass){ echo
						" disabled=true "; } ?>
					onclick="addAdendo();disabled=true;salvar.disabled=false;" /></td>
				
				<td align="right" width="1"><input type="hidden" name="gamb" value="false"
					id="gamb" /> <?php   if ($n == "exame" || $n == "exame_inspec"|| $n == "exame_gang"|| $n == "exame_pele" || $n =="exame_desneuro" || $n == "exame_estpub"||$n == "exame_olhos" ||$n == "exame_cranio"||$n == "exame_sistotor"||$n == "exame_apresp"||$n == "exame_cardio"||$n == "exame_pescoco" ||$n == "exame_apgast"||$n == "exame_genurin"||$n == "exame_muscesq"||$n == "exame_nervoso"){
						$abas = getSalvosAbasExame($atend);
						
						$inspecao = $abas->inspecao;
						$pele = $abas->pele;
						$ganglios =  $abas->ganglios;
						$estadpuberal = $abas->estadpuberal;
						$desenvneuropsicomotor = $abas->desenvneuropsicomotor;
						$cranio = $abas->cranio;
						$olhos = $abas->olhos;
						$sistotorrino = $abas->sistotorrino;
						$pescoco = $abas->pescoco;
						$aprespiratorio = $abas->aprespiratorio ;
						$apcardiovascular = $abas->apcardiovascular;
						$apgastroint = $abas->apgastroint;
						$apgenitourinario = $abas->apgenitourinario;
						$apmuscesqueletico = $abas->apmuscesqueletico;
						$sistnervoso = $abas->sistnervoso;
						?> <input type="button" name="assinar" value="Assinar"
						<?php if(EXAssinado($atend)) echo "disabled=true";?>
					onclick="verificarExame(
						<?php echo $inspecao." ,  ".$pele." ,  ".$ganglios." ,  ".$estadpuberal." ,  ".$desenvneuropsicomotor." ,  ".$cranio." ,  ".$olhos." ,  ".$sistotorrino." ,  ".$pescoco." ,  ".$aprespiratorio ." ,  ".$apcardiovascular." ,  ".$apgastroint ." ,  ".$apgenitourinario." ,  ".$apmuscesqueletico." ,  ".$sistnervoso; ?>
						); " /></td>


						<?php
					} else if($n == "is" ||$n == "pele" || $n == "olhos" || $n == "ouvidos" || $n == "respiratorio" || $n == "cardiovascular" || $n == "gastrointestinal" || $n == "genitourinario" || $n == "musculoesqueletico" || $n == "nervoso" || $n == "geral"){
						
						$abas = getSalvosAbasIs($atend);
						$geral = $abas->geral;
						$pele = $abas->pele;
						$olhos = $abas->olhos;
						$ouvidos = $abas->ouvidos;
						$respiratorio = $abas->respiratorio ;
						$cardiovascular = $abas->cardiovascular;
						$gastroint = $abas->gastrointestinal;
						$genitourinario = $abas->genitourinario;
						$muscesqueletico = $abas->muscesqueletico;
						$nervoso = $abas->nervoso;
							
						?>

				<input type="button" name="assinar" value= "Assinar"
				<?php if(ISAssinado($atend))echo "disabled=true";?>
					onclick="verificarIs(
						<?php echo $geral." ,  ".$pele." ,  ".$olhos." ,  ".$ouvidos." ,  ".$respiratorio ." ,  ".$cardiovascular." ,  ".$gastroint ." ,  ".$genitourinario." ,  ".$muscesqueletico." ,  ".$nervoso; ?>
						); " />
				</td>


				<?php
					
					}elseif($n == "qpdhda" || $n== "conduta" || $n == "hd"){
						?>
				<input type="button" name="assinar" value="Assinar"
				<?php echo checkAssinado($linha->ass);?>
					onclick="verificar(); " />
				</td>

				
				<?php
					}
					?>
				<td align="right" ><input  name="salvar" type="submit" id="salvar" 
					value="Salvar"<?php if($n == "pele" || $n == "olhos" || $n == "ouvidos" || $n == "respiratorio" || $n == "cardiovascular" || $n == "gastrointestinal" || $n == "genitourinario" || $n == "musculoesqueletico" || $n == "nervoso" || $n == "geral"){
						if(ISAssinado($atend))echo " disabled=true ";
				     }
					else if(  $n == "exame_inspec"|| $n == "exame_gang"|| $n == "exame_pele" ||$n == "exame_estpub"||$n == "exame_desneuro"||$n == "exame_olhos" ||$n == "exame_cranio"||$n == "exame_sistotor"||$n == "exame_apresp"||$n == "exame_cardio"||$n == "exame_pescoco"||$n == "exame_apgast"||$n == "exame_genurin"||$n == "exame_muscesq"||$n == "exame_nervoso"){
					 if(EXAssinado($atend))echo " disabled=true ";	}
				     else echo checkAssinado($linha->ass); ?> />  </td>
			</tr>

			<input type="hidden" value="0" id="ctrl" />
		</table>
		</fieldset>
		<?php } ?> <br />
		<script type="text/javascript">
		function verificar(){
			document.getElementById("gamb").value = "true";
			document.getElementById("pront").submit();
		}
		function concatenar(msg1, msg2){
			
			if (msg1 == "") msg1 = msg2;
			else msg1 = msg1 + ", "+ msg2;
			
			return msg1;
		}
		
		function verificarExame(inspecao, pele, ganglios,estadpuberal,desenvneuropsicomotor, cranio, olhos, sistotorrino, pescoco, aprespiratorio , apcardiovascular, apgastroint , apgenitourinario, apmuscesqueletico, sistnervoso ){
		
			var erroJanela = "";
				if( inspecao == 0)
					erroJanela = concatenar(erroJanela, "Inspeção");
				if( pele == 0)
					erroJanela = concatenar(erroJanela, "Pele e Mucosas");
				if( ganglios == 0)
					erroJanela = concatenar(erroJanela, "Ganglios Linfáticos");
				if( estadpuberal == 0)
					erroJanela = concatenar(erroJanela, "Estadiamento Puberal");
				if( desenvneuropsicomotor == 0)
					erroJanela = concatenar(erroJanela, "Desenvolvimento Neuropsicomotor");
				if( cranio == 0)
					erroJanela = concatenar(erroJanela, "Crânio");
				if( olhos == 0)
					erroJanela = concatenar(erroJanela, "Olhos");
				if( sistotorrino == 0)
					erroJanela = concatenar(erroJanela, "Sistema Otorrinolaringológico");
				if( pescoco == 0)
					erroJanela = concatenar(erroJanela, "Pescoço");
				if( aprespiratorio == 0)
					erroJanela = concatenar(erroJanela, "Ap. Respiratório");
				if( apcardiovascular == 0)
					erroJanela = concatenar(erroJanela, "Ap. Cardiovascular");
				if( apgastroint == 0)
					erroJanela = concatenar(erroJanela, "Ap. Gastro Intestinal");
				if( apgenitourinario == 0)
					erroJanela = concatenar(erroJanela, "Ap. Genito-Urinário");
				if( apmuscesqueletico == 0)
					erroJanela = concatenar(erroJanela, "Ap. Músculo Esquelético");
				if( sistnervoso == 0)
					erroJanela = concatenar(erroJanela, "Sistema Nervoso");

				
				if(erroJanela == "" ){
					document.getElementById("gamb").value = "true";
					document.getElementById("pront").submit();
					
				}else{


				
					if (confirm('Voce não salvou os seguintes itens: '+erroJanela+'. Deseja assinar?')) { 
						document.getElementById("gamb").value = "true";
						document.getElementById("pront").submit();
						
	      		  } 
	     		   else { 
	            		return void(''); 
	      	 	 } 
				}
		}		

		function verificarIs(geral, pele, olhos,ouvidos,respiratorio , cardiovascular, gastroint , genitourinario, muscesqueletico, nervoso ){
			var erroJanela = "";
				
			if( geral == 0)
				erroJanela = concatenar(erroJanela, "Geral");
			if( pele == 0)
				erroJanela = concatenar(erroJanela, "Pele");
			if( olhos == 0)
				erroJanela = concatenar(erroJanela, "Olhos");
			if( ouvidos == 0)
				erroJanela = concatenar(erroJanela, "Ouvidos");
			if( respiratorio == 0)
				erroJanela = concatenar(erroJanela, "Respiratório");
			if( cardiovascular == 0)
				erroJanela = concatenar(erroJanela, "Cardiovascular");
			if( gastroint == 0)
				erroJanela = concatenar(erroJanela, "Gastro Intestinal");
			if( genitourinario == 0)
				erroJanela = concatenar(erroJanela, "Genito-Urinário");
			if( muscesqueletico == 0)
				erroJanela = concatenar(erroJanela, "Músculo Esquelético");
			if( nervoso == 0)
				erroJanela = concatenar(erroJanela, "Nervoso");

			
			if(erroJanela == "" ){
				document.getElementById("gamb").value = "true";
				document.getElementById("pront").submit();	
				

			}else{


			
				if (confirm('Voce não salvou os seguintes itens: '+erroJanela+'. Deseja assinar?')) { 
					document.getElementById("gamb").value = "true";
					document.getElementById("pront").submit();
				
      		  } 
     		   else { 
            		return void(''); 
      	 	 } 
			}
		}	

</script> <?php echo "</div>"; ?></fieldset></td>
	</tr>
</table>

</form>
