<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	    <%@include file="../head.jsp" %>
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
				<h2>7. TABAGISMO</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
			<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 7 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br />
				
				<br>
				<form action="formulario.addFormulario7.logic" method = "post" >
					<input type="hidden" name="tabagismo.formulario.id" value="${formulario.id}">
					<input type="hidden" name="tabagismo.id" value="${tabagismo.id}" />
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					
					<table class="block" id='formulario8' style="width: 100%;">

						
						<tr>
							<td class="block" style="width: 50%;">
								Fuma?
							</td>
							<td class="block">
								<input type="radio" name="tabagismo.fuma" value="sim" id='tabagismo.fuma.sim' onclick="cigarro(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${tabagismo.fuma == 'sim'}">checked='checked'</c:if>/>Sim
								<input type="radio" name="tabagismo.fuma" value="nao" onclick="cigarro(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${tabagismo.fuma == 'nao'}">checked='checked'</c:if>/>Não
								<input type="radio" name="tabagismo.fuma" value="ja fumei" onclick="cigarro(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${tabagismo.fuma == 'ja fumei'}">checked='checked'</c:if>/>Já fumei
							</td>
						</tr>
						<script type="text/javascript">
							var fuma = "";
						
							function cigarro(valor,linha){
								if(valor =="sim"){
									if (fuma == "sim"){
										return "";
									}
									else if(fuma == "nao"){//se era nao antes e agora passou a ser sim
										removeNaoFuma(linha);
									}else if (fuma == "ja fumei"){//se era ja fumei antes e agora passou a ser sim
										removeJaFumei(linha);
									}
									addFuma(linha);
									fuma = "sim";
								}
								
								else if (valor == "nao" ){
									if(fuma == "nao"){
										return "";
									}
									else if(fuma == "sim"){
										removeFuma(linha);
									}
									else if(fuma == "ja fumei"){
										removeJaFumei(linha);
									}
									addNaoFuma(linha);
									fuma = "nao";
								}
								
								else if(valor =='ja fumei'){
									if(fuma == "sim"){
										removeFuma(linha);
									}else if(fuma == "nao"){
										removeNaoFuma(linha);
									}
									else if(fuma =="ja fumei"){
										return "";
									}
									addJaFumei(linha);
									fuma="ja fumei"
								}
							}
							
							function addFuma(linha){
								var row = document.getElementById("formulario8").insertRow(linha+1);
								var colA = row.insertCell(0);
								colA.innerHTML = "H&aacute; quanto tempo fuma?";
								colA.id="block";
								var colB = row.insertCell(1);
								colB.innerHTML ="<input type=hidden name='tabagismo.fumo.id' value='${tabagismo.fumo.id}' />";
								colB.innerHTML +="<input type='text' class='textfieldLongo' name='tabagismo.fumo.quantoTempoFuma' value='${tabagismo.fumo.quantoTempoFuma}' maxlength=50/>";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual tipo de cigarro?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroPalha' <c:if test='${tabagismo.fumo.cigarroPalha == \"Y\"}'>checked='checked'</c:if>/>de palha"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroComFiltro' <c:if test='${tabagismo.fumo.cigarroComFiltro == \"Y\"}'>checked='checked'</c:if>/>com filtro"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroSemFiltro' <c:if test='${tabagismo.fumo.cigarroSemFiltro == \"Y\"}'>checked='checked'</c:if>/>sem filtro"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroCharuto' <c:if test='${tabagismo.fumo.cigarroCharuto == \"Y\"}'>checked='checked'</c:if>/>charuto"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroCachimbo' <c:if test='${tabagismo.fumo.cigarroCachimbo == \"Y\"}'>checked='checked'</c:if>/>cachimbo"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroIndiano' <c:if test='${tabagismo.fumo.cigarroIndiano == \"Y\"}'>checked='checked'</c:if>/>indiano";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+3);
								colA = row.insertCell(0);
								colA.innerHTML = "Quantidade por dia:";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='tabagismo.fumo.quantidadeCigarrosPorDia'>"+
													"<option value='' >selecione...</option>"+
													"<option value='1 a 3 cigarros' <c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"1 a 3 cigarros\"}'>selected='selected'</c:if>>1 a 3 cigarros</option>"+
													"<option value='4 a 6 cigarros' <c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"4 a 6 cigarros\"}'>selected='selected'</c:if>>4 a 6 cigarros</option>"+
													"<option value='7 a 10 cigarros' <c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"7 a 10 cigarros\"}'>selected='selected'</c:if>>7 a 10 cigarros</option>"+
													"<option value='mais de 10 cigarros' <c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"mais de 10 cigarros\"}'>selected='selected'</c:if>>mais de 10 cigarros</option>"+
													"<option value='1 maco'	<c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"1 maco\"}'>selected='selected'</c:if>>1 maço</option>"+
													"<option value='2 macos'	<c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"2 macos\"}'>selected='selected'</c:if>>2 maços</option>"+
													"<option value='mais de 2 macos' <c:if test='${tabagismo.fumo.quantidadeCigarrosPorDia == \"mais de 2 macos\"}'>selected='selected'</c:if>>mais de 2 maços</option>"+
												"</select>";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+4);
								colA = row.insertCell(0);
								colA.innerHTML = "Quanto tempo depois de acordar a Sra. fuma o primeiro cigarro?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='tabagismo.fumo.primeiroCigarroDepoisAcordar'>"+
													"<option value=''>selecione...</option>"+
													"<option value='Nos primeiros 5 minutos' <c:if test='${tabagismo.fumo.primeiroCigarroDepoisAcordar == \"Nos primeiros 5 minutos\"}'>selected='selected'</c:if>>Nos primeiros 5 minutos</option>"+
													"<option value='De 6 minutos a 30 minutos' <c:if test='${tabagismo.fumo.primeiroCigarroDepoisAcordar == \"De 6 minutos a 30 minutos\"}'>selected='selected'</c:if>>De 6 minutos a 30 minutos</option>"+
													"<option value='De 31 minutos a 60 minutos' <c:if test='${tabagismo.fumo.primeiroCigarroDepoisAcordar == \"De 31 minutos a 60 minutos\"}'>selected='selected'</c:if>>De 31 minutos a 60 minutos</option>"+
													"<option value='Apos 60 minutos' <c:if test='${tabagismo.fumo.primeiroCigarroDepoisAcordar == \"Apos 60 minutos\"}'>selected='selected'</c:if>>Ap&oacute;s 60 minutos</option>"+
												"</select>";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+5);
								colA = row.insertCell(0);
								colA.innerHTML = "A Sra, j&aacute; parou de fumar por pelo menos 1 dia, porque estava tentando seriamente parar de vez?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='tabagismo.fumo.jaParouFumarPeloMenosUmDia'>"+
													"<option value=''>selecione...</option>"+
													"<option value='Y' <c:if test='${tabagismo.fumo.jaParouFumarPeloMenosUmDia == \"Y\"}'>selected='selected'</c:if>>Sim</option>"+
													"<option value='N' <c:if test='${tabagismo.fumo.jaParouFumarPeloMenosUmDia == \"N\"}'>selected='selected'</c:if>>N&atilde;o</option>"+
												"</select>";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+6);
								colA = row.insertCell(0);
								colA.innerHTML = "Quando foi a &uacute;ltima vez que a Sra. tentou parar de fumar?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='tabagismo.fumo.ultimaVezTentouPararFumar'>"+
													"<option value='' >selecione...</option>"+
													"<option value='Durante o ultimo mes' <c:if test='${tabagismo.fumo.ultimaVezTentouPararFumar == \"Durante o ultimo mes\"}'>selected='selected'</c:if>>Durante o &uacute;ltimo m&ecirc;s</option>"+
													"<option value='Mais de 1 mes ate 6 meses atras' <c:if test='${tabagismo.fumo.ultimaVezTentouPararFumar == \"Mais de 1 mes ate 6 meses atras\"}'>selected='selected'</c:if>>Mais de um m&ecirc;s até 6 meses atrás</option>"+
													"<option value='Mais de 6 meses ate 12 meses atras' <c:if test='${tabagismo.fumo.ultimaVezTentouPararFumar == \"Mais de 6 meses ate 12 meses atras\"}'>selected='selected'</c:if>>Mais de 6 meses até 12 meses atrás</option>"+
													"<option value='Ha mais de 12 meses' <c:if test='${tabagismo.fumo.ultimaVezTentouPararFumar == \"Ha mais de 12 meses\"}'>selected='selected'</c:if>>H&aacute; mais de 12 meses</option>"+
												"</select>";
								colB.id="block";
							}

							function addNaoFuma(linha){
								row = document.getElementById("formulario8").insertRow(linha+1);
								colA = row.insertCell(0);
								colA.innerHTML = "Alguma vez a Sra. j&aacute; experimentou ou tentou fumar cigarros, mesmo uma ou duas tragadas?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<select name='tabagismo.jaExperimentouFumar'>"+
													"<option value=''>selecione...</option>"+
													"<option value='Y' <c:if test='${tabagismo.jaExperimentouFumar == \"Y\"}'>selected='selected'</c:if>>sim</option>"+
													"<option value='N' <c:if test='${tabagismo.jaExperimentouFumar == \"N\"}'>selected='selected'</c:if>>n&atilde;o</option>"+
												"</select>";
								colB.id="block";
							}

							function removeJaFumei(linha){
								var tbl = document.getElementById('formulario8');
								var i = 0;
								for(i = 0; i < 5;i++){
									tbl.deleteRow(linha+1);
								}
							}

							function removeFuma(linha){
								var tbl = document.getElementById('formulario8');
								var i = 0;
								for(i = 0; i < 6;i++){
									tbl.deleteRow(linha+1);
								}
							}

							function removeNaoFuma(linha){
								var tbl = document.getElementById('formulario8');
								tbl.deleteRow(linha+1);	
							}

							function addJaFumei(linha){
								/*row = document.getElementById("formulario8").insertRow(linha+1);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual tipo de cigarro?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type=hidden name='tabagismo.fumo.id' value='${tabagismo.fumo.id}' />";
								colB.innerHTML +="<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroPalha' <c:if test='${tabagismo.fumo.cigarroPalha == \"Y\"}'>checked='checked'</c:if>/>de palha"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroComFiltro' <c:if test='${tabagismo.fumo.cigarroComFiltro == \"Y\"}'>checked='checked'</c:if>/>com filtro"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroSemFiltro' <c:if test='${tabagismo.fumo.cigarroSemFiltro == \"Y\"}'>checked='checked'</c:if>/>sem filtro"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroCharuto' <c:if test='${tabagismo.fumo.cigarroCharuto == \"Y\"}'>checked='checked'</c:if>/>charuto"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroCachimbo' <c:if test='${tabagismo.fumo.cigarroCachimbo == \"Y\"}'>checked='checked'</c:if>/>cachimbo"+
												"<br />"+
												"<input type='checkbox' value='Y' name='tabagismo.fumo.cigarroIndiano' <c:if test='${tabagismo.fumo.cigarroIndiano == \"Y\"}'>checked='checked'</c:if>/>indiano";
								colB.id="block";
								*/

								row = document.getElementById("formulario8").insertRow(linha+1);
								colA = row.insertCell(0);
								colA.innerHTML = "Há quanto tempo a Sra.  parou de fumar?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' name='tabagismo.quantoTempoParouFumar' value='${tabagismo.quantoTempoParouFumar}' maxlength=50/>";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+2);
								colA = row.insertCell(0);
								colA.innerHTML = "Quantidade por dia:";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='text' name='tabagismo.fumo.quantidadeCigarrosPorDia' value='${tabagismo.fumo.quantidadeCigarrosPorDia}' style='width:30px;' maxlength='2' id='tabagismo.fumo.quantidadeCigarrosPorDia'/><br>" +
												"<input type='radio' value='cigarrosPorDia' name='tabagismo.fumo.tipoQuantidadeFumavaDia' <c:if test='${tabagismo.fumo.tipoQuantidadeFumavaDia == \"cigarrosPorDia\"}'>checked='checked'</c:if> onclick=\"document.getElementById('tabagismo.fumo.quantidadeCigarrosPorDia').enabled=true; \"/>Cigarros por dia<br/>"+
												"<input type='radio' value='cigarrosPorDia' name='tabagismo.fumo.tipoQuantidadeFumavaDia' <c:if test='${tabagismo.fumo.tipoQuantidadeFumavaDia == \"cigarrosPorDia\"}'>checked='checked'</c:if> onclick=\"document.getElementById('tabagismo.fumo.quantidadeCigarrosPorDia').enabled=true; \"/>Maços por dia<br/>"+
												"<input type='radio' value='cigarrosPorDia' name='tabagismo.fumo.tipoQuantidadeFumavaDia' <c:if test='${tabagismo.fumo.tipoQuantidadeFumavaDia == \"cigarrosPorDia\"}'>checked='checked'</c:if> onclick=\"document.getElementById('tabagismo.fumo.quantidadeCigarrosPorDia').value='';onclick=\"document.getElementById('tabagismo.fumo.quantidadeCigarrosPorDia').enabled=false; \"/>NS/NR<br/>";
									
								colB.id="block";
								
								
								
								row = document.getElementById("formulario8").insertRow(linha+3);
								colA = row.insertCell(0);
								colA.innerHTML = "A Sra. parou de fumar porque tinha algum problema de saúde que foi causado ou que piorou por causa do cigarro?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type=radio name='tabagismo.parouMotivoAgravamentoSaude' value='Y' <c:if test='${tabagismo.parouMotivoAgravamentoSaude == \"Y\"}'>checked='checked'</c:if>/> Sim"+
												"<input type=radio name='tabagismo.parouMotivoAgravamentoSaude' value='N' <c:if test='${tabagismo.parouMotivoAgravamentoSaude == \"N\"}'>checked='checked'</c:if>/>Não";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+4);
								colA = row.insertCell(0);
								colA.innerHTML = "Para parar de fumar, a Sra. ...";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='radio' value='Recebeu algum tipo de tratamento com profissionais de saude ou usou algum tipo de medicamento' name='tabagismo.paraPararFumar' <c:if test='${tabagismo.paraPararFumar == \"Recebeu algum tipo de tratamento com profissionais de saude ou usou algum tipo de medicamento\"}'>checked='checked'</c:if>/>Recebeu algum tipo de tratamento com profissionais de sa&uacute;de ou usou algum tipo de medicamento <br>"+
												"<input type='radio' value='Parou por conta propria' name='tabagismo.paraPararFumar' <c:if test='${tabagismo.paraPararFumar == \"Parou por conta propria\"}'>checked='checked'</c:if>/>Parou por conta pr&oacute;pria";
								colB.id="block";
								
								row = document.getElementById("formulario8").insertRow(linha+5);
								colA = row.insertCell(0);
								colA.innerHTML = "Qual foi o tipo de tratamento ou medicamento que a Sra. recebeu?";
								colA.id="block";
								colB = row.insertCell(1);
								colB.innerHTML ="<input type='radio' id='tratamentoParaPararFumar1' onchange='alterarOpcaoTratamentoPararFumar(this.value);' value='Recebeu orientacoes em consultas com medico,enfermeirou ou psicologo' name='tratamentoParaPararFumar'/>Recebeu orienta&ccedil;&otilde;es em consulta com m&eacute;dico, enfermeiro ou psic&oacute;logo"+
												"<br />"+
												"<input type='radio' id='tratamentoParaPararFumar2' onchange='alterarOpcaoTratamentoPararFumar(this.value);' value='Participou de grupos para ajudar o fumante a parar de fumar' name='tratamentoParaPararFumar'/>Participou de grupos para ajudar o fumante a parar"+
												"<br />"+
												"<input type='radio' id='tratamentoParaPararFumar3' onchange='alterarOpcaoTratamentoPararFumar(this.value);' value='Fez tratamento com laser ou acupuntura' name='tratamentoParaPararFumar'/>Fez tratamento com laser ou acupuntura"+
												"<br />"+
												"<input type='radio' id='tratamentoParaPararFumar4' onchange='alterarOpcaoTratamentoPararFumar(this.value);' value='Usou adesivos ou chiclete de nicotina' name='tratamentoParaPararFumar' />Usou adesivos ou chiclete de nicotina"+
												"<br />"+
												"<input type='radio' id='tratamentoParaPararFumar5' onchange='alterarOpcaoTratamentoPararFumar(this.value);' name='tratamentoParaPararFumar' value='outros' />" +
												"Outros: <input type=text id='tratamentoParaPararFumar6.texto' name='tabagismo.tratamentoParaPararFumar' maxlength=80 onkeyup='alterarOpcaoTratamentoPararFumar(this.value);'/>" + 
												"<input type=hidden id='tabagismo.tratamentoParaPararFumar' name='tabagismo.tratamentoParaPararFumar' value='${tabagismo.tratamentoParaPararFumar}' />";
								colB.id="block";
							}

							function alterarOpcaoTratamentoPararFumar(opt){
								
								if(opt == null || opt == ""){
									
								}
								else if(opt == document.getElementById("tratamentoParaPararFumar1").value ){
									document.getElementById("tratamentoParaPararFumar1").checked = true;
									document.getElementById("tratamentoParaPararFumar6.texto").value = "";
									document.getElementById("tratamentoParaPararFumar6.texto").disabled = true;
									document.getElementById("tabagismo.tratamentoParaPararFumar").value = document.getElementById("tratamentoParaPararFumar1").value;
								}
								else if(opt == document.getElementById("tratamentoParaPararFumar2").value){
									document.getElementById("tratamentoParaPararFumar2").checked = true;
									document.getElementById("tratamentoParaPararFumar6.texto").value = "";
									document.getElementById("tratamentoParaPararFumar6.texto").disabled = true;
									document.getElementById("tabagismo.tratamentoParaPararFumar").value = document.getElementById("tratamentoParaPararFumar2").value;
								}
								else if(opt == document.getElementById("tratamentoParaPararFumar3").value){
									document.getElementById("tratamentoParaPararFumar3").checked = true;
									document.getElementById("tratamentoParaPararFumar6.texto").value = "";
									document.getElementById("tratamentoParaPararFumar6.texto").disabled = true;
									document.getElementById("tabagismo.tratamentoParaPararFumar").value = document.getElementById("tratamentoParaPararFumar3").value;
								}
								else if(opt == document.getElementById("tratamentoParaPararFumar4").value){
									document.getElementById("tratamentoParaPararFumar4").checked = true;
									document.getElementById("tratamentoParaPararFumar6.texto").value = "";
									document.getElementById("tratamentoParaPararFumar6.texto").disabled = true;
									document.getElementById("tabagismo.tratamentoParaPararFumar").value = document.getElementById("tratamentoParaPararFumar4").value;
								}
								else if(opt == "outros"){
									document.getElementById("tratamentoParaPararFumar6.texto").disabled = false;
								}
								else{
									document.getElementById("tratamentoParaPararFumar5").checked = true;
									document.getElementById("tratamentoParaPararFumar6.texto").value = opt;
									document.getElementById("tabagismo.tratamentoParaPararFumar").value = opt;
								}
							}
							cigarro("${tabagismo.fuma}",document.getElementById("tabagismo.fuma.sim").parentNode.parentNode.rowIndex);
							var t = "${tabagismo.tratamentoParaPararFumar}";
							alterarOpcaoTratamentoPararFumar(t);
						</script>
						<tr>
							<td class="block" style="width: 50%;">
								A Sra. fica em contato com a fuma&ccedil;a do cigarro de outras pessoas em sua casa, trabalho ou escola?
							</td>
							<td class="block">
								<input type="radio" name="tabagismo.contatoFumaca" value="Y" <c:if test="${tabagismo.contatoFumaca == 'Y'}"> checked='checked'</c:if> />Sim
								<input type="radio" name="tabagismo.contatoFumaca" value="N" <c:if test="${tabagismo.contatoFumaca == 'N'}">checked='checked'</c:if>/>N&atilde;o
							</td>
						</tr>
						
						<tr>
							<td>
								<br/>
								</td>
							<td>
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
	</body>
</html>