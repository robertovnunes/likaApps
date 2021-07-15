<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
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
				<h2>9. ATIVIDADE F&Iacute;SICA</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
			<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 9 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br />
				
				<br>
				<form action="formulario.addFormulario9.logic" method = "post">
					<input type="hidden" name="formulario.id" value="${formulario.id}"/>
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />	

					<table class="block">
						<tr>
							<td class="block" colspan="2">
								Em quantos dias de uma semana comum a Sra. caminha por pelo menos 10 minutos 
								seguidos em casa, no trabalho, como forma de transporte para ir de um lugar 
								para outro, por lazer ou como forma de exerc&iacute;cio?
								<br/> <br/>
								<input name="formulario.qntsDiasSemanaCaminhada" value="${formulario.qntsDiasSemanaCaminhada}" style="width: 40px;" onkeyup="this.value=doDecimal(this.value);" maxlength="1"/>&nbsp; <span style="font-size:85%">dia(s) na semana</span> 
							</td>
						</tr>
						<tr>
							<td class="block" colspan="2">
								(Al&eacute;m da caminhada,) a Sra. faz atividades MODERADAS, 
								por pelo menos 10 minutos seguidos, no trabalho, 
								por lazer, por esporte, como forma de exerc&iacute;cio, 
								como parte das suas atividades dentro de casa, no quintal ou qualquer 
								outra atividade que aumente moderadamente a sua respiração ou batimentos do cora&ccedil;&atilde;o?
								<br/><br/>
								<input type="radio" value="sim" name='formulario.praticaAtividadesModeradas' <c:if test="${formulario.praticaAtividadesModeradas == 'sim'}">checked='checked'</c:if>/>Sim  
								<input type="radio" value="nao" name='formulario.praticaAtividadesModeradas' <c:if test="${formulario.praticaAtividadesModeradas == 'nao'}">checked='checked'</c:if>/>Não 
								<input type="radio" value="ns/nr" name='formulario.praticaAtividadesModeradas' <c:if test="${formulario.praticaAtividadesModeradas == 'ns/nr'}">checked='checked'</c:if>/>NS/NR    
								<br/><br/>
								<span style="font-size: 8pt;">
									Alguns exemplos de atividades moderadas s&atilde;o:  
									pedalar leve na bicicleta, nadar, dançar, fazer gin&aacute;stica aer&oacute;bica leve, 
									jogar v&ocirc;lei recreativo, carregar pesos leves, 
									fazer serviços dom&eacute;sticos na casa ou no quintal, como varrer, aspirar, 
									cuidar do jardim ou trabalhos como soldar, 
									operar m&aacute;quinas, empilhar caixas, etc.
									<br/><br/>
								</span>
							</td>
						</tr>
						<tr>
							<td class="block" colspan="2">
								Em quantos dias de uma semana comum, a Sra. faz essas atividades MODERADAS, por pelo menos 10 minutos seguidos?
								<br/>
								<input name="formulario.qntsDiasSemanaisPraticaEstasAtividades" value="${formulario.qntsDiasSemanaisPraticaEstasAtividades}" style="width: 40px" onkeyup="this.value=doDecimal(this.value);" maxlength="1"/>&nbsp; <span style="font-size:85%">dia(s) na semana</span>
							</td>
						</tr>
						
						<tr><td> </td><td><br/> </td>  </tr>
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