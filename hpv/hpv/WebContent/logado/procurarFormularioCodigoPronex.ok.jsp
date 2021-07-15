<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@include file="../head.jsp"%>

		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="container">
		<div id="top">
			<%@include file="../top.jsp"%>
		</div>
		<div id="menuh-container">
			<%@include file="menu.jsp"%>
		</div>

		<div class="clear:both;"></div>

		<div style="text-align: center;">
			<br /> <br />
			<h2>
				Bem vindo, <span style="font-weight: bold; color: #520934;"> ${usuarioDaSessao.nome} </span>
			</h2>
			<br /> <br />
			<form method="post" action="logado.procurarFormularioCodigoPronex.logic">
				Informe o Código Pronex para obter os dados. <br /> <input type="text" name="formulario.codigoPronex" /> <input type="submit" value="Buscar">
			</form>
			<br /> <br />
			<c:if test="${formulariosBuscados != null}">
				<div class="resultadoListar">

			<display:table requestURI="logado.procurarFormularioCodigoPronex.logic" name="${formulariosBuscados}" export="false" id="formulario" list="${formulariosBuscados}" pagesize="20" sort="list" class="displaytag" length="5">
				<display:column title="Código PRONEX" sortable="true">${formulario.codigoPronex}</display:column>
				
				<display:column title="Formulário"><a href="formulario.formulario1.logic?formulario.id=${formulario.id}">editar</a></display:column>
				

				<c:if test="${usuarioDaSessao.acessoViralClamidia == 'Y'}">
					<display:column title="Laudo Clamidia"> <a href="viralClamidia.formulario.logic?formulario.id=${formulario.id}">Clamídia</a> </display:column>
				</c:if>
				
				<c:if test="${usuarioDaSessao.acessoViralHbv == 'Y'}">
					<display:column title="Laudo HBV"><a href="viralHbv.formulario.logic?formulario.id=${formulario.id}">&nbsp; HBV</a></display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoViralHcv == 'Y'}">
					<display:column title="Laudo HCV"><a href="viralHcv.formulario.logic?formulario.id=${formulario.id}">&nbsp; HCV</a></display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoViralHiv == 'Y'}">
					<display:column title="Laudo HIV"><a href="viralHiv.formulario.logic?formulario.id=${formulario.id}">&nbsp; HIV</a></display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoViralHpv == 'Y'}">
					<display:column title="Laudo HPV"><a href="viralHpv.formulario.logic?formulario.id=${formulario.id}">&nbsp; HPV</a></display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoCitopato == 'Y'}">
					<display:column title="Citopato"><a href="citopato.formulario.logic?formulario.id=${formulario.id}">&nbsp; CITOPATO </a></display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoAnexos != null && usuarioDaSessao.acessoAnexos == 'Y'}">
					<display:column title="Anexos"> <a href="anexos.formulario.logic?formulario.id=${formulario.id}">Anexos</a> </display:column>
				</c:if>

				<c:if test="${usuarioDaSessao.acessoAmostras != null && usuarioDaSessao.acessoAmostras == 'Y'}">
					<display:column title="Amostras"> <a href="amostras.formulario.logic?formulario.id=${formulario.id}">Amostras</a> </display:column>
				</c:if>


				<display:setProperty name="paging.banner.placement" value="bottom" />
				<display:setProperty name="basic.empty.showtable" value="true" />
				<display:setProperty name="export.excel" value="false" />
				<display:setProperty name="export.xml" value="false" />
				<display:setProperty name="export.csv" value="false" />
				<display:setProperty name="export.pdf" value="false" />
			</display:table>
		</div>
		</c:if>

	</div>


	<div id="footer">
		<%@include file="../footer.jsp"%>
	</div>
	</div>

</body>

</html>
