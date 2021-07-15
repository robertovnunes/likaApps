<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	   <%@include file="../head.jsp" %>
		<script type="text/javascript" src="javascripts/scriptFormatarData.js"></script>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"></script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"></script>
	    <title>HPV-LIKA</title>
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
				<h2>2. INFORMA&Ccedil;&Otilde;ES PESSOAIS</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
			
							<br>
				<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 2 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
			<br />	
			
			
				<br>
				<form action="formulario.addFormulario2.logic" method = "post">

					<input type="hidden" name="informacoesPessoais.id" value="${informacoesPessoais.id}" />
					<input type="hidden" value="${formulario.id}" name="informacoesPessoais.formulario.id">
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					
					<table class="block" id="tabelaFormulario">
						<tr>
							<td class="block">Nome</td>
							<td class="block"><input name="informacoesPessoais.nome" value="${informacoesPessoais.nome}" style="width: 100%;" maxlength="120"/></td>
						</tr>
						<tr>
							<td class="block">Data Nascimento</td>
							<td class="block">
								<input name="informacoesPessoais.dataNascimento" value="${informacoesPessoais.dataNascimento}" onkeyup="this.value=formateadata(this.value);calculaIdade(this.value);" onkeydown="this.value=formateadata(this.value);" class="data" maxlength="10"/> 
								<span style="color:gray; font-size: 7pt;">(DD/MM/AAAA)</span>
							</td>
						</tr>
						<tr>
							<td class="block">Idade</td>
							<td class="block"><input name="informacoesPessoais.idade" id='idade' value="${informacoesPessoais.idade}" onkeyup="this.value=doDecimal(this.value);" onkeydown="this.value=doDecimal(this.value);" style="width: 20px;" maxlength="3"/><span style="color:gray; font-size: 7pt;">(anos)</span></td>
							<script type="text/javascript">
								function calculaIdade(data){
									if(data != null && data.length == 10){
										var hoje = new Date();
										var anoNasc = data.substring(6);
										document.getElementById("idade").value = hoje.getFullYear() - anoNasc;
										
									}
								}	
							</script>
						</tr>
						<tr>
							<td class="block">Sexo</td>
							<td class="block">
								<select name="informacoesPessoais.sexo">
									<option value='' <c:if test="${informacoesPessoais.sexo == ''}">selected="selected"</c:if>>selecione...</option>
									<option value='feminino' <c:if test="${informacoesPessoais.sexo == 'feminino'}">selected="selected"</c:if>>Feminino</option>
									<option value='masculino' disabled="disabled" <c:if test="${informacoesPessoais.sexo == 'masculino'}">selected="selected"</c:if>>Masculino</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><br></td>
							<td></td> 
						</tr>
						<!-- ENDERECO ATUAL -->
						<tr>
							<td align="left" colspan="2" valign="top" class="block"><strong>Resid&ecirc;ncia Atual</strong></td>
						</tr>

						<tr>
							<td class="block">Endere&ccedil;o</td>
							<td class="block"><input name="informacoesPessoais.residenciaAtualEndereco" value="${informacoesPessoais.residenciaAtualEndereco}" style="width: 100%;" maxlength="100"/></td>
						</tr>
						<tr>
							<td class="block">Bairro</td>
							<td class="block"><input name="informacoesPessoais.residenciaAtualBairro" value="${informacoesPessoais.residenciaAtualBairro}" style="width: 100%;" maxlength="60"/></td>
						</tr>
	
						<tr>
							<td class="block">Cidade</td>
							<td class="block"><input name="informacoesPessoais.residenciaAtualCidade" value="${informacoesPessoais.residenciaAtualCidade}" style="width: 100%;" maxlength="60"/></td>
						</tr>

						<tr>
							<td class="block">Município</td>
							<td class="block"><input name="informacoesPessoais.residenciaAtualMunicipio" value="${informacoesPessoais.residenciaAtualCidade}" style="width: 100%;" maxlength="60"/></td>
						</tr>

						<tr>
							<td class="block">UF</td>
							<td class="block"><input name="informacoesPessoais.residenciaAtualEstadoUF" value="${informacoesPessoais.residenciaAtualEstadoUF}" maxlength="2" style="width:20px;text-transform: uppercase;" onblur="blur();"/></td>
						</tr>
						<tr>
							<td class="block">CEP</td>
							<td class="block"><input type='text' name="informacoesPessoais.residenciaAtualCep" value="${informacoesPessoais.residenciaAtualCep}" maxlength="8"/></td>
						</tr>
						<tr>
							<td class="block">Zona</td>
							<td class="block">
								<select name="informacoesPessoais.residenciaAtualZona">
									<option value="" <c:if test="${informacoesPessoais.residenciaAtualZona == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="urbana" <c:if test="${informacoesPessoais.residenciaAtualZona == 'urbana'}">selected="selected"</c:if>>Urbana</option>
									<option value="rural" <c:if test="${informacoesPessoais.residenciaAtualZona == 'rural'}">selected="selected"</c:if>>Rural</option>
								</select> 
							</td>
						</tr>
						<tr>
							<td class="block">Tempo de Resid&ecirc;ncia</td>
							<td class="block">
								<input type="text" name="informacoesPessoais.residenciaAtualTempoAnos" value="${informacoesPessoais.residenciaAtualTempoAnos}" style="width: 20px;" onkeyup='this.value=doDecimal(this.value);' maxlength="3"/>
								<i>anos e </i>&nbsp;
								<input type="text" name="informacoesPessoais.residenciaAtualTempoMeses" value="${informacoesPessoais.residenciaAtualTempoMeses}" style="width: 20px;" onkeyup='this.value=doDecimal(this.value);' maxlength="2"/>
								 <i>m&ecirc;s(es)</i> 
							</td>
						</tr>
						<!--<tr>
							<td valign="top" class="block">Condi&ccedil;&otilde;es da moradia</td>
							<td class="block">
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualCondicoesMoradiaAlvenaria" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaAlvenaria == 'Y'}">checked="checked"</c:if>/>alvenaria
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualCondicoesMoradiaPau_a_pique" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaPau_a_pique == 'Y'}">checked="checked"</c:if>/>pau-a-pique
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualCondicoesMoradiaAguaEncanada" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaAguaEncanada == 'Y'}">checked="checked"</c:if>/>&aacute;gua encanada
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualCondicoesMoradiaEsgotoEncanado" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaEsgotoEncanado == 'Y'}">checked="checked"</c:if>/>esgoto encanado
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualCondicoesMoradiaCriacaoBovinos" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaCriacaoBovinos == 'Y'}">checked="checked"</c:if>/>cria&ccedil;&atilde;o/manejo de bovinos
								<br/>
								<div class="block" >
									<input type="checkbox" name="informacoesPessoais.residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais" style="margin-left: 0;" value="Y" <c:if test="${informacoesPessoais.residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais == 'Y'}">checked="checked"</c:if>/>cria&ccedil;&atilde;o/manejo de outro animais									
									<br/>
									Quais animais? <input name="informacoesPessoais.residenciaAtualCondicoesMoradiaOutrosAnimais" value="${informacoesPessoais.residenciaAtualCondicoesMoradiaOutrosAnimais}" style="width: 360px;" maxlength=80/>
								</div>
							</td>
						</tr>
						<tr>
							--><td valign="top" class="block">Proximidade</td>
							<td class="block">
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualProximidadeMineradora" <c:if test="${informacoesPessoais.residenciaAtualProximidadeMineradora == 'Y'}">checked="checked"</c:if>/>mineradora
								<br/>	
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualProximidadePedraSabao" <c:if test="${informacoesPessoais.residenciaAtualProximidadePedraSabao == 'Y'}">checked="checked"</c:if>/>arte c/ pedra sab&atilde;o
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAtualProximidadeFabricas" <c:if test="${informacoesPessoais.residenciaAtualProximidadeFabricas == 'Y'}">checked="checked"</c:if>/>f&aacute;bricas/ind&uacute;strias
								<br/>
								Outros <input name="informacoesPessoais.residenciaAtualProximidadeOutros" value="${informacoesPessoais.residenciaAtualProximidadeOutros}" style="width: 360px;" maxlength="80"/>
							</td>
						</tr>
						<tr>
							<td class="block">Telefone</td>
							<td class="block"><input type='text' name="informacoesPessoais.residenciaAtualTelefone" value="${informacoesPessoais.residenciaAtualTelefone}" maxlength="13" onkeyup="this.value=doDecimal(this.value);"/></td>
						</tr>
			
						<tr>
							<td></td>
							<td><br></td>
						</tr>

						<tr>
							<td align="left" colspan="2" valign="top" class="block">
								<strong>Resid&ecirc;ncia Anterior</strong>
							</td>
						</tr>
						<tr>
							<td class="block">Cidade</td>
							<td class="block"><input name="informacoesPessoais.residenciaAnteriorCidade" value="${informacoesPessoais.residenciaAnteriorCidade}" style="width: 100%;" maxlength="60"/></td>
						</tr>
						<tr>
							<td class="block">Bairro</td>
							<td class="block"><input name="informacoesPessoais.residenciaAnteriorBairro" value="${informacoesPessoais.residenciaAnteriorBairro}" style="width: 100%;" maxlength="50"/></td>
						</tr>
						<tr>
							<td class="block">UF</td>
							<td class="block"><input name="informacoesPessoais.residenciaAnteriorEstadoUF" value="${informacoesPessoais.residenciaAnteriorEstadoUF}" maxlength="2" style="width:20px;text-transform: uppercase;"/></td>
						</tr>
						<tr>
							<td class="block">Tempo de resid&ecirc;ncia</td>
							<td class="block">
								<input type="text" name="informacoesPessoais.residenciaAnteriorTempoAnos" value="${informacoesPessoais.residenciaAnteriorTempoAnos}" style="width: 20px;" onkeyup='this.value=doDecimal(this.value);' maxlength="3"/> <i>anos e </i>&nbsp;
								<input type="text" name="informacoesPessoais.residenciaAnteriorTempoMeses" value="${informacoesPessoais.residenciaAnteriorTempoMeses}" style="width: 20px;" onkeyup='this.value=doDecimal(this.value);' maxlength="2"/> <i>m&ecirc;s(es)</i>
							</td>
						</tr>

						<!--  <tr>
							<td class="block">Zona</td>
							<td class="block">
								<select name="informacoesPessoais.residenciaAnteriorZona">
									<option value="" <c:if test="${informacoesPessoais.residenciaAnteriorZona == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="urbana" <c:if test="${informacoesPessoais.residenciaAnteriorZona == 'urbana'}">selected="selected"</c:if>>Urbana</option>
									<option value="rural" <c:if test="${informacoesPessoais.residenciaAnteriorZona == 'rural'}">selected="selected"</c:if>>Rural</option>
								</select>
							</td>
						</tr>-->
						
						<tr>
							<td valign="top" class="block">Proximidade</td>
							<td class="block">
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAnteriorProximidadeMineradora" <c:if test="${informacoesPessoais.residenciaAnteriorProximidadeMineradora == 'Y'}">checked="checked"</c:if>/>mineradora
								<br/>	
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAnteriorProximidadePedraSabao" <c:if test="${informacoesPessoais.residenciaAnteriorProximidadePedraSabao == 'Y'}">checked="checked"</c:if>/>arte c/ pedra sabão
								<br/>
								<input type="checkbox" value="Y" name="informacoesPessoais.residenciaAnteriorProximidadeFabricas" <c:if test="${informacoesPessoais.residenciaAnteriorProximidadeFabricas == 'Y'}">checked="checked"</c:if>/>f&aacute;bricas/ind&uacute;strias
								<br/>
								Outros	<input name="informacoesPessoais.residenciaAnteriorProximidadeOutros" value="${informacoesPessoais.residenciaAnteriorProximidadeOutros}" style="width:360px;" maxlength="80"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><br></td>
						</tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>			
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>
</html>