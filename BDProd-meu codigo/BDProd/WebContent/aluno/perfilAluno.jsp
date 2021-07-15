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

	jQuery(document).ready(function() {

		jQuery('#dialogTipoProjeto').dialog( {
			autoOpen : false,
			width : 320,
			height : 130,
			closeOnEscape : false,
			modal : true
		});

		jQuery('#dialogProjetoAluno').dialog( {
			autoOpen : false,
			width : 620,
			height : 300,
			closeOnEscape : false
		});

		jQuery('#dialogOrientador').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogCracha').dialog( {
			autoOpen : false,
			width : 550,
			height : 250,
			closeOnEscape : false
		});

		jQuery('#dialogLaboratorios').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogTitulacao').dialog( {
			autoOpen : false,
			width : 900,
			height : 120,
			closeOnEscape : false,
			dialogClass : 'myPosition'

		});

		jQuery('#dialogNomeSubprojeto').dialog( {
			autoOpen : false,
			width : 620,
			height : 150,
			closeOnEscape : false

		});

		jQuery('#dialogAreas').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogProjetos').dialog( {
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


		<h:commandButton value="Ficha Cadastral"
			rendered="#{sessionHandler.navigation.mostrarVisualizarAluno}"
			actionListener="#{relatorioHandler.gerarCadastroAluno}">
			<f:attribute name="aluno" value="#{alunoHandler.alunoAtual}" />
		</h:commandButton>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarAluno}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarAluno" /> 
				<h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarAluno}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{alunoHandler.usr}" />
			</h:commandButton>
			<h:commandButton value="Tornar Pesquisador" action="#{alunoHandler.tornarPesquisador}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{alunoHandler.usr}" />
			</h:commandButton>
			</div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarAluno}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{alunoHandler.refresh}" immediate="true" />
			<h:commandButton value="Salvar" action="#{alunoHandler.salvarAluno}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{alunoHandler.usr}" />
			</h:commandButton>
			</div>
		</h:panelGroup>


		<f:subview id="editarAluno"
			rendered="#{sessionHandler.navigation.mostrarEditarAluno}">
			<jsp:include page="/aluno/editarAluno.jsp"></jsp:include>
		</f:subview>

		<f:subview id="visualizarAluno"
			rendered="#{sessionHandler.navigation.mostrarVisualizarAluno}">
			<jsp:include page="/aluno/visualizarAluno.jsp"></jsp:include>
		</f:subview>

		<div align="center"><h:panelGrid columns="4">
			<h:outputLabel value="Atualizado por: "></h:outputLabel>

			<h:outputLabel style="font-weight:bold;"
				value="#{alunoHandler.alunoAtual.usuarioAtualizou.login}"
				rendered="#{alunoHandler.alunoAtual.usuarioAtualizou != null}"></h:outputLabel>

			<h:outputLabel style="font-weight:bold;" value=" - "
				rendered="#{alunoHandler.alunoAtual.usuarioAtualizou == null}"></h:outputLabel>

			<h:outputLabel value="  Em: "></h:outputLabel>
			<h:outputText value="#{alunoHandler.alunoAtual.dataAtualizacao}"
				style="font-weight:bold;" escape="false">
				<f:convertDateTime type="both" dateStyle="default"
					pattern="dd/MM/yyyy 'às' HH:mm:ss" />
			</h:outputText>


		</h:panelGrid></div>



		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarAluno}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="#{sessionHandler.navigation.visualizarAluno}" />
			<h:commandButton value="Editar"
				action="#{sessionHandler.navigation.editarAluno}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{alunoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarAluno}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{alunoHandler.refresh}" immediate="true" />
			<h:commandButton value="Salvar" action="#{alunoHandler.salvarAluno}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{alunoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>
	</h:form></div>
	</div>
	</div>
	<!-- end page -->

	<div id="footer"></div>


	<f:subview id="criarCracha">
		<jsp:include page="/aluno/criarCracha.jsp"></jsp:include>
	</f:subview>

	<f:subview id="lookupLaboratorios">
		<jsp:include page="/aluno/lookup/lookupLaboratorios.jsp"></jsp:include>
	</f:subview>
	<f:subview id="lookupTitulacao">
		<jsp:include page="/aluno/lookup/lookupTitulacao.jsp"></jsp:include>
	</f:subview>
	<f:subview id="lookupProjetos">
		<jsp:include page="/aluno/lookup/lookupProjetos.jsp"></jsp:include>
	</f:subview>
	<f:subview id="lookupAreas">
		<jsp:include page="/aluno/lookup/lookupAreas.jsp"></jsp:include>
	</f:subview>

	<f:subview id="lookupOrientador">
		<jsp:include page="/aluno/lookup/lookupOrientador.jsp"></jsp:include>
	</f:subview>

	<div id="teste" class="center"></div>

	</body>
	</html>
</f:view>
