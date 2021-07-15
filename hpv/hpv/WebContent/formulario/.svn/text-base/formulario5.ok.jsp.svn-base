<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	   <%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/formulario5.js"></script>
		<title>HPV-LIKA</title>
		<script type="text/javascript">
			function doDecimal(numero, checkboxID){
				if(numero == "ns/nr"){
					document.getElementById(checkboxID).checked = false;
				}
				
				var tamanho = numero.length;
				var retorno = "";
				var achou = 0;
				var i = 0;
		
				if(tamanho > 0){
					if(numero.charAt(0) == "." ||numero.charAt(0) == "," ){
						retorno += "0.";
						numero = numero.substr(1,tamanho);
					}
				}
				
				for(i = 0; i < tamanho; i++){
					if(numero.charAt(i) >= 0 && numero.charAt(i) <= 9 ){
						retorno += numero.charAt(i); 
					}
					else if((numero.charAt(i) == "." || numero.charAt(i) == ",") &&  achou == 0){
						retorno += ".";
						achou = 1;
					}
					else{
						return retorno;
					}
				}
				return retorno;
			}


		</script>
  	</head>
	<body>
	    <div id="container">
			<div id="top"><%@include file="../top.jsp" %></div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>

			<div class="clear:both;"></div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2> 5. HISTORICO CLÍNICO</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
		<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 5 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br />
				
				<br>
				<form action="formulario.addFormulario5.logic" method = "post">
					<input type="hidden" name="historicoClinico.formulario.id" value="${formulario.id}" />
					<input type="hidden" name="historicoClinico.id" value="${historicoClinico.id}"/>
			<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />		
					<table class="block" id="formulario5">
						<tr>
							<td class="block">Qual a sua altura? (m)</td>
							<td class="block" title="exemplo: 0.00 ">
								<input type="text" id="altura2" name="historicoClinico.altura" value="${historicoClinico.altura}" style="width:30px" onkeyup="this.value=doDecimal(this.value,'checkboxAltura');" maxlength='5' />
								<input type="checkbox" id="checkboxAltura" value="ns/nr" onclick="altura(this.checked);" name="alturaNSNR" <c:if test="${historicoClinico.altura == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
								<script type="text/javascript">
									function altura(checked, value){
										if(checked){
											document.getElementById("altura2").value = "ns/nr";
											document.getElementById("altura2").disabled = true;
										}else{
											document.getElementById("altura2").value = "";
											document.getElementById("altura2").disabled = false;
										}
									}
								</script>
							</td>
						</tr>
						<tr>
							<td class="block">Qual o seu peso? (kg)</td>
							<td class="block" title="exemplo: 57.75 ">
								<input id="peso2" name="historicoClinico.peso" value="${historicoClinico.peso}" style="width:30px" onkeyup="this.value=doDecimal(this.value,'checkboxPeso');" maxlength='5' /> 
								<input type="checkbox" id="checkboxPeso" value="sim" onclick="peso(this.checked);" name="pesoNSNR" <c:if test="${historicoClinico.peso == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
								<script type="text/javascript">
								function peso(v){
									if(v){
										document.getElementById("peso2").value = "ns/nr";
										//document.getElementById("peso2").disabled = true;
									}else{
										document.getElementById("peso2").value = "";
										//document.getElementById("peso2").disabled = false;
									}
								}
								</script>
							</td>
						</tr>
						<tr>
							<td class="block">Com que frequ&ecirc;ncia vai ao ginecologista?</td>
							<td class="block">
								<select name="historicoClinico.frequenciaGinecologista" title="selecione a frequência que a(o) entrevistada(o) vai ao ginecologista (andrologista)">
									<option value='' <c:if test="${historicoClinico.frequenciaGinecologista == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="Mensal" <c:if test="${historicoClinico.frequenciaGinecologista == 'Mensal'}">selected="selected"</c:if>>Mensal</option>
									<option value="Trimestral" <c:if test="${historicoClinico.frequenciaGinecologista == 'Trimestral'}">selected="selected"</c:if>>Trimestral</option>
									<option value="Semestral" <c:if test="${historicoClinico.frequenciaGinecologista == 'Semestral'}">selected="selected"</c:if>>Semestral</option>
									<option value="Anual" <c:if test="${historicoClinico.frequenciaGinecologista == 'Anual'}">selected="selected"</c:if>>Anual</option>
									<option value="Nunca" <c:if test="${historicoClinico.frequenciaGinecologista == 'Nunca'}">selected="selected"</c:if>>Nunca</option>
									<option value="NS/NR" <c:if test="${historicoClinico.frequenciaGinecologista == 'NS/NR'}">selected="selected"</c:if>>NS/NR</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">Quando fez o &uacute;ltimo exame preventivo?</td>
							<td class="block">
								<select name="historicoClinico.ultimoPreventivo">
									<option value='' <c:if test="${historicoClinico.ultimoPreventivo == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="Menos de 1 ano" <c:if test="${historicoClinico.ultimoPreventivo == 'Menos de 1 ano'}">selected="selected"</c:if>>Menos de 1 ano</option>
									<option value="1 ano" <c:if test="${historicoClinico.ultimoPreventivo == ''}">selected="selected"</c:if>>1 ano</option>
									<option value="Mais de 1 ano" <c:if test="${historicoClinico.ultimoPreventivo == 'Mais de 1 ano'}">selected="selected"</c:if>>Mais de 1 ano</option>
									<option value="Indeterminado (NS)" <c:if test="${historicoClinico.ultimoPreventivo == 'Indeterminado (NS)'}">selected="selected"</c:if>>Indeterminado (NS)</option>
									<option value="Nunca" <c:if test="${historicoClinico.ultimoPreventivo == 'Nunca'}">selected="selected"</c:if>>Nunca</option>
								</select>
							</td>
						</tr>
						<tr title="Em caso de ter feito o exame de papanicolau, informar qual foi o resultado do exame...">
							<td class="block">A Sra j&aacute; fez exame de Papanicolau?</td>
							<td class="block">
								<select name="historicoClinico.jaFezPapaNicolau">
									<option value='' <c:if test="${historicoClinico.jaFezPapaNicolau == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="sim" <c:if test="${historicoClinico.jaFezPapaNicolau == 'sim'}">selected="selected"</c:if>>Sim</option>
									<option value="nao" <c:if test="${historicoClinico.jaFezPapaNicolau == 'nao'}">selected="selected"</c:if>>N&atilde;o</option>
								    <option value="NS/NR" <c:if test="${historicoClinico.jaFezPapaNicolau == 'NS/NR'}">selected="selected"</c:if>>NS/NR</option>
								</select>
								<br>
								Resultado do exame 
								<!-- <input type="text" maxlength="50" name="historicoClinico.resultadoExamePapaNicolau" value='${historicoClinico.resultadoExamePapaNicolau}' style="width: 100%;"> -->
								<select name="historicoClinico.resultadoExamePapaNicolau" >
									<option value='' >selecione...</option>
									<option value="negativo" <c:if test="${historicoClinico.resultadoExamePapaNicolau == 'negativo'}">selected="selected"</c:if>>negativo</option>
									<option value="positivo" <c:if test="${historicoClinico.resultadoExamePapaNicolau == 'positivo'}">selected="selected"</c:if>>positivo</option>
									<option value="ns/nr" <c:if test="${historicoClinico.resultadoExamePapaNicolau == 'ns/nr'}">selected="selected"</c:if>>ns/nr</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="block">Qual (is) o seu m&eacute;todo contraceptivo atual?</td>
							<td class="block" title="selecione um ou mais métodos que a(o) entrevistada(o) utiliza como método contraceptivo atualmente">
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualAdesivo" <c:if test="${historicoClinico.contraceptivoAtualAdesivo == 'Y'}">checked="checked"</c:if>/>Adesivo<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualAnelVaginal" <c:if test="${historicoClinico.contraceptivoAtualAnelVaginal == 'Y'}">checked="checked"</c:if>/>Anel vaginal<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualCamisinhaFeminina" <c:if test="${historicoClinico.contraceptivoAtualCamisinhaFeminina == 'Y'}">checked="checked"</c:if>/>Camisinha feminina<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualCoitoInterrompido" <c:if test="${historicoClinico.contraceptivoAtualCoitoInterrompido == 'Y'}">checked="checked"</c:if>/>Coito interrompido<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualDiafragma" <c:if test="${historicoClinico.contraceptivoAtualDiafragma == 'Y'}">checked="checked"</c:if>/>Diafragma<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualDIU" <c:if test="${historicoClinico.contraceptivoAtualDIU == 'Y'}">checked="checked"</c:if>/>DIU<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualEspermaticida" <c:if test="${historicoClinico.contraceptivoAtualEspermaticida == 'Y'}">checked="checked"</c:if>/>Espermaticida<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualImplante" <c:if test="${historicoClinico.contraceptivoAtualImplante == 'Y'}">checked="checked"</c:if>/>Implante<br>
									<input type="checkbox" value='Y' name="historicoClinico.contraceptivoAtualInjecao" <c:if test="${historicoClinico.contraceptivoAtualInjecao == 'Y'}">checked="checked"</c:if>/>Inje&ccedil;&atilde;o<br>
									<input type="checkbox" value='Y' name="historicoClinico.contraceptivoAtualLigaduraTrompa" <c:if test="${historicoClinico.contraceptivoAtualLigaduraTrompa == 'Y'}">checked="checked"</c:if>/>Ligadura de Trompa<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualMetodoMuco" <c:if test="${historicoClinico.contraceptivoAtualMetodoMuco == 'Y'}">checked="checked"</c:if>/>M&eacute;todo do muco<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualNaoUsa" <c:if test="${historicoClinico.contraceptivoAtualNaoUsa == 'Y'}">checked="checked"</c:if>/>N&atilde;o usa<br>	
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualOutro" <c:if test="${historicoClinico.contraceptivoAtualOutro == 'Y'}">checked="checked"</c:if>/>Outro<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualPilulaDiaSeguinte" <c:if test="${historicoClinico.contraceptivoAtualPilulaDiaSeguinte == 'Y'}">checked="checked"</c:if>/>P&iacute;lula do dia seguinte<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualPilula" <c:if test="${historicoClinico.contraceptivoAtualPilula == 'Y'}">checked="checked"</c:if>/>Pílula<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualPreservativoMasculino" <c:if test="${historicoClinico.contraceptivoAtualPreservativoMasculino == 'Y'}">checked="checked"</c:if>/>Preservativo (camisinha masculina)<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualTabelinha" <c:if test="${historicoClinico.contraceptivoAtualTabelinha == 'Y'}">checked="checked"</c:if>/>Tabelinha<br>
									<input type="checkbox" value="Y" name="historicoClinico.contraceptivoAtualVasectomiaParceiro" <c:if test="${historicoClinico.contraceptivoAtualVasectomiaParceiro == 'Y'}">checked="checked"</c:if>/>Vasectomia do parceiro
							</td>
						</tr>
						<tr>
							<td class="block">Quanto tempo de uso?</td>
							<td class="block">
								<select name="historicoClinico.quantoTempoUsaContraceptivo" >
									<option value='' <c:if test="${historicoClinico.quantoTempoUsaContraceptivo == ''}">selected="selected"</c:if>>selecione...</option>
									<option value='menos de 1 ano' <c:if test="${historicoClinico.quantoTempoUsaContraceptivo == 'menos de 1 ano'}">selected="selected"</c:if>>menos de 1 ano</option>
									<option value="mais de 1 ano" <c:if test="${historicoClinico.quantoTempoUsaContraceptivo == 'mais de 1 ano'}">selected="selected"</c:if>>mais de 1 ano</option>
								    <option value="NS/NR" <c:if test="${historicoClinico.quantoTempoUsaContraceptivo == 'NS/NR'}">selected="selected"</c:if>>NS/NR</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">A senhora está na menopausa?</td>
							<td class="block">
								<select name="historicoClinico.estaNaMenoPausa" >
									<option value='' <c:if test="${historicoClinico.estaNaMenoPausa == ''}">selected="selected"</c:if>>selecione...</option>
									<option value='sim' <c:if test="${historicoClinico.estaNaMenoPausa == 'sim'}">selected="selected"</c:if>>sim</option>
									<option value="não" <c:if test="${historicoClinico.estaNaMenoPausa == 'não'}">selected="selected"</c:if>>não</option>
								    <option value="NS/NR" <c:if test="${historicoClinico.estaNaMenoPausa == 'NS/NR'}">selected="selected"</c:if>>NS/NR</option>
								</select>
							</td>
						</tr>						
						<tr>
							<td class="block">A Sra. usa medica&ccedil;&atilde;o para menopausa?</td>
							<td class="block">
								<input type="hidden"  name="historicoClinico.medicacaoMenorPausa.id" value="${historicoClinico.medicacaoMenorPausa.id}" />
								<input type="radio" id="menoPausaSim" name="historicoClinico.usaMedicacaoMenorPausa" value="sim" onclick="menopausa('sim',this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoMenorPausa == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.usaMedicacaoMenorPausa" value="nao" onclick="menopausa('nao',this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoMenorPausa == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.usaMedicacaoMenorPausa" value="ns/nr" onclick="menopausa('ns/nr',this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoMenorPausa == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
								
							</td>
							<script>
								var bool_menopausa = false;
								function menopausa(valor,linha){
									if(valor =="sim" && bool_menopausa == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "Qual(is)?";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<input type='checkbox' value='Y' name='historicoClinico.medicacaoMenorPausa.hormonal' <c:if test='${historicoClinico.medicacaoMenorPausa.hormonal == \"Y\"}'>checked='checked'</c:if>/>Hormonal<br/>"+
														"<input type='checkbox' value='Y' name='historicoClinico.medicacaoMenorPausa.quimico' <c:if test='${historicoClinico.medicacaoMenorPausa.quimico == \"Y\"}'>checked='checked'</c:if>/>Qu&iacute;mico <br/>"+
														"<input type='checkbox' value='Y' name='historicoClinico.medicacaoMenorPausa.ns_nr' <c:if test='${historicoClinico.medicacaoMenorPausa.ns_nr == \"Y\"}'>checked='checked'</c:if>/>NS/NR <br/>";
										colB.id="block";
										bool_menopausa = true;
									}
									else if ((valor == "nao" || valor == "ns/nr") && bool_menopausa == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("Hormonal") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											bool_menopausa = false;
										}
									}
								}
							</script>
						</tr>
						<tr>
							<td class="block">Algum mal estar?</td>
							<td class="block" style="width:280px;">
								<input type="hidden" name='historicoClinico.malEstar.id' value='${historicoClinico.malEstar.id}' />
								<input type="radio" name="historicoClinico.algumMalEstar" value="sim" id="historicoClinico.algumMalEstar.sim" onclick="malestar(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.algumMalEstar == 'sim'}">checked="checked"</c:if> onselect="malestar(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.algumMalEstar" value="nao" onclick="malestar(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.algumMalEstar == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.algumMalEstar" value="ns/nr" onclick="malestar(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.algumMalEstar == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
							<script>
							var bool_malestar = false;

							function malestar(valor,linha){
								if(valor =="sim" && bool_malestar == false){
									var row = document.getElementById("formulario5").insertRow(linha+1);
									var colA = row.insertCell(0);
									colA.innerHTML = "Qual(is)?";
									colA.id="block";
									var colB = row.insertCell(1);
									colB.innerHTML ="<input type='checkbox' value='Y' name='historicoClinico.malEstar.tontura' <c:if test='${historicoClinico.malEstar.tontura == \"Y\"}'>checked='checked'</c:if> />Tontura <br/>"+
														"<input type='checkbox' value='Y' name='historicoClinico.malEstar.fraqueza' <c:if test='${historicoClinico.malEstar.fraqueza == \"Y\"}'>checked='checked'</c:if>/>Fraqueza <br/>"+
														"<input type='checkbox' value='Y' name='historicoClinico.malEstar.nauseas' <c:if test='${historicoClinico.malEstar.nauseas == \"Y\"}'>checked='checked'</c:if>/>N&aacute;useas <br/>"+
														"<input type='checkbox' value='Y' name='historicoClinico.malEstar.sonolencia' <c:if test='${historicoClinico.malEstar.sonolencia == \"Y\"}'>checked='checked'</c:if>/>Sonol&ecirc;ncia <br/>"+
														"<input type='checkbox' value='Y' <c:if test='${historicoClinico.malEstar.coceira != null}'>checked='checked'</c:if> />Coceira [onde?] <input type='text' name='historicoClinico.malEstar.coceira'  maxlength='50' value='${historicoClinico.malEstar.coceira}'/><br/>"+
														"<input type='checkbox' value='Y' <c:if test='${historicoClinico.malEstar.dor != null}'>checked='checked'</c:if>/>Dor [onde?] <input type='text' name='historicoClinico.malEstar.dor' maxlength='50' value='${historicoClinico.malEstar.dor}'/>"+
														"<br>Outros <input type='text' name='historicoClinico.malEstar.outros' value='${historicoClinico.malEstar.outros}' maxlength='50'/>";
									colB.id="block";
									bool_malestar = true;
								}else if ((valor == "nao" || valor == "ns/nr") /*&& bool_malestar == true*/){
									var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
									if(str.indexOf("tontura") >= 0 ){/*então existia antes o campo na tabela*/
										var tbl = document.getElementById('formulario5');
										tbl.deleteRow(linha+1);
										bool_malestar = false;
									}
								}
							}
							</script>
						</tr>
						<!-- PRESSAO ALTA -->
						<tr>
							<td class="block">Algum médico, enfermeiro ou agente comunitário de saúde já lhe disse que a Sra. tem pressão alta?</td>
							<td class="block"> 
								
								<input type="radio" name="historicoClinico.temPressaoAlta" id="historicoClinico.temPressaoAlta.sim" value="sim" onclick="pressaoAlta(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.temPressaoAlta == 'sim'}">checked="checked"</c:if> onselect="pressaoAlta(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.temPressaoAlta" value="nao" onclick="pressaoAlta(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.temPressaoAlta == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.temPressaoAlta" value="ns/nr" onclick="pressaoAlta(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.algumMalEstar == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
							<script type="text/javascript">
								var bool_pressao = false;
								function pressaoAlta(valor,linha){
									if(valor =="sim" && bool_pressao == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										//itens removidos na versao 3.2 do formulario novembro/2009
										/*var colA = row.insertCell(0);
										colA.innerHTML = "Depois que disseram que a Sra. tem press&atilde;o alta, algum m&eacute;dico lhe receitou rem&eacute;dio para a press&atilde;o?";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<select name='historicoClinico.medicoJaReceitouMedicacaoPressao'>"+
															"<option value='sim' <c:if test='${historicoClinico.medicoJaReceitouMedicacaoPressao == \"sim\"}'>selected='selected'</c:if>>sim</option>"+
															"<option value='nao' <c:if test='${historicoClinico.medicoJaReceitouMedicacaoPressao == \"nao\"}'>selected='selected'</c:if>>n&atilde;o</option>"+
														"</select>";
										colB.id="block";
										*/
										//var row = document.getElementById("formulario5").insertRow(linha+1);
										var col1A = row.insertCell(0);
										col1A.innerHTML = "Atualmente, a Sra. est&aacute; usando o rem&eacute;dio para baixar sua press&atilde;o?";
										col1A.id="block";
										var col1B = row.insertCell(1);
										col1B.innerHTML ="<select name='historicoClinico.estaUsandoRemedioPraBaixarPressao'>"+
															"<option value='NS/NR' <c:if test='${historicoClinico.estaUsandoRemedioPraBaixarPressao == \"NS/NR\"}'>selected='selected'</c:if>>NS/NR</option>"+
															"<option value='sim' <c:if test='${historicoClinico.estaUsandoRemedioPraBaixarPressao == \"sim\"}'>selected='selected'</c:if>>sim</option>"+
															"<option value='nao' <c:if test='${historicoClinico.estaUsandoRemedioPraBaixarPressao == \"nao\"}'>selected='selected'</c:if>>n&atilde;o</option>"+
														"</select>";
										col1B.id="block";
										
										bool_pressao = true;
									}
									else if ((valor == "nao" || valor == "ns/nr") && bool_pressao == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("historicoClinico.estaUsandoRemedioPraBaixarPressao") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											//tbl.deleteRow(linha+1);
											bool_pressao = false;
										}
									}
								}
							</script>
						</tr>
						<!-- COLESTEROL -->
						<tr>
							<td class="block">Alguma vez a Sra. fez exame de sangue para medir o seu colesterol?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.jaFezExameSangueColesterol" id="historicoClinico.jaFezExameSangueColesterol.sim" value="sim" onclick="colesterol(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.jaFezExameSangueColesterol == 'sim'}">checked="checked"</c:if> onselect="colesterol(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.jaFezExameSangueColesterol" value="nao" onclick="colesterol(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.jaFezExameSangueColesterol == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.jaFezExameSangueColesterol" value="ns/nr" onclick="colesterol(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.jaFezExameSangueColesterol == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
							<script type="text/javascript">
								var bool_colesterol = false;
	
								function colesterol(valor,linha){
									if(valor =="sim" && bool_colesterol == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "Quando foi a &uacute;ltima vez que a Sra. fez exame para medir o seu colesterol?";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<select name='historicoClinico.ultimaVezExameColesterol'>"+
															"<option value='' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
															"<option value='Há até 6 meses' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"Há até 6 meses\"}'>selected='selected'</c:if>>Há até 6 meses</option>"+
															"<option value='Há mais de 6 meses até 1 ano' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"Há mais de 6 meses até 1 ano\"}'>selected='selected'</c:if>>Há mais de 6 meses até 1 ano</option>"+
															"<option value='Há mais de 1 ano até 2 anos' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"Há mais de 1 ano até 2 anos\"}'>selected='selected'</c:if>>Há mais de 1 ano até 2 anos</option>"+
															"<option value='Há mais de 2 anos até 5 anos' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"Há mais de 2 anos até 5 anos\"}'>selected='selected'</c:if>>Há mais de 2 anos até 5 anos</option>"+
															"<option value='Há mais de 5 anos' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"Há mais de 5 anos\"}'>selected='selected'</c:if>>Há mais de 5 anos</option>"+
															"<option value='ns/nr' <c:if test='${historicoClinico.ultimaVezExameColesterol == \"ns/nr\"}'>selected='selected'</c:if>>NS/NR</option>"+
														"</select>";
										colB.id="block";
										bool_colesterol = true;
									}
									else if ((valor == "nao" || valor == "ns/nr") && bool_colesterol == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("6 meses") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											bool_colesterol = false;
										}
									}
								}
							</script>
						</tr>
						<tr>
							<td class="block">Algum m&eacute;dico, enfermeiro ou nutricionista j&aacute; lhe disse que a Sra. tem colesterol alto?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.alguemDisseColesterolAlto" value="sim" <c:if test="${historicoClinico.alguemDisseColesterolAlto == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.alguemDisseColesterolAlto" value="nao" <c:if test="${historicoClinico.alguemDisseColesterolAlto == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.alguemDisseColesterolAlto" value="ns/nr" <c:if test="${historicoClinico.alguemDisseColesterolAlto == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<!-- DIABETES -->
						<tr>
							<td class="block">A Sra. j&aacute; fez exame para medir o a&ccedil;&uacute;car no sangue ou diagnosticar diabetes?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.jaFezExameMedirAcucarSangue" value="sim" <c:if test="${historicoClinico.jaFezExameMedirAcucarSangue == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.jaFezExameMedirAcucarSangue" value="nao" <c:if test="${historicoClinico.jaFezExameMedirAcucarSangue == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.jaFezExameMedirAcucarSangue" value="ns/nr" <c:if test="${historicoClinico.jaFezExameMedirAcucarSangue == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<tr>
							<td class="block">Algum m&eacute;dico j&aacute; lhe disse que a Sra. tem diabetes?</td>
							<td class="block">
								<input type="hidden" name="historicoClinico.diabetes.id" value="${historicoClinico.diabetes.id}"/>
								<input type="radio" name="historicoClinico.alguemDisseDiabetes" id="historicoClinico.alguemDisseDiabetes.sim" value="sim" onclick="diabetes(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.alguemDisseDiabetes == 'sim'}">checked="checked"</c:if> onselect="diabetes(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.alguemDisseDiabetes" value="nao" onclick="diabetes(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.alguemDisseDiabetes == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.alguemDisseDiabetes" value="ns/nr" onclick="diabetes(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.alguemDisseDiabetes == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
							<script type="text/javascript">
							var bool_diabetes = false;

							function diabetes(valor,linha){
								if(valor =="sim" && bool_diabetes == false){
									var row = document.getElementById("formulario5").insertRow(linha+1);
									var colA = row.insertCell(0);
									colA.innerHTML = "Depois que disseram que a Sra. é diabética, algum médico, enfermeiro ou nutricionista receitou uma dieta para diabetes (pouco açúcar, pouco macarrão, etc)?";
									colA.id="block";
									var colB = row.insertCell(1);
									colB.innerHTML ="<input type='radio' name='historicoClinico.diabetes.medicoReceitouDietaDiabetes' value='sim' <c:if test='${historicoClinico.diabetes.medicoReceitouDietaDiabetes == \"sim\"}'>checked='checked'</c:if>/>Sim"+
													"<input type='radio' name='historicoClinico.diabetes.medicoReceitouDietaDiabetes' value='nao' <c:if test='${historicoClinico.diabetes.medicoReceitouDietaDiabetes == \"nao\"}'>checked='checked'</c:if>/>N&atilde;o <br/>";
									colB.id="block";
									
									
									var row = document.getElementById("formulario5").insertRow(linha+2);
									var col2A = row.insertCell(0);
									col2A.innerHTML = "A Sra. est&aacute; seguindo essa dieta?";
									col2A.id="block";
									var col2B = row.insertCell(1);
									col2B.innerHTML ="<input type='radio' name='historicoClinico.diabetes.estaSeguindoDietaDiabetes' value='sim' <c:if test='${historicoClinico.diabetes.estaSeguindoDietaDiabetes == \"sim\"}'>checked='checked'</c:if>/>Sim"+
													 "<input type='radio' name='historicoClinico.diabetes.estaSeguindoDietaDiabetes' value='nao' <c:if test='${historicoClinico.diabetes.estaSeguindoDietaDiabetes == \"nao\"}'>checked='checked'</c:if>/>N&atilde;o <br/>";
									col2B.id="block";
									
									
									var row = document.getElementById("formulario5").insertRow(linha+3);
									var col3A = row.insertCell(0);
									col3A.innerHTML = "Depois que disseram que a Sra. &eacute; diab&eacute;tica, algum m&eacute;dico lhe receitou rem&eacute;dio para o seu diabetes?";
									col3A.id="block";
									var col3B = row.insertCell(1);
									col3B.innerHTML ="<input type='radio' name='historicoClinico.diabetes.medicoReceitouMedicamentoDiabetes' value='sim' <c:if test='${historicoClinico.diabetes.medicoReceitouMedicamentoDiabetes == \"sim\"}'>checked='checked'</c:if>/>Sim"+
													 "<input type='radio' name='historicoClinico.diabetes.medicoReceitouMedicamentoDiabetes' value='nao' <c:if test='${historicoClinico.diabetes.medicoReceitouMedicamentoDiabetes == \"nao\"}'>checked='checked'</c:if>/>N&atilde;o <br/>";
									col3B.id="block";
									
									
									var row = document.getElementById("formulario5").insertRow(linha+4);
									var col4A = row.insertCell(0);
									col4A.innerHTML = "Esse remédio é?";
									col4A.id="block";
									var col4B = row.insertCell(1);
									col4B.innerHTML ="<select name='historicoClinico.diabetes.remedioDiabetes'>"+
														"<option value='' <c:if test='${historicoClinico.diabetes.remedioDiabetes == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
														"<option value='Apenas comprimidos' <c:if test='${historicoClinico.diabetes.remedioDiabetes == \"Apenas comprimidos\"}'>selected='selected'</c:if>>Apenas comprimidos</option>"+
														"<option value='Insulina' <c:if test='${historicoClinico.diabetes.remedioDiabetes == \"Insulina\"}'>selected='selected'</c:if>>Insulina</option>"+
														"<option value='Ambos' <c:if test='${historicoClinico.diabetes.remedioDiabetes == \"Ambos\"}'>selected='selected'</c:if>>Ambos</option>"+
													"</select>";
									col4B.id="block";
									
									var row = document.getElementById("formulario5").insertRow(linha+5);
									var col5A = row.insertCell(0);
									col5A.innerHTML = "Atualmente, a Sra. est&aacute; tomando os rem&eacute;dios para diabetes?";
									col5A.id="block";
									var col5B = row.insertCell(1);
									col5B.innerHTML ="<input type='radio' name='historicoClinico.diabetes.estaTomandoRemedioDiabetes' value='sim' <c:if test='${historicoClinico.diabetes.estaTomandoRemedioDiabetes == \"sim\"}'>checked='checked'</c:if>/>Sim"+
												     "<input type='radio' name='historicoClinico.diabetes.estaTomandoRemedioDiabetes' value='false' <c:if test='${historicoClinico.diabetes.estaTomandoRemedioDiabetes == \"nao\"}'>checked='checked'</c:if>/>N&atilde;o <br/>";
									col5B.id="block";
									
									bool_diabetes = true;
								}
								else if ((valor == "nao" || valor == "ns/nr") && bool_diabetes == true){
									var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
									if(str.indexOf("enfermeiro ou nutricionista receitou uma dieta para diabetes") >= 0 ){/*então existia antes o campo na tabela*/
										var tbl = document.getElementById('formulario5');
										tbl.deleteRow(linha+1);
										tbl.deleteRow(linha+1);
										tbl.deleteRow(linha+1);
										tbl.deleteRow(linha+1);
										tbl.deleteRow(linha+1);
										bool_diabetes = false;
									}
								}
							}

							</script>
						</tr>

						<tr>
							<td class="block">Tem alguma outra doença crônica?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.temDoencaCronica" id="historicoClinico.temDoencaCronica.sim" value="sim" onclick="cronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.temDoencaCronica == 'sim'}">checked="checked"</c:if> onselect="cronica(this.value,this.parentNode.parentNode.rowIndex);" />Sim
								<input type="radio" name="historicoClinico.temDoencaCronica" value="nao" onclick="cronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.temDoencaCronica == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.temDoencaCronica" value="ns/nr" onclick="cronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.temDoencaCronica == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
								
							</td>
							<script type="text/javascript">
								var bool_cronica = false;
	
								function cronica(valor,linha){
									if(valor =="sim" && bool_cronica == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "Qual(is)?";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<input type='text' name='historicoClinico.doencaCronica' value='${historicoClinico.doencaCronica}' style='width:100%;' maxlength=60/>";
										colB.id="block";
										bool_cronica = true;
									}else if ((valor == "nao" || valor == "ns/nr") && bool_cronica == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("Qual") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											bool_cronica = false;
										}
									}
								}
							</script>	
						</tr>	
						<tr>
							<td class="block">Atualmente, a senhora faz uso de alguma medica&ccedil;&atilde;o ?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.usaMedicacaoUsoContinuo" id="historicoClinico.usaMedicacaoUsoContinuo.sim" value="sim" onclick="continuo(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoUsoContinuo == 'sim'}">checked="checked"</c:if> onselect="continuo(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.usaMedicacaoUsoContinuo" value="nao" onclick="continuo(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoUsoContinuo == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.usaMedicacaoUsoContinuo" value="ns/nr" onclick="continuo(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.usaMedicacaoUsoContinuo == 'ns/nr'}">checked="checked"</c:if> />NS/NR
								
							</td>
							<script type="text/javascript">
								var bool_continuo = false;
								function continuo(valor,linha){
									if(valor =="sim" && bool_continuo == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);

										var colA = row.insertCell(0);
										colA.innerHTML = "Quais?";
										colA.id="block";

										var colB = row.insertCell(1);
										
										colB.innerHTML = "<input type='checkbox' name='historicoClinico.usaMedicacaoImunossupressora' value='S' <c:if test='${historicoClinico.usaMedicacaoImunossupressora == \"S\"}'>checked='checked'</c:if> />Imunossupressora<br>";
										colB.innerHTML += "<input type='checkbox' name='historicoClinico.usaMedicacaoAntibiotico' value='S' <c:if test='${historicoClinico.usaMedicacaoAntibiotico == \"S\"}'>checked='checked'</c:if> />Antibi&oacute;tico<br>";
										colB.innerHTML += "<input type='checkbox' name='historicoClinico.usaMedicacaoCardiovascular' value='S' <c:if test='${historicoClinico.usaMedicacaoCardiovascular == \"S\"}'>checked='checked'</c:if> />Cardiovascular<br>";
										colB.innerHTML += "<input type='checkbox' name='historicoClinico.usaMedicacaoPsicotropico' value='S' <c:if test='${historicoClinico.usaMedicacaoPsicotropico == \"S\"}'>checked='checked'</c:if> />Psicotrópico<br>";
										colB.innerHTML += "<input type='checkbox' name='historicoClinico.usaMedicacaoNSNR' value='S' <c:if test='${historicoClinico.usaMedicacaoNSNR == \"S\"}'>checked='checked'</c:if> />NS/NR<br/>";
										
										colB.innerHTML += "<input type='hidden' name='historicoClinico.medicacoesUsoContinuo[0].id' value='${medicacoesUsoContinuo[0].id}'/> Outros <br> <hr>";
										colB.innerHTML +="<input type=hidden name='historicoClinico.medicacoesUsoContinuo[0].historicoClinico.id' value='${historicoClinico.id}'>";
										colB.innerHTML +="Quais? <input type='text' name='historicoClinico.medicacoesUsoContinuo[0].medicacao' value='${historicoClinico.medicacoesUsoContinuo[0].medicacao}' maxlength='50' width='200px'/><br/>";
										colB.innerHTML +="Quanto tempo? <input type='text' name='historicoClinico.medicacoesUsoContinuo[0].tempo' value='${historicoClinico.medicacoesUsoContinuo[0].tempo}'/>";
										colB.id="block";
										bool_continuo = true;
									}
									else if ((valor == "nao" || valor == "ns/nr") && bool_continuo == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										var tbl = document.getElementById('formulario5');
	
										if(str.indexOf("historicoClinico.usaMedicacaoImunossupressora") >= 0 ){/*então existia antes o campo na tabela*/
											/*while(str.indexOf("Quanto tempo") >= 0 ){
												tbl.deleteRow(linha+1);
												str = document.getElementById("formulario5").rows[linha+1].innerHTML;				
											}*/
											tbl.deleteRow(linha+1);
											tbl.deleteRow(linha+1);
											bool_continuo = false;
										}
									}
								}
								
								var posMedContinuo = 1;
								function addNovoMedicamentoUsoContinuo(linha){
									var row = document.getElementById("formulario5").insertRow(linha+1);
									var colA = row.insertCell(0);
									colA.innerHTML = "<input type=hidden name='historicoClinico.medicacoesUsoContinuo["+posMedContinuo+"].id' value='${historicoClinico.medicacoesUsoContinuo[0].id}'/>";
									colA.innerHTML = "<input type=hidden name='historicoClinico.medicacoesUsoContinuo["+posMedContinuo+"].historicoClinico.id' value='${historicoClinico.id}'/>";
									colA.innerHTML = "<img src='./images/Button-Delete-16x16.png' onclick='removeNovoMedicamentoUsoContinuo(this.parentNode.parentNode.rowIndex);'/>";
									colA.innerHTML += "Qual? <input type='text' name='historicoClinico.medicacoesUsoContinuo["+posMedContinuo+"].medicacao' value='${historicoClinico.medicacoesUsoContinuo[0].medicacao}' maxlength=50/>";
									colA.id="block";
									
									var colB = row.insertCell(1);
									colB.innerHTML ="Quanto tempo? <input type='text' name='historicoClinico.medicacoesUsoContinuo["+posMedContinuo+"].tempo' value='${historicoClinico.medicacoesUsoContinuo[0].tempo}'/>";
									colB.id="block";
									bool_continuo = true;	
								}

								function removeNovoMedicamentoUsoContinuo(linha){
									var tbl = document.getElementById('formulario5');
									tbl.deleteRow(linha);
									posMedContinuo = posMedContinuo-1;
								}
							</script>
						</tr>

						<tr>
							<td class="block">J&aacute; fez alguma cirurgia?</td>
							<td class="block">
								<input type="hidden" name="historicoClinico.cirurgias.id" value="${historicoClinico.cirurgias.id}" >
								<input type="radio" name="historicoClinico.jaFezCirurgia" value="sim" onclick="cirurgias(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.jaFezCirurgia == 'sim'}">checked="checked"</c:if> onselect="cirurgias(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.jaFezCirurgia" value="nao" onclick="cirurgias(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.jaFezCirurgia == 'nao'}">checked="checked"</c:if>/>N&atilde;o
							</td>
							<script type="text/javascript">
								var bool_cirurgias = false;
	
								function cirurgias(valor,linha){
									if(valor =="sim" && bool_cirurgias == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "Qua(is)?<br/> <input type='textfield' name='historicoClinico.cirurgias.cirurgias' value='${historicoClinico.cirurgias.cirurgias}' class='textfieldLongo'/> ";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="Quando?<br/>  <input type='textfield' name='historicoClinico.cirurgias.quando' value='${historicoClinico.cirurgias.quando}' class='textfieldLongo'/> ";
										colB.id="block";
										
										bool_cirurgias = true;
									}else if ((valor == "nao" || valor == "ns/nr") && bool_cirurgias == true){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("Qua(is)?") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											bool_cirurgias = false;
										}
									}
								}
							</script>
						</tr>						
						<tr>
							<td class="block">A Sra. já recebeu transfusão sanguínea?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.jaRecebeuTransfusaoSanguinea" value="sim" <c:if test="${historicoClinico.jaRecebeuTransfusaoSanguinea == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.jaRecebeuTransfusaoSanguinea" value="nao" <c:if test="${historicoClinico.jaRecebeuTransfusaoSanguinea == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.jaRecebeuTransfusaoSanguinea" value="ns/nr" <c:if test="${historicoClinico.jaRecebeuTransfusaoSanguinea == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<tr>
							<td class="block">A Sra. já recebeu algum transplante?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.jaRecebeuTransplante" value="sim" <c:if test="${historicoClinico.jaRecebeuTransplante == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.jaRecebeuTransplante" value="nao" <c:if test="${historicoClinico.jaRecebeuTransplante == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.jaRecebeuTransplante" value="ns/nr" <c:if test="${historicoClinico.jaRecebeuTransplante == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<tr>
							<td class="block">Algum m&eacute;dico j&aacute; disse que a Sra. tem ou j&aacute; teve câncer?</td>
							<td class="block">
								<input type="hidden" name="historicoClinico.cancer.id" value="${historicoClinico.cancer.id}">
								<input type="radio" name="historicoClinico.alguemDisseCancer" id="historicoClinico.alguemDisseCancer.sim" value="sim" onclick="cancer(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.alguemDisseCancer == 'sim'}">checked="checked"</c:if> onselect="cancer(this.value,this.parentNode.parentNode.rowIndex);"/>Sim
								<input type="radio" name="historicoClinico.alguemDisseCancer" value="nao" onclick="cancer(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoClinico.alguemDisseCancer == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								
							</td>
							<script type="text/javascript">
								var jaCriouCampoQualIdadeTinhaQuandoTeveCancer = false;
								
								function cancer(valor,linha){
									if(valor =="sim" && jaCriouCampoQualIdadeTinhaQuandoTeveCancer == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "O m&eacute;dico disse para a Sra. qual &eacute; o local deste c&acirc;ncer?";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<input type='radio' name='historicoClinico.cancer.medicoDisseLocalCancer' value='sim'  onclick='localCancer(this.value,this.parentNode.parentNode.rowIndex);' id='historicoClinico.cancer.medicoDisseLocalCancer.sim' <c:if test='${historicoClinico.cancer.medicoDisseLocalCancer == \"sim\"}'>checked='checked'</c:if>/>Sim"+
														"<input type='radio' name='historicoClinico.cancer.medicoDisseLocalCancer' value='nao' onclick='localCancer(this.value,this.parentNode.parentNode.rowIndex);' <c:if test='${historicoClinico.cancer.medicoDisseLocalCancer == \"nao\"}'>checked='checked'</c:if>/>N&atilde;o";
										colB.id="block";
										
										
										if(jaCriouCampoQualIdadeTinhaQuandoTeveCancer ==  false){
											var row = document.getElementById("formulario5").insertRow(linha+2);
											var col2A = row.insertCell(0);
											col2A.innerHTML = "Qual era a sua idade quando disseram que a Sra. tinha (este) c&acirc;ncer?";
											col2A.id="block";
											
											var col2B = row.insertCell(1);
											col2B.innerHTML ="<input type='textfield' name='historicoClinico.cancer.idadeQuandoDisseramCancer' value='${historicoClinico.cancer.idadeQuandoDisseramCancer}' class='textfieldLongo' onkeyup='this.value=doDecimal(this.value);' maxlength='3'/>";
											col2B.id="block";
											
											var row = document.getElementById("formulario5").insertRow(linha+3);
											var col3A = row.insertCell(0);
											col3A.innerHTML = "A Sra. iniciou tratamento para este c&acirc;ncer?";
											col3A.id="block";
											
											var col3B = row.insertCell(1);
											col3B.innerHTML ="<input type='radio' name='historicoClinico.cancer.iniciouTratamentoCancer' value='sim' <c:if test='${historicoClinico.cancer.iniciouTratamentoCancer == \"sim\"}'>checked='checked'</c:if>/> Sim "+
															 "<input type='radio' name='historicoClinico.cancer.iniciouTratamentoCancer' value='nao' <c:if test='${historicoClinico.cancer.iniciouTratamentoCancer == \"nao\"}'>checked='checked'</c:if>/> N&atilde;o ";
											col3B.id="block";
											
											
											var row = document.getElementById("formulario5").insertRow(linha+4);
											var col4A = row.insertCell(0);
											col4A.innerHTML = "A Sra. continua o tratamento para este c&acirc;ncer?";
											col4A.id="block";
											
											var col4B = row.insertCell(1);
											col4B.innerHTML ="<input type='radio' name='historicoClinico.cancer.continuaTratamentoCancer' value='sim' <c:if test='${historicoClinico.cancer.continuaTratamentoCancer == \"sim\"}'>checked='checked'</c:if>/> Sim "+
															 "<input type='radio' name='historicoClinico.cancer.continuaTratamentoCancer' value='nao' <c:if test='${historicoClinico.cancer.continuaTratamentoCancer == \"nao\"}'>checked='checked'</c:if>/> N&atilde;o ";
											col4B.id="block";
											
											var row = document.getElementById("formulario5").insertRow(linha+5);
											var col5A = row.insertCell(0);
											col5A.innerHTML = "Por que a Sra. n&atilde;o est&aacute; se tratando atualmente? ";
											col5A.id="block";
											
											var col5B = row.insertCell(1);
											
											col5B.innerHTML ="<select name='historicoClinico.cancer.porqueParouTratamentoCancer' onchange='changePorqueParouTratamentoCancer(this.value);' style='width: 98%'>" +
																"<option value='' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
																"<option value='Tratamento foi concluído' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer == \"Tratamento foi concluído\"}'>selected='selected'</c:if>>Tratamento foi concluído</option>"+
																"<option value='Abandonei' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer == \"Abandonei\"}'>selected='selected'</c:if>>Abandonei</option>"+
																"<option value='ns/nr' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer == \"ns/nr\"}'>selected='selected'</c:if>>NS/NR</option>"+
																"<option value='Outro' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer != \"ns/nr\" &&  historicoClinico.cancer.porqueParouTratamentoCancer != \"Abandonei\" && historicoClinico.cancer.porqueParouTratamentoCancer != \"Tratamento foi concluído\"}'>selected='selected'</c:if>>Outro</option>"+
															"</select><br/>"+ 
															"<input type='text' style='margin-top: 5px;width: 200px;' id='textoMotivoParouTratamentoCancer' <c:if test='${historicoClinico.cancer.porqueParouTratamentoCancer != \"ns/nr\" &&  historicoClinico.cancer.porqueParouTratamentoCancer != \"Abandonei\" && historicoClinico.cancer.porqueParouTratamentoCancer != \"Tratamento foi concluído\"}'>disabled='false' value='${historicoClinico.cancer.porqueParouTratamentoCancer}'</c:if> onkeyup='addPorqueParouTratamentoCancer(valor);' />";
											col5B.innerHTML += "<input type=hidden id='cancer.motivoPorqueParouTratamentoCancer' name='historicoClinico.cancer.porqueParouTratamentoCancer' value='${historicoClinico.cancer.porqueParouTratamentoCancer}' >";
											col5B.id="block";
											jaCriouCampoQualIdadeTinhaQuandoTeveCancer = true;
										}
									}else if (valor == "nao" || valor == "ns/nr"){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("dico disse para a Sra. qual ") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);/*lembrar de remover a coluna de baixo tb*/
											str = document.getElementById("formulario5").rows[linha+1].innerHTML;
											if(str.indexOf("Qual era a localiza") >= 0 ){
												tbl.deleteRow(linha+1);
											}
											str = document.getElementById("formulario5").rows[linha+1].innerHTML;
											if(str.indexOf("Qual era a sua idade quando disseram que a Sra.") >= 0 ){
												tbl.deleteRow(linha+1);
												tbl.deleteRow(linha+1);
												tbl.deleteRow(linha+1);
												tbl.deleteRow(linha+1);
												jaCriouCampoQualIdadeTinhaQuandoTeveCancer = false;
												bool_cancer = false;
											}
										}
									}
								}

								function changePorqueParouTratamentoCancer(opt){
									if(opt == 'Outro'){
										document.getElementById("textoMotivoParouTratamentoCancer").disabled = false;
										document.getElementById("textoMotivoParouTratamentoCancer").value = "${historicoClinico.cancer.porqueParouTratamentoCancer}";
										//document.getElementById("cancer.motivoPorqueParouTratamentoCancer").value = "";
									}else{
										document.getElementById("textoMotivoParouTratamentoCancer").value = "";
										document.getElementById("textoMotivoParouTratamentoCancer").disabled = true;
										document.getElementById("cancer.motivoPorqueParouTratamentoCancer").value = opt;
									}
								}
								
								function addPorqueParouTratamentoCancer(valor){
									
									document.getElementById("cancer.motivoPorqueParouTratamentoCancer").value = valor;
								}
																
								var bool_cancer = false;
								
								function localCancer(valor,linha){
									if(valor =="sim" && bool_cancer == false){
										var row = document.getElementById("formulario5").insertRow(linha+1);
										var colA = row.insertCell(0);
										colA.innerHTML = "Qual era a localiza&ccedil;&atilde;o deste c&acirc;ncer na &eacute;poca do diagn&oacute;stico? <br/>"+
										"<span style='font-size:85%'>(caso a entrevistada responda &uacute;tero, pergunte se foi/ &eacute; c&acirc;ncer de colo do &uacute;tero ou de corpo do &uacute;tero. Se ela n&atilde;o souber se foi/&eacute; colo ou corpo anotar &Uacute;TERO SOE).</span>";
										colA.id="block";
										var colB = row.insertCell(1);
										colB.innerHTML ="<input type='textfield' name='historicoClinico.cancer.localCancer' value='${historicoClinico.cancer.localCancer}' class='textfieldLongo' maxlength=50/>";
										colB.id="block";
										
										bool_cancer = true;
									}
									else if (valor == "nao" || valor == "ns/nr"){
										var str = document.getElementById("formulario5").rows[linha+1].innerHTML;
										if(str.indexOf("Qual era a localiza") >= 0 ){/*então existia antes o campo na tabela*/
											var tbl = document.getElementById('formulario5');
											tbl.deleteRow(linha+1);
											bool_cancer = false;
										}
									}
								}
								</script>
						</tr>
						
						<tr>
							<td class="block">A Sra. já fez algum tratamento radiológico pélvico?</td>
							<td class="block">
								<input type="radio" name="historicoClinico.jaFezTratamentoRadiologicoPelvico" value="sim" <c:if test="${historicoClinico.jaFezTratamentoRadiologicoPelvico == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoClinico.jaFezTratamentoRadiologicoPelvico" value="nao" <c:if test="${historicoClinico.jaFezTratamentoRadiologicoPelvico == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoClinico.jaFezTratamentoRadiologicoPelvico" value="ns/nr" <c:if test="${historicoClinico.jaFezTratamentoRadiologicoPelvico == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						
						<tr>
							<td class="block">A Sra. j&aacute; apresentou algum dos problemas ao lado?</td>
							<td class="block">
								<input type='checkbox' name='historicoClinico.jaApresentouProblemaInfeccaoHPV' value="Y" <c:if test="${historicoClinico.jaApresentouProblemaInfeccaoHPV == 'Y'}">checked="checked"</c:if>>Infec&ccedil;&atilde;o por HPV<br/>
								<input type='checkbox' name='historicoClinico.jaApresentouProblemaCorrimento' value="Y" <c:if test="${historicoClinico.jaApresentouProblemaCorrimento == 'Y'}">checked="checked"</c:if>>Corrimento<br/>
								<input type='checkbox' name='historicoClinico.jaApresentouProblemaPrurido' value="Y" <c:if test="${historicoClinico.jaApresentouProblemaPrurido == 'Y'}">checked="checked"</c:if>>Prurido<br/>
								<input type='checkbox' name='historicoClinico.jaApresentouProblemaArdencia' value="Y" <c:if test="${historicoClinico.jaApresentouProblemaArdencia == 'Y'}">checked="checked"</c:if>>Ard&ecirc;ncia<br/>
								
								
								<input type='checkbox' name='historicoClinico.jaApresentouProblemaNSNR' value="Y" <c:if test="${historicoClinico.jaApresentouProblemaNSNR == 'Y'}">checked="checked"</c:if>>NS/NR<br/>
								
								
								<!--colocado na versao 3.2 do formulário. antes, ficava nessa parte abaixo do formulário que está comentada abaixo  -->
								<input type='checkbox' name='historicoClinico.jaTeveInfeccaoClamidia' value="Y" <c:if test="${historicoClinico.jaTeveInfeccaoClamidia == 'Y'}">checked="checked"</c:if>>Clam&iacute;dia<br/>
								<input type='checkbox' name='historicoClinico.jaTeveInfeccaoCandidiase' value="Y" <c:if test="${historicoClinico.jaTeveInfeccaoCandidiase == 'Y'}">checked="checked"</c:if>>Candid&iacute;ase<br/>
								<input type='checkbox' name='historicoClinico.jaTeveInfeccaoGonorreia' value="Y" <c:if test="${historicoClinico.jaTeveInfeccaoGonorreia == 'Y'}">checked="checked"</c:if>>Gonorr&eacute;ia<br/>
								<input type='checkbox' name='historicoClinico.jaTeveInfeccaoSifilis' value="Y"<c:if test="${historicoClinico.jaTeveInfeccaoSifilis == 'Y'}">checked="checked"</c:if>>S&iacute;filis<br/>
								<input type='checkbox' name='historicoClinico.jaTeveInfeccaoNSNR' value="Y" <c:if test="${historicoClinico.jaTeveInfeccaoNSNR == 'Y'}">checked="checked"</c:if>>NS/NR<br/>
								
								Outro(s) <input name="historicoClinico.jaApresentouProblemasOutros" style="margin-top: 5px;width: 200px;" maxlength="60" value="${historicoClinico.jaApresentouProblemasOutros}"/>
							</td>
						</tr>
						<!-- <tr>
							<td class="block">A Sra. j&aacute; teve infec&ccedil;&atilde;o por alguma das infec&ccedil;&otilde;es abaixo?</td>
							<td class="block">
								
								Outro(s) <input name="historicoClinico.jaTeveInfeccaoOutros" value="${historicoClinico.jaTeveInfeccaoOutros}" style="margin-top: 5px;width: 200px;" maxlength="60"/>
							</td>
						</tr> -->
						
						
						
						<!-- perguntar pra rosalie se isso aqui realmente vai ser removido. Ao meu ver, isso é importante! Isso indica o grau de preocupacao do paciente em relação a sua saúde e cuidados pessoais -->
					
						
						
						<tr>
							<td class="block">Algum médico já lhe disse que a Sra. tem ou teve algumas das seguintes doenças?</td>							
							<td class="block">
								<input type='checkbox' name='historicoClinico.jaTeveDoencaDorNasCostas' value="Y" <c:if test="${historicoClinico.jaTeveDoencaDorNasCostas == 'Y'}">checked="checked"</c:if> />Doença da coluna ou costas<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaArtriteReumatismo' value="Y" <c:if test="${historicoClinico.jaTeveDoencaArtriteReumatismo == 'Y'}">checked="checked"</c:if>/>Atrite/Reumatismo (não infeccioso/Gota)<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaTendiniteLer' value="Y" <c:if test="${historicoClinico.jaTeveDoencaTendiniteLer == 'Y'}">checked="checked"</c:if> />Tendinite/LER(Lesão por Esforço Repetitivo)<br/>
								
								<input type='checkbox' name='historicoClinico.jaTeveDoencaAtaqueCoracao' value="Y" <c:if test="${historicoClinico.jaTeveDoencaAtaqueCoracao == 'Y'}">checked="checked"</c:if>/>Ataque do coraç&atilde;o<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaAngina' value="Y" <c:if test="${historicoClinico.jaTeveDoencaAngina == 'Y'}">checked="checked"</c:if>/>Angina ou doença das coron&aacute;rias<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaInsuficienciaCardiaca' value="Y" <c:if test="${historicoClinico.jaTeveDoencaInsuficienciaCardiaca == 'Y'}">checked="checked"</c:if>/>Insuficiência Cardíaca<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaDerrame' value="Y" <c:if test="${historicoClinico.jaTeveDoencaDerrame == 'Y'}">checked="checked"</c:if>/>Derrame<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaDengue' value="Y" <c:if test="${historicoClinico.jaTeveDoencaDengue == 'Y'}">checked="checked"</c:if>/>Dengue<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaDepressao' value="Y" <c:if test="${historicoClinico.jaTeveDoencaDepressao == 'Y'}">checked="checked"</c:if>/>Depress&atilde;o<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaEnfisema' value="Y" <c:if test="${historicoClinico.jaTeveDoencaEnfisema == 'Y'}">checked="checked"</c:if>/>Enfisema<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaAsma' value="Y" <c:if test="${historicoClinico.jaTeveDoencaAsma == 'Y'}">checked="checked"</c:if>/>Asma<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaCirroseFigado' value="Y" <c:if test="${historicoClinico.jaTeveDoencaCirroseFigado == 'Y'}">checked="checked"</c:if>/>Cirrose do f&iacute;gado<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaHepatite' value="Y" <c:if test="${historicoClinico.jaTeveDoencaHepatite == 'Y'}">checked="checked"</c:if>/>Hepatite<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaTuberculose' value="Y" <c:if test="${historicoClinico.jaTeveDoencaTuberculose == 'Y'}">checked="checked"</c:if>/>Tuberculose<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaMalaria' value="Y" <c:if test="${historicoClinico.jaTeveDoencaMalaria == 'Y'}">checked="checked"</c:if>/>Mal&aacute;ria<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaHanseniase' value="Y" <c:if test="${historicoClinico.jaTeveDoencaHanseniase == 'Y'}">checked="checked"</c:if>/>Hansen&iacute;ase<br/>
								<input type='checkbox' name='historicoClinico.jaTeveDoencaAids' value="Y" <c:if test="${historicoClinico.jaTeveDoencaAids == 'Y'}">checked="checked"</c:if> />AIDS/SIDA<br/>
								Outra: <input type='text' name='historicoClinico.jaTeveDoencaOutra' value="${historicoClinico.jaTeveDoencaOutra}" maxlength="50" />
							</td>
						</tr>
						
						
						
						
						
						<tr>
							<td><br/>
							</td>
						</tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
<!-- scripts para realizar as opcoes de editar -->
	<c:if test="${historicoClinico.id != null}">
		<script type="text/javascript">
			menopausa("${historicoClinico.usaMedicacaoMenorPausa}",document.getElementById("menoPausaSim").parentNode.parentNode.rowIndex);
			cronica("${historicoClinico.temDoencaCronica}",document.getElementById("historicoClinico.temDoencaCronica.sim").parentNode.parentNode.rowIndex);
			continuo("${historicoClinico.usaMedicacaoUsoContinuo}",document.getElementById("historicoClinico.usaMedicacaoUsoContinuo.sim").parentNode.parentNode.rowIndex)
			//lembrar que medicacao de uso continuo é uma lista, ou seja, tem que percorrer cada item da lista.
			malestar("${historicoClinico.algumMalEstar}",document.getElementById("historicoClinico.algumMalEstar.sim").parentNode.parentNode.rowIndex);
			pressaoAlta("${historicoClinico.temPressaoAlta}",document.getElementById("historicoClinico.temPressaoAlta.sim").parentNode.parentNode.rowIndex);
			colesterol("${historicoClinico.jaFezExameSangueColesterol}",document.getElementById("historicoClinico.jaFezExameSangueColesterol.sim").parentNode.parentNode.rowIndex);
			cancer("${historicoClinico.alguemDisseCancer}",document.getElementById("historicoClinico.alguemDisseCancer.sim").parentNode.parentNode.rowIndex);
			localCancer("${historicoClinico.cancer.medicoDisseLocalCancer}",document.getElementById("historicoClinico.cancer.medicoDisseLocalCancer.sim").parentNode.parentNode.rowIndex);
			diabetes("${historicoClinico.alguemDisseDiabetes}",document.getElementById("historicoClinico.alguemDisseDiabetes.sim").parentNode.parentNode.rowIndex);				
		</script>
	</c:if>


	</body>
</html>