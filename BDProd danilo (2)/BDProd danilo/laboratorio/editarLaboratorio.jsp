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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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

</head>
<body>
<f:subview id="editarLaboratorio">

	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1"
		id="panelResponsavel">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" style="width:520px;"
				value="#{laboratorioHandler.laboratorioAtual.nome}" maxlength="80" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Descrição do Laboratório:" for="descricao" />
			<br />
			<h:inputTextarea id="descricao" style="width:730px; height: 100px;"
				value="#{laboratorioHandler.laboratorioAtual.finalidade}" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Responsável:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{laboratorioHandler.laboratorioAtual.administrador.nome}"
				rendered="#{laboratorioHandler.laboratorioAtual.administrador != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Responsável associado."
				rendered="#{laboratorioHandler.laboratorioAtual.administrador == null}" />

			<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
				rendered="#{laboratorioHandler.laboratorioAtual.administrador != null}"
				actionListener="#{laboratorioHandler.removerResponsavel}"
				reRender="panelResponsavel">
				<f:attribute value="resp" name="resp" />
				<h:graphicImage value="../images/cancel2.jpg"
					title="Remover Responsável" alt="Remover Responsável" width="15"
					height="15"></h:graphicImage>
			</a4j:commandLink>


			<br />
			<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
				rendered="#{laboratorioHandler.laboratorioAtual.administrador == null}"
				onclick="jQuery('#dialogResponsavel').dialog('open')"
				action="#{laboratorioHandler.ehResp}">
				<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
			</a4j:commandLink>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Vice responsável:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{laboratorioHandler.laboratorioAtual.viceAdministrador.nome} - "
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Vice Responsável associado."
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador == null}" />

			<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador != null}"
				actionListener="#{laboratorioHandler.removerResponsavel}"
				reRender="panelResponsavel">
				<f:attribute value="vice" name="resp" />
				<h:graphicImage value="../images/cancel2.jpg"
					title="Remover Vice Responsável" alt="Remover Vice Responsável"
					width="15" height="15"></h:graphicImage>
			</a4j:commandLink>


			<br />
			<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador == null}"
				onclick="jQuery('#dialogResponsavel').dialog('open')"
				action="#{laboratorioHandler.ehVice}">
				<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
			</a4j:commandLink>

		</h:panelGroup>




	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Integrantes</legend> <h:panelGroup
		id="panelIntegrantes">

		<h:panelGroup
			rendered="#{!empty laboratorioHandler.laboratorioAtual.integrantes}">


			<div id="lista"><rich:dataList
				value="#{laboratorioHandler.laboratorioAtual.integrantes}"
				var="pessoa">
				<h:outputText value="#{pessoa.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{laboratorioHandler.removerIntegrante}"
					reRender="panelIntegrantes">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Integrante" alt="Remover Integrante" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="pessoa" value="#{pessoa}" />
				</a4j:commandLink>
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty laboratorioHandler.laboratorioAtual.integrantes}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Laboratório" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>

	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true"
		onclick="jQuery('#dialogIntegrantes').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>

	<fieldset><legend>Equipamentos</legend> <h:panelGroup
		id="panelEquipamentos">

		<h:panelGroup
			rendered="#{!empty laboratorioHandler.laboratorioAtual.equipamentos}">


			<div id="lista"><rich:dataTable var="equipamento"
				id="listaTitulacao" style="margin-left: 10px;"
				value="#{laboratorioHandler.laboratorioAtual.equipamentos}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 200px;"><h:outputText
						value="#{equipamento.nome}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Tombamento"></h:outputText>
					</f:facet>
					<div style="width: 150px;"><h:outputText
						value="#{equipamento.numeroTombamento}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Situação"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{equipamento.status} - " /> <a4j:commandLink
						value="Desativar"
						rendered="#{equipamento.status == 'em Funcionamento'}"
						actionListener="#{laboratorioHandler.editarEquipamento}"
						reRender="panelEquipamentos">
						<f:attribute name="equipamento" value="#{equipamento}" />
					</a4j:commandLink> <a4j:commandLink value="Ativar"
						rendered="#{equipamento.status == 'Desativado'}"
						actionListener="#{laboratorioHandler.editarEquipamento}"
						reRender="panelEquipamentos">
						<f:attribute name="equipamento" value="#{equipamento}" />
					</a4j:commandLink></div>
				</rich:column>







				<rich:column>
					<div style="width: 200px;" align="right""><a4j:commandLink
						ajaxSingle="true"
						actionListener="#{laboratorioHandler.removerEquipamento}"
						reRender="panelEquipamentos">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Equipamento" alt="Remover Equipamento" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="equipamento" value="#{equipamento}" />
					</a4j:commandLink></div>
				</rich:column>
			</rich:dataTable></div>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty laboratorioHandler.laboratorioAtual.equipamentos}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Equipamento associado ao Laboratório" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>

	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true"
		onclick="jQuery('#dialogEquipamentos').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>

</f:subview>
</body>
</html>

