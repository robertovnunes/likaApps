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
<f:subview id="editarArea">

	<fieldset><legend>Informações Gerais</legend>



	<div id="conteudoForm"
		style="margin-left: 20%; margin-top: 10px; margin-bottom: 10px;"><h:panelGrid
		columns="1" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" style="width:520px;"
				value="#{areaHandler.areaDePesquisaAtual.nome}" maxlength="80" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Descrição:" for="descricao" />
			<br />
			<h:inputTextarea id="descricao"
				value="#{areaHandler.areaDePesquisaAtual.finalidade}"
				style="width:520px; height: 100px;" />
		</h:panelGroup>


	</h:panelGrid></div>

	</fieldset>

</f:subview>
</body>
</html>

