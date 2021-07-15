<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"> </script>
	    <title>HPV-LIKA</title>
  	</head>
	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
	      	</div>
	      	<div id="menuh-container">
		      	<%@include file="../logado/menu.jsp" %>
	      	</div>
			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2>FORMUL&Aacute;RIO CADASTRO BI&Oacute;PSIA</h2><!-- campo obrigatorio o h2 no css!!! -->

				<br>
				<form action="citopato.add.logic" method = "post" id='form'>
					<input type="hidden" name='laudoCitopatologico.id' value='${laudoCitopatologico.id}' />
					<input type="hidden" name='laudoCitopatologico.formulario.id' value='${formulario.id}' />
					
					<table class="block">
						<tr>
							<td colspan="2" class="block" style="width: 100%;">
								<b><u>EXAME CITOPATOLÓGICO DO COLO DO ÚTERO</u></b>
							</td>
						</tr>
						<tr>
							<td colspan="2" class=block>
								<div style="margin: 10px 0 10px 0">
									NOME <input type=text style="width: 400px;" readonly="readonly" value="${formulario.informacoesPessoais.nome}" maxlength="120"> <br>
								</div>
								<div style="margin: 10px 0 10px 0">
									N. REGISTRO (PRONEX) <input type=text style="width: 100px;" readonly="readonly" value="${formulario.codigoPronex}">
									IDADE <input type=text style="width: 100px;" readonly="readonly" value="${formulario.informacoesPessoais.idade}">
								</div>
								<div style="margin: 10px 0 10px 0">
									DATA DA REALIZAÇÃO DO EXAME:<input type=text style="width: 100px;" id='dataRealizacaoExame' name='laudoCitopatologico.dataRealizacaoExame' value="${laudoCitopatologico.dataRealizacaoExame}" maxlength="10" onkeyup="this.value=formateadata(this.value);" />
								</div>
								<div style="margin: 10px 0 10px 0">
									DATA DA LIBERAÇÃO DO RESULTADO: <input type=text style="width: 100px;" id='dataLiberacaoResultado' name='laudoCitopatologico.dataLiberacaoResultado' value='${laudoCitopatologico.dataLiberacaoResultado}' onkeyup="this.value=formateadata(this.value);" /> 
									<script type="text/javascript">
										function getDataAtual(){
											alert("opa");
											var today = new Date();
											return today.getDate() + "/" +today.getMonth() + "/" +today.getFullYear() ;
										}
									</script>
								</div>
							</td>
						</tr>
						<tr><td> </td><td><br/> </td>  </tr>

						<tr>
							<td colspan="2" class="block" style="width: 100%;">
								<b><u>RESULTADO DO EXAME CITOPATOLÓGICO DO COLO DO ÚTERO</u></b>
							</td>
						</tr>
						<tr><td> </td><td><br/> </td>  </tr> 
						<tr > 
							<td class="block" >Tipo da Amostra</td>
							
							<td class="block" >
								<select name='laudoCitopatologico.tipoAmostra' >
									<option value="Citologia Convencional" >Citologia Convencional</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block" >Material</td>
							<td class="block" >
								<input type="checkbox" name='laudoCitopatologico.materialEctocerviceEndocervice' value='Y' <c:if test="${laudoCitopatologico.materialEctocerviceEndocervice == 'Y'}">checked='checked'</c:if>/>Ectocérvice/Endocérvice  <br>
								<input type="checkbox" name='laudoCitopatologico.materialEctocervice' value='Y' <c:if test="${laudoCitopatologico.materialEctocervice == 'Y'}">checked='checked'</c:if>/>Ectocérvice <br>
								<input type="checkbox" name='laudoCitopatologico.materialVaginal' value='Y' <c:if test="${laudoCitopatologico.materialVaginal == 'Y'}">checked='checked'</c:if>/>Vaginal <br>
								<input type="checkbox" name='laudoCitopatologico.materialCupulaVaginal' value='Y' <c:if test="${laudoCitopatologico.materialCupulaVaginal == 'Y'}">checked='checked'</c:if>/>Cúpula vaginal<br>
							</td>
						</tr>
						<tr><td> </td><td><br/> </td>  </tr>
						<tr>
						</tr>
						<tr>
							<td class="block">
								<b>AVALIAÇÃO PRÉ-ANALÍTICA</b>
							</td>
							<td class="block">
								<div style="margin: 5px 0px 10px 5px">
									Amostra não processada por<br>
								</div>
								<input type="checkbox" name='laudoCitopatologico.amostraNaoProcessadaPorAusenciaErro' <c:if test="${laudoCitopatologico.amostraNaoProcessadaPorAusenciaErro == 'Y'}">checked='checked'</c:if> value='Y'>Ausência ou erro na identificação da lâmina, frasco ou formulário<br> 
								<input type="checkbox" name='laudoCitopatologico.amostraNaoProcessadaPorLaminaDanificada' <c:if test="${laudoCitopatologico.amostraNaoProcessadaPorLaminaDanificada == 'Y'}">checked='checked'</c:if> value='Y'>Lâmina danificada ou ausente<br>
								<input type="checkbox" name='laudoCitopatologico.amostraNaoProcessadaPorCausasAlheias' <c:if test="${laudoCitopatologico.amostraNaoProcessadaPorCausasAlheias == 'Y'}">checked='checked'</c:if> value='Y'>Causas alheias ao laboratório<br>
								<input type="checkbox" name='laudoCitopatologico.amostraNaoProcessadaPorOutrasCausas' <c:if test="${laudoCitopatologico.amostraNaoProcessadaPorOutrasCausas == 'Y'}">checked='checked'</c:if> value='Y'>Outras causas<br>
								<textarea name='laudoCitopatologico.amostraNaoProcessadaPorTextoOutrasCausas' rows="3" cols="5" style="width: 95%;">${laudoCitopatologico.amostraNaoProcessadaPorTextoOutrasCausas}</textarea>
								
							</td>
						</tr>
						<tr>
							<td class="block" >ADEQUABILIDADE DA AMOSTRA</td>
							<td class="block">
								<div class='block' style="margin-top: 10px;">
									<input type="radio" name='laudoCitopatologico.adequabilidadeAmostra' value='Satisfatória' onclick="funcaoAdequabilidadeAmostra(this.value);" <c:if test="${laudoCitopatologico.adequabilidadeAmostra == 'Satisfatória'}">checked='checked'</c:if>><u>Satisfatória</u><br>
									Obs.: <textarea name='laudoCitopatologico.adeqAmostraTextoOutros' rows="3" cols="5" style="width: 95%;">${laudoCitopatologico.adeqAmostraTextoOutros}</textarea>
								</div>
								<div class='block' style="margin-top: 10px;">
									<input type='radio' name='laudoCitopatologico.adequabilidadeAmostra' value='Insatisfatória' <c:if test="${laudoCitopatologico.adequabilidadeAmostra == 'Insatisfatória'}">checked='checked'</c:if>><u>Insatisfatória</u> devido a:<br>
									<div style="margin-left: 35px;">
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Material acelular ou hipocelular em menos de 10% do esfregaço <br>		
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraSangueMais75porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraSangueMais75porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Sangue em mais de 75% do esfregaço <br>
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Leucócitos obscurecendo mais de 75% do esfregaço <br>
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Artefatos de dessecamento em mais de 75% do esfregaço <br>
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraContaminantesExternosMais75porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraContaminantesExternosMais75porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Contaminantes externos em mais de 75% do esfregaço <br>
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco == 'Y'}">checked='checked'</c:if>> Intensa superposição celular em mais de 75% do esfregaço <br>
										<input type="checkbox" name='laudoCitopatologico.adeqAmostraOutros' value='Y' <c:if test="${laudoCitopatologico.adeqAmostraOutros == 'Y'}">checked='checked'</c:if>> Outros<br>
										<textarea name='laudoCitopatologico.adeqAmostraTextoOutros' rows="3" cols="5" style="width: 95%;">${laudoCitopatologico.adeqAmostraTextoOutros}</textarea>
									</div>
								</div>
								<br>
							</td>
						</tr>
						<tr>
							<td class="block">EPITÉLIOS REPRESENTADOS NA AMOSTRA</td>
							<td class="block">
								<input type="checkbox" name='laudoCitopatologico.epiteliosRepresentativosAmostraEscamoso' value='Y' <c:if test="${laudoCitopatologico.epiteliosRepresentativosAmostraEscamoso == 'Y'}"> checked='checked'</c:if>>Escamoso <br>
								<input type="checkbox" name='laudoCitopatologico.epiteliosRepresentativosAmostraGlandular' value='Y' <c:if test="${laudoCitopatologico.epiteliosRepresentativosAmostraGlandular == 'Y'}"> checked='checked'</c:if>>Glandular <br>
								<input type="checkbox" name='laudoCitopatologico.epiteliosRepresentativosAmostraMetaplasico' value='Y' <c:if test="${laudoCitopatologico.epiteliosRepresentativosAmostraMetaplasico == 'Y'}"> checked='checked'</c:if>>Metaplásico <br>
							</td>
						</tr>
						<tr>
							<td class="block">MICROBIOLOGIA</td>
							<td class="block">
								<input type="checkbox" name='laudoCitopatologico.microbiologiaLactobacillusSpp' value='Y' <c:if test="${laudoCitopatologico.microbiologiaLactobacillusSpp == 'Y'}"> checked='checked'</c:if>>Lactobacillus  spp<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaBacilos' value='Y' <c:if test="${laudoCitopatologico.microbiologiaBacilos == 'Y'}"> checked='checked'</c:if>>Bacilos<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaCocos' value='Y' <c:if test="${laudoCitopatologico.microbiologiaCocos == 'Y'}"> checked='checked'</c:if>>Cocos<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaSugestivoChlamydiaSpp' value='Y' <c:if test="${laudoCitopatologico.microbiologiaSugestivoChlamydiaSpp == 'Y'}"> checked='checked'</c:if>>Sugestivo de Chlamydia spp<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaActinomycesSpp' value='Y' <c:if test="${laudoCitopatologico.microbiologiaActinomycesSpp == 'Y'}"> checked='checked'</c:if>>Actinomyces spp<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaCandidaSpp' value='Y' <c:if test="${laudoCitopatologico.microbiologiaCandidaSpp == 'Y'}"> checked='checked'</c:if>>Candida spp<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaTrichomonasVaginalis' value='Y' <c:if test="${laudoCitopatologico.microbiologiaTrichomonasVaginalis == 'Y'}"> checked='checked'</c:if>>Trichomonas vaginalis<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaEfeitoCitopaticoCompativelHerpes' value='Y' <c:if test="${laudoCitopatologico.microbiologiaEfeitoCitopaticoCompativelHerpes == 'Y'}"> checked='checked'</c:if>>Efeito citopático compatível com vírus do grupo Herpes<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaBacilosSupracitoplasmaticos' value='Y' <c:if test="${laudoCitopatologico.microbiologiaBacilosSupracitoplasmaticos  == 'Y'}"> checked='checked'</c:if>>Bacilos Supracitoplasmáticos (sugestivo de Gardnerella vaginalis/Mobiluncus spp)<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaLeptothrixSpp' value='Y' <c:if test="${laudoCitopatologico.microbiologiaLeptothrixSpp == 'Y'}"> checked='checked'</c:if>>Leptothrix spp<br>
								<input type="checkbox" name='laudoCitopatologico.microbiologiaOutros' value='Y' <c:if test="${laudoCitopatologico.microbiologiaOutros == 'Y'}"> checked='checked'</c:if>>Outros<br>
								<textarea name='laudoCitopatologico.microbiologiaTextoOutros' rows="3" cols="2" style="width: 95%;">${laudoCitopatologico.microbiologiaTextoOutros}</textarea>
							</td>
						</tr>
						<tr style="margin: 10px 0px 10px 0px">
							<td class="block"><b>DIAGNÓSTICO DESCRITIVO/RESULTADO</b></td>
							<td class="block">
								<div class=block>
									<input type="radio" name='laudoCitopatologico.diagnosticoDescritivo' value='Dentro dos Limites da Normalidade' <c:if test="${laudoCitopatologico.diagnosticoDescritivo == 'Dentro dos Limites da Normalidade'}">checked='checked'</c:if>>Dentro dos Limites da Normalidade <br>
									<br>								
									<input type="radio" name='laudoCitopatologico.diagnosticoDescritivo' value='Alterações Celulares Benignas' <c:if test="${laudoCitopatologico.diagnosticoDescritivo == 'Alterações Celulares Benignas'}">checked='checked'</c:if>>Alterações Celulares Benignas: <br>
									<div style="margin-left: 35px;">
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoInflamacao' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoInflamacao == 'Y'}">checked='checked'</c:if>>Inflamação<br>
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoReparacao' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoReparacao == 'Y'}">checked='checked'</c:if>>Reparação<br>
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoMetaplasiaEscamosaImatura' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoMetaplasiaEscamosaImatura == 'Y'}">checked='checked'</c:if>>Metaplasia Escamosa Imatura<br>
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoArtrofiaComInflamacao' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoArtrofiaComInflamacao == 'Y'}">checked='checked'</c:if>>Atrofia com Inflamação<br>
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoRadiacao' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoRadiacao == 'Y'}">checked='checked'</c:if>>Radiação<br>
										<input type="checkbox" name='laudoCitopatologico.diagnosticoDescritivoOutros' value='Y' <c:if test="${laudoCitopatologico.diagnosticoDescritivoOutros == 'Y'}">checked='checked'</c:if>>Outros<br>
										<textarea name='laudoCitopatologico.diagnosticoDescritivoTextoOutros' rows="3" cols="2" style="width: 95%;">${laudoCitopatologico.diagnosticoDescritivoTextoOutros}</textarea>
										<br>
									</div>
									<input type=radio name='laudoCitopatologico.diagnosticoDescritivo' <c:if test="${laudoCitopatologico.diagnosticoDescritivo == 'Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado'}">checked='checked'</c:if> value='Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado' <c:if test="${laudoCitopatologico.diagnosticoDescritivo == 'Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado'}"> checked='checked'</c:if>>Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado<br>
								</div>

								<div class=block style="margin-top: 35px;"  > 
									<b>Anormalidades em Células Epiteliais Escamosas:</b> <br>
									<div style="margin-left:15px; margin-top: 5px;">
										Atipias em Células Escamosas<br>
										<div style="margin: 5px 0px 10px 35px;">
											<input type="radio" name='laudoCitopatologico.atipiasCelulasEscamosas' value='de Significado Indeterminado (ASC-US)' <c:if test="${laudoCitopatologico.atipiasCelulasEscamosas == 'de Significado Indeterminado (ASC-US)'}">checked='checked'</c:if>>de Significado Indeterminado (ASC-US)<br>
											<input type="radio" name='laudoCitopatologico.atipiasCelulasEscamosas' value='não Excluindo Lesão de Alto Grau (ASC-H)' <c:if test="${laudoCitopatologico.atipiasCelulasEscamosas == 'não Excluindo Lesão de Alto Grau (ASC-H)'}">checked='checked'</c:if>>não Excluindo Lesão de Alto Grau (ASC-H)<br>
										</div>
										Lesão Intra-Epitelial Escamosa de Baixo Grau<br>
										<div style="margin: 5px 0px 10px 35px;">
											<input type="radio" name='laudoCitopatologico.lesaoIntraEpitelialEscamosaBaixoGrau' value='Compreendendo Efeito Citopático do HPV' <c:if test="${laudoCitopatologico.lesaoIntraEpitelialEscamosaBaixoGrau == 'Compreendendo Efeito Citopático do HPV'}">checked='checked'</c:if>>Compreendendo Efeito Citopático do HPV<br>
											<input type="radio" name='laudoCitopatologico.lesaoIntraEpitelialEscamosaBaixoGrau' value='Compreendendo Neoplasia Intra-Epitelial Cervical de Grau I' <c:if test="${laudoCitopatologico.lesaoIntraEpitelialEscamosaBaixoGrau == 'Compreendendo Neoplasia Intra-Epitelial Cervical de Grau I'}">checked='checked'</c:if>>Compreendendo Neoplasia Intra-Epitelial Cervical de Grau I<br>
										</div>	
										Lesão Intra-Epitelial Escamosa de Alto Grau<br>
										<div style="margin: 5px 0px 10px 35px;">
											<input type="radio" name='laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau' value='Compreendendo Neoplasia Intra-Epitelial Cervical de Grau II' <c:if test="${laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau == 'Compreendendo Neoplasia Intra-Epitelial Cervical de Grau II'}">checked='checked'</c:if>>Compreendendo Neoplasia Intra-Epitelial Cervical de Grau II<br>
											<input type="radio" name='laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau' value='Compreendendo Neoplasia Intra-Epitelial Cervical de Grau III' <c:if test="${laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau == 'Compreendendo Neoplasia Intra-Epitelial Cervical de Grau III'}">checked='checked'</c:if>>Compreendendo Neoplasia Intra-Epitelial Cervical de Grau III<br>
											<input type="radio" name='laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau' value='Não Excluindo micro-invasão' <c:if test="${laudoCitopatologico.lesaoIntraEpitelialEscamosaAltoGrau == 'Não Excluindo micro-invasão'}">checked='checked'</c:if>>Não Excluindo micro-invasão<br>
										</div>
									</div>
								</div>
								
								<div class=block style="margin-top: 35px;" >
									<b>Anormalidades em Células Epiteliais Glandulares:</b> <br>
									<div style="margin-left:15px; margin-top: 5px;">
									
										Células Glandulares:
										<div style="margin: 5px 0px 10px 35px;">
											<input type="radio" name='laudoCitopatologico.celulasGlandulares' value='Endocervicais Atípicas' <c:if test="${laudoCitopatologico.celulasGlandulares == 'Endocervicais Atípicas'}">checked='checked'</c:if>>Endocervicais Atípicas <br>
											<input type="radio" name='laudoCitopatologico.celulasGlandulares' value='Endometriais Atípicas' <c:if test="${laudoCitopatologico.celulasGlandulares == 'Endometriais Atípicas'}">checked='checked'</c:if>>Endometriais Atípicas <br>
											<input type="radio" name='laudoCitopatologico.celulasGlandulares' value='Atípicas de Origem Indefinida' <c:if test="${laudoCitopatologico.celulasGlandulares == 'Atípicas de Origem Indefinida'}">checked='checked'</c:if>>Atípicas de Origem Indefinida <br>
										</div>

										<input type="radio" name='laudoCitopatologico.adenocarcinomaInSitu' value='Y' <c:if test="${laudoCitopatologico.adenocarcinomaInSitu == 'Y'}">checked='checked'</c:if>>Adenocarcinoma <i>'in situ'</i> <br>
										Adenocarcinoma  <br>
										<div style="margin: 5px 0px 10px 35px;">
											<input type="radio" name='laudoCitopatologico.adenocarcinoma' value='Endocervical' <c:if test="${laudoCitopatologico.adenocarcinoma == 'Endocervical'}">checked='checked'</c:if>>Endocervical
											<input type="radio" name='laudoCitopatologico.adenocarcinoma' value='Endometrial' <c:if test="${laudoCitopatologico.adenocarcinoma == 'Endometrial'}">checked='checked'</c:if>>Endometrial
											<input type="radio" name='laudoCitopatologico.adenocarcinoma' value='Sem outras especificações' <c:if test="${laudoCitopatologico.adenocarcinoma == 'Sem outras especificações'}">checked='checked'</c:if>>Sem outras especificações
										</div> 
									</div>

								</div>
								<div class=block style="margin-top: 35px;" >
									<b><input type="radio" name='laudoCitopatologico.presencaCelulasEndometriais' value='Y' <c:if test="${laudoCitopatologico.presencaCelulasEndometriais == 'Y'}">checked='checked'</c:if>>PRESENÇA DE CÉLULAS ENDOMETRIAIS</b>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class=block align="left" valign="top">
								Observações<br><textarea rows="4" cols="2" style="width: 98%;" name="laudoCitopatologico.observacoesFinais" onkeyup="this.value=tamanho(this.value,150);">${laudoCitopatologico.observacoesFinais}</textarea> 
							</td>
							<script type="text/javascript">
							function tamanho(str, tam){
								if(str.length <= tam)return str;
								else return str.substr(0,tam);
							}</script>
						</tr>
						<tr>
							<td colspan="2" style="font-size: 7pt;">
								Obs: Laudo Citopatológico Baseado em Padronização do Sistema Bethesda 2001 <br>
								e Nomenclatura Brasileira para Laudos Citopatológicos Cervicais 2006.
							</td>

						</tr>
						<tr><td> </td><td><br/> </td>  </tr>
						<tr>
							<td align="center" colspan="2" class="block">
								<input type="reset" value="Limpar" style="margin-right: 30px;"/>
								<input type="button" onclick="validar();" value="Salvar" style="margin-left: 30px;"/>
								<script >
									function validar(){
										var send = 1;
										var temp = document.getElementById("dataRealizacaoExame").value + "";
										if(temp.length < 10){
											alert("A data de realização do exame não foi preenchida!");
											send = 0;
										}
										temp = document.getElementById("dataLiberacaoResultado").value + "";
										if(temp.length < 10){
											alert("A data de realização do exame não foi preenchida!");
											send=0;
										}
										if(send == 1){
											document.getElementById("form").submit();
											//window.location.href = "";
										}
									}
								</script>
							</td>
						</tr>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>
</html>