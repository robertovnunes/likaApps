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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link href="../css/styleMenus.css" rel="stylesheet" type="text/css" />
	<link href="../css/tabela.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../css/niceforms.js"></script>
	<link rel="stylesheet" type="text/css" media="all"
		href="../css/niceforms-default.css" />
	<script type="text/javascript" src="../js/mascaras.js"></script>

	<link rel="stylesheet" href="../js/css/jquery.jgrowl.css"
		type="text/css" />
	<script type="text/javascript" src="../js/jquery.jgrowl.js"></script>


	<script type="text/javascript">
	
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
			rendered="#{sessionHandler.navigation.mostrarVisualizarArea}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarArea" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarArea}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{areaHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarArea}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{areaHandler.refreshArea}" /> <h:commandButton
				value="Salvar" action="#{areaHandler.salvarArea}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{areaHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>


		<f:subview id="editarArea"
			rendered="#{sessionHandler.navigation.mostrarEditarArea}">
			<jsp:include page="/areaDePesquisa/editarArea.jsp"></jsp:include>
		</f:subview>

		<f:subview id="visualizarArea"
			rendered="#{sessionHandler.navigation.mostrarVisualizarArea}">
			<jsp:include page="/areaDePesquisa/visualizarArea.jsp"></jsp:include>
		</f:subview>


		<div align="center"><h:panelGrid columns="4">
			<h:outputLabel value="Atualizado por: "></h:outputLabel>

			<h:outputLabel style="font-weight:bold;"
				value="#{areaHandler.areaDePesquisaAtual.usuarioAtualizou.login}"
				rendered="#{areaHandler.areaDePesquisaAtual.usuarioAtualizou != null}"></h:outputLabel>

			<h:outputLabel style="font-weight:bold;" value=" - "
				rendered="#{areaHandler.areaDePesquisaAtual.usuarioAtualizou == null}"></h:outputLabel>

			<h:outputLabel value="  Em: "></h:outputLabel>
			<h:outputText
				value="#{areaHandler.areaDePesquisaAtual.dataAtualizacao}"
				style="font-weight:bold;" escape="false">
				<f:convertDateTime type="both" dateStyle="default"
					pattern="dd/MM/yyyy 'às' HH:mm:ss" />
			</h:outputText>


		</h:panelGrid></div>


		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarArea}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarArea" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarArea}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{areaHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarArea}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{areaHandler.refreshArea}" /> <h:commandButton
				value="Salvar" action="#{areaHandler.salvarArea}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{areaHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>
	</h:form></div>
	</div>
	</div>
	<!-- end page -->

	<div id="footer"></div>

	<div id="teste" class="center"></div>


	</body>
	</html>
</f:view>
