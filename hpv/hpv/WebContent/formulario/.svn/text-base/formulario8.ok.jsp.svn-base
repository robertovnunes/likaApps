<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	    <%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/formulario7.js"></script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"></script>
	    <title>HPV-LIKA</title>
  	</head>
	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
	      	</div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>

			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2> 8. HIST&Oacute;RICO ALIMENTAR</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
		<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 8 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br />
				
				<br>
				<form action="formulario.addFormulario8.logic" method="post">
					<input type="hidden" name="historicoAlimentar.formulario.id" value="${formulario.id}">
					<input type="hidden" name="historicoAlimentar.id" value="${historicoAlimentar.id}" />
			<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
			
					
					<table class="block" id='formulario7'>
						<tr>
							<td class="block" colspan="2">
								<br  /><strong>ALCOOLISMO</strong><br  /><br  />
							</td>
						</tr>

						<tr>
							<td class="block">Consome Bebida alco&oacute;licas?</td>
							<td class="block" style="width: 320px;">
								<input type="radio" name="historicoAlimentar.consomeBebidasAlcoolicas" value="sim" id='historicoAlimentar.consomeBebidasAlcoolicas.sim' 		onclick="consomeBebidas(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBebidasAlcoolicas == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.consomeBebidasAlcoolicas" value="nao" 		onclick="consomeBebidas(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBebidasAlcoolicas == 'nao'}">checked="checked"</c:if>/>Não
								<input type="radio" name="historicoAlimentar.consomeBebidasAlcoolicas" value="naoAgora" 	onclick="consomeBebidas(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBebidasAlcoolicas == 'naoAgora'}">checked="checked"</c:if>/>Não agora,mas já consumi
							</td>
						</tr>
						<script type="text/javascript"> 
						var bebida = false;

						function consomeBebidas(valor,linha){
							if((valor =="sim" || valor == "naoAgora") && bebida == false ){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "Qual o tipo ?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML = "<input type='hidden' name='historicoAlimentar.consumoBebidaAlcoolica.id' value='${historicoAlimentar.consumoBebidaAlcoolica.id}' />";
								colB.innerHTML +="<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.aguardente' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.aguardente == \"Y\"}'>checked='checked'</c:if>/>Aguardente <br/>"+
												 "<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.cerveja' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.cerveja == \"Y\"}'>checked='checked'</c:if>/>Cerveja <br/>"+
												 "<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.vinho' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.vinho == \"Y\"}'>checked='checked'</c:if>/>Vinho <br/>"+
												 "<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.whisky' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.whisky == \"Y\"}'>checked='checked'</c:if>/>Whisky <br/>"+
												 "<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.licor' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.licor == \"Y\"}'>checked='checked'</c:if>/>Licor <br/>"+
												 "<input type='checkbox' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.ns_nr' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.ns_nr == \"Y\"}'>checked='checked'</c:if>/>NS/NR <br/>"+
												 "<br/>"+
												 "Outro(s) <input type='text' name='historicoAlimentar.consumoBebidaAlcoolica.outros' value='${historicoAlimentar.consumoBebidaAlcoolica.outros}' maxlength=50 style='width:75%;margin-top:5px;%' />";
								colB.id="block";
								
								row = document.getElementById("formulario7").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Com que idade iniciou ?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' class='textfieldLongo' name='historicoAlimentar.consumoBebidaAlcoolica.idadeComecouBeber' value='${historicoAlimentar.consumoBebidaAlcoolica.idadeComecouBeber}' onkeyup='this.value=doDecimal(this.value);' maxlength=3 />";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+3);
								colA = row.insertCell(0);
								colA.innerHTML = "Com que frequência costuma beber?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='historicoAlimentar.consumoBebidaAlcoolica.frequencia'>"+
													"<option value='' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.frequencia == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
													"<option value='diariamente' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.frequencia == \"diariamente\"}'>selected='selected'</c:if>>Diariamente</option>"+
													"<option value='semanalmente' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.frequencia == \"semanalmente\"}'>selected='selected'</c:if>>Semanalmente</option>"+
													"<option value='mensalmente' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.frequencia == \"mensalmente\"}'>selected='selected'</c:if>>Mensalmente</option>"+
													"<option value='raramente' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.frequencia == \"raramente\"}'>selected='selected'</c:if>>Raramente</option>"+
												"</select>";
								colB.id="block";
								
								row = document.getElementById("formulario7").insertRow(linha+4);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual a (era) quantidade de copos por dia ?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='historicoAlimentar.consumoBebidaAlcoolica.coposPorDia'>"+
													"<option value='' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.coposPorDia == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
													"<option value='1-2' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.coposPorDia == \"1-2\"}'>selected='selected'</c:if>>1 a 2</option>"+
													"<option value='3-4' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.coposPorDia == \"3-4\"}'>selected='selected'</c:if>>3 a 4</option>"+
													"<option value='5-6' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.coposPorDia == \"5-6\"}'>selected='selected'</c:if>>5 a 6</option>"+
													"<option value='+7' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.coposPorDia == \"+7\"}'>selected='selected'</c:if>>mais de sete</option>"+
												"</select>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+5);
								colA = row.insertCell(0);
								colA.innerHTML = "Com que idade parou de beber?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input name='historicoAlimentar.consumoBebidaAlcoolica.idadeParou' value='${historicoAlimentar.consumoBebidaAlcoolica.idadeParou}' type='textfield' class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);' maxlength=3/>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+6);
								colA = row.insertCell(0);
								colA.innerHTML = "Por quantos anos bebeu?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input name='historicoAlimentar.consumoBebidaAlcoolica.tempoBebeu' value='${historicoAlimentar.consumoBebidaAlcoolica.tempoBebeu}' type='textfield' class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);' maxlength=2/>";
								colB.id="block";
								
								row = document.getElementById("formulario7").insertRow(linha+7);
								colA = row.insertCell(0);
								colA.innerHTML = "Passou por algum tratamento para parar de beber?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='radio' value='sim'   value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber == \"sim\"}'>checked='checked'</c:if>/>Sim"+
												"<input type='radio' value='nao'   value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber == \"nao\"}'>checked='checked'</c:if>/>Não"+
												"<input type='radio' value='ns/nr' value='Y' name='historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber' <c:if test='${historicoAlimentar.consumoBebidaAlcoolica.tratamentoPararBeber == \"ns/nr\"}'>checked='checked'</c:if>/>NS/NR  ";
								colB.id="block";
								
								
								bebida = true;
							}
							else if (valor == "nao" || valor == "ns/nr"){
								if(bebida==true){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									bebida = false;
								}
							}
						}
						</script>
						
						<tr>
							<td class="block" colspan="2">
								<br  />	<strong>BROTO DE SAMAMBAIA</strong>	<br  />	<br  />
							</td>
						</tr>
						<tr>
							<td class="block">
								Ingere broto de samambaia?
							</td>

							<td class="block">
								<input type="radio" name="historicoAlimentar.consomeBrotoSamambaia" value="sim" id="historicoAlimentar.consomeBrotoSamambaia.sim"  onclick="consomeBrotoSamambaia(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBrotoSamambaia == 'sim'}">checked="checked"</c:if>/>Sim 
								<input type="radio" name="historicoAlimentar.consomeBrotoSamambaia" value="nao"   onclick="consomeBrotoSamambaia(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBrotoSamambaia == 'nao'}">checked="checked"</c:if>/>Não
								<input type="radio" name="historicoAlimentar.consomeBrotoSamambaia" value="ns/nr" onclick="consomeBrotoSamambaia(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoAlimentar.consomeBrotoSamambaia == 'ns/nr'}">checked="checked"</c:if>/>Não sabe 
							</td>
						</tr>
						<script type="text/javascript">
						var broto = false;
						function consomeBrotoSamambaia(valor,linha){
							if(valor =="sim" && broto == false){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "H&aacute quantos anos consome?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type=hidden name='historicoAlimentar.consumoBrotoSamambaia.id' value='${historicoAlimentar.consumoBrotoSamambaia.id}' />";
								colB.innerHTML +="<input type='text' class='textfieldLongo' name='historicoAlimentar.consumoBrotoSamambaia.tempoConsome' value='${historicoAlimentar.consumoBrotoSamambaia.tempoConsome}'  maxlength=2 onkeyup='this.value=doDecimal(this.value);'/>";
								colB.id="block";
								
								row = document.getElementById("formulario7").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual a forma de preparo?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='historicoAlimentar.consumoBrotoSamambaia.formaConsumo' >"+
													"<option value='' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.formaConsumo == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
													"<option value='cru' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.formaConsumo == \"cru\"}'>selected='selected'</c:if>  >Cru</option>"+
													"<option value='cozido' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.formaConsumo == \"cozido\"}'>selected='selected'</c:if>>Cozido</option>"+
												    "<option value='outros' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.formaConsumo == \"outros\"}'>selected='selected'</c:if>>Outros</option>"+
												"</select>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+3);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual número(quantidade) de águas desprezadas? (litros)";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeAguaDesprezada' value='${historicoAlimentar.consumoBrotoSamambaia.quantidadeAguaDesprezada}' class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);' maxlength='3'/>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+4);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual a quantidade de porções que ingere por vez ?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='radio' value='1-2' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeColheres' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeColheres == \"1-2\"}'>checked='checked'</c:if>/>1 a 2 colheres"+
												"<br  />"+
												"<input type='radio' value='3-4' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeColheres' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeColheres == \"3-4\"}'>checked='checked'</c:if>/>3 a 4 colheres"+  
												"<br  />"+
												"<br  />"+
												"<input type='text' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeVezes' value='${historicoAlimentar.consumoBrotoSamambaia.quantidadeVezes}' class='pequeno' onkeyup='this.value=doDecimal(this.value);' maxlength=2/> vezes por"+
												"<br  />"+
												"<br  />"+
												"<input type='radio' value='dia'  name='historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo == \"dia\"}'>checked='checked'</c:if>/>Dia"+
												"<input type='radio' value='semana'  name='historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo == \"semana\"}'>checked='checked'</c:if>/>Semana"+
												"<input type='radio' value='mes' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo == \"mes\"}'>checked='checked'</c:if>/>Mês"+
												"<input type='radio' value='rara/nunca' name='historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo' <c:if test='${historicoAlimentar.consumoBrotoSamambaia.quantidadeTempo == \"rara/nunca\"}'>checked='checked'</c:if>/>Rara/Nunca";
								colB.id="block";
								
								broto = true;
							}
							else if (valor == "nao" || valor == "ns/nr"){
								if(broto==true){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									broto = false;
								}
							}
						}

						</script>
					
						<tr>
							<td class="block" colspan="2">
								<br  /><strong>FOGÃO</strong><br  /><br  />
							</td>
						</tr>
						<tr>
							<td class="block">Usa Fogão a Lenha?</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.usaFogaoLenha" id="historicoAlimentar.usaFogaoLenha.sim" value="sim"    onclick="fogao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.usaFogaoLenha == "sim"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.usaFogaoLenha" value="nao"    onclick="fogao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.usaFogaoLenha == "nao"}'>checked='checked'</c:if>/>N&atilde;o
								<input type="radio" name="historicoAlimentar.usaFogaoLenha" value="jaUsei" onclick="fogao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.usaFogaoLenha == "jaUsei"}'>checked='checked'</c:if>/>Já usei
							</td>
						</tr>
						<script type="text/javascript">
						var boolFogao = false;

						function fogao(valor,linha){
							if((valor =="sim" || valor=="jausei") && boolFogao == false){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "H&aacute; quanto tempo?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type=hidden name='historicoAlimentar.fogao.id' value='${historicoAlimentar.fogao.id}' />";
								colB.innerHTML +="<input type='text' name='historicoAlimentar.fogao.tempoTemFogaoCasa' value='${historicoAlimentar.fogao.tempoTemFogaoCasa}' maxlength=30 class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);' maxlength=3/> anos";
								colB.id="block";
								
								row = document.getElementById("formulario7").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Voc&ecirc; cozinha neste fog&atilde;o?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='historicoAlimentar.fogao.cozinhaNesteFogao'>"+
													"<option value='' <c:if test='${historicoAlimentar.fogao.cozinhaNesteFogao == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
													"<option value='Y' <c:if test='${historicoAlimentar.fogao.cozinhaNesteFogao == \"Y\"}'>selected='selected'</c:if>>Sim</option>"+
													"<option value='N' <c:if test='${historicoAlimentar.fogao.cozinhaNesteFogao == \"N\"}'>selected='selected'</c:if>>Não</option>"+
												"</select>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+3);
								colA = row.insertCell(0);
								colA.innerHTML = "H&aacute; quanto tempo cozinha neste fog&atilde;o?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' name='historicoAlimentar.fogao.tempoCozinhaNesteFogao' value='${historicoAlimentar.fogao.tempoCozinhaNesteFogao}' maxlength=30 class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);'/>";
								colB.id="block";
								
								boolFogao = true;
							}
							else if (valor == "nao" || valor == "ns/nr"){
								var str = document.getElementById("formulario7").rows[linha+1].innerHTML;
								if(str.indexOf(" quanto tempo?") >= 0 ){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									boolFogao = false;
								}
							}
						}

						</script>
						<tr>
							<td class="block">
								Tem Fog&atilde;o a Lenha em casa?
							</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.temFogaoLenhaCasa" value="Y" <c:if test='${historicoAlimentar.temFogaoLenhaCasa == "Y"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.temFogaoLenhaCasa" value="N" <c:if test='${historicoAlimentar.temFogaoLenhaCasa == "N"}'>checked='checked'</c:if>/>N&atilde;o
							</td>
						</tr>

						<tr>
							<td class="block">
								Voc&ecirc; costuma queimar madeira para outro fim?
							</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.costumaQueimarMadeira" value="Y" <c:if test='${historicoAlimentar.costumaQueimarMadeira == "Y"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.costumaQueimarMadeira" value="N" <c:if test='${historicoAlimentar.costumaQueimarMadeira == "N"}'>checked='checked'</c:if>/>N&atilde;o
							</td>
						</tr>
						<tr>
							<td class="block" colspan="2">
								<br  /><strong>FRANGO</strong><br  /><br  />
							</td>
						</tr>
						<tr>
							<td class="block">A Sra. come frango?</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.consomeFrango" id="historicoAlimentar.consomeFrango.sim" value="sim"  onclick="frango(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeFrango == "sim"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.consomeFrango" value="nao" onclick="frango(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeFrango == "nao"}'>checked='checked'</c:if>/>N&atilde;o
								<input type="radio" name="historicoAlimentar.consomeFrango" value="ns/nr" onclick="frango(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeFrango == "ns/nr"}'>checked='checked'</c:if>/>NS/NR
							</td>
						</tr>
						<script type="text/javascript">
						var boolFrango = false;
						function frango(valor,linha){
							if(valor =="sim" && boolFrango == false){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "Com que frequ&ecirc;ncia a Sra. come frango?	";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type=hidden name='historicoAlimentar.frango.id' value='${historicoAlimentar.frango.id}' />";
								colB.innerHTML +="<input type='text' class='pequeno' name='historicoAlimentar.frango.frequenciaQuantidadeConsumo' value='${historicoAlimentar.frango.frequenciaQuantidadeConsumo}' onkeyup='this.value=doDecimal(this.value);' maxlength=2/> vezes por"+
												"<select name='historicoAlimentar.frango.frequenciaTempoConsumo'>"+
													"<option value='dia' <c:if test='${historicoAlimentar.frango.frequenciaTempoConsumo == \"dia\"}'>selected='selected'</c:if>>dia </option>"+
													"<option value='semana' <c:if test='${historicoAlimentar.frango.frequenciaTempoConsumo == \"semana\"}'>selected='selected'</c:if>>semana </option>"+
													"<option value='mes' <c:if test='${historicoAlimentar.frango.frequenciaTempoConsumo == \"mes\"}'>selected='selected'</c:if>>mes </option>"
												"</select> <br/><br/>"+
												"<input type='radio' class='pequeno' name='historicoAlimentar.frango.frequenciaQuantidadeConsumo' <c:if test='${historicoAlimentar.frango.frequenciaQuantidadeConsumo == \"raramente\"}'>checked='checked'</c:if> value='raramente'/>menos que uma vez por mês/raramente <br/>";
												"<input type='radio' class='pequeno' name='historicoAlimentar.frango.frequenciaQuantidadeConsumo' value='ns/nr' <c:if test='${historicoAlimentar.frango.frequenciaQuantidadeConsumo == \"ns/nr\"}'>checked='checked'</c:if>/> ns/nr <br/>";
								colB.id="block";
								
								
								row = document.getElementById("formulario7").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Quando a Sra. come frango, o que normalmente faz com a pele?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='historicoAlimentar.frango.peleFrango'>"+
													"<option value=''>selecione...</option>"+
													"<option value='Sempre retira a pele antes de comer' <c:if test='${historicoAlimentar.frango.peleFrango == \"Sempre retira a pele antes de comer\"}'>selected='selected'</c:if>> Sempre retira a pele antes de comer</option>"+
													"<option value='Na maioria das vezes retira' <c:if test='${historicoAlimentar.frango.peleFrango == \"Na maioria das vezes retira\"}'>selected='selected'</c:if>> Na maioria das vezes retira</option>"+
													"<option value='Algumas vezes retira' <c:if test='${historicoAlimentar.frango.peleFrango == \"Algumas vezes retira\"}'>selected='selected'</c:if>> Algumas vezes retira</option>"+
													"<option value='Quase nunca retira' <c:if test='${historicoAlimentar.frango.peleFrango == \"Quase nunca retira\"}'>selected='selected'</c:if>> Quase nunca retira</option>"+
													"<option value='Nunca retira' <c:if test='${historicoAlimentar.frango.peleFrango == \"Nunca retira\"}'>selected='selected'</c:if>> Nunca retira</option>"+
													"<option value='Nao come carne que tenha muita gordura' <c:if test='${historicoAlimentar.frango.peleFrango == \"Nao come carne que tenha muita gordura\"}'>selected='selected'</c:if>> N&atilde;o come carne que tenha muita gordura</option>"+
													"<option value='ns/nr' <c:if test='${historicoAlimentar.frango.peleFrango == \"ns/nr\"}'>selected='selected'</c:if>> NS/NR</option>"+
												"</select>";
								colB.id="block";
								
								boolFrango = true;
							}
							else if (valor == "nao" || valor == "ns/nr"){
								var str = document.getElementById("formulario7").rows[linha+1].innerHTML;
								if(str.indexOf("Com que frequ") >= 0 ){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									tbl.deleteRow(linha+1);
									boolFrango = false;
								}
							}
						}
						</script>



						<tr>
							<td class="block" colspan="2">
								<br  />
								<strong>CARNE VERMELHA</strong> 
								<br  />
								<br  />
							</td>
						</tr>
						<tr>
							<td class="block">
								A Sra. come carne vermelha?
							</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.consomeCarneVermelha" id="historicoAlimentar.consomeCarneVermelha.sim" value="sim" onclick="carneVermelha(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeCarneVermelha == "sim"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.consomeCarneVermelha" value="nao" onclick="carneVermelha(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeCarneVermelha == "nao"}'>checked='checked'</c:if>/>Não
								<input type="radio" name="historicoAlimentar.consomeCarneVermelha" value="ns/nr" onclick="carneVermelha(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomeCarneVermelha == "ns/nr"}'>checked='checked'</c:if>/>NS/NR
							</td>
						</tr>
						<script type="text/javascript">
						var boolCarneVermelha = false;
						function carneVermelha(valor,linha){
							if(valor =="sim" && boolCarneVermelha==false){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "Quando a Sra. come carne vermelha, o que normalmente faz com a gordura vis&iacute;vel?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type='hidden' name='historicoAlimentar.carneVermelha.id' value='${historicoAlimentar.carneVermelha.id}' />";
								colB.innerHTML +="<select name='historicoAlimentar.carneVermelha.gordura'>"+
													"<option value=''>selecione...</option>"+
													"<option value='Sempre retira' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Sempre retira\"}'>selected='selected'</c:if>> Sempre retira</option>"+
													"<option value='Na maioria das vezes retira' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Na maioria das vezes retira\"}'>selected='selected'</c:if>> Na maioria das vezes retira</option>"+
													"<option value='Algumas vezes retira' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Algumas vezes retira\"}'>selected='selected'</c:if>> Algumas vezes retira</option>"+
													"<option value='Quase nunca retira' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Quase nunca retira\"}'>selected='selected'</c:if>> Quase nunca retira</option>"+
													"<option value='Nunca retira' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Nunca retira\"}'>selected='selected'</c:if>> Nunca retira</option>"+
													"<option value='Nao come carne que tenha muita gordura' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"Nao come carne que tenha muita gordura\"}'>selected='selected'</c:if>> N&atilde;o come carne que tenha muita gordura</option>"+
													"<option value='ns/nr' <c:if test='${historicoAlimentar.carneVermelha.gordura == \"ns/nr\"}'>selected='selected'</c:if>> NS/NR</option>"+
												"</select>";
								colB.id="block";
								
								boolCarneVermelha = true;
							}
							else if (valor == "nao" || valor == "ns/nr"){
								var str = document.getElementById("formulario7").rows[linha+1].innerHTML;
								if(str.indexOf("Quando a Sra. come carne vermelha,") >= 0 ){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									boolCarneVermelha = false;
								}
							}
						}

						</script>


						<tr>
							<td class="block" colspan="2">
								<br>
								<strong>PEIXE</strong>
								<br><br>
							</td>
						</tr>
						<tr>
							<td class="block">
								A Sra. come peixe?
							</td>
							<td class="block">
								<input type="radio" name="historicoAlimentar.consomePeixe" id="historicoAlimentar.consomePeixe.y" value="Y"  onclick="peixe(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomePeixe == \"Y\"}'>checked='checked'</c:if>/>Sim
								<input type="radio" name="historicoAlimentar.consomePeixe" value="N" onclick="peixe(this.value,this.parentNode.parentNode.rowIndex);" <c:if test='${historicoAlimentar.consomePeixe == \"N\"}'>checked='checked'</c:if>/>Não
							</td>
						</tr>
						<script>
						var boolPeixe = false;
						function peixe(valor,linha){
							if(valor =="Y" && boolPeixe == false){
								var row = document.getElementById("formulario7").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "Com que frequ&ecirc;ncia a Sra. come peixe?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' class='pequeno' id='peixeQnt' name='historicoAlimentar.frequenciaConsomePeixeQuantidade' value='${historicoAlimentar.frequenciaConsomePeixeQuantidade}' onkeyup='this.value=doDecimal(this.value);' maxlength='3'/>vezes por:<br>" +
												"<input type='radio' name='historicoAlimentar.frequenciaConsomePeixeTempo' value='dia' <c:if test='${historicoAlimentar.frequenciaConsomePeixeTempo == \"dia\"}'>checked='checked'</c:if>>dia <br>"+
												"<input type='radio' name='historicoAlimentar.frequenciaConsomePeixeTempo' value='semana' <c:if test='${historicoAlimentar.frequenciaConsomePeixeTempo == \"semana\"}'>checked='checked'</c:if>>semana <br/>"+
												"<input type='radio' name='historicoAlimentar.frequenciaConsomePeixeTempo' value='mes' <c:if test='${historicoAlimentar.frequenciaConsomePeixeTempo == \"mes\"}'>checked='checked'</c:if>>m&ecirc;s <br/>"+
												"<input type='radio' name='historicoAlimentar.frequenciaConsomePeixeTempo' value'raramente' <c:if test='${historicoAlimentar.frequenciaConsomePeixeTempo == \"raramente\"}'>checked='checked'</c:if>>menos que uma vez por m&ecirc;s/raramente <br/>"+
												"<input type='radio' name='historicoAlimentar.frequenciaConsomePeixeTempo' value='ns/nr' <c:if test='${historicoAlimentar.frequenciaConsomePeixeTempo == \"ns/nr\"}'>checked='checked'</c:if>>ns/nr <br/>";
								colB.id="block";

								boolPeixe = true;
							}
							else if (valor == "N"){
								var str = document.getElementById("formulario7").rows[linha+1].innerHTML;
								if(str.indexOf("Com que frequ") >= 0 ){/*então existia antes o campo na tabela*/
									var tbl = document.getElementById('formulario7');
									tbl.deleteRow(linha+1);
									boolPeixe = false;
								}
							}
						}
						</script>


						<tr>
							<td class="block" colspan="2">
								<br>
								<strong>SAL</strong>
								<br><br>
							</td>
						</tr>
						<tr>
							<td class="block" >
								Sem contar saladas,  com que frequ&ecirc;ncia a Sra. costuma colocar sal no prato de comida?  
							</td>
							<td class="block">
								<input type="radio" value="Nunca coloca sal no prato de comida" name="historicoAlimentar.sal" <c:if test='${historicoAlimentar.sal == \"Nunca coloca sal no prato de comida\"}'>checked='checked'</c:if>/>Nunca coloca sal no prato de comida
								<br  />
								<input type="radio" value="Provo e coloco se estiver sem sal" name="historicoAlimentar.sal" <c:if test='${historicoAlimentar.sal == \"Provo e coloco se estiver sem sal\"}'>checked='checked'</c:if>/>Provo e coloco se estiver sem sal
								<br  />
								<input type="radio" value="Coloco quase sempre mesmo sem provar" name="historicoAlimentar.sal" <c:if test='${historicoAlimentar.sal == \"Coloco quase sempre mesmo sem provar\"}'>checked='checked'</c:if>/>Coloco quase sempre mesmo sem provar
							</td>
						</tr>
						<tr>
							<td class="block" colspan="2">
								<br  />
								<strong>Com que frequ&ecirc;ncia a Sra. normalmente come</strong> 
								<br  />
								<br  />
							</td>
						</tr>
						<tr>
							<td class="block" >
								1. Bife ou carne cozida n&atilde;o incluindo carne mo&iacute;da  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.bifeCarneQuantidade' value='${historicoAlimentar.bifeCarneQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.bifeCarneTempo' <c:if test='${historicoAlimentar.bifeCarneTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.bifeCarneTempo' <c:if test='${historicoAlimentar.bifeCarneTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.bifeCarneTempo' <c:if test='${historicoAlimentar.bifeCarneTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.bifeCarneTempo' <c:if test='${historicoAlimentar.bifeCarneTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								2 . Hamb&uacute;rguer ou carne mo&iacute;da. N&atilde;o considerar hamb&uacute;rguer de frango
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.hamburguerQuantidade' value='${historicoAlimentar.hamburguerQuantidade}' maxlength="3" class='pequeno' onkeyup="this.value=doDecimal(this.value);"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.hamburguerTempo' <c:if test='${historicoAlimentar.hamburguerTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.hamburguerTempo' <c:if test='${historicoAlimentar.hamburguerTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.hamburguerTempo' <c:if test='${historicoAlimentar.hamburguerTempo == "Mes"}'>checked='checked'</c:if>/> Mês <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.hamburguerTempo' <c:if test='${historicoAlimentar.hamburguerTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								3. Lingui&ccedil;a ou salsicha. N&atilde;o considerar de frango ou  peru
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.linguicaSalsichaQuantidade' value='${historicoAlimentar.linguicaSalsichaQuantidade}'class='pequeno' maxlength="3" onkeyup="this.value=doDecimal(this.value);"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.linguicaSalsichaTempo' <c:if test='${historicoAlimentar.linguicaSalsichaTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.linguicaSalsichaTempo' <c:if test='${historicoAlimentar.linguicaSalsichaTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.linguicaSalsichaTempo' <c:if test='${historicoAlimentar.linguicaSalsichaTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.linguicaSalsichaTempo' <c:if test='${historicoAlimentar.linguicaSalsichaTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								4. Carne de porco n&atilde;o incluindo lingui&ccedil;a e salsichas  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.porcoQuantidade' value='${historicoAlimentar.porcoQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.porcoTempo' <c:if test='${historicoAlimentar.porcoTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.porcoTempo' <c:if test='${historicoAlimentar.porcoTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.porcoTempo' <c:if test='${historicoAlimentar.porcoTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.porcoTempo' <c:if test='${historicoAlimentar.porcoTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								5. Queijo ou requeij&atilde;o  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.queijoQuantidade' value='${historicoAlimentar.queijoQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.queijoTempo' <c:if test='${historicoAlimentar.queijoTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.queijoTempo' <c:if test='${historicoAlimentar.queijoTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.queijoTempo' <c:if test='${historicoAlimentar.queijoTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.queijoTempo' <c:if test='${historicoAlimentar.queijoTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								6. Margarina ou manteiga  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.margarinaQuantidade' value='${historicoAlimentar.margarinaQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.margarinaTempo' <c:if test='${historicoAlimentar.margarinaTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.margarinaTempo' <c:if test='${historicoAlimentar.margarinaTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.margarinaTempo' <c:if test='${historicoAlimentar.margarinaTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.margarinaTempo' <c:if test='${historicoAlimentar.margarinaTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								7. Biscoito  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.biscoitoQuantidade' value='${historicoAlimentar.biscoitoQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.biscoitoTempo' <c:if test='${historicoAlimentar.biscoitoTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.biscoitoTempo' <c:if test='${historicoAlimentar.biscoitoTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.biscoitoTempo' <c:if test='${historicoAlimentar.biscoitoTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.biscoitoTempo' <c:if test='${historicoAlimentar.biscoitoTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								8. Bolos e tortas  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.boloQuantidade' value='${historicoAlimentar.boloQuantidade}'  class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.boloTempo' <c:if test='${historicoAlimentar.boloTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.boloTempo' <c:if test='${historicoAlimentar.boloTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.boloTempo' <c:if test='${historicoAlimentar.boloTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.boloTempo' <c:if test='${historicoAlimentar.boloTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								9. Batata frita ou chip  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.batataFritaQuantidade' value='${historicoAlimentar.batataFritaQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.batataFritaTempo' <c:if test='${historicoAlimentar.batataFritaTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.batataFritaTempo' <c:if test='${historicoAlimentar.batataFritaTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.batataFritaTempo' <c:if test='${historicoAlimentar.batataFritaTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.batataFritaTempo' <c:if test='${historicoAlimentar.batataFritaTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								10. Carnes ou peixes conservados no sal como bacalhau, carne seca, p&eacute; de porco, etc  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.carnesConservadosSalQuantidade' value='${historicoAlimentar.carnesConservadosSalQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.carnesConservadosSalTempo' <c:if test='${historicoAlimentar.carnesConservadosSalTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.carnesConservadosSalTempo' <c:if test='${historicoAlimentar.carnesConservadosSalTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.carnesConservadosSalTempo' <c:if test='${historicoAlimentar.carnesConservadosSalTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.carnesConservadosSalTempo' <c:if test='${historicoAlimentar.carnesConservadosSalTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								11. Alimentos enlatados ou em conserva como milho, ervilha, palmito, azeitona, salsicha, extrato ou massa de tomate, etc
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.enlatadosQuantidade' value='${historicoAlimentar.enlatadosQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.enlatadosTempo' <c:if test='${historicoAlimentar.enlatadosTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.enlatadosTempo' <c:if test='${historicoAlimentar.enlatadosTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.enlatadosTempo' <c:if test='${historicoAlimentar.enlatadosTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.enlatadosTempo' <c:if test='${historicoAlimentar.enlatadosTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								12. Frios, tais como presunto, mortadela, salame, presuntada, etc.
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.friosQuantidade' value='${historicoAlimentar.friosQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.friosTempo' <c:if test='${historicoAlimentar.friosTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.friosTempo' <c:if test='${historicoAlimentar.friosTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.friosTempo' <c:if test='${historicoAlimentar.friosTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.friosTempo' <c:if test='${historicoAlimentar.friosTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								13. Alimentos preparados na brasa, tipo churrasco
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.preparadosNaBrasaQuantidade' value="${historicoAlimentar.preparadosNaBrasaQuantidade}" class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.preparadosNaBrasaTempo' <c:if test='${historicoAlimentar.preparadosNaBrasaTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.preparadosNaBrasaTempo' <c:if test='${historicoAlimentar.preparadosNaBrasaTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.preparadosNaBrasaTempo' <c:if test='${historicoAlimentar.preparadosNaBrasaTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.preparadosNaBrasaTempo' <c:if test='${historicoAlimentar.preparadosNaBrasaTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
							<tr>
							<td class="block" >
								14. Leite, incluindo achocolatados, mingaus e vitaminas preparadas com leite  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.leiteQuantidade' value='${historicoAlimentar.leiteQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.leiteTempo' <c:if test='${historicoAlimentar.leiteTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.leiteTempo' <c:if test='${historicoAlimentar.leiteTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.leiteTempo' <c:if test='${historicoAlimentar.leiteTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.leiteTempo' <c:if test='${historicoAlimentar.leiteTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" colspan="2">
								<br  />
								<strong>Com que frequ&ecirc;ncia a Sra. normalmente come</strong> 
								<br  />
								<br  />
							</td>
						</tr>
							<tr>
							<td class="block" >
								1. Frutas e sucos de frutas preparados a partir da fruta, polpa ou concentrado. Não considere os refrescos ou refrigerantes  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.frutasSucosQuantidade' value='${historicoAlimentar.frutasSucosQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.frutasSucosTempo' <c:if test='${historicoAlimentar.frutasSucosTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.frutasSucosTempo' <c:if test='${historicoAlimentar.frutasSucosTempo == "Semana"}'>checked='checked'</c:if> /> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.frutasSucosTempo' <c:if test='${historicoAlimentar.frutasSucosTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.frutasSucosTempo' <c:if test='${historicoAlimentar.frutasSucosTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								2 . Batata sem ser frita, batata-doce, batata-baroa, aipim, car&aacute; , inhame  
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.batataComumQuantidade' value='${historicoAlimentar.batataComumQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.batataComumTempo' <c:if test='${historicoAlimentar.batataComumTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.batataComumTempo' <c:if test='${historicoAlimentar.batataComumTempo == "Semana"}'>checked='checked'</c:if> /> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.batataComumTempo' <c:if test='${historicoAlimentar.batataComumTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.batataComumTempo' <c:if test='${historicoAlimentar.batataComumTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								3. Outros legumes sem incluir batata-ab&oacute;bora, abobrinha, beterraba, chuchu, cenoura, quiabo, vagem, etc.
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.legumesQuantidade' value='${historicoAlimentar.legumesQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.legumesTempo' <c:if test='${historicoAlimentar.legumesTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.legumesTempo' <c:if test='${historicoAlimentar.legumesTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.legumesTempo' <c:if test='${historicoAlimentar.legumesTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.legumesTempo' <c:if test='${historicoAlimentar.legumesTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								4. Hortali&ccedil;as - agri&atilde;o, alface, br&oacute;colis, chic&oacute;ria, couve, couve-flor, espinafre, repolho, etc
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.hortalicasQuantidade' value='${historicoAlimentar.hortalicasQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.hortalicasTempo' <c:if test='${historicoAlimentar.hortalicasTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.hortalicasTempo' <c:if test='${historicoAlimentar.hortalicasTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.hortalicasTempo' <c:if test='${historicoAlimentar.hortalicasTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.hortalicasTempo' <c:if test='${historicoAlimentar.hortalicasTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td class="block" >
								5. Feij&otilde;es preto, mulatinho, fradinho, roxo, etc., lentilha, ervilha seca ou gr&atilde;o de bico
							</td>
							<td class="block" align="justify">
								<div style="float: left;">
									<br />
									<input type="text" name='historicoAlimentar.feijaoQuantidade' value='${historicoAlimentar.feijaoQuantidade}' class='pequeno' onkeyup="this.value=doDecimal(this.value);" maxlength="3"/>Vezes por
								</div>
								<div style="float: left;">
									<input type="radio" value="Dia" name='historicoAlimentar.feijaoTempo' <c:if test='${historicoAlimentar.feijaoTempo == "Dia"}'>checked='checked'</c:if>/> Dia <br />
									<input type="radio" value="Semana" name='historicoAlimentar.feijaoTempo' <c:if test='${historicoAlimentar.feijaoTempo == "Semana"}'>checked='checked'</c:if>/> Semana <br />
									<input type="radio" value="Mes" name='historicoAlimentar.feijaoTempo' <c:if test='${historicoAlimentar.feijaoTempo == "Mes"}'>checked='checked'</c:if>/> M&ecirc;s <br />
									<input type="radio" value="Rara/Nunca" name='historicoAlimentar.feijaoTempo' <c:if test='${historicoAlimentar.feijaoTempo == "Rara/Nunca"}'>checked='checked'</c:if>/> Rara/Nunca
								</div>
							</td>
						</tr>
						<tr>
							<td><br/></td>
							<td></td>
						</tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>

<!-- SCRIPTS PRA A PARTE DE EDITAR/ATUALIZAR -->
<script type="text/javascript">
	<c:if test="${historicoAlimentar.consomeBebidasAlcoolicas == 'sim'}">consomeBebidas("sim",document.getElementById("historicoAlimentar.consomeBebidasAlcoolicas.sim").parentNode.parentNode.rowIndex);</c:if>
	<c:if test="${historicoAlimentar.consomeBrotoSamambaia == 'sim'}">consomeBrotoSamambaia("sim",document.getElementById("historicoAlimentar.consomeBrotoSamambaia.sim").parentNode.parentNode.rowIndex);</c:if>
	<c:if test='${historicoAlimentar.usaFogaoLenha == "sim"}'>fogao("sim",document.getElementById("historicoAlimentar.usaFogaoLenha.sim").parentNode.parentNode.rowIndex);</c:if>
	<c:if test='${historicoAlimentar.consomeFrango == "sim"}'>frango("sim",document.getElementById("historicoAlimentar.consomeFrango.sim").parentNode.parentNode.rowIndex);</c:if>
	<c:if test='${historicoAlimentar.consomeCarneVermelha == "sim"}'>carneVermelha("sim", document.getElementById("historicoAlimentar.consomeCarneVermelha.sim").parentNode.parentNode.rowIndex);</c:if>
	<c:if test='${historicoAlimentar.consomePeixe == \"Y\"}'>peixe("Y",document.getElementById("historicoAlimentar.consomePeixe.y").parentNode.parentNode.rowIndex);</c:if>
</script>
<!--<fim de> SCRIPTS PRA A PARTE DE EDITAR/ATUALIZAR -->

	</body>
</html>