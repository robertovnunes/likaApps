<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@include file="../head.jsp"%>
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

		<div id="content">
			<br />
			<br />
			<h2>
				Bem vindo, <span style="font-weight: bold; color: #520934;"> ${usuarioDaSessao.nome} </span>
			</h2>

			<ul>
				<li><a href="logado.formularioAlterarMeusDados.logic?usuario.id=${usuarioDaSessao.id}"> Meus Dados </a></li>
				<li><a href="logado.procurarFormularioCodigoPronex.logic">Buscar formulários pelo Código Pronex</a>
			</ul>


		</div>


		<div id="footer">
			<%@include file="../footer.jsp"%>
		</div>
	</div>

</body>

</html>
