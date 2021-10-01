<?php
require "./ajax/xajax_core/xajax.inc.php"; // XAJAX
require "./funBuscarCep.php"; // Função que faz a busca do cep

$ajax = new xajax();
$ajax->registerFunction("buscaCep");

##################################### BUSCA CEP #####################################
function buscaCep($cep, $endereco, $bairro, $cidade, $estado){
	
	//Instancia o objeto XAJAX response
	$objResponse = new xajaxResponse('ISO-8859-1');
	
	if(empty($cep)){
		return $objResponse;
	}

	$cep = str_replace("-", "", $cep);

	$resultado_busca = busca_cep($cep); // Retorna um array
	
	// Coloca os valores dos arrays nos campos do formulário
	$objResponse->assign($endereco, "value", $resultado_busca['tipo_logradouro']." ".$resultado_busca['logradouro']);
	$objResponse->assign($bairro, "value", $resultado_busca['bairro']);
	$objResponse->assign($cidade, "value", $resultado_busca['cidade']);
	if($resultado_busca['uf'] =="AC")	$objResponse->assign($estado, "value", "2");
	if($resultado_busca['uf'] =="AL")	$objResponse->assign($estado, "value", "3");
	if($resultado_busca['uf'] =="AP")	$objResponse->assign($estado, "value", "5");
	if($resultado_busca['uf'] =="AM")	$objResponse->assign($estado, "value", "4");
	if($resultado_busca['uf'] =="BA")	$objResponse->assign($estado, "value", "6");
	if($resultado_busca['uf'] =="CE")	$objResponse->assign($estado, "value", "7");
	if($resultado_busca['uf'] =="DF")	$objResponse->assign($estado, "value", "8");	   
 	if($resultado_busca['uf'] =="ES")	$objResponse->assign($estado, "value", "9");	   
	if($resultado_busca['uf'] =="GO")	$objResponse->assign($estado, "value", "10");	   
	if($resultado_busca['uf'] =="MA")	$objResponse->assign($estado, "value", "11");
	if($resultado_busca['uf'] =="MG")	$objResponse->assign($estado, "value", "12");	   
	if($resultado_busca['uf'] =="MS")	$objResponse->assign($estado, "value", "13");
    if($resultado_busca['uf'] =="MT")	$objResponse->assign($estado, "value", "14");
	if($resultado_busca['uf'] =="PA")	$objResponse->assign($estado, "value", "15");
	if($resultado_busca['uf'] =="PB")	$objResponse->assign($estado, "value", "16");
	if($resultado_busca['uf'] =="PE")	$objResponse->assign($estado, "value", "17");
	if($resultado_busca['uf'] =="PI")	$objResponse->assign($estado, "value", "18");
	if($resultado_busca['uf'] =="PR")	$objResponse->assign($estado, "value", "19");
	if($resultado_busca['uf'] =="RJ")	$objResponse->assign($estado, "value", "20");
	if($resultado_busca['uf'] =="RN")	$objResponse->assign($estado, "value", "21");
	if($resultado_busca['uf'] =="RS")	$objResponse->assign($estado, "value", "24");
	if($resultado_busca['uf'] =="RO")	$objResponse->assign($estado, "value", "22");
	if($resultado_busca['uf'] =="RR")	$objResponse->assign($estado, "value", "23");
    if($resultado_busca['uf'] =="SC")	$objResponse->assign($estado, "value", "25");      
	if($resultado_busca['uf'] =="SP")	$objResponse->assign($estado, "value", "27");
	if($resultado_busca['uf'] =="SE")	$objResponse->assign($estado, "value", "26");
	if($resultado_busca['uf'] =="TO")	$objResponse->assign($estado, "value", "28");
          
         
//	$objResponse->assign($estado, "value", $resultado_busca['uf']);

	// Retorna a resposta de XML gerada pelo objeto do xajaxResponse
	return $objResponse;
}

// Manda o ajax processar os pedidos acima
$ajax->processRequest();

$ajax->printJavascript('./ajax/');




include ("cabecalho.inc.php");
include ("ped.php");
?>
 
<div id="formCep">
        
<form action="cadastro_paciente.php?t=1" method="post" name="cadpaciente" >
  <table border="0"  cellpadding="2">
    <tr>
      
      <td  class="txt_maior"><br /><strong>&nbsp;&nbsp;&nbsp;Dados de Endere&ccedil;o</strong></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;CEP:</td>
      <td ><br /><input name="cep" type="text" class="forms" id="cep" size="11" maxlength="9" onkeyup="if(this.value.length == 9) xajax_buscaCep(this.value, 'ende', 'bair', 'cidade', 'estado');" onblur="xajax_buscaCep(this.value, 'ende', 'bair', 'cidade', 'estado');"/></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;Logradouro:</td>
      <td ><br /><input name="ende" type="text" class="forms" id="ende" size="35" maxlength="75" /></td>
    </tr>
    <tr>
      <td><br />&nbsp;&nbsp;N&uacute;mero:</td>
      <td ><br /><input name="numero" type="text" class="forms" id="numero" size="8" maxlength="6" /></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;Complemento:</td>
      <td ><br /><input name="comp" type="text" class="forms" id="comp" size="35" maxlength="75" /></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;Bairro:</td>
      <td ><br /><input name="bair" type="text" class="forms" id="bair" size="35" maxlength="75" /></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;Cidade:</td>
      <td ><br /><input name="cidade" type="text" class="forms" id="cidade" size="35" maxlength="75" /></td>
    </tr>
    <tr>
      <td ><br />&nbsp;&nbsp;Estado:</td>
      <td><br /> <select name="estado" id="estado" class="forms" style="width:45px">
          <option value="">UF</option>
          <option value="2">AC</option>
          <option value="3">AL</option>
          <option value="4">AM</option>
          <option value="5">AP</option>
          <option value="6">BA</option>
          <option value="7">CE</option>
          <option value="8">DF</option>
          <option value="9">ES</option>
          <option value="10">GO</option>
          <option value="11">MA</option>
          <option value="12">MG</option>
          <option value="13">MS</option>
          <option value="14">MT</option>         
          <option value="15">PA</option>
          <option value="16">PB</option>
          <option value="17">PE</option>
          <option value="18">PI</option>
          <option value="19">PR</option>
          <option value="20">RJ</option>
          <option value="21">RN</option>
          <option value="24">RS</option>
          <option value="22">RO</option>
          <option value="23">RR</option>
          <option value="25">SC</option>
          <option value="27">SP</option>
          <option value="26">SE</option>
          <option value="28">TO</option>
        </select>
        <input type="submit" name="ok" value="Ok"/>
    </tr>
  </table>
  <? include("rodapeped.inc"); ?>
</form>
  </div>
