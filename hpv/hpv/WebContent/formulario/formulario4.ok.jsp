<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	    <%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
	    <title>HPV-LIKA</title>
  	</head>
	<body onload="quandoEditar();">
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
				<h2> 4. HISTÓRICO SEXUAL E REPRODUTIVO</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
				<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 4 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
			<br />	
				
				<br>
				<form action="formulario.addFormulario4.logic" method = "post">
					<input type="hidden" name="historicoSexual.formulario.id" value="${formulario.id}" >
					<input type="hidden" name="historicoSexual.id" value="${historicoSexual.id}">
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					
					<table class="block" id="formulario4" >
						<tr>
							<td class="block" width="260px;">Relações Sexuais</td>
							<td class="block" width="265px;">
								<input type="radio" name="historicoSexual.jaTeveRelacaoSexual" value="sim" onclick="opcoesRelacaoSexual(this.value);" <c:if test='${historicoSexual.jaTeveRelacaoSexual == \"sim\"}'>checked='checked'</c:if> id='jaTeveRelacaoSexualOpcaoSim'/>Sim
								<input type="radio" name="historicoSexual.jaTeveRelacaoSexual" value="não" onclick="opcoesRelacaoSexual(this.value);" <c:if test='${historicoSexual.jaTeveRelacaoSexual == \"não\"}'>checked='checked'</c:if>/>Não
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
	</body>
	<script type="text/javascript">
	var bool_rel = false;
	function opcoesRelacaoSexual(valor){
		if(valor == "sim" && bool_rel == false){
			var formulario = document.getElementById("formulario4");

			var row1 = formulario.insertRow(1);
			var op1a = row1.insertCell(0);
			op1a.innerHTML = "Idade da primeira relação sexual";
			op1a.id = "block";
			var op1b = row1.insertCell(1);
			op1b.innerHTML = "<input name='historicoSexual.idadePrimeiraRelacaoSexual' value='${historicoSexual.idadePrimeiraRelacaoSexual}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='3' />&nbsp;<span style='font-size:85%;'>(anos)</span>";
			op1b.id="block";
			

			var row2 = formulario.insertRow(2);
			var op2a = row2.insertCell(0);
			op2a.innerHTML = "A Sra. está grávida ou amamentando?";
			op2a.id = "block";
			
			var op2b = row2.insertCell(1);
			op2b.innerHTML = "<select name='historicoSexual.estaGravida' id='historicoSexual.estaGravida'>"+
			 "<option value='' <c:if test='${historicoSexual.estaGravida == \"\"}'>selected='selected'</c:if>>selecione...</option>"+
			 "<option value='Sim, está grávida' <c:if test='${historicoSexual.estaGravida == \"Sim, está grávida\"}'>selected='selected'</c:if>>Sim, está grávida</option>"+
			 "<option value='Sim, está amamentando' <c:if test='${historicoSexual.estaGravida == \"Sim, está amamentando\"}'>selected='selected'</c:if>>Sim, está amamentando</option>"+
			 "<option value='Não. Não está grávida/amamentando' <c:if test='${historicoSexual.estaGravida == \"Não. Não está grávida/amamentando\"}'>selected='selected'</c:if>>Não. Não está grávida / amamentando</option>"+
			 "<option value='NS/NR' <c:if test='${historicoSexual.estaGravida == \"NS/NR\"}'>selected='selected'</c:if>>NS/NR</option>"+
			 "</select>";
			op2b.id = "block";
			
			var row3 = formulario.insertRow(3);
			var op3a = row3.insertCell(0);
			op3a.innerHTML = "Número de parceiros";
			op3a.id="block";
			var op3b = row3.insertCell(1);
			op3b.innerHTML ="<input type=radio value='muitos' name='radio' onclick='numParceiros(this.value);' <c:if test='${historicoSexual.numeroParceiros == \"muitos\"}'>checked='checked'</c:if>> muitos <br>"+
							"<input type=radio value='ns/nr'  name='radio' onclick='numParceiros(this.value);' <c:if test='${historicoSexual.numeroParceiros == \"ns/nr\"}'>checked='checked'</c:if>> NS/NR <br>"+
							"<input id='txt' type=radio value='texto'  name='radio' onclick='numParceiros(this.value);' <c:if test='${historicoSexual.numeroParceiros != \"ns/nr\" && historicoSexual.numeroParceiros != \"muitos\"}'>checked='checked'</c:if>> (informe)"+
							"<input id='parceiros' name='historicoSexual.numeroParceiros' style='width: 70px' onkeyup='this.value=opcaoNumeroParceiros(this.value);' onchange='this.value=opcaoNumeroParceiros(this.value);' maxlength='6' <c:if test='${historicoSexual.numeroParceiros != \"muitos\" && historicoSexual.numeroParceiros != \"ns/nr\"}'>value='${historicoSexual.numeroParceiros}'</c:if>/>";
			op3b.id="block";
			
			var row4 = formulario.insertRow(4);
			var op4a = row4.insertCell(0);
			op4a.innerHTML = "Número de gestações";
			op4a.id="block";
			
			var op4b = row4.insertCell(1);
			op4b.innerHTML = "<input name='historicoSexual.numeroGestacoes' value='${historicoSexual.numeroGestacoes}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>";
			op4b.id="block";
			
			var row5 = formulario.insertRow(5);
			var op5a = row5.insertCell(0);
			op5a.innerHTML = "Idade da primeira gestação";
			op5a.id="block";
			
			var op5b = row5.insertCell(1);
			op5b.innerHTML = "<input name='historicoSexual.idadePrimeiraGestacao' value='${historicoSexual.idadePrimeiraGestacao}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='3'/>&nbsp;<span style='font-size:85%;' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>(anos)</span>";
			op5b.id="block";
			
			
			var row6 = formulario.insertRow(6);
			var op6a = row6.insertCell(0);
			op6a.innerHTML = "Idade que nasceu o primeiro filho";
			op6a.id="block";
			
			var op6b = row6.insertCell(1);
			op6b.innerHTML = "<input name='historicoSexual.idadeNasceuPrimeiroFilho' value='${historicoSexual.idadeNasceuPrimeiroFilho}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>&nbsp;<span style='font-size:85%;'>(anos)</span>";
			op6b.id="block";
			
			var row7 = formulario.insertRow(7);
			var op7a = row7.insertCell(0);
			op7a.innerHTML = "Número de abortos";
			op7a.id="block";
			
			var op7b = row7.insertCell(1);
			op7b.innerHTML = "<input name='historicoSexual.numeroAbortos' value='${historicoSexual.numeroAbortos}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>";
			op7b.id="block";
			
			/*var row8 = formulario.insertRow(8);
			var op8a = row8.insertCell(0);
			op8a.innerHTML = "Número de partos ";
			op8a.id="block";
			
			var op8b = row8.insertCell(1);
			op8b.innerHTML = "<input name='historicoSexual.numeroPartos' value='${historicoSexual.numeroPartos}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>";
			op8b.id="block";*/
			
			var row8 = formulario.insertRow(8);
			var op8a = row8.insertCell(0);
			op8a.innerHTML = "Número de partos normal";
			op8a.id="block";
			
			var op8b = row8.insertCell(1);
			op8b.innerHTML = "<input name='historicoSexual.numeroPartosNormal' value='${historicoSexual.numeroPartosNormal}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>";
			op8b.id="block";
			
			var row9 = formulario.insertRow(9);
			var op9a = row9.insertCell(0);
			op9a.innerHTML = "Número de partos cesária";
			op9a.id="block";
			
			var op9b = row9.insertCell(1);
			op9b.innerHTML = "<input name='historicoSexual.numeroPartosCesaria' value='${historicoSexual.numeroPartosCesaria}' style='width: 30px' onkeyup='this.value=doDecimal(this.value);' maxlength='2'/>";
			op9b.id="block";
			
			bool_rel = true;
		}
		else if(valor == "não" && bool_rel == true){
			/*remove todo o restante da pagina!*/
			var tbl = document.getElementById('formulario4');
			var i = 0;
			for(i = 9; i > 0; i--){
				tbl.deleteRow(i);
			}
			bool_rel = false;
		}
	}

	function numParceiros(v){
		if(v == "muitos"){
			document.getElementById("parceiros").value ="muitos";
			//document.getElementById("parceiros").disabled = true;
		}
		else if(v == "ns/nr"){
			document.getElementById("parceiros").value ="ns/nr";
			//document.getElementById("parceiros").disabled = true;
		}
		else if (v == "texto"){
			document.getElementById("parceiros").value ="";
			document.getElementById("parceiros").disabled = false;
		}		
	}

	function quandoEditar(){
		var temp = document.getElementById("jaTeveRelacaoSexualOpcaoSim");
		
		if(temp.checked){
			opcoesRelacaoSexual("sim");
		}
	}

	function opcaoNumeroParceiros(op){
		var retorno = doDecimal(op);
		document.getElementById("txt").checked = true;
		return retorno;
	}

	
	</script>
</html>