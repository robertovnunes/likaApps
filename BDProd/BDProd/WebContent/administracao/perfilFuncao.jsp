<%-- 
    Document   : perfilPesquisador
    Created on : 21/03/2010, 16:25:05
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>


<f:view>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link href="../css/styleMenus.css" rel="stylesheet" type="text/css" />
	<link href="../css/tabela.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../css/niceforms.js"></script>
	<link rel="stylesheet" type="text/css" media="all"
		href="../css/niceforms-default.css" />
	<script type="text/javascript" src="../js/mascaras.js"></script>


	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.8.custom.min.js"></script>
	<link href="../js/css/cupertino/jquery-ui-1.8.custom.css"
		rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="../js/css/jquery.jgrowl.css"
		type="text/css" />
	<script type="text/javascript" src="../js/jquery.jgrowl.js"></script>


	<script type="text/javascript">
	jQuery.noConflict();
</script>

	<title>BD-Prod</title>

	<style type="text/css">
.label {
	font-weight: bold;
	margin-right: 10px;
}

.myPosition {
	position: absolute;
	right: 200px;
	top: 300px;
}
</style>


	</head>
	<body>





	<div id="wrapper"><f:subview id="menuPrincipal">
		<jsp:include page="../menuPrincipal.jsp"></jsp:include>
	</f:subview> <!-- start header --> <!-- end header --> <!-- start page -->
	<div id="page">
	<div id="container" style="margin-top: 30px;"><h:form
		styleClass="niceform" prependId="false">


		<div id="panelConfirmacao" align="center"><h:messages
			id="confirmacao" errorClass="erroConfirmacao"
			infoClass="sucessoConfirmacao" layout="table" showSummary="true"
			showDetail="false" globalOnly="true"></h:messages></div>


		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarFuncao}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarFuncao" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarFuncao}">

			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarFuncao}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{adminHandler.refreshFuncao}"
				immediate="true" /> <h:commandButton value="Salvar"
				action="#{adminHandler.salvarFuncao}">

			</h:commandButton></div>
		</h:panelGroup>


		<f:subview id="editarFuncao"
			rendered="#{sessionHandler.navigation.mostrarEditarFuncao}">
			<jsp:include page="/administracao/editarFuncao.jsp"></jsp:include>
		</f:subview>

		<f:subview id="visualizarFuncao"
			rendered="#{sessionHandler.navigation.mostrarVisualizarFuncao}">
			<jsp:include page="/administracao/visualizarFuncao.jsp"></jsp:include>
		</f:subview>





		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarFuncao}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarFuncao" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarFuncao}">

			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarFuncao}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{adminHandler.refreshFuncao}"
				immediate="true" /> <h:commandButton value="Salvar"
				action="#{adminHandler.salvarFuncao}">

			</h:commandButton></div>
		</h:panelGroup>
	</h:form></div>
	</div>
	</div>
	<!-- end page -->

	<div id="footer"></div>

	</body>
	</html>
</f:view>
