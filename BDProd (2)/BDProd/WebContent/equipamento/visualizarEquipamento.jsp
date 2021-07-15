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
<f:subview id="visualizarEquipamento">



	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:outputText id="nome"
				value="#{equipamentoHandler.equipamentoAtual.nome}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{equipamentoHandler.equipamentoAtual.nome == ''}" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Projeto:" />
			<br />
			<h:outputText id="projeto"
				value="#{equipamentoHandler.equipamentoAtual.projeto.nome}"
				rendered="#{equipamentoHandler.equipamentoAtual.projeto != null}"
				styleClass="visualizar_texto" />

			<h:outputText styleClass="nao_informado"
				value="Nenhum Projeto associado."
				rendered="#{equipamentoHandler.equipamentoAtual.projeto == null}" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Laboratório:" />
			<br />
			<h:outputText
				value="#{equipamentoHandler.equipamentoAtual.laboratorio.nome}"
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio != null}"
				styleClass="visualizar_texto" />

			<h:outputText styleClass="nao_informado"
				value="Nenhum Laboratório associado."
				rendered="#{equipamentoHandler.equipamentoAtual.laboratorio == null}" />

		</h:panelGroup>


	</h:panelGrid> <h:panelGrid columns="3">

		<h:panelGroup style="margin-right:50px;">
			<h:outputLabel value="Localização:" for="localizacao" />
			<br />
			<h:outputText id="localizacao"
				value="#{equipamentoHandler.equipamentoAtual.localizacao}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{equipamentoHandler.equipamentoAtual.localizacao == ''}" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Número de Tombamento:" for="tombamento" />
			<br />
			<h:outputText id="tombamento"
				value="#{equipamentoHandler.equipamentoAtual.numeroTombamento}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{equipamentoHandler.equipamentoAtual.numeroTombamento == ''}" />

		</h:panelGroup>


		<h:panelGroup style="margin-left:50px;">
			<h:outputLabel value="Situação" for="situacao" />
			<br />
			<h:outputText style="margin-left:53px;" id="situacao"
				value="#{equipamentoHandler.equipamentoAtual.status}"
				styleClass="visualizar_texto" />

			<h:outputText style="margin-left:53px;" value="Não informado" styleClass="nao_informado"
				rendered="#{equipamentoHandler.equipamentoAtual.status == ''}" />

		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="1">

		<h:panelGroup>
			<h:outputLabel value="Descrição do Equipamento:" for="descricao" />
			<br />
			<h:outputText id="descricao"
				value="#{equipamentoHandler.equipamentoAtual.descricao}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{equipamentoHandler.equipamentoAtual.descricao == ''}" />

		</h:panelGroup>


	</h:panelGrid></div>
	</fieldset>


</f:subview>
</body>
</html>

