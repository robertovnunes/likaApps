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

		jQuery('#dialogResponsavel').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogIntegrantes').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
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

		jQuery('#dialogSubAreas').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogGrupo').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogNovaPublicacao').dialog( {
			autoOpen : false,
			width : 820,
			height : 450,
			closeOnEscape : false
		});

		jQuery('#dialogTipoPublicacao').dialog( {
			autoOpen : false,
			width : 400,
			height : 200,
			closeOnEscape : false
		});

		jQuery('#dialogAutores').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false,
			modal : true,
			position : 'center'
		});

		jQuery('#dialogNovoEquipamento').dialog( {
			autoOpen : false,
			width : 820,
			height : 450,
			closeOnEscape : false
		});

		jQuery('#dialogLabEquip').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogTipoAutor').dialog( {
			autoOpen : false,
			width : 320,
			height : 130,
			closeOnEscape : false,
			modal : true,
			position : 'center'
		});

		jQuery('#dialogAutorExterno').dialog( {
			autoOpen : false,
			width : 620,
			height : 200,
			closeOnEscape : false,
			modal : true,
			position : 'center'
		});

	});

	function trocaCursor(tipo, btn) {
		this.document.body.style.cursor = tipo;
		btn.style.cursor = "wait";
	}
</script>

	<title>BD-Prod</title>

	<style type="text/css">
div.jGrowl div.smoke {
	background-color: #4682B4;
	width: 400px;
	height: 20px;
	overflow: hidden;
	font-weight: bold;
}

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

		<h:commandButton value="Cadastro do Projeto"
			rendered="#{sessionHandler.navigation.mostrarVisualizarProjeto}"
			actionListener="#{relatorioHandler.gerarCadastroProjeto}">
			<f:attribute name="projeto" value="#{projetoHandler.projetoAtual}" />
		</h:commandButton>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarProjeto}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarProjeto" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarProjeto}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{projetoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarProjeto}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{projetoHandler.refresh}" immediate="true" />
			<h:commandButton value="Salvar"
				action="#{projetoHandler.salvarProjeto}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{projetoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>


		<f:subview id="editarProjeto"
			rendered="#{sessionHandler.navigation.mostrarEditarProjeto}">
			<jsp:include page="/projeto/editarProjeto.jsp"></jsp:include>
		</f:subview>

		<f:subview id="visualizarProjeto"
			rendered="#{sessionHandler.navigation.mostrarVisualizarProjeto}">
			<jsp:include page="/projeto/visualizarProjeto.jsp"></jsp:include>
		</f:subview>

		<div align="center"><h:panelGrid columns="4">
			<h:outputLabel value="Atualizado por: "></h:outputLabel>

			<h:outputLabel style="font-weight:bold;"
				value="#{projetoHandler.projetoAtual.usuarioAtualizou.login}"
				rendered="#{projetoHandler.projetoAtual.usuarioAtualizou != null}"></h:outputLabel>

			<h:outputLabel style="font-weight:bold;" value=" - "
				rendered="#{projetoHandler.projetoAtual.usuarioAtualizou == null}"></h:outputLabel>

			<h:outputLabel value="  Em: "></h:outputLabel>
			<h:outputText value="#{projetoHandler.projetoAtual.dataAtualizacao}"
				style="font-weight:bold;" escape="false">
				<f:convertDateTime type="both" dateStyle="default"
					pattern="dd/MM/yyyy 'às' HH:mm:ss" />
			</h:outputText>


		</h:panelGrid></div>



		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarVisualizarProjeto}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Voltar" action="pesquisarProjeto" /> <h:commandButton
				value="Editar" action="#{sessionHandler.navigation.editarProjeto}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{projetoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>

		<h:panelGroup
			rendered="#{sessionHandler.navigation.mostrarEditarProjeto}">
			<div align="right" style="margin-top: 20px;"><h:commandButton
				value="Cancelar" action="#{projetoHandler.refresh}" /> <h:commandButton
				value="Salvar" action="#{projetoHandler.salvarProjeto}">
				<f:setPropertyActionListener value="#{sessionHandler.usuario}"
					target="#{projetoHandler.usr}" />
			</h:commandButton></div>
		</h:panelGroup>
	</h:form></div>
	</div>
	</div>
	<!-- end page -->

	<div id="footer"></div>




	<div id="teste" class="center"></div>

	<div style="margin-top: 150px;"><f:subview id="lookupResponsavel">
		<jsp:include page="/projeto/lookup/lookupResponsavel.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupIntegrantes">
		<jsp:include page="/projeto/lookup/lookupIntegrantes.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupAreas">
		<jsp:include page="/projeto/lookup/lookupAreas.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupSubAreas">
		<jsp:include page="/projeto/lookup/lookupSubAreas.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupNovaPublicacao">
		<jsp:include page="/projeto/lookup/lookupNovaPublicacao.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupAutores">
		<jsp:include page="/projeto/lookup/lookupAutores.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupNovoEquipamento">
		<jsp:include page="/projeto/lookup/lookupNovoEquipamento.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupLabEquip">
		<jsp:include page="/projeto/lookup/lookupLabEquip.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupGrupo">
		<jsp:include page="/projeto/lookup/lookupGrupo.jsp"></jsp:include>
	</f:subview></div>

	</body>
	</html>
</f:view>
