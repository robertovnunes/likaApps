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
</head>
<body>
<f:subview id="visualizarArea">

	<fieldset><legend>Informações Gerais</legend>



	<div id="conteudoForm" style="margin-top: 10px; margin-bottom: 10px;"><h:panelGrid
		columns="1" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<h:outputText id="nome"
				value="#{areaHandler.areaDePesquisaAtual.nome}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{areaHandler.areaDePesquisaAtual.nome == ''}" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Descrição:" for="descricao" />

			<h:outputText id="descricao"
				value="#{areaHandler.areaDePesquisaAtual.finalidade}"
				styleClass="visualizar_texto" />




			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{areaHandler.areaDePesquisaAtual.finalidade == ''}" />

		</h:panelGroup>


	</h:panelGrid></div>

	</fieldset>


	<fieldset><legend>Sub Área de Pesquisa</legend>


	<div id="lista_Visualizar"><h:panelGroup id="panelAreas">

		<h:panelGroup
			rendered="#{!empty areaHandler.areaDePesquisaAtual.subAreas}">


			<rich:dataList var="area" id="listaProjetos"
				value="#{areaHandler.areaDePesquisaAtual.subAreas}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<br />
				<br />
			</rich:dataList>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty areaHandler.areaDePesquisaAtual.subAreas}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Sub Área de Pesquisa associada" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></div>


	</fieldset>



</f:subview>
</body>
</html>

