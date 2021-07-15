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
<f:subview id="visualizarAluno">

	<div align="center"><h:panelGrid columns="2">
		<h:outputText value="Tipo do Aluno: " />
		<h:selectOneRadio value="#{alunoHandler.alunoAtual.tipoAluno}"
			disabled="true">
			<f:selectItems value="#{alunoHandler.tipoAlunos}" />
		</h:selectOneRadio>

	</h:panelGrid></div>



	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">

	<h:graphicImage value="../images/foto.gif" width="120px" height="150px"
		rendered="#{alunoHandler.alunoAtual.foto == null}" /> <a4j:mediaOutput
		element="img" cacheable="false" session="false"
		createContent="#{alunoHandler.paint}" mimeType="image/jpeg"
		rendered="#{alunoHandler.alunoAtual.foto != null}" /><br />

	</div>

	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />

			<h:outputText id="nome" value="#{alunoHandler.alunoAtual.nome}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.nomePublicacao == ''}" />

			<h:outputText id="assPublicacao"
				value="#{alunoHandler.alunoAtual.nomePublicacao}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.nomePublicacao != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.CPF == ''}" />

			<h:outputText id="cpf" value="#{alunoHandler.alunoAtual.CPF}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.CPF != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG/Passaporte:" for="rg" />

			<h:outputText value="Não informado" styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.RG == ''}" />

			<h:outputText id="rg" value="#{alunoHandler.alunoAtual.RG}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.RG != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />

			<h:outputText id="uf" value="#{alunoHandler.alunoAtual.uf}"
				styleClass="visualizar_texto" />

		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Órgão Expedidor" for="orgao" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.orgaoExpedidor == ''}" />

			<h:outputText id="orgao"
				value="#{alunoHandler.alunoAtual.orgaoExpedidor}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.orgaoExpedidor != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.nascimento == null}" />

			<h:outputText id="nascimento"
				value="#{alunoHandler.alunoAtual.nascimento}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.nascimento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />

			<h:outputText id="sexo" value="#{alunoHandler.alunoAtual.sexo}"
				styleClass="visualizar_texto" />
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe:" for="nomeMae" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.filiacaoMae == ''}" />

			<h:outputText id="nomeMae"
				value="#{alunoHandler.alunoAtual.filiacaoMae}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.filiacaoMae != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.filiacaoPai == ''}" />

			<h:outputText id="nomePai"
				value="#{alunoHandler.alunoAtual.filiacaoPai}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.filiacaoPai != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.endereco == ''}" />


			<h:outputText id="endereco"
				value="#{alunoHandler.alunoAtual.endereco}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.endereco != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.endereco == ''}" />

			<h:outputText id="cep" value="#{alunoHandler.alunoAtual.CEP}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.endereco != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.telefone == '' }" />

			<h:outputText id="dddRes"
				value="(#{ alunoHandler.alunoAtual.dddResidencial}) "
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.telefone != '' }" />
			<h:outputText id="telRes" value="#{alunoHandler.alunoAtual.telefone}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.telefone != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.foneComercial == '' }" />

			<h:outputText id="dddCom"
				value="(#{alunoHandler.alunoAtual.dddComercial})"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.foneComercial != ''}" />


			<h:outputText id="telCom"
				value="#{alunoHandler.alunoAtual.foneComercial}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.foneComercial != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.celular == '' }" />


			<h:outputText id="dddCel"
				value="(#{alunoHandler.alunoAtual.dddCelular}) "
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.celular != '' }" />
			<h:outputText id="cel" value="#{alunoHandler.alunoAtual.celular}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.celular != '' }" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.email == ''}" />

			<h:outputText id="email" value="#{alunoHandler.alunoAtual.email}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.email != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Currículo Lattes:" for="lattes" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.curriculoLattes == ''}" />


			<h:outputText id="lattes"
				value="#{alunoHandler.alunoAtual.curriculoLattes}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.curriculoLattes != ''}" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>


	<fieldset><legend>Formação</legend> <h:panelGroup
		id="panelTitulacoes">

		<h:panelGroup rendered="#{!empty alunoHandler.alunoAtual.titulacao}">

			<div id="lista_Visualizar"><rich:dataTable var="titulacao"
				id="listaTitulacao" style="margin-left: 10px;"
				value="#{alunoHandler.alunoAtual.titulacao}"
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
					<div style="width: 200px;"><h:outputText
						value="#{titulacao.instituicao}" /></div>
				</rich:column>
				
				<rich:column>
					<f:facet name="header">
						<h:outputText value="Início"></h:outputText>
					</f:facet>
					<div style="width: 30px;"><h:outputText
						value="#{titulacao.inicio}" /></div>
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
		<h:panelGroup rendered="#{empty alunoHandler.alunoAtual.titulacao}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Titulação adicionada ao Aluno" /></li>
			</ul>
		</h:panelGroup>
	</h:panelGroup></fieldset>


	<fieldset><legend>Informações LIKA</legend>

	<div id="conteudoForm">


	<div style="float: left; width: 100%; margin-bottom: 5px;"><h:panelGroup
		style="margin-left:5px;">
		<h:outputLabel value="Instituição de Orígem:" for="instOrigem" />

		<h:outputText value="Não informado" styleClass="nao_informado"
			rendered="#{alunoHandler.alunoAtual.instituicaoOrigem == ''}" />

		<h:outputText id="instOrigem"
			value="#{alunoHandler.alunoAtual.instituicaoOrigem}"
			styleClass="visualizar_texto"
			rendered="#{alunoHandler.alunoAtual.instituicaoOrigem != ''}" />

	</h:panelGroup> <rich:spacer width="120px;" rendered="#{!alunoHandler.mostrarCentro}"></rich:spacer>
	<h:panelGroup style="margin-left:40px;"
		rendered="#{alunoHandler.mostrarCentro}">
		<h:outputLabel value="Centro:" for="centro" />

		<h:outputText id="centro"
			value="#{alunoHandler.alunoAtual.departamento.nome}"
			styleClass="visualizar_texto" style="width:280px;" />
	</h:panelGroup></div>


	<h:panelGrid columns="4" width="100%" style="clear: both;">

		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.dataAdmissao == null}" />

			<h:outputText id="calendario"
				value="#{alunoHandler.alunoAtual.dataAdmissao}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.dataAdmissao != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Crachá:" for="cracha" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.cracha == null}" />


			<h:outputText id="cracha"
				value="#{alunoHandler.alunoAtual.cracha.numeroCracha}"
				styleClass="visualizar_texto" />
		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />

			<h:outputText id="situacao"
				value="#{alunoHandler.alunoAtual.situacao}"
				styleClass="visualizar_texto">
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{alunoHandler.alunoAtual.dataDesligamento == null}" />

			<h:outputText id="calendario2"
				value="#{alunoHandler.alunoAtual.dataDesligamento}"
				styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.dataDesligamento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>
		
		
	</h:panelGrid>




	<div style="float: left; width: 450px; margin-bottom: 5px;"><h:panelGroup
		style="margin-left:3px;">
		<h:outputLabel value="Orientador: " for="orientador" />
		<h:outputText value="#{alunoHandler.alunoAtual.orientador.nome}"
			rendered="#{alunoHandler.alunoAtual.orientador != null}"
			styleClass="visualizar_texto" />

		<h:outputText id="orientador" value="Não informado"
			styleClass="nao_informado"
			rendered="#{alunoHandler.alunoAtual.orientador == null}" />
	</h:panelGroup></div>

	<div style="float: left; width: auto; margin-left: 25px;"><h:panelGrid
		columns="3">
		<h:panelGroup>

			<h:outputLabel value="Bolsista:" />

			<h:outputText value="Sim" styleClass="visualizar_texto"
				rendered="#{alunoHandler.alunoAtual.possuiBolsa}" />

			<h:outputText value="Não" styleClass="visualizar_texto"
				rendered="#{!alunoHandler.alunoAtual.possuiBolsa}" />


		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Orígem Bolsa:" for="origem" />


			<h:outputText id="origem"
				value="#{alunoHandler.alunoAtual.origemBolsa}"
				styleClass="visualizar_texto" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Tipo da Bolsa:" for="tipo" />

			<h:outputText id="tipo"
				value="#{alunoHandler.alunoAtual.tipoOrigemBolsa}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		
		
	
	
	</h:panelGrid></div>
	</div>

	</fieldset>



	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:panelGroup id="listaAreas"
			rendered="#{!empty alunoHandler.alunoAtual.areasPesquisa}">
			<div id="lista_Visualizar"><rich:dataList var="area"
				value="#{alunoHandler.alunoAtual.areasPesquisa}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup id="nenhumaArea"
			rendered="#{empty alunoHandler.alunoAtual.areasPesquisa}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Aluno" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>


	<fieldset><legend>Laboratórios</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty alunoHandler.alunoAtual.laboratorios}">


			<div id="lista_Visualizar"><rich:dataList
				value="#{alunoHandler.alunoAtual.laboratorios}" var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />

				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup rendered="#{empty alunoHandler.alunoAtual.laboratorios}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Laboratório associado ao Aluno" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>



	<fieldset><legend>Projetos</legend>

	<div id="lista_Visualizar"><h:panelGroup id="panelProjetos">

		<h:panelGroup rendered="#{!empty alunoHandler.projetosAdicionados}">


			<rich:dataList var="projeto" id="listaProjetos"
				value="#{alunoHandler.projetosAdicionados}">

				<h:outputText value="#{projeto.nome}" styleClass="label" />
				<br />
				<h:outputText value="Subprojeto: #{projeto.nomeSubprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList>

		</h:panelGroup>
		<h:panelGroup rendered="#{empty alunoHandler.projetosAdicionados}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto Pesquisador associado." /></li>
			</ul>
		</h:panelGroup>
	</h:panelGroup> <h:panelGroup id="panelProjetosSimples">

		<h:panelGroup
			rendered="#{!empty alunoHandler.alunoAtual.projetosSimples}">


			<rich:dataList var="projeto" id="listaProjetosSimples"
				value="#{alunoHandler.alunoAtual.projetosSimples}"
				style="list-style-type: square">

				<h:outputText value="#{projeto.nome}" styleClass="label" />

				<br />
				<h:outputText value="Duração: #{projeto.duracao}" />
				<h:outputText value=" #{projeto.tipoDuracao} " />
				<h:outputText value=" - " />
				<h:outputText value=" Subprojeto: #{projeto.subprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty alunoHandler.alunoAtual.projetosSimples}">
			<ul style="padding-left: 23px; list-style-type: square">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto Aluno associado." /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></div>


	</fieldset>


	<fieldset><legend>Publicações</legend> <h:panelGroup
		id="panelPublicacao">

		<h:panelGroup rendered="#{!empty alunoHandler.publicacoes}">


			<div id="lista_Visualizar"><rich:dataTable id="tabelaPub"
				rows="10" var="publicacao" value="#{alunoHandler.publicacoes}"
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
		<h:panelGroup rendered="#{empty alunoHandler.publicacoes}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Publicação escrita pelo Aluno" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>











</f:subview>
</body>
</html>

