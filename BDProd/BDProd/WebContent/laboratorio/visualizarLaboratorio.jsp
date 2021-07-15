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
<f:subview id="visualizarLaboratorio">



	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:outputText id="nome"
				value="#{laboratorioHandler.laboratorioAtual.nome}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{laboratorioHandler.laboratorioAtual.nome == ''}" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Descrição do Laboratório:" for="descricao" />
			<br />
			<h:outputText styleClass="visualizar_texto" id="descricao"
				value="#{laboratorioHandler.laboratorioAtual.finalidade}" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{laboratorioHandler.laboratorioAtual.finalidade == ''}" />
		</h:panelGroup>



		<h:panelGroup>
			<h:outputLabel value="Responsável:" />
			<br />
			<h:outputText id="resp"
				value="#{laboratorioHandler.laboratorioAtual.administrador.nome}"
				rendered="#{laboratorioHandler.laboratorioAtual.administrador != null}"
				styleClass="visualizar_texto" />

			<h:outputText styleClass="nao_informado"
				value="Nenhum Responsável associado."
				rendered="#{laboratorioHandler.laboratorioAtual.administrador == null}" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Vice Responsável:" />
			<br />
			<h:outputText
				value="#{laboratorioHandler.laboratorioAtual.viceAdministrador.nome}"
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador != null}"
				styleClass="visualizar_texto" />

			<h:outputText styleClass="nao_informado"
				value="Nenhum Vice Responsável associado."
				rendered="#{laboratorioHandler.laboratorioAtual.viceAdministrador == null}" />

		</h:panelGroup>


	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Integrantes Ativos</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty laboratorioHandler.laboratorioAtual.integrantes}">


			<div id="lista_Visualizar"><rich:dataList
				value="#{laboratorioHandler.ativos}"
				var="pessoa">
				
			
				<h:outputText value="#{pessoa.nome}" styleClass="label"  />
				<br />
				<br />
			</rich:dataList>
			</div>
			
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty laboratorioHandler.laboratorioAtual.integrantes}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Laboratório" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>
	
	
	
	<fieldset><legend>Egressos</legend> <h:panelGroup
		id="panelLaboratorios2">

		<h:panelGroup
			rendered="#{!empty laboratorioHandler.laboratorioAtual.integrantes}">


			<div id="lista_Visualizar"><rich:dataList
				value="#{laboratorioHandler.desativados}"
				var="pessoa">
				
			
				<h:outputText value="#{pessoa.nome}" styleClass="label"  />
				<br />
				<br />
			</rich:dataList>
			</div>
			
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty laboratorioHandler.laboratorioAtual.integrantes}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Laboratório" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>
	
	
	
	

	<fieldset><legend>Equipamentos</legend> <h:panelGroup
		id="panelEquipamentos">

		<h:panelGroup
			rendered="#{!empty laboratorioHandler.laboratorioAtual.equipamentos}">


			<div id="lista_Visualizar"><rich:dataTable var="equipamento"
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
						value="#{equipamento.status}" /></div>
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

	</h:panelGroup></fieldset>


</f:subview>
</body>
</html>