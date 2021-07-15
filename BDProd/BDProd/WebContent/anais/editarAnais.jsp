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
<f:subview id="editarAnais">

	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGroup>


		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Titulo:" />
				<br />
				<h:inputText style="width:800px;" maxlength="250"
					value="#{publicacaoHandler.publicacaoAtual.titulo}"></h:inputText>
			</h:panelGroup>
		</h:panelGrid>
		<h:panelGrid columns="4">
			<h:panelGroup>
				<h:outputText value="DOI:" />
				<br />
				<h:inputText style="width:400px;"
					value="#{publicacaoHandler.publicacaoAtual.DOI}"></h:inputText>

			</h:panelGroup>

			<rich:spacer width="20" />

			<h:panelGroup>
				<h:outputText value="Tipo:" />
				<br />
				<h:selectOneMenu value="#{publicacaoHandler.publicacaoAtual.tipo}">
					<f:selectItem itemLabel="Internacional" itemValue="Internacional" />
					<f:selectItem itemLabel="Nacional" itemValue="Nacional" />
					<f:selectItem itemLabel="Regional" itemValue="Regional" />
					<f:selectItem itemLabel="Local" itemValue="Local" />
				</h:selectOneMenu>



			</h:panelGroup>


			<h:panelGroup>
				<h:outputText value="Natureza:" />
				<br />

				<h:selectOneMenu
					value="#{publicacaoHandler.publicacaoAtual.natureza}">
					<f:selectItem itemLabel="Completo" itemValue="Completo" />
					<f:selectItem itemLabel="Resumo" itemValue="Resumo" />
					<f:selectItem itemLabel="Resumo Expandido"
						itemValue="Resumo Expandido" />

				</h:selectOneMenu>


			</h:panelGroup>

		</h:panelGrid>

		<h:panelGrid columns="4">
			<h:panelGroup id="panelProjeto">
				<h:outputLabel value="Projeto:" />
				<br />
				<h:outputText styleClass="visualizar_texto"
					value="#{publicacaoHandler.publicacaoAtual.projeto.nome} - "
					rendered="#{publicacaoHandler.publicacaoAtual.projeto != null}" />

				<h:outputText style="color:red; margin-left:3px;"
					value="Nenhum Projeto associado."
					rendered="#{publicacaoHandler.publicacaoAtual.projeto == null}" />

				<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
					rendered="#{publicacaoHandler.publicacaoAtual.projeto != null}"
					action="#{publicacaoHandler.removerProjeto}"
					reRender="panelProjeto">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Projeto" alt="Remover Projeto" width="15"
						height="15"></h:graphicImage>
				</a4j:commandLink>


				<br />
				<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
					rendered="#{publicacaoHandler.publicacaoAtual.projeto == null}"
					onclick="jQuery('#dialogProjeto').dialog('open')">
					<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
				</a4j:commandLink>



			</h:panelGroup>







		</h:panelGrid>

		<h:panelGrid columns="11">
			<h:panelGroup>
				<h:outputText value="Idioma:" />
				<br />
				<h:inputText size="25"
					value="#{publicacaoHandler.publicacaoAtual.pais}" />

			</h:panelGroup>

			<rich:spacer width="10" />

			<h:panelGroup>
				<h:outputText value="Ano Publicaçao:" />
				<br />
				<h:inputText style="width:50px;"
					value="#{publicacaoHandler.publicacaoAtual.anoPublicacao}"
					maxlength="4" onkeypress="mascara(this,soNumeros)" />
			</h:panelGroup>

			<rich:spacer width="10" />

			<h:panelGroup>
				<h:outputText value="País:" />
				<br />
				<h:inputText style="width:150px;"
					value="#{publicacaoHandler.publicacaoAtual.localConferencia}" />

			</h:panelGroup>

			<rich:spacer width="20" />
			<h:panelGroup>
				<h:outputText value="Página Inicial:" />
				<br />
				<h:inputText style="width:80px;"
					value="#{publicacaoHandler.publicacaoAtual.paginaInicial}"></h:inputText>

			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="Página Final:" />
				<br />
				<h:inputText style="width:80px;"
					value="#{publicacaoHandler.publicacaoAtual.paginaFinal}"></h:inputText>

			</h:panelGroup>


			<rich:spacer width="20" />


			<h:panelGroup>
				<h:outputText value="Volume:" />
				<br />
				<h:inputText style="width:80px;"
					value="#{publicacaoHandler.publicacaoAtual.volume}"></h:inputText>


			</h:panelGroup>


			<h:panelGroup>
				<h:outputText value="Série:" />
				<br />
				<h:inputText style="width:80px;"
					value="#{publicacaoHandler.publicacaoAtual.serie}"></h:inputText>

			</h:panelGroup>



		</h:panelGrid>

		<h:panelGrid columns="4">
			<h:panelGroup>
				<h:outputText value="Link da Publicação:" />
				<br />
				<h:inputText size="80"
					value="#{publicacaoHandler.publicacaoAtual.linkPublicacao}" />

			</h:panelGroup>

			<rich:spacer width="20" />


			<h:panelGroup>
				<h:outputText value="ISBN:" />
				<br />
				<h:inputText size="12"
					value="#{publicacaoHandler.publicacaoAtual.ISBN}" />

			</h:panelGroup>


			<h:panelGroup>
				<h:outputText value="Fascículo:" />
				<br />
				<h:inputText size="12"
					value="#{publicacaoHandler.publicacaoAtual.fasciculo}" />

			</h:panelGroup>

		</h:panelGrid>

		<h:panelGrid columns="1">

			<h:panelGroup>
				<h:outputText value="Nome do Evento:" />
				<br />
				<h:inputText size="40"
					value="#{publicacaoHandler.publicacaoAtual.nomeEvento}" />

			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="Título dos Anais do Evento:" />
				<br />
				<h:inputText size="80"
					value="#{publicacaoHandler.publicacaoAtual.tituloAnaisEvento}" />

			</h:panelGroup>

		</h:panelGrid>

		<h:panelGrid columns="3">

			<h:panelGroup>
				<h:outputText value="Cidade do Evento:" />
				<br />
				<h:inputText style="width:200px;"
					value="#{publicacaoHandler.publicacaoAtual.cidadeEvento}" />

			</h:panelGroup>


			<h:panelGroup>
				<h:outputText value="Nome da Editora:" />
				<br />
				<h:inputText style="width:200px;"
					value="#{publicacaoHandler.publicacaoAtual.nomeEditora}" />

			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="Cidade da Editora:" />
				<br />
				<h:inputText style="width:200px;"
					value="#{publicacaoHandler.publicacaoAtual.cidadeEditora}" />

			</h:panelGroup>

		</h:panelGrid>
	</h:panelGroup></div>
	</fieldset>

	<fieldset><legend>Autores</legend> <h:panelGroup
		id="autores">

		<h:panelGroup
			rendered="#{!empty publicacaoHandler.publicacaoAtual.autores}">

			<div id="lista"><rich:dataTable var="autor" id="tabelaAutor"
				style="margin-left: 10px;" rows="10"
				value="#{publicacaoHandler.publicacaoAtual.autores}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{autor.nome}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome na Publicação"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{autor.nomePublicacao}" /></div>
				</rich:column>

				<rich:column>
					<div style="width: 50px;" align="right""><a4j:commandLink
						ajaxSingle="true"
						actionListener="#{publicacaoHandler.removerAutorPublicacao}"
						reRender="autores">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Autor" alt="Remover Autor" width="15" height="15"></h:graphicImage>
						<f:attribute name="autor" value="#{autor}" />
					</a4j:commandLink></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller id="dsAutor" fastControls="hide" for="tabelaAutor"
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
			rendered="#{empty publicacaoHandler.publicacaoAtual.autores}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Autor associado à Publicação" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>




	<div align="right"><a4j:commandLink
		onclick="jQuery('#dialogTipoAutor').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png" />
	</a4j:commandLink></div>
	</fieldset>





</f:subview>
</body>
</html>

