<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/styleMenus.css" rel="stylesheet" type="text/css" />
<title>JSP Page</title>
</head>
<body>
<f:subview id="lookupProjetos">

	<div id="dialogProjetoAluno" title="Adicionar Novo Projeto Aluno">
	<h:form styleClass="niceform">
		<h:panelGroup id="panelProjetoAluno">
			<h:outputLabel value="Nome do Projeto:" />
			<br />
			<h:inputText id="nomeProjetoSimples" style="width:570px;"
				maxlength="180" value="#{alunoHandler.projetoSimples.nome}" />
			<br />
			<br />
			<h:outputLabel value="Subprojeto:" />
			<br />
			<h:inputTextarea id="subprojeto" style="width:570px; height:50px;"
				value="#{alunoHandler.projetoSimples.subprojeto}"
				onkeyup="this.value = this.value.substring(0, 200);" />
			<br />
			<br />
			<h:outputLabel value="Duração:" />
			<br />
			<h:inputText size="4" value="#{alunoHandler.projetoSimples.duracao}"
				style="margin-right:3px;" maxlength="3"
				onkeypress="mascara(this,soNumeros)" />

			<h:selectOneMenu value="#{alunoHandler.projetoSimples.tipoDuracao}">
				<f:selectItem itemLabel="Dia(s)" itemValue="Dia(s)" />
				<f:selectItem itemLabel="Mês(es)" itemValue="Mês(es)" />
			</h:selectOneMenu>
		</h:panelGroup>
		<br />
		<div align="center"><h:panelGrid columns="2">



			<a4j:commandLink
				onclick="jQuery('#dialogProjetoAluno').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>


			<a4j:commandLink
				onclick="jQuery('#dialogProjetoAluno').dialog('close')"
				action="#{alunoHandler.adicionarProjetoSimples}"
				reRender="panelProjetos">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>






		</h:panelGrid></div>
	</h:form></div>


	<div id="dialogTipoProjeto" title="Escolha do Tipo do Projeto"><h:form
		styleClass="niceform">

		<h:selectOneRadio id="tipoProjeto"
			value="#{alunoHandler.projetoAluno}">
			<f:selectItem itemValue="true" itemLabel="Projeto Aluno" />
			<f:selectItem itemValue="false" itemLabel="Projeto Pesquisador" />
			<a4j:support event="onclick" reRender="panelTipo"></a4j:support>

		</h:selectOneRadio>

		<br />
		<div align="center"><h:panelGrid columns="2" id="panelTipo">



			<a4j:commandLink
				onclick="jQuery('#dialogTipoProjeto').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>



			<a4j:commandLink
				onclick="jQuery('#dialogTipoProjeto').dialog('close') "
				oncomplete="jQuery('#dialogProjetos').dialog('open')"
				rendered="#{alunoHandler.projetoAluno == false}"
				action="#{projetoHandler.listarPorNome}"
				reRender="novoProjeto">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>


			<a4j:commandLink
				onclick="jQuery('#dialogTipoProjeto').dialog('close') "
				oncomplete="jQuery('#dialogProjetoAluno').dialog('open')"
				rendered="#{alunoHandler.projetoAluno == true}"
				reRender="panelProjetoAluno">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>




		</h:panelGrid></div>
	</h:form></div>


	<div id="dialogNomeSubprojeto" title="Nome do Subprojeto"><h:form
		styleClass="niceform">

		<h:inputTextarea id="subprojeto" style="width:570px; height:50px;"
			value="#{alunoHandler.nomeSubProjeto}" />

		<br />
		<div align="center"><h:panelGrid columns="2">





			<a4j:commandLink
				onclick="jQuery('#dialogNomeSubprojeto').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>



			<a4j:commandLink
				onclick="jQuery('#dialogNomeSubprojeto').dialog('close')"
				action="#{alunoHandler.adicionarProjetosCompleto}"
				reRender="panelProjetos">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>


		</h:panelGrid></div>
	</h:form></div>








	<!-- ui-dialog -->
	<div id="dialogProjetos" title="Associar Projeto ao "><h:form
		styleClass="niceform">
		<div align="center" style="margin-bottom: 15px; margin-top: 15px;">

		<h:panelGroup>

			<h:inputText id="buscarNomeProjeto" style="width: 400px"
				value="#{projetoHandler.parametroPesquisa}" />

			<a4j:commandButton id="botaoBuscarProjeto" value="Buscar"
				reRender="novoProjeto" action="#{projetoHandler.listarPorNome}"
				onclick="this.disabled=true" oncomplete="this.disabled=false">
			</a4j:commandButton>
		</h:panelGroup> <a4j:outputPanel id="novoProjeto">

			<h:panelGroup rendered="#{empty projetoHandler.projetos}">
				<div id="nenhum" align="center" style="color: red;"><h:outputText
					value="Nenhum Projeto econtrado. " /></div>
			</h:panelGroup>


			<rich:dataTable id="tabelaResultado"
				value="#{projetoHandler.projetos}" var="proj" cellpadding="2"
				cellspacing="2" style="width:580px; margin-top:15px;" rows="5"
				styleClass="mytable" rendered="#{!empty projetoHandler.projetos }">
				<rich:column id="nome">
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 450px"><h:outputText value="#{proj.nome}"></h:outputText>
					</div>
				</rich:column>


				<rich:column id="opcoes">
					<f:facet name="header">
						<h:outputText value="Opções"></h:outputText>
					</f:facet>
					<div style="width: 60px" align="center"><a4j:commandLink
						ajaxSingle="true"
						onclick="jQuery('#dialogProjetos').dialog('close') "
						oncomplete="jQuery('#dialogNomeSubprojeto').dialog('open')"
						value="Selecionar" action="#{alunoHandler.adicionarProjeto}"
						reRender="subprojeto">
						<f:setPropertyActionListener value="#{proj}"
							target="#{alunoHandler.projetoAdicionado}" />
					</a4j:commandLink></div>
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller fastControls="hide">

						<f:facet name="first">
							<h:outputText value="Primeira" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="first_disabled">
							<h:outputText value="Primeira" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="last">
							<h:outputText value="Última" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="last_disabled">
							<h:outputText value="Última" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous_disabled">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next">
							<h:outputText value="Próxima" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next_disabled">
							<h:outputText value="Próxima" styleClass="scrollerCell" />
						</f:facet>


					</rich:datascroller>
				</f:facet>

			</rich:dataTable>


		</a4j:outputPanel></div>
		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">


			<a4j:commandLink onclick="jQuery('#dialogProjetos').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>


		</h:panelGrid></div>
	</h:form></div>
</f:subview>
</body>
</html>

