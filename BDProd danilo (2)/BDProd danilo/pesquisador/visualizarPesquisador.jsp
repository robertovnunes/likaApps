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
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
</head>
<body>
<f:subview id="visualizarPesquisador">





	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">

	<h:graphicImage value="../images/foto.gif" width="120px" height="150px"
		rendered="#{pesquisadorHandler.pesquisadorAtual.foto == null}" /> <a4j:mediaOutput
		element="img" cacheable="false" session="false"
		createContent="#{pesquisadorHandler.paint}" mimeType="image/jpeg"
		rendered="#{pesquisadorHandler.pesquisadorAtual.foto != null}" /><br />

	</div>

	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />

			<h:outputText id="nome"
				value="#{pesquisadorHandler.pesquisadorAtual.nome}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.nomePublicacao == ''}" />

			<h:outputText id="assPublicacao"
				value="#{pesquisadorHandler.pesquisadorAtual.nomePublicacao}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.nomePublicacao != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.CPF == ''}" />

			<h:outputText id="cpf"
				value="#{pesquisadorHandler.pesquisadorAtual.CPF}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.CPF != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.RG == ''}" />

			<h:outputText id="rg"
				value="#{pesquisadorHandler.pesquisadorAtual.RG}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.RG != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />

			<h:outputText id="uf"
				value="#{pesquisadorHandler.pesquisadorAtual.uf}"
				styleClass="visualizar_texto" />

		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Órgão Expedidor" for="orgao" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.orgaoExpedidor == ''}" />

			<h:outputText id="orgao"
				value="#{pesquisadorHandler.pesquisadorAtual.orgaoExpedidor}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.orgaoExpedidor != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.nascimento == null}" />

			<h:outputText id="nascimento"
				value="#{pesquisadorHandler.pesquisadorAtual.nascimento}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.nascimento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />

			<h:outputText id="sexo"
				value="#{pesquisadorHandler.pesquisadorAtual.sexo}"
				styleClass="visualizar_texto" />
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.filiacaoPai == ''}" />

			<h:outputText id="nomePai"
				value="#{pesquisadorHandler.pesquisadorAtual.filiacaoPai}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.filiacaoPai != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe:" for="nomeMae" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.filiacaoMae == ''}" />

			<h:outputText id="nomeMae"
				value="#{pesquisadorHandler.pesquisadorAtual.filiacaoMae}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.filiacaoMae != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.endereco == ''}" />


			<h:outputText id="endereco"
				value="#{pesquisadorHandler.pesquisadorAtual.endereco}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.endereco != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.endereco == ''}" />

			<h:outputText id="cep"
				value="#{pesquisadorHandler.pesquisadorAtual.CEP}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.endereco != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.telefone == '' }" />

			<h:outputText id="dddRes"
				value="(#{ pesquisadorHandler.pesquisadorAtual.dddResidencial}) "
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.telefone != '' }" />
			<h:outputText id="telRes"
				value="#{pesquisadorHandler.pesquisadorAtual.telefone}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.telefone != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.foneComercial == '' }" />

			<h:outputText id="dddCom"
				value="(#{pesquisadorHandler.pesquisadorAtual.dddComercial})"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.foneComercial != ''}" />


			<h:outputText id="telCom"
				value="#{pesquisadorHandler.pesquisadorAtual.foneComercial}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.foneComercial != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.celular == '' }" />


			<h:outputText id="dddCel"
				value="(#{pesquisadorHandler.pesquisadorAtual.dddCelular}) "
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.celular != '' }" />
			<h:outputText id="cel"
				value="#{pesquisadorHandler.pesquisadorAtual.celular}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.celular != '' }" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.email == ''}" />

			<h:outputText id="email"
				value="#{pesquisadorHandler.pesquisadorAtual.email}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.email != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Currículo Lattes:" for="lattes" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.curriculoLattes == ''}" />


			<h:outputText id="lattes"
				value="#{pesquisadorHandler.pesquisadorAtual.curriculoLattes}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.curriculoLattes != ''}" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>


	<fieldset><legend>Formação</legend> <h:panelGroup
		id="panelTitulacoes">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.titulacao}">

			<div id="lista_Visualizar"><rich:dataTable var="titulacao"
				id="listaTitulacao" style="margin-left: 10px;"
				value="#{pesquisadorHandler.pesquisadorAtual.titulacao}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Titulação"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{titulacao.titulacao}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Curso"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{titulacao.curso}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Instituição"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{titulacao.instituicao}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Conclusão"></h:outputText>
					</f:facet>
					<div style="width: 30px;"><h:outputText
						value="#{titulacao.conclusao}" /></div>
				</rich:column>


			</rich:dataTable></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.titulacao}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Titulação adicionada ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>
	</h:panelGroup></fieldset>


	<fieldset><legend>Informações LIKA</legend>

	<div id="conteudoForm">


	<div
		style="float: left; width: 100%; margin-left: 3px; margin-bottom: 5px;"><h:panelGroup>
		<h:outputLabel value="SIAPE:" for="siape" />

		<h:outputText value="Não informado" styleClass="nao_informado"
			rendered="#{pesquisadorHandler.pesquisadorAtual.SIAPE == ''}" />

		<h:outputText id="siape"
			value="#{pesquisadorHandler.pesquisadorAtual.SIAPE}"
			styleClass="visualizar_texto"
			rendered="#{pesquisadorHandler.pesquisadorAtual.SIAPE != ''}" />
	</h:panelGroup> <rich:spacer width="137px;"
		rendered="#{!pesquisadorHandler.mostrarCentro}"></rich:spacer> <h:panelGroup
		style="margin-left:20px;">
		<h:outputLabel value="Instituição de Orígem:" for="instOrigem" />

		<h:outputText value="Não informado" styleClass="nao_informado"
			rendered="#{pesquisadorHandler.pesquisadorAtual.instituicaoOrigem == ''}" />

		<h:outputText id="instOrigem"
			value="#{pesquisadorHandler.pesquisadorAtual.instituicaoOrigem}"
			styleClass="visualizar_texto"
			rendered="#{pesquisadorHandler.pesquisadorAtual.instituicaoOrigem != ''}" />

	</h:panelGroup> <rich:spacer width="100px;"
		rendered="#{!pesquisadorHandler.mostrarCentro}"></rich:spacer> <h:panelGroup
		style="margin-left:20px;"
		rendered="#{pesquisadorHandler.mostrarCentro}">
		<h:outputLabel value="Centro:" for="centro" />

		<h:outputText id="centro"
			value="#{pesquisadorHandler.pesquisadorAtual.departamento.nome}"
			styleClass="visualizar_texto" style="width:280px;" />
	</h:panelGroup></div>


	<h:panelGrid columns="4" width="100%" style="clear: both;">

		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.dataAdmissao == null}" />

			<h:outputText id="calendario"
				value="#{pesquisadorHandler.pesquisadorAtual.dataAdmissao}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.dataAdmissao != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Crachá:" for="cracha" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.cracha == null}" />


			<h:outputText id="cracha"
				value="#{pesquisadorHandler.pesquisadorAtual.cracha.numeroCracha}"
				styleClass="visualizar_texto" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />

			<h:outputText id="situacao"
				value="#{pesquisadorHandler.pesquisadorAtual.situacao}"
				styleClass="visualizar_texto">
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{pesquisadorHandler.pesquisadorAtual.dataDesligamento == null}" />

			<h:outputText id="calendario2"
				value="#{pesquisadorHandler.pesquisadorAtual.dataDesligamento}"
				styleClass="visualizar_texto"
				rendered="#{pesquisadorHandler.pesquisadorAtual.dataDesligamento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>
	</h:panelGrid></div>

	</fieldset>



	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:panelGroup id="listaAreas"
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.areasPesquisa}">
			<div id="lista_Visualizar"><rich:dataList var="area"
				value="#{pesquisadorHandler.pesquisadorAtual.areasPesquisa}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup id="nenhumaArea"
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.areasPesquisa}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>


	<fieldset><legend>Laboratórios</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.laboratorios || !empty pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado ||
			!empty pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado}">


			<div id="lista_Visualizar"><rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado}"
				var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado}"
				var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Vice Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorios}"
				var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />

				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.laboratorios && empty pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado &&
			empty pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Laboratório associado ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>



	<fieldset><legend>Projetos</legend> <h:panelGroup
		id="panelProjetos">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.projetosAdicionados || !empty pesquisadorHandler.pesquisadorAtual.projetoResponsavel || !empty pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}">


			<div id="lista_Visualizar"><rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.projetoResponsavel}"
				var="proj" style="list-style-type: square">
				<h:outputText value="#{proj.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}"
				var="proj" style="list-style-type: square">
				<h:outputText value="#{proj.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Vice Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList var="projeto" id="listaProjetos"
				value="#{pesquisadorHandler.projetosAdicionados}">

				<h:outputText value="#{projeto.nome}" styleClass="label" />
				<br />
				<h:outputText value="Subprojeto: #{projeto.nomeSubprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.projetosAdicionados && empty pesquisadorHandler.pesquisadorAtual.projetoResponsavel  && empty pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto associado ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>


	<fieldset><legend>Publicações</legend> <h:panelGroup
		id="panelPublicacao">

		<h:panelGroup rendered="#{!empty pesquisadorHandler.publicacoes}">


			<div id="lista_Visualizar"><rich:dataTable id="tabelaPub"
				rows="10" var="publicacao" value="#{pesquisadorHandler.publicacoes}"
				style="margin-left: 10px;" styleClass="tabelaSemLinha"
				width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Título"></h:outputText>
					</f:facet>
					<div style="width: 460px;"><h:outputText
						value="#{publicacao.titulo}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Tipo"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{publicacao.tipoPublicacao}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Ano"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{publicacao.anoPublicacao}" /></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller for="tabelaPub" fastControls="hide"
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
		<h:panelGroup rendered="#{empty pesquisadorHandler.publicacoes}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Publicação escrita pelo Pesquisador" /></li>
			</ul>
		</h:panelGroup>


	</h:panelGroup></fieldset>











</f:subview>
</body>
</html>

