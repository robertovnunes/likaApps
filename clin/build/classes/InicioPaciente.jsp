<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CLIN</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<link href="CSS/tabela.css" rel="stylesheet" type="text/css" />
<link href="CSS/menu.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
	<div id="main_content">
	<div id="top_banner"></div>
	<div id="page_content"><f:subview id="menuPacientes">
		<jsp:include page="MenuPacientes.jsp"></jsp:include>
	</f:subview>

	<div class="bordaBox">
	<div id="menuPac" align="center"><h:outputText
		value="Buscar Pacientes" styleClass="subTitulo"></h:outputText></div>
	<strong class="b4"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong><strong
		class="b3"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong><strong
		class="b2"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
	<strong class="b1"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong></div>

	<div id="center_section"><h:form>
		<div align="center" style="height: 79px"><h:inputText
			id="textBusca" style="width: 447px" value="#{usuarioHandler.idUsuario}">
		</h:inputText> <h:commandButton value="Buscar" id="botaoBuscar"></h:commandButton> <h:selectOneRadio>
			<f:selectItem itemValue="nome" itemLabel="Nome" />
			<f:selectItem itemValue="prontuario" itemLabel="Prontuário" />
			<f:selectItem itemValue="CPF" itemLabel="CPF" />
			<f:selectItem itemValue="nomeMae" itemLabel="Nome da Mãe" />
			<f:selectItem itemValue="nascimento" itemLabel="Data de Nascimento" />
			<f:selectItem itemValue="sexo" itemLabel="Sexo" />
		</h:selectOneRadio></div>
		<div class="title" style="padding-left: 60px; margin-bottom: 15px">Pacientes</div>

<div align="center">
		<h:dataTable value="#{pacienteHandler.pacientes}" var="pac"
			styleClass="mytable" cellpadding="0" cellspacing="0" >
			<h:column id="nome" >
				<f:facet name="header">
					<h:outputText value="Nome"></h:outputText>
				</f:facet>
				<h:outputText value="#{pac.nome}"></h:outputText>
			</h:column>
			<h:column id="DataNascimento">
				<f:facet name="header">
					<h:outputText value="Data de Nascimento">
					
					</h:outputText>
				</f:facet>
				<h:outputText value="#{pac.dataNascimento}">
				 <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
				</h:outputText>
			</h:column>

			<h:column id="idade">
				<f:facet name="header">
					<h:outputText value="Idade"></h:outputText>
				</f:facet>
				<h:outputText value=""></h:outputText>
			</h:column>

			<h:column id="NomeMae">
				<f:facet name="header">
					<h:outputText value="Nome da Mãe"></h:outputText>
				</f:facet>
				<h:outputText value="#{pac.nomeDaMae}"></h:outputText>
			</h:column>

			<h:column id="opcoes">
				<f:facet name="header">
					<h:outputText value="Opções"></h:outputText>
				</f:facet>
				<h:commandLink action="atendimentos" title="Atendimentos">
					<img src="images/icone_medico.jpg" width="20" height="20" />
				</h:commandLink>
				<h:commandLink action="editarPaciente"
					title="Alterar Cadastro do Paciente">
					<img src="images/text_edit.jpg" width="20" height="20" />
				</h:commandLink>

			</h:column>

		</h:dataTable>
</div>
	</h:form></div>
	<f:subview id="rodape">
		<jsp:include page="Rodape.jsp"></jsp:include>
	</f:subview></div>
	</div>
</f:view>
</body>
</html>