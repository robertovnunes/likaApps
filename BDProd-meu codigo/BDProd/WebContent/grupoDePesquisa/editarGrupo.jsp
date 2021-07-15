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



<html>

<script type="text/javascript">
	(function(jQuery) {

		jQuery(document)
				.ready(
						function() {

							jQuery('#teste')
									.jGrowl(
											"Atenção: As alterações realizadas só serão confirmadas após serem salvas!",
											{
												closer : false,
												sticky : false,
												glue : 'before',
												speed : 1500,
												theme : 'smoke',
												easing : 'easeInOutElastic',

												animateClose : {
													height : "hide",
													width : "show"
												}
											});

						});
	})(jQuery);
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.rich-datascr {
	border: 1;
}

.rich-table-cell {
	
}

.rich-table-sortable-header {
	font-weight: bold;
}

td.rich-datascr-button {
	background-color: #fff;
	border-top: 1px;
	border-top-style: solid;
	text-decoration: none;
	border: 0px solid #ccc;
}

td.rich-datascr-button-dsbld {
	background-color: #fff;
}

.rich-datascr-ctrls-separator {
	padding-right: 5px;
}

.rich-dtascroller-table {
	background: #fff;
	border: 0;
}

.scroller {
	display: block;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 3px 3px;
	margin: 0px 5px 5px 5px;
	text-decoration: none;
}

.scroller:hover {
	background-color: #eee;
}

td.rich-datascr-button-dsbld .scroller {
	background-color: #eee;
}

td.rich-datascr-inact {
	color: #000;
	border: 0;
}

td.rich-datascr-inact:hover {
	text-decoration: underline;
}

td.rich-datascr-act {
	text-decoration: underline;
}

td.rich-datascr-act {
	border: 0;
	font-weight: bold;
}
</style>

