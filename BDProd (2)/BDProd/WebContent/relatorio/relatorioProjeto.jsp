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

	<title>BD-Prod</title>

	<script type="text/javascript">
	jQuery.noConflict();

	jQuery(document).ready(function() {

		jQuery('#dialogResponsavel').dialog( {
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

		jQuery('#dialogGrupo').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});

		jQuery('#dialogAreas').dialog( {
			autoOpen : false,
			width : 620,
			height : 350,
			closeOnEscape : false
		});
	});
</script>

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

.erro {
	color: red;
}
</style>


	</head>
	<body>





	<div id="wrapper"><f:subview id="menuPrincipal">
		<jsp:include page="../menuPrincipal.jsp"></jsp:include>
	</f:subview> <!-- start header --> <!-- end header --> <!-- start page -->
	<div id="page">
	<div id="container" style="margin-top: 30px;"><a4j:region
		id="regiao">
		<h:form styleClass="niceform" prependId="false">




			<div align="center"><h:panelGrid columns="5">
				<h:panelGroup>
					<h:outputLabel value="Tipo do Projeto:"></h:outputLabel>
					<br />
					<h:selectOneMenu value="#{relatorioProjetoHandler.tipo}">
						<f:selectItem itemLabel="Todos os Tipos"
							itemValue="Todos os Tipos" />
						<f:selectItem itemLabel="Financiados" itemValue="Financiados" />
						<f:selectItem itemLabel="N??o Financiados"
							itemValue="N??o Financiados" />

					</h:selectOneMenu>
				</h:panelGroup>

				<rich:spacer width="30"></rich:spacer>

				<h:panelGroup>
					<h:outputLabel value="Per??odo:"></h:outputLabel>
					<br />
					<h:inputText size="5" maxlength="4"
						onkeypress="mascara(this,soNumeros)"
						value="#{relatorioProjetoHandler.dataInicio}"></h:inputText>
					<h:outputLabel value="??" style="margin-right: 2px;"></h:outputLabel>
					<h:inputText size="5" maxlength="4"
						onkeypress="mascara(this,soNumeros)"
						value="#{relatorioProjetoHandler.dataFim}"></h:inputText>
				</h:panelGroup>

				<rich:spacer width="30"></rich:spacer>

				<h:panelGroup>
					<h:outputLabel value="Tipo do Filtro:"></h:outputLabel>
					<br />
					<h:selectOneMenu value="#{relatorioProjetoHandler.tipoFiltro}"
						immediate="true"
						valueChangeListener="#{relatorioProjetoHandler.tipoFiltroChanged}">
						<f:selectItem itemLabel="Geral do LIKA" itemValue="Geral do LIKA" />
						<f:selectItem itemLabel="Por Respons??vel"
							itemValue="Por Respons??vel" />
						<f:selectItem itemLabel="Por Grupo de Pesquisa"
							itemValue="Por Grupo de Pesquisa" />
						<f:selectItem itemLabel="Por ??rea de Pesquisa"
							itemValue="Por ??rea de Pesquisa" />
						<a4j:support event="onchange" reRender="panels, msgs" status="a"></a4j:support>


					</h:selectOneMenu>

				</h:panelGroup>

			</h:panelGrid></div>

			<h:panelGroup id="panels">
				<h:panelGroup id="panelResponsavel"
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por Respons??vel'}">
					<br />
					<div style="margin-left: 255px;"><h:outputLabel
						value="Nome do Respons??vel:" /> <br />
					<h:inputText value="#{relatorioProjetoHandler.pesquisador.nome}"
						disabled="true" style="width:430px;" /> <br />
					</div>

				</h:panelGroup>




				<h:panelGroup id="panelGrupo"
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por Grupo de Pesquisa'}">
					<br />
					<div style="margin-left: 255px;"><h:outputLabel
						value="Nome do Grupo de Pesquisa:" /> <br />
					<h:inputText value="#{relatorioProjetoHandler.grupo.nome}"
						disabled="true" style="width:430px;" /> <br />
					</div>

				</h:panelGroup>

				<h:panelGroup id="panelArea"
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por ??rea de Pesquisa'}">
					<br />
					<div style="margin-left: 255px;"><h:outputLabel
						value="Nome da ??rea de Pesquisa:" /> <br />
					<h:inputText value="#{relatorioProjetoHandler.areaDePesquisa.nome}"
						disabled="true" style="width:430px;" /> <br />
					</div>

				</h:panelGroup>

				<div style="padding-left: 620px;"><a4j:commandLink
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por Grupo de Pesquisa'}"
					onclick="jQuery('#dialogGrupo').dialog('open')">

					<h:graphicImage value="../css/images/selecionar.png"></h:graphicImage>
				</a4j:commandLink></div>

				<div style="padding-left: 620px;"><a4j:commandLink
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por Respons??vel'}"
					onclick="jQuery('#dialogResponsavel').dialog('open')">
					<h:graphicImage value="../css/images/selecionar.png"></h:graphicImage>
				</a4j:commandLink></div>



				<div style="padding-left: 620px;"><a4j:commandLink
					rendered="#{relatorioProjetoHandler.tipoFiltro == 'Por ??rea de Pesquisa'}"
					onclick="jQuery('#dialogAreas').dialog('open')">
					<h:graphicImage value="../css/images/selecionar.png"></h:graphicImage>

				</a4j:commandLink></div>

			</h:panelGroup>
			<br />

			<a4j:outputPanel id="msgs">
				<div align="center"><h:messages id="confirmacao"
					errorClass="erro" infoClass="sucessoConfirmacao" layout="table"
					showSummary="true" showDetail="false" globalOnly="true" /></div>
			</a4j:outputPanel>
			<div align="center"><a4j:status for="regiao">
				<f:facet name="start">
					<h:graphicImage value="../css/images/carregando.gif" />
				</f:facet>
			</a4j:status></div>

			<br />
			<div align="center"><h:commandButton value="Gerar Relat??rio"
				actionListener="#{relatorioProjetoHandler.gerarDadosProjeto}">
				<a4j:support event="oncomplete" reRender="msgs"></a4j:support>
			</h:commandButton></div>
		</h:form>
	</a4j:region></div>
	</div>
	</div>
	<!-- end page -->



	<div id="footer"></div>



	<div style="margin-top: 150px;"><f:subview id="lookupResponsavel">
		<jsp:include
			page="/relatorio/lookupRelatorioProjetos/lookupResponsavel.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupGrupo">
		<jsp:include page="/relatorio/lookupRelatorioProjetos/lookupGrupo.jsp"></jsp:include>
	</f:subview> <f:subview id="lookupAreas">
		<jsp:include page="/relatorio/lookupRelatorioProjetos/lookupAreas.jsp"></jsp:include>
	</f:subview></div>
	</body>
	</html>
</f:view>
