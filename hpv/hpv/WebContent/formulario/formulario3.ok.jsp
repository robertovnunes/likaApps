<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	    <%@include file="../head.jsp" %>
		
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
	    <title>HPV-LIKA</title>
  	</head>
	<body onload="quandoEditar();">
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
				<h2> 3. SITUAÇÃO SOCIOECONÔMICA E DEMOGRÁFICA</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>

				<br>
			<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 3 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>	
<br />
				<br>
				<form action="formulario.addFormulario3.logic" method="post">
					<input type="hidden" name="situacaoSocioEconomicaDemografica.formulario.id" value="${formulario.id}" />
					<input type="hidden" name="situacaoSocioEconomicaDemografica.id" value="${situacaoSocioEconomicaDemografica.id}" />
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />

					<table class="block" id="formulario3">
						<tr>
							<td class="block" width="300">Etnia</td>
							<td class="block"> 
								<select name="situacaoSocioEconomicaDemografica.etnia">
									<option value="" <c:if test="${situacaoSocioEconomicaDemografica.etnia == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="Amarela" <c:if test="${situacaoSocioEconomicaDemografica.etnia == 'Amarela'}">selected="selected"</c:if>>Amarela</option>
									<option value="Branca" <c:if test="${situacaoSocioEconomicaDemografica.etnia == 'Branca'}">selected="selected"</c:if>>Branca</option>
									<option value="Indígena" <c:if test="${situacaoSocioEconomicaDemografica.etnia == 'Indígena'}">selected="selected"</c:if>>Indígena</option>
									<option value="Parda" <c:if test="${situacaoSocioEconomicaDemografica.etnia == 'Parda'}">selected="selected"</c:if>>Parda</option>
									<option value="Preta" <c:if test="${situacaoSocioEconomicaDemografica.etnia == 'Preta'}">selected="selected"</c:if>>Preta</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">Situação conjugal</td>
							<td class="block">
								<select name="situacaoSocioEconomicaDemografica.situacaoConjugal">
									<option value="" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="Casada" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == 'Casada'}">selected="selected"</c:if>>Casada</option>
									<option value="Separada" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == 'Separada'}">selected="selected"</c:if>>Separada</option>
									<option value="Solteira" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == 'Solteira'}">selected="selected"</c:if>>Solteira</option>
									<option value="União consensual(estável)" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == 'União consensual(estável)'}">selected="selected"</c:if>>União consensual (estável)</option>
									<option value="Viúva" <c:if test="${situacaoSocioEconomicaDemografica.situacaoConjugal == 'Viúva'}">selected="selected"</c:if>>Viúva</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">Qual a sua escolaridade</td>
							<td class="block">
								<select name="situacaoSocioEconomicaDemografica.escolaridade" id="situacaoSocioEconomicaDemografica.escolaridade" onchange="addCampoProfissao(this.value,this.parentNode.parentNode.rowIndex);">
									<option value="" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="nenhuma" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'nenhuma'}">selected="selected"</c:if>>nenhuma</option>
									<option value="fundamental menor incompleto" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'fundamental menor incompleto'}">selected="selected"</c:if>>Fund. Menor Incompleto</option>
									<option value="fundamental menor completo" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'fundamental menor completo'}">selected="selected"</c:if>>Fund. Menor Completo</option>
									<option value="fundamental maior incompleto" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'fundametal maior incompleto'}">selected="selected"</c:if>>Fund. Maior Incompleto</option>
									<option value="fundamental maior completo" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'fundamental maior completo'}">selected="selected"</c:if>>Fund. Maior Completo</option>
									<option value="médio incompleto" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'médio incompleto'}">selected="selected"</c:if>>Médio Incompleto </option>
									<option value="médio completo" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'médio completo'}">selected="selected"</c:if>>Médio Completo</option>
									<option value="superior incompleto" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'superior incompleto'}">selected="selected"</c:if>>Superior Incompleto</option>
									<option value="superior completo" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'superior completo'}">selected="selected"</c:if>>Superior Completo</option>
									<option value="curso técnico" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'técnico'}">selected="selected"</c:if>>Curso Técnico</option>
									<option value="ns/nr" <c:if test="${situacaoSocioEconomicaDemografica.escolaridade == 'ns/nr'}">selected="selected"</c:if>>NS/Recusa</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="block">Sua principal ocupação?<br/>
								<span class="observacao">(ocupação seria correspondente &agrave; alguma atividade remunerada. <br> exemplo:auxiliar serviços gerais, secret&aacute;ria, estudante,aut&ocirc;noma,etc.)</span>
							</td>
							<td class="block">
								Nome <input style='margin-bottom: 5px;' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.principalOcupacaoNome' value="${situacaoSocioEconomicaDemografica.principalOcupacaoNome}" maxlength='100'/>
								Tempo <input type='text' name='situacaoSocioEconomicaDemografica.principalOcupacaoTempoAnos' value="${situacaoSocioEconomicaDemografica.principalOcupacaoTempoAnos}" onkeyup='this.value=doDecimal(this.value);' class='pequeno' maxlength=3/><i>(anos)</i> <input type='text' name='situacaoSocioEconomicaDemografica.principalOcupacaoTempoMeses' value="${situacaoSocioEconomicaDemografica.principalOcupacaoTempoMeses}" onkeyup='this.value=doDecimal(this.value);' class='pequeno' maxlength=2/><i>(meses)</i> 
								<br><br>
								CBO <input style='margin-top: 5px; ' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.principalOcupacaoCBO' value="${situacaoSocioEconomicaDemografica.principalOcupacaoCBO}" maxlength="50"/> 
								<a href='http://www.mtecbo.gov.br/a-z.asp' style='font-size:9pt;float:right' target='about'>(consultar)</a>
							</td>
						</tr>
						<tr>
							<td class="block">Onde a Sra. trabalha?<br/>
								<span class="observacao">(hospital, restaurante, escola, creche, lavanderia, etc.)</span>
							</td>
							<td class="block">
								<input name="situacaoSocioEconomicaDemografica.ondeTrabalha" value="${situacaoSocioEconomicaDemografica.ondeTrabalha}" class="textfieldLongo" maxlength="50"/>
							</td>
						</tr>
						<tr>
							<td class="block">Qual foi a ocupação que a Sra. teve por mais tempo?	<br/>
								<span class="observacao">(auxiliar de escrit&oacute;rio, arquiteta, enfermeira,cozinheira, etc.)</span>								
							</td>
							<td class="block">
								Nome <input style='margin-bottom: 5px;' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoNome' value="${situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoNome}" maxlength='100'/>
								CBO <input style='margin-top: 5px; ' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoCBO' value="${situacaoSocioEconomicaDemografica.ocupacaoQueTevePorMaisTempoCBO}" maxlength="50"/>
								<a href='http://www.mtecbo.gov.br/a-z.asp' style='font-size:9pt;float:right' target='about'>(consultar)</a>
							</td>
						</tr>
						<tr>
							<td class="block">A Sra. tem ou j&aacute; teve alguma atividade de trabalho, em que ficava em contato com <u>produtos qu&iacute;micos </u>?
							</td>
							<td colspan="2" class="block">
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico" id="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimicoSim" value="sim" onclick="ativarOpcoesProdutosQuimicos(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico == 'sim'}">checked="checked"</c:if>> Sim 
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico" id="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimicoNao" value="nao" onclick="ativarOpcoesProdutosQuimicos(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico == 'nao'}">checked="checked"</c:if>> Não
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico" id="situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimicoNSNR" value="ns/nr" onclick="ativarOpcoesProdutosQuimicos(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimico == 'ns/nr'}">checked="checked"</c:if>> NS/NR
							</td>
						</tr>
						
						<tr>
							<td class="block">
								A Sra. tem ou j&aacute; teve alguma atividade de trabalho em que teve contato com <u>metais pesados</u>, como cromo, c&aacute;dmio, n&iacute;quel ou outros?
							</td>
							<td colspan="2" class="block">
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados" id="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesadosSim" value="sim" onclick="ativarOpcoesContatoMetaisPesados(this.value, this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados == 'sim'}">checked="checked"</c:if>/>Sim 
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados" id="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesadosNao" value="nao" onclick="ativarOpcoesContatoMetaisPesados(this.value, this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados == 'nao'}">checked="checked"</c:if>/>Não   
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados" id="situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesadosNSNR" value="ns/nr" onclick="ativarOpcoesContatoMetaisPesados(this.value, this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesados == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						
						<tr>
							<td class="block">
								A Sra. tem ou j&aacute; teve alguma atividade de trabalho em que teve contato com algum tipo de <u>radiação</u>?
							</td>
							<td class="block">
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao" id="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacaoSim" value="sim" onclick="ativarOpcoesContatoRadiacao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao == 'sim'}">checked="checked"</c:if>> Sim
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao" id="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacaoNao" value="nao" onclick="ativarOpcoesContatoRadiacao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao == 'nao'}">checked="checked"</c:if>> Não
								<input type="radio" name="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao" id="situacaoSocioEconomicaDemografica.jaTeveContatoRadiacaoNSNR" value="ns/nr" onclick="ativarOpcoesContatoRadiacao(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${situacaoSocioEconomicaDemografica.jaTeveContatoRadiacao == 'ns/nr'}">checked="checked"</c:if>> NS/NR
							</td>
						</tr>
						<tr>
							<td class="block">
								Contando com salário, pensão, e outras rendas, em que faixa de renda a Sra. se encaixa?
							</td>
							<td class="block">
								<select name="situacaoSocioEconomicaDemografica.renda">
									<option value="" <c:if test="${situacaoSocioEconomicaDemografica.renda == ''}">selected="selected"</c:if>>selecione...</option>
									<option value="Não tem renda" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'Não tem renda'}">selected="selected"</c:if>>Não tem renda</option>
									<option value="Menos de 1 salário mínimo" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'Menos de 1 salário mínimo'}">selected="selected"</c:if>>Menos de 1 salário mínimo</option>
									<option value="De 1 a menos de 2 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 1 a menos de 2 salários mínimos'}">selected="selected"</c:if>>De 1 a menos de 2 salários mínimos</option>
									<option value="De 2 a menos de 3 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 2 a menos de 3 salários mínimos'}">selected="selected"</c:if>>De 2 a menos de 3 salários mínimos</option>
									<option value="De 3 a menos de 5 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 3 a menos de 5 salários mínimos'}">selected="selected"</c:if>>De 3 a menos de 5 salários mínimos</option>
									<option value="De 5 a menos de 10 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 5 a menos de 10 salários mínimos'}">selected="selected"</c:if>>De 5 a menos de 10 salários mínimos</option>
									<option value="De 10 a menos de 20 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 10 a menos de 20 salários mínimos'}">selected="selected"</c:if>>De 10 a menos de 20 salários mínimos</option>
									<option value="De 20 a menos de 30 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 20 a menos de 30 salários mínimos'}">selected="selected"</c:if>>De 20 a menos de 30 salários mínimos</option>
									<option value="De 30 a menos de 40 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 30 a menos de 40 salários mínimos'}">selected="selected"</c:if>>De 30 a menos de 40 salários mínimos</option>
									<option value="De 40 a menos de 50 salários mínimos" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'De 40 a menos de 50 salários mínimos'}">selected="selected"</c:if>>De 40 a menos de 50 salários mínimos</option>
									<option value="50 salários mínimos ou mais" <c:if test="${situacaoSocioEconomicaDemografica.renda == '50 salários mínimos ou mais'}">selected="selected"</c:if>>50 salários mínimos ou mais</option>
									<option value="NS/Recusa" <c:if test="${situacaoSocioEconomicaDemografica.renda == 'NS/Recusa'}">selected="selected"</c:if>>NS/Recusa</option>                          
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">Número de pessoas no domicílio</td>
							<td class="block">
								<input name="situacaoSocioEconomicaDemografica.numeroPessoasDomicilio" value="${situacaoSocioEconomicaDemografica.numeroPessoasDomicilio}" onkeyup="this.value=doDecimal(this.value);" maxlength="5"/>(especifique)
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
	<script type="text/javascript">
		var quimicos = false;
		function ativarOpcoesProdutosQuimicos(valor,linha){
			if(valor == "sim" && quimicos == false){
				var x = document.getElementById("formulario3").insertRow(linha+1);
				var elto = x.insertCell(0);
				elto.innerHTML = "<div >";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.tintas' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.tintas == \"Y\"}'>checked='checked'</c:if>/>Tintas";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.combustiveis' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.combustiveis == \"Y\"}'>checked='checked'</c:if>/>Combustíveis / Lubrificantes";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.preservativoMadeira' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.preservativoMadeira == \"Y\"}'>checked='checked'</c:if>/>Preservativos de madeira";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.solvente' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.solvente == \"Y\"}'>checked='checked'</c:if>/>Solvente   ";              
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.inseticidas' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.inseticidas == \"Y\"}'>checked='checked'</c:if>/>Inseticidas, Pesticidas e Herbicidas";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.corantes' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.corantes == \"Y\"}'>checked='checked'</c:if>/>Corantes e pigmentos";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.resinas' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.resinas == \"Y\"}'>checked='checked'</c:if>/>Resinas"; 
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.acidos' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.acidos == \"Y\"}'>checked='checked'</c:if>/>&Aacute;cidos e c&aacute;usticos fortes"; 
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.plasticos' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.plasticos == \"Y\"}'>checked='checked'</c:if>/>Produto para fabricação de pl&aacute;sticos";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.borracha' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.borracha == \"Y\"}'>checked='checked'</c:if>/>produto para fabricação de borracha";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.produtosQuimicos.ns_nr' <c:if test='${situacaoSocioEconomicaDemografica.produtosQuimicos.ns_nr == \"Y\"}'>checked='checked'</c:if>/>NS/NR";
				elto.innerHTML +="<br />";
				elto.innerHTML +="Outros produtos químicos <input name='situacaoSocioEconomicaDemografica.produtosQuimicos.outros' value='${situacaoSocioEconomicaDemografica.produtosQuimicos.outros}' maxlength='50'/>(especifique)<br />";
				elto.innerHTML +="</div>";
				elto.colSpan = 2;
				elto.id = "block";
				quimicos = true;
			}
			else if ((valor == "nao" || valor == "ns/nr") && quimicos == true){
				var str = document.getElementById("formulario3").rows[linha+1].innerHTML;
				if(str.indexOf("Tintas") >= 0 ){/*então existia antes o campo na tabela*/
					var tbl = document.getElementById('formulario3');
					tbl.deleteRow(linha+1);
					quimicos = false;
				}
			}	
		}	
	
		var pesados = false;
		function ativarOpcoesContatoMetaisPesados(valor,linha){
			if(valor == "sim" && pesados == false){	
				var x = document.getElementById("formulario3").insertRow(linha+1);
				var elto = x.insertCell(0);
				elto.innerHTML = "<div >";
				elto.innerHTML +="<input type=hidden name='situacaoSocioEconomicaDemografica.metaisPesados.id' value='${situacaoSocioEconomicaDemografica.metaisPesados.id}'/>";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.cromo' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.cromo == \"Y\"}'>checked='checked'</c:if>/>Cromo";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.cadmio' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.cadmio == \"Y\"}'>checked='checked'</c:if> />C&aacute;dmio";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.niquel' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.niquel == \"Y\"}'>checked='checked'</c:if>/>Níquel";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.mercurio' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.mercurio == \"Y\"}'>checked='checked'</c:if>/>Merc&uacute;rio";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.chumbo' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.chumbo == \"Y\"}'>checked='checked'</c:if>/>Chumbo";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.metaisPesados.ns_nr' <c:if test='${situacaoSocioEconomicaDemografica.metaisPesados.ns_nr == \"Y\"}'>checked='checked'</c:if>/>NS/NR";
				elto.innerHTML +="<br />";
				elto.innerHTML +="Outros metais pesados <input name='situacaoSocioEconomicaDemografica.metaisPesados.outros' value='${situacaoSocioEconomicaDemografica.metaisPesados.outros}'/>(especifique) <br/> </div> ";
				elto.colSpan = 2;
				elto.id = "block";
				pesados = true;
			}
			else if (valor == "nao" && pesados == true){
				var str = document.getElementById("formulario3").rows[linha+1].innerHTML;
				if(str.indexOf("Cromo") >= 0 ){/*então existia antes o campo na tabela*/
					var tbl = document.getElementById('formulario3');
					tbl.deleteRow(linha+1);
					pesados = false;
				}
			}
		}

		
		var radiacao = false;
		function ativarOpcoesContatoRadiacao(valor,linha){
			if(valor == "sim" && radiacao == false){	
				var x = document.getElementById("formulario3").insertRow(linha+1);
				var elto = x.insertCell(0);
				elto.innerHTML = "<div >";
				elto.innerHTML +="<input type='hidden' name='situacaoSocioEconomicaDemografica.radiacoes.id' value='${situacaoSocioEconomicaDemografica.radiacoes.id}'> ";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.radiacoes.solar' <c:if test='${situacaoSocioEconomicaDemografica.radiacoes.solar == \"Y\"}'>checked='checked'</c:if>/>Solar";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.radiacoes.raioX' <c:if test='${situacaoSocioEconomicaDemografica.radiacoes.raioX == \"Y\"}'>checked='checked'</c:if>/>Raio X e outras radiações ionizantes";
				elto.innerHTML +="<br />";
				elto.innerHTML +="<input type='checkbox' value='Y' name='situacaoSocioEconomicaDemografica.radiacoes.ns_nr' <c:if test='${situacaoSocioEconomicaDemografica.radiacoes.ns_nr == \"Y\"}'>checked='checked'</c:if>/>NS/NR";
				elto.innerHTML +="<br />";
				elto.innerHTML +="Outras radiações <input type=text name='situacaoSocioEconomicaDemografica.radiacoes.outros' id='jkjk' value='${situacaoSocioEconomicaDemografica.radiacoes.outros}'/>(especifique)";
				elto.innerHTML +="</div>";
				elto.colSpan = 2;
				elto.id = "block";
				radiacao = true;
			}else if ((valor == "nao" || valor== "ns/nr") && radiacao == true){
				var str = document.getElementById("formulario3").rows[linha+1].innerHTML;
				if(str.indexOf("Solar") >= 0 ){/*então existia antes o campo na tabela*/
					var tbl = document.getElementById('formulario3');
					tbl.deleteRow(linha+1);
					radiacao = false;
				}
			}
		}	
	
		var profissao = false;
		function addCampoProfissao(valor,linha){	
			if((valor == "superior completo" || valor == "curso técnico") && profissao == false){
				var tb = document.getElementById("formulario3").insertRow(linha+1);
				var temp = tb.insertCell(0);
				temp.id = "block";
				temp.innerHTML = "Profissão <br> <span style='color:gray;font-size:7pt;'> (profissão corresponde à alguma graduação) ";
				var temp2 = tb.insertCell(1);
				temp2.innerHTML =   "Nome <input style='margin-bottom: 5px;' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.profissaoFormacao' value='${situacaoSocioEconomicaDemografica.profissaoFormacao}' maxlength='100'/>"+
									"CBO <input style='margin-top: 5px; ' class='textfieldLongo' name='situacaoSocioEconomicaDemografica.profissaoFormacaoCBO' value='${situacaoSocioEconomicaDemografica.profissaoFormacaoCBO}'/> "+
									"<a href='http://www.mtecbo.gov.br/a-z.asp' style='font-size:9pt;float:right' target='about'>(consultar)</a>"+
									"<br><br>"+
									"Tempo <input type='text' name='situacaoSocioEconomicaDemografica.profissaoFormacaoAnos' value='${situacaoSocioEconomicaDemografica.profissaoFormacaoAnos}' onkeyup='this.value=doDecimal(this.value);' class='pequeno' maxlength=2/><i>(anos)</i>";
				temp2.id="block";
				profissao = true;
			}
			else if((valor != "superior comp." && valor != "tecnico") && profissao){
				var html = document.getElementById("formulario3").rows[linha+1].innerHTML;
				if(html.indexOf("Profiss") >= 0){
					var tbl = document.getElementById('formulario3');
					tbl.deleteRow(linha+1);
					profissao = false;
				}
			}
		}

		function quandoEditar(){
			var produtosQuimicos = document.getElementById("situacaoSocioEconomicaDemografica.jaTeveContatoProdutoQuimicoSim");	
			if(produtosQuimicos.checked){
				ativarOpcoesProdutosQuimicos(produtosQuimicos.value,produtosQuimicos.parentNode.parentNode.rowIndex);
			}
			var metaisPesados = document.getElementById("situacaoSocioEconomicaDemografica.jaTeveContatoMetaisPesadosSim");
			if(metaisPesados.checked){
				ativarOpcoesContatoMetaisPesados(metaisPesados.value, metaisPesados.parentNode.parentNode.rowIndex);
			}
			var radiacoes = document.getElementById("situacaoSocioEconomicaDemografica.jaTeveContatoRadiacaoSim");
			if(radiacoes.checked){
				ativarOpcoesContatoRadiacao(radiacoes.value,radiacoes.parentNode.parentNode.rowIndex);
			}
			var profissao = document.getElementById("situacaoSocioEconomicaDemografica.escolaridade");
			if(profissao.selectedIndex == 9 || profissao.selectedIndex == 11){
				addCampoProfissao(profissao.value, profissao.parentNode.parentNode.rowIndex);
			}
		}
	</script>
</html>