</head>
<body>
<f:subview id="editarGrupo">

	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGroup>
		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Nome:" />
				<br />
				<h:inputText style="width:620px;" value="#{grupoHandler.grupoAtual.nome}"></h:inputText>
			</h:panelGroup>
		</h:panelGrid>

		<h:panelGrid columns="5">
			<h:panelGroup>
				<h:outputText value="Grupo do CNPQ:" />
				<br />
				<h:selectOneRadio value="#{grupoHandler.grupoAtual.grupoCnpq}">
					<f:selectItem itemLabel="Sim" itemValue="true" />
					<f:selectItem itemLabel="Não" itemValue="false" />
				</h:selectOneRadio>
			</h:panelGroup>

			<rich:spacer width="20"></rich:spacer>

			<h:panelGroup>
				<h:outputText value="Situação:" />
				<br />
				<h:selectOneMenu value="#{grupoHandler.grupoAtual.situacao}">
					<f:selectItem itemLabel="em Atividade" itemValue="em Atividade" />
					<f:selectItem itemLabel="Desligado" itemValue="Desligado" />
				</h:selectOneMenu>
			</h:panelGroup>

			<rich:spacer width="20"></rich:spacer>

			<h:panelGroup>
				<h:outputText value="Data Desligamento:" />
				<br />
				<rich:calendar value="#{grupoHandler.grupoAtual.dataEncerramento}"
					id="calendario2" datePattern="dd/MM/yyyy" showApplyButton="false"
					cellWidth="24px" cellHeight="22px" enableManualInput="true"
					requiredMessage="É necessário informar a Data da Solicitação"
					converterMessage="Data da Solicitação inválida!" />
			</h:panelGroup>



		</h:panelGrid>

		<h:panelGrid columns="1">

			<h:panelGroup id="panelResponsavel">
				<h:outputLabel value="Responsável:" />
				<br />
				<h:outputText styleClass="visualizar_texto"
					value="#{grupoHandler.grupoAtual.responsavel.nome}"
					rendered="#{grupoHandler.grupoAtual.responsavel != null}" />

				<h:outputText style="color:red; margin-left:3px;"
					value="Nenhum Responsável associado."
					rendered="#{grupoHandler.grupoAtual.responsavel == null}" />

				<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
					rendered="#{grupoHandler.grupoAtual.responsavel != null}"
					action="#{grupoHandler.removerResponsavel}"
					reRender="panelResponsavel">
					<f:attribute value="resp" name="resp" />
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Responsável" alt="Remover Responsável" width="15"
						height="15"></h:graphicImage>
				</a4j:commandLink>


				<br />
				<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
					rendered="#{grupoHandler.grupoAtual.responsavel == null}"
					onclick="jQuery('#dialogResponsavel').dialog('open')">
					<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
				</a4j:commandLink>

			</h:panelGroup>

		</h:panelGrid>



		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Email:" />
				<br />
				<h:inputText style="width:620px;" value="#{grupoHandler.grupoAtual.email}"></h:inputText>
			</h:panelGroup>






			<h:panelGroup>
				<h:outputText value="Site:" />
				<br />
				<h:inputText style="width:620px;" value="#{grupoHandler.grupoAtual.url}"></h:inputText>
			</h:panelGroup>





			<h:panelGroup>
				<h:outputText value="Objetivo:" />
				<br />
				<h:inputTextarea style="width: 620px; height: 80px;"
					value="#{grupoHandler.grupoAtual.objetivo}" />
			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="Descrição:" />
				<br />
				<h:inputTextarea style="width: 620px; height: 80px;"
					value="#{grupoHandler.grupoAtual.descricao}" />
			</h:panelGroup>


		</h:panelGrid>



	</h:panelGroup></div>
	</fieldset>

	<fieldset><legend>Integrantes</legend> <h:panelGroup
		id="integrantes">

		<h:panelGroup rendered="#{!empty grupoHandler.grupoAtual.integrantes}">

			<div id="lista"><rich:dataTable var="integrante"
				id="tabelaIntegrante" style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.integrantes}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{integrante.nome}" /></div>
				</rich:column>


				<rich:column>
					<div style="width: 50px;" align="right""><a4j:commandLink
						ajaxSingle="true"
						actionListener="#{grupoHandler.removerIntegrante}"
						reRender="integrantes">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Integrante" alt="Remover Integrante" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="integrante" value="#{integrante}" />
					</a4j:commandLink></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller id="dsIntegrante" fastControls="hide"
				for="tabelaIntegrante" renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup rendered="#{empty grupoHandler.grupoAtual.integrantes}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>




	<div align="right"><a4j:commandLink
		onclick="jQuery('#dialogIntegrantes').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png" />
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Áreas de Pesquisas</legend> <h:panelGroup
		id="areas">


		<h:panelGroup
			rendered="#{!empty grupoHandler.grupoAtual.areasPesquisa}">

			<div id="lista"><rich:dataTable var="area" id="tabelaArea"
				style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.areasPesquisa}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText value="#{area.nome}" /></div>
				</rich:column>


				<rich:column>
					<div style="width: 50px;" align="right""><a4j:commandLink
						ajaxSingle="true" actionListener="#{grupoHandler.removerArea}"
						reRender="areas">
						<h:graphicImage value="../images/cancel2.jpg" title="Remover Área"
							alt="Remover Área" width="15" height="15"></h:graphicImage>
						<f:attribute name="area" value="#{area}" />
					</a4j:commandLink></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller id="dsArea" fastControls="hide" for="tabelaArea"
				renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup
			rendered="#{empty grupoHandler.grupoAtual.areasPesquisa}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>


	</h:panelGroup>



	<div align="right"><a4j:commandLink
		onclick="jQuery('#dialogSubAreas').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png" />
	</a4j:commandLink></div>





	</fieldset>

	<fieldset><legend>Projetos</legend> <h:panelGroup
		id="projetos">
		<h:panelGroup rendered="#{!empty grupoHandler.grupoAtual.projetos}">

			<div id="lista"><rich:dataTable var="projeto"
				id="tabelaProjeto" style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.projetos}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{projeto.nome}" /></div>
				</rich:column>


				<rich:column>
					<div style="width: 50px;" align="right""><a4j:commandLink
						ajaxSingle="true" actionListener="#{grupoHandler.removerProjeto}"
						reRender="projetos">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Projeto" alt="Remover Projeto" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="projeto" value="#{projeto}" />
					</a4j:commandLink></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller id="dsProjetos" fastControls="hide"
				for="tabelaProjeto" renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup rendered="#{empty grupoHandler.grupoAtual.projetos}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto associado ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>


	</h:panelGroup>



	<div align="right"><a4j:commandLink
		onclick="jQuery('#dialogProjeto').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png" />
	</a4j:commandLink></div>
	</fieldset>


</f:subview>
</body>
</html>

