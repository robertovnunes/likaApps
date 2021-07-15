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
<f:subview id="lookupNovoEquipamento">




	<!-- ui-dialog -->
	<div id="dialogNovoEquipamento" title="Novo Equipamento"><h:form
		styleClass="niceform">

		<h:panelGroup id="panelEquip">
			<h:panelGrid columns="1">
				<h:panelGroup>
					<h:outputLabel value="Nome:" for="nome" />
					<br />
					<h:inputText id="nome" size="86"
						value="#{projetoHandler.novoEquipamento.nome}" maxlength="80" />
				</h:panelGroup>


				<h:panelGroup>
					<h:outputLabel value="Projeto:" />
					<br />
					<h:outputText styleClass="visualizar_texto"
						value="#{projetoHandler.projetoAtual.nome}" />



				</h:panelGroup>

				<a4j:outputPanel id="panelLaboratorios">
					<h:outputLabel value="Laboratório:" />
					<br />
					<h:outputText styleClass="visualizar_texto"
						value="#{projetoHandler.novoEquipamento.laboratorio.nome} - "
						rendered="#{projetoHandler.novoEquipamento.laboratorio != null}" />

					<h:outputText style="color:red; margin-left:3px;"
						value="Nenhum Laboratório associado."
						rendered="#{projetoHandler.novoEquipamento.laboratorio == null}" />

					<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
						rendered="#{projetoHandler.novoEquipamento.laboratorio != null}"
						action="#{projetoHandler.removerLab}" reRender="panelLaboratorios">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Laboratório" alt="Remover Laboratório" width="15"
							height="15"></h:graphicImage>
					</a4j:commandLink>


					<br />
					<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
						rendered="#{projetoHandler.novoEquipamento.laboratorio == null}"
						onclick="jQuery('#dialogLabEquip').dialog('open')">
						<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
					</a4j:commandLink>
				</a4j:outputPanel>


			</h:panelGrid>
			<h:panelGrid columns="1">

				<h:panelGroup>
					<h:outputLabel value="Localização:" for="localizacao" />
					<br />
					<h:inputText id="localizacao" size="86"
						value="#{projetoHandler.novoEquipamento.localizacao}"
						maxlength="50" />
				</h:panelGroup>

			</h:panelGrid>

			<h:panelGrid columns="2">

				<h:panelGroup>
					<h:outputLabel value="Número de Tombamento:" for="tombamento" />
					<br />
					<h:inputText id="tombamento" size="20"
						value="#{projetoHandler.novoEquipamento.numeroTombamento}"
						maxlength="50" />
				</h:panelGroup>


				<h:panelGroup>
					<h:outputLabel value="Situação" for="situacao" />
					<br />
					<h:selectOneMenu id="situacao"
						value="#{projetoHandler.novoEquipamento.status}">
						<f:selectItem itemValue="em Funcionamento"
							itemLabel="em Funcionamento" />
						<f:selectItem itemValue="Desativado" itemLabel="Desativado" />
					</h:selectOneMenu>
				</h:panelGroup>
			</h:panelGrid>

			<h:panelGrid columns="1">

				<h:panelGroup>
					<h:outputLabel value="Descrição do Equipamento:" for="descricao" />
					<br />
					<h:inputTextarea id="descricao" style="width:730px; height: 100px;"
						value="#{projetoHandler.novoEquipamento.descricao}" />
				</h:panelGroup>


			</h:panelGrid>

		</h:panelGroup>

		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">


			<a4j:commandLink
				onclick="jQuery('#dialogNovoEquipamento').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>

			<a4j:commandLink
				onclick="jQuery('#dialogNovoEquipamento').dialog('close')"
				action="#{projetoHandler.adicionarEquipamento}"
				reRender="panelEquipamentos">
				<h:graphicImage value="../css/images/finalizar.png" />
			</a4j:commandLink>


		</h:panelGrid></div>


	</h:form></div>
</f:subview>
</body>
</html>

