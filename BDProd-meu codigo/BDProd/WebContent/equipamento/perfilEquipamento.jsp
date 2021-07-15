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


	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.8.custom.min.js"></script>
	<link href="../js/css/cupertino/jquery-ui-1.8.custom.css"
		rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="../js/css/jquery.jgrowl.css"
		type="text/css" />
	<script type="text/javascript" src="../js/jquery.jgrowl.js"></script>


	<script type="text/javascript">
	jQuery.noConflict();

	jQuery(document).ready(function() {

		jQuery('#dialogLaboratorios').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

	});
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
			rendered="#{sessionHandler.navigation.mostrarVisualizarEquipamento}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarEquipamentos" /> <h:commandButton
				value="Editar"
				action="#{sessionHandler.navigation.editarEquipamento}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{equipamentoHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarEquipamento}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{equipamentoHandler.refresh}" /> <h:commandButton
				value="Salvar" action="#{equipamentoHandler.salvarEquipamento}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{equipamentoHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>


		<f:subview id="editarEquipamento"
			rendered="#{sessionHandler.navigation.mostrarEditarEquipamento}">
			<jsp:include page="/equipamento/editarEquipamento.jsp"></jsp:include>
		</f:subview>

		<f:subview id="visualizarEquipamento"
			rendered="#{sessionHandler.navigation.mostrarVisualizarEquipamento}">
			<jsp:include page="/equipamento/visualizarEquipamento.jsp"></jsp:include>
		</f:subview>

		<div align="center"><h:panelGrid columns="4">
			<h:outputLabel value="Atualizado por: "></h:outputLabel>

			<h:outputLabel style="font-weight:bold;"
				value="#{equipamentoHandler.equipamentoAtual.usuarioAtualizou.login}"
				rendered="#{equipamentoHandler.equipamentoAtual.usuarioAtualizou != null}"></h:outputLabel>

			<h:outputLabel style="font-weight:bold;" value=" - "
				rendered="#{equipamentoHandler.equipamentoAtual.usuarioAtualizou == null}"></h:outputLabel>

			<h:outputLabel value="  Em: "></h:outputLabel>
			<h:outputText
				value="#{equipamentoHandler.equipamentoAtual.dataAtualizacao}"
				style="font-weight:bold;" escape="false">
				<f:convertDateTime type="both" dateStyle="default"
					pattern="dd/MM/yyyy 'às' HH:mm:ss" />
			</h:outputText>


		</h:panelGrid></div>


		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarEquipamento}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarEquipamentos" /> <h:commandButton
				value="Editar"
				action="#{sessionHandler.navigation.editarEquipamento}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{equipamentoHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarEquipamento}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{equipamentoHandler.refresh}" /> <h:commandButton
				value="Salvar" action="#{equipamentoHandler.salvarEquipamento}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{equipamentoHandler.user}" />
			</h:commandButton></div>
		</h:panelGroup>
	</h:form></div>
	</div>
	</div>
	<!-- end page -->

	<div id="footer"></div>


	<f:subview id="lookupLaboratorios">
		<jsp:include page="/equipamento/lookup/lookupLaboratorios.jsp"></jsp:include>
	</f:subview>
	<div id="teste" class="center"></div>
	</body>
	</html>
</f:view>
