<?php
/*function printAdendo($sql){
		$val = 1;		
		while ($arrays = mysql_fetch_array($sql)){
			
			$data = printData($arrays['dthr']);
			$hora = printHora($arrays['dthr']);
			
			echo "<fieldset style='width:590px'>
				<legend>Adendo ".$val."</legend><font size='2' face='Trebuchet MS'  style='font-weight:normal;'>".$arrays['adendo']."<br>".getNomeAluno($arrays['idAlun'])." - ".$data." - ".$hora."<br>
				</font></fieldset><br />";
			$val++;
		}
}
function printAdendoQH($idAtendimento){
	  	$sqlqh = mysql_query("SELECT * FROM adendoqh WHERE idAtend='".$idAtendimento."'");
		printAdendo($sqlqh);
}

function printAdendoIS($idAtendimento){
	  	$sqlis = mysql_query("SELECT * FROM adendois WHERE idAtend='".$idAtendimento."'");
		printAdendo($sqlis);
}

function printAdendoEX($idAtendimento){
	  	$sqlcd = mysql_query("SELECT * FROM adendoex WHERE idAtend='".$idAtendimento."'");
		printAdendo($sqlcd);
}

function printAdendoHD($idAtendimento){
	  	$sqlhd = mysql_query("SELECT * FROM adendohd WHERE idAtend='".$idAtendimento."'");
		printAdendo($sqlhd);
}

function printAdendoCD($idAtendimento){
	  	$sqlcd = mysql_query("SELECT * FROM adendocd WHERE idAtend='".$idAtendimento."'");
		printAdendo($sqlcd);
}*/

function printAdendo($adendois, $fachada){
	if (sizeOf($adendois) > 0){ 
		$val = 1;
		foreach($adendois as $arrays){
			$assinatura1 = $fachada->getNomeAluno($arrays['idAluno']) . " - " . 
				$fachada->printData($arrays['dthr']) . " - " . $fachada->printHora($arrays['dthr']); ?>
		<fieldset class="full" style="margin-left:1%;">
			<legend>Adendo <?php echo $val; ?></legend>
			<font size='2' face='Trebuchet MS' style='font-weight:normal;'><?php echo $arrays['adendo']; ?><br><?php echo $assinatura1; ?></font><br />
		</fieldset>
	<?php $val++;}} 
}
?>