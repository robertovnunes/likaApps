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

		jQuery('#dialogOrientador').dialog( {
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




			<div align="center"><h:panelGrid columns="7">
				<a4j:outputPanel id="panelTipo">
					<h:outputLabel value="Tipo do Aluno:"></h:outputLabel>
					<br />
					<h:selectOneMenu id="tipo" value="#{relatorioAlunosAtivosHandler.tipo}"
						>
						<f:selectItem itemLabel="Todos os Tipos"
							itemValue="Todos os Tipos" />
						<f:selectItem itemLabel="IC" itemValue="IC" />
						<f:selectItem itemLabel="Estagiário" itemValue="Estagiário" />
						<f:selectItem itemLabel="Mestrado" itemValue="Mestrado" />
						<f:selectItem itemLabel="Doutorado" itemValue="Doutorado" />
						<f:selectItem itemLabel="Especialização"
							itemValue="Especialização" />
						<f:selectItem itemLabel="Outros" itemValue="Outros" />

					</h:selectOneMenu>
				</a4j:outputPanel>

				<rich:spacer width="30"></rich:spacer>


				<a4j:outputPanel id="panelSituacao">
					<h:outputLabel value="Situação do Aluno:"></h:outputLabel>
					<br />
					<h:selectOneMenu value="#{relatorioAlunosAtivosHandler.situacao}"
						immediate="true"
						>
						<f:selectItem itemLabel="Todos" itemValue="" />
						<f:selectItem itemLabel="em Atividade" itemValue="em Atividade" />
						<f:selectItem itemLabel="Desligado" itemValue="Desligado" />


					</h:selectOneMenu>

				</a4j:outputPanel>


				<rich:spacer width="30"></rich:spacer>

				<h:panelGroup>
					<h:outputLabel value="Período:"></h:outputLabel>
					<br />
					<h:inputText size="5" maxlength="4"
						onkeypress="mascara(this,soNumeros)"
						value="#{relatorioAlunosAtivosHandler.dataInicio}"></h:inputText>
					<h:outputLabel value="à" style="margin-right: 2px;"></h:outputLabel>
					<h:inputText size="5" maxlength="4"
						onkeypress="mascara(this,soNumeros)"
						value="#{relatorioAlunosAtivosHandler.dataFim}"></h:inputText>
				</h:panelGroup>

				<rich:spacer width="30"></rich:spacer>

				<h:panelGroup>
					<h:outputLabel value="Tipo do Filtro:"></h:outputLabel>
					<br />
					<h:selectOneMenu value="#{relatorioAlunosAtivosHandler.tipoFiltro}"
						immediate="true">
						<f:selectItem itemLabel="Geral do LIKA" itemValue="Geral do LIKA" />
						<f:selectItem itemLabel="Por Orientador"
							itemValue="Por Orientador" />
						<f:selectItem itemLabel="Por Projetos" itemValue="Por Projetos" />

						<a4j:support event="onchange"
							action="#{relatorioAlunosAtivosHandler.tipoFiltroChanged}"
							reRender="panels, msgs, panelTipo, panelSituacao" status="a"></a4j:support>


					</h:selectOneMenu>

				</h:panelGroup>

			</h:panelGrid></div>

			<h:panelGroup id="panels">
				<h:panelGroup id="panelOrientador"
					rendered="#{relatorioAlunosAtivosHandler.tipoFiltro == 'Por Orientador'}">
					<br />
					<div style="margin-left: 255px;"><h:outputLabel
						value="Nome do Orientador:" /> <br />
					<h:inputText value="#{relatorioAlunosAtivosHandler.pesquisador.nome}"
						disabled="true" style="width:430px;" /> <br />
					</div>

				</h:panelGroup>



				<div style="padding-left: 620px;"><a4j:commandLink
					rendered="#{relatorioAlunosAtivosHandler.tipoFiltro == 'Por Orientador'}"
					onclick="jQuery('#dialogOrientador').dialog('open')">
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
			<div align="center"><h:commandButton value="Gerar Relatório"
				actionListener="#{relatorioAlunosAtivosHandler.gerarDadosAluno}">
				
				<a4j:support event="oncomplete" reRender="msgs"></a4j:support>
			</h:commandButton></div>

		</h:form>
	</a4j:region></div>
	</div>
	</div>
	<!-- end page -->



	<div id="footer"></div>



	<div style="margin-top: 150px;"><f:subview id="lookupOrientador">
		<jsp:include
			page="/relatorio/lookupRelatorioAlunos/lookupOrientadorResumido.jsp"></jsp:include>
	</f:subview></div>
	</body>
	</html>
</f:view>
