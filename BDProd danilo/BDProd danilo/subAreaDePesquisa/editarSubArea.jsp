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
.rich-fileupload-toolbar-decor,.rich-fileupload-toolbar-decor table,.rich-fileupload-list-overflow,.rich-fileupload-table,.rich-fileupload-table-td,.rich-fileupload-list-decor
	{
	background: transparent;
	border: 0px;
	padding: 0;
}

.rich-fileupload-button,.rich-fileupload-button-border {
	background: #BBD8EC;
	border-color: #BBD8EC;
	margin: -1px 0 0 -1px;
	position: relative;
	top: 0;
	left: 0;
}

.rich-fileupload-button-press,.rich-fileupload-button-light {
	background: #BBD8EC;
	border-color: #BBD8EC;
	margin: -1px 0 0 -1px;
	position: relative;
	top: 0;
	left: 0;
}
</style>

</head>
<body>
<f:subview id="editarSubArea">

	<fieldset><legend>Informações Gerais</legend>



	<div id="conteudoForm"><h:panelGrid columns="1" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" style="width:520px;"
				value="#{areaHandler.subAreaDePesusquisaAtual.nome}" maxlength="80" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Finalidade:" for="finalidade" />
			<br />
			<h:inputTextarea id="finalidade"
				value="#{areaHandler.subAreaDePesusquisaAtual.finalidade}"
				style="width:520px; height: 60px;" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Descrição:" for="descricao" />
			<br />
			<h:inputTextarea id="descricao"
				value="#{areaHandler.subAreaDePesusquisaAtual.descricao}"
				style="width:520px; height: 60px;" />
		</h:panelGroup>


	</h:panelGrid></div>

	</fieldset>

	<fieldset><legend>Área de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:panelGroup
			rendered="#{!empty areaHandler.subAreaDePesusquisaAtual.grandesAreasDePesquisas}">


			<div id="lista"><rich:dataList var="area" id="listaProjetos"
				value="#{areaHandler.subAreaDePesusquisaAtual.grandesAreasDePesquisas}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{areaHandler.removerGrandeArea}"
					reRender="panelAreas">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Projeto" alt="Remover Projeto" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="area" value="#{area}" />
				</a4j:commandLink>
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty areaHandler.subAreaDePesusquisaAtual.grandesAreasDePesquisas}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Grande Área de Pesquisa associada" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>


	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" hreflang="#" id="dialogProjetos_link"
		style="text-decoration: none"
		onclick="jQuery('#dialogGrandeAreas').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>



	</fieldset>

</f:subview>
</body>
</html>

