<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	   	<%@include file="../head.jsp" %>
		<title>HPV-LIKA</title>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"></script>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"></script>
  	</head>

	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
	      	</div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>
			
			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2>FORMUL&Aacute;RIO</h2>
				<br>
				<input type="hidden" name="formulario.id" value="${formulario.id}"/>
				<table class="block" id="tabelaFormulario" >
					<tr>
						<td class="block">Código PRONEX</td>
						<td class="block">${formulario.codigoPronex}</td>
					</tr>

					<tr>
						<td class="block">Data</td>
						<td class="block">${formulario.data}</td>
					</tr>

					<tr>
						<td class="block">Local Coleta</td>
						<td class="block">${formulario.localColeta}</td>
					</tr>

					<tr>
						<td class="block">Grupo Participante</td>
						<td class="block">${formulario.grupoParticipante}</td>
					</tr>

					<tr>
						<td class="block">Número do prontuário</td>
						<td class="block">${formulario.numeroProntuario}</td>
					</tr>
					
					<tr>
						<td class="block">Código de barras</td>
						<td class="block">${formulario.codigoBarras}</td>
					</tr>
					
					<tr>
						<td></td>
						<td><br/></td>
					</tr>
	<!----------------------------------------------------------------------------------------------------------------->
					<tr>
						<td colspan="2">Parte 2)Informações pessoais</td>
					</tr>
		
					<tr>
						<td class="block">Nome</td>
						<td class="block">${informacoesPessoais.nome}</td>
					</tr>
					<tr>
						<td class="block">Data Nascimento</td>
						<td class="block">${informacoesPessoais.dataNascimento}</td>
					</tr>
					<tr>
						<td class="block">Idade</td>
						<td class="block">${informacoesPessoais.idade}</td>
					<tr>
						<td class="block">Sexo</td>
						<td class="block">${informacoesPessoais.sexo}</td>
					</tr>
					<!-- ENDERECO ATUAL -->
					<tr>
						<td align="left" colspan="2" valign="top" class="block"><strong>Resid&ecirc;ncia Atual</strong></td>
					</tr>

					<tr>
						<td class="block">Endere&ccedil;o</td>
						<td class="block">${informacoesPessoais.residenciaAtualEndereco}</td>
					</tr>
					<tr>
						<td class="block">Bairro</td>
						<td class="block">${informacoesPessoais.residenciaAtualBairro}</td>
					</tr>
					<tr>
						<td class="block">Cidade</td>
						<td class="block">${informacoesPessoais.residenciaAtualCidade}</td>
					</tr>

					<tr>
						<td class="block">Município</td>
						<td class="block">${informacoesPessoais.residenciaAtualCidade}</td>
					</tr>

					<tr>
						<td class="block">UF</td>
						<td class="block">${informacoesPessoais.residenciaAtualEstadoUF}</td>
					</tr>
					<tr>
						<td class="block">CEP</td>
						<td class="block">${informacoesPessoais.residenciaAtualCep}</td>
					</tr>
					<tr>
						<td class="block">Zona</td>
						<td class="block">${informacoesPessoais.residenciaAtualZona}</td>
					</tr>
					<tr>
						<td class="block">Tempo de Resid&ecirc;ncia</td>
						<td class="block">${informacoesPessoais.residenciaAtualTempoAnos}<i>anos e </i>${informacoesPessoais.residenciaAtualTempoMeses} <i>m&ecirc;s(es)</i></td>
					</tr>
					<td valign="top" class="block">Proximidade</td>
						<td class="block">
							<c:if test="${informacoesPessoais.residenciaAtualProximidadeMineradora == 'Y'}">mineradora</c:if>
							<br/>
							<c:if test="${informacoesPessoais.residenciaAtualProximidadePedraSabao == 'Y'}">arte c/ pedra sab&atilde;o</c:if>
							<br/>
							<c:if test="${informacoesPessoais.residenciaAtualProximidadeFabricas == 'Y'}">f&aacute;bricas/ind&uacute;strias</c:if>
							<br/>
							Outros: ${informacoesPessoais.residenciaAtualProximidadeOutros}
							<br>
						</td>
					</tr>
					<tr>
						<td class="block">Telefone</td>
						<td class="block">${informacoesPessoais.residenciaAtualTelefone}</td>
					<tr>
					
					<tr>
						<td align="left" colspan="2" valign="top" class="block">
							<strong>Resid&ecirc;ncia Anterior</strong>
						</td>
					</tr>
					<tr>
						<td class="block">Cidade</td>
						<td class="block">${informacoesPessoais.residenciaAnteriorCidade}</td>
					</tr>
					<tr>
						<td class="block">Bairro</td>
						<td class="block">${informacoesPessoais.residenciaAnteriorBairro}</td>
					</tr>
					<tr>
						<td class="block">UF</td>
						<td class="block">${informacoesPessoais.residenciaAnteriorEstadoUF}</td>
					</tr>
					<tr>
						<td class="block">Tempo de resid&ecirc;ncia</td>
						<td class="block">
							${informacoesPessoais.residenciaAnteriorTempoAnos} <i>anos e </i>${informacoesPessoais.residenciaAnteriorTempoMeses} <i>m&ecirc;s(es)</i></td>
					</tr>

					<tr>
						<td valign="top" class="block">Proximidade</td>
						<td class="block">
							<c:if test="${informacoesPessoais.residenciaAnteriorProximidadeMineradora == 'Y'}">mineradora</c:if>
							<br/>	
							<c:if test="${informacoesPessoais.residenciaAnteriorProximidadePedraSabao == 'Y'}">arte c/ pedra sabão</c:if>
							<br/>
							<c:if test="${informacoesPessoais.residenciaAnteriorProximidadeFabricas == 'Y'}">f&aacute;bricas/ind&uacute;strias</c:if>
							<br/>
							Outros: ${informacoesPessoais.residenciaAnteriorProximidadeOutros}
						</td>
					</tr>
					<tr>
						<td></td>
						<td><br></td>
					</tr>
					<tr>
						<td>Parte 3) SITUAÇÃO SOCIOECONÔMICA E DEMOGRÁFICA</td>
						<td><br></td>
					</tr>
					<tr>
							<td class="block" width="300">Etnia</td>
							<td class="block">${situacaoSocioEconomicaDemografica.etnia}</td>
						</tr>
						<tr>
							<td class="block">Situação conjugal</td>
							<td class="block">${situacaoSocioEconomicaDemografica.situacaoConjugal}</td>
						</tr>
						<tr>
							<td class="block">Escolaridade</td>
							<td class="block">${situacaoSocioEconomicaDemografica.escolaridade}</td>
						</tr>
						
						<tr>
							<td class="block">Principal ocupação</td>
							<td class="block">
								${situacaoSocioEconomicaDemografica.principalOcupacaoNome}<br>
								Tempo: ${situacaoSocioEconomicaDemografica.principalOcupacaoTempoAnos} anos e ${situacaoSocioEconomicaDemografica.principalOcupacaoTempoMeses} meses <br> 
								CBO ${situacaoSocioEconomicaDemografica.principalOcupacaoCBO}
							</td>
						</tr>
						<tr>
							<td class="block">Onde trabalha</td>
							<td class="block">{situacaoSocioEconomicaDemografica.ondeTrabalha}</td>
						</tr>
						<tr>
							<td class="block">A ocupação que a Sra. teve por mais tempo</td>
							<td class="block">
								Nome: ${situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoNome}<br>
								CBO: ${situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoCBO}<br>
							</td>
						</tr>
						<tr>
							<td class="block">A Sra. tem ou j&aacute; teve alguma atividade de trabalho, em que ficava em contato com <u>produtos qu&iacute;micos </u>?
							</td>
							<td colspan="2" class="block"> ${situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico} <br><br>
								<c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico == 'sim'}">
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.tintas == \"Y\"}'>Tintas</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.combustiveis == \"Y\"}'>Combustíveis / Lubrificantes</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.preservativoMadeira == \"Y\"}'>Preservativos de madeira</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.solvente == \"Y\"}'>Solvente</c:if>              
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.inseticidas == \"Y\"}'>Inseticidas, Pesticidas e Herbicidas</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.corantes == \"Y\"}'>Corantes e pigmentos</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.resinas == \"Y\"}'>Resinas</c:if> 
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.acidos == \"Y\"}'>&Aacute;cidos e c&aacute;usticos fortes</c:if> 
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.plasticos == \"Y\"}'>Produto para fabricação de pl&aacute;sticos</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.borracha == \"Y\"}'>Produto para fabricação de borracha</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.ns_nr == \"Y\"}'>NS/NR</c:if>
									<br />
									Outros produtos químicos: ${situacaoSocioEconomicaDemografica.produtosQuimicos.outros}<br />
								</c:if> 
							</td>
						</tr>
						<tr>
							<td class="block">
								A Sra. tem ou j&aacute; teve alguma atividade de trabalho em que teve contato com <u>metais pesados</u>, como cromo, c&aacute;dmio, n&iacute;quel ou outros
							</td>
							<td colspan="2" class="block">${situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados} 
								<c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados == 'sim'}">
									<br/><br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.cromo == \"Y\"}'>Cromo</c:if>
									<br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.cadmio == \"Y\"}'>C&aacute;dmio</c:if>
									<br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.niquel == \"Y\"}'>Níquel</c:if>
									<br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.mercurio == \"Y\"}'>Merc&uacute;rio</c:if>
									<br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.chumbo == \"Y\"}'>Chumbo</c:if>
									<br/>
									<c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.ns_nr == \"Y\"}'>NR/NR</c:if>
									<br/>
									Outros metais pesados: ${situacaoSocioEconomicaDemografica.metaisPesados.outros}<br/>
								</c:if>
							</td>
						</tr>
						
						<tr>
							<td class="block">
								A Sra. tem ou j&aacute; teve alguma atividade de trabalho em que teve contato com algum tipo de radiação?
							</td>
							<td class="block">${situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao}
								<c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao == 'sim'}">
									<br/><br/>
									<c:if test='${situacaoSocioEconomicaDemografica.radiacoes.solar == \"Y\"}'>Solar</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.radiacoes.raioX == \"Y\"}'>Raio X e outras radiações ionizantes</c:if>
									<br />
									<c:if test='${situacaoSocioEconomicaDemografica.radiacoes.ns_nr == \"Y\"}'>NS/NR</c:if>
									<br />
									Outras radiações:${situacaoSocioEconomicaDemografica.radiacoes.outros}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="block">
								Contando com salário, pensão, e outras rendas, em que faixa de renda a Sra. se encaixa?
							</td>
							<td class="block">${situacaoSocioEconomicaDemografica.renda}</td>
						</tr>
						<tr>
							<td class="block">Número de pessoas no domicílio</td>
							<td class="block">${situacaoSocioEconomicaDemografica.numeroPessoasDomicilio}</td>
						</tr>
						<tr>
							<td></td>
							<td><br></td>
						</tr>
						<tr>
							<td>Parte 4) HISTÓRICO SEXUAL E REPRODUTIVO</td>
							<td><br></td>
						</tr>						
						<tr>
							<td class="block" width="260px;">Relações Sexuais</td>
							<td class="block" width="265px;">${historicoSexual.jaTeveRelacaoSexual}
								<c:if test='${historicoSexual.jaTeveRelacaoSexual == \"sim\"}'>
									Idade da primeira relação sexual: ${historicoSexual.idadePrimeiraRelacaoSexual}<br/>
									A Sra. está grávida ou amamentando? : ${historicoSexual.estaGravida}<br/>
									Número de parceiros: <c:if test='${historicoSexual.numeroParceiros == \"muitos\"}'>muitos</c:if>
														 <c:if test='${historicoSexual.numeroParceiros == \"ns/nr\"}'>NS/NR</c:if>
														 <c:if test='${historicoSexual.numeroParceiros != \"ns/nr\" && historicoSexual.numeroParceiros != \"muitos\"}'>$historicoSexual.numeroParceiros}</c:if>
									<br>
									Número de gestações: ${historicoSexual.numeroGestacoes}<br>
									Idade da primeira gestação: ${historicoSexual.idadePrimeiraGestacao}<br>
									Idade que nasceu o primeiro filho: ${historicoSexual.idadeNasceuPrimeiroFilho}<br>
									Número de abortos: ${historicoSexual.numeroAbortos}<br>
									Número de partos: ${historicoSexual.numeroPartos}<br>
									Número de partos normal: ${historicoSexual.numeroPartosNormal}<br>
									Número de partos cesária: ${historicoSexual.numeroPartosCesaria}<br>
								</c:if>
							</td>
						</tr>
						


				</table>
		</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>
</html>