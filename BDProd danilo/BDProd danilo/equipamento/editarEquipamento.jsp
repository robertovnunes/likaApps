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


<style type="text/css">
</style>

</head>
<body>
<f:subview id="editarEquipamento">

	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" size="86"
				value="#{equipamentoHandler.equipamentoAtual.nome}" maxlength="80" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Projeto:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{equipamentoHandler.equipamentoAtual.projeto.nome}"
				rendered="#{equipamentoHandler.equipamentoAtual.projeto != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Projeto associado."
				rendered="#{equipamentoHandler.equipamentoAtual.projeto == null}" />

		</h:panelGroup>

		<h:panelGroup id="panelLaboratorios">
			<h:outputLabel value="Laboratório:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{equipamentoHandler.equipamentoAtual.laboratorio.nome} - "
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Laboratório associado."
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio == null}" />

			<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio != null}"
				action="#{equipamentoHandler.removerLab}"
				reRender="panelLaboratorios">
				<h:graphicImage value="../images/cancel2.jpg"
					title="Remover Laboratório" alt="Remover Laboratório" width="15"
					height="15"></h:graphicImage>
			</a4j:commandLink>


			<br />
			<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio == null}"
				onclick="jQuery('#dialogLaboratorios').dialog('open')">
				<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
			</a4j:commandLink>



		</h:panelGroup>


	</h:panelGrid> <h:panelGrid columns="3">

		<h:panelGroup>
			<h:outputLabel value="Localização:" for="localizacao" />
			<br />
			<h:inputText id="localizacao" style="width:420px;"
				value="#{equipamentoHandler.equipamentoAtual.localizacao}"
				maxlength="50" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Número de Tombamento:" for="tombamento" />
			<br />
			<h:inputText id="tombamento" size="20"
				value="#{equipamentoHandler.equipamentoAtual.numeroTombamento}"
				maxlength="50" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação" for="situacao" />
			<br />
			<h:selectOneMenu id="situacao"
				value="#{equipamentoHandler.equipamentoAtual.status}">
				<f:selectItem itemValue="em Funcionamento"
					itemLabel="em Funcionamento" />
				<f:selectItem itemValue="Desativado" itemLabel="Desativado" />
			</h:selectOneMenu>
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="1">

		<h:panelGroup>
			<h:outputLabel value="Descrição do Equipamento:" for="descricao" />
			<br />
			<h:inputTextarea id="descricao" style="width:730px; height: 100px;"
				value="#{equipamentoHandler.equipamentoAtual.descricao}" />
		</h:panelGroup>


	</h:panelGrid></div>
	</fieldset>


</f:subview>
</body>
</html>

