<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"> </script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
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

				<h2 style="">HPV</h2><br>
				<h2 style="margin-left: 20px;"><u>Viral - HPV</u></h2>
				<br>
				<ul class="erro">
					<c:forEach var="error" items="${errors.iterator}">
					<li><fmt:message key="${error.key}"/></li>
					</c:forEach>
				</ul>
				<form action="viralHpv.add.logic" method="post">
					<input type="hidden" name='laudoHpv.id' value="${laudoHpv.id}">
					<input type="hidden" name='laudoHpv.formulario.id' value='${formulario.id}'>

					<table class=block style="width: 100%;">
						<tr> 
							<td class=block colspan="2"><b>RESULTADOS</b></td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td class=block>Nome do paciente</td>
							<td class=block>
								<input type=text style="width: 300px;background: silver;" maxlength="99" value='${formulario.informacoesPessoais.nome}' readonly="readonly"/>
							</td>
						</tr>
						<tr> 
							<td class=block>Idade</td>
							<td class=block>
								<input type=text style="width: 300px;background: silver;" maxlength="99" value='${formulario.informacoesPessoais.idade}' readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td class=block>Número prontuário</td>
							<td class=block>
								<input type=text style="width: 300px;background: silver;" maxlength="99" value='${formulario.numeroProntuario}' readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td class=block>Data da coleta</td>
							<td class=block>
								<input type='text' name='laudoHpv.dataColeta' value='${laudoHpv.dataColeta}' onkeyup="this.value=formateadata(this.value);" style="width: 80px;"/>
							</td>
						</tr>
						<tr>
							<td class=block>Data da liberação do resultado</td>
							<td class=block>
								<input type='text' name='laudoHpv.dataEntrega' value='${laudoHpv.dataEntrega}' onkeyup="this.value=formateadata(this.value);" style="width: 80px;"/>
							</td>
						</tr>
						<tr>
							<td><br></td>
							<td></td>
						</tr>
						<tr> 
							<td class=block colspan="2"><b>RESULTADO DO EXAME MOLECULAR PARA PAPILOMAVÍRUS HUMANO</b></td>
						</tr>
						<tr>
							<td class=block>Tipo da amostra</td>
							<td class=block >
								<input type="checkbox" name='laudoHpv.tipoAmostraRaspadoCervicoUterino' value="raspado Cervico-uterino" <c:if test="${laudoHpv.tipoAmostraRaspadoCervicoUterino == 'raspado Cervico-uterino'}">checked="checked"</c:if>/>raspado Cervico-uterino<br>
								<input type="checkbox" name='laudoHpv.tipoAmostraSangueVenoso' value="sangue venoso" <c:if test="${laudoHpv.tipoAmostraSangueVenoso == 'sangue venoso'}">checked="checked"</c:if>/>sangue venoso<br>
								<input type="checkbox" name='laudoHpv.tipoAmostraSangueArterial' value="sangue arterial" <c:if test="${laudoHpv.tipoAmostraSangueArterial == 'sangue arterial'}">checked="checked"</c:if>/>sangue arterial<br>
								<input type="checkbox" name='laudoHpv.tipoAmostraBiopsiaFormalina' value="biópsia em formalina" <c:if test="${laudoHpv.tipoAmostraBiopsiaFormalina == 'biópsia em formalina'}">checked="checked"</c:if>/>biópsia em formalina<br>
								<input type="checkbox" name='laudoHpv.tipoAmostraBiopsiaEmblocadoParafina' value="biópsia emblocado em parafina" <c:if test="${laudoHpv.tipoAmostraBiopsiaEmblocadoParafina == 'biópsia emblocado em parafina'}">checked="checked"</c:if>/>biópsia emblocado em parafina<br>
								Outros:<br>
								<textarea rows="10" cols="20" name="laudoHpv.tipoAmostraOutros" onkeyup="this.value=tamanho(this.value,250);" style="width: 95%; height: 45px;">${laudoHpv.tipoAmostraOutros}</textarea>
							</td>
						</tr>
						
						<tr>
							<td class=block>Adequabilidade da amostra</td>
							<td class=block>
								<input type="checkbox" name='laudoHpv.adeqAmostSatisfatoriaAnaliseBiologiaMolecular' value='Amostra satisfatória para análise por biologia molecular' <c:if test="${laudoHpv.adeqAmostSatisfatoriaAnaliseBiologiaMolecular == 'Amostra satisfatória para análise por biologia molecular'}">checked="checked"</c:if> />Amostra satisfatória para análise por biologia molecular<br/>
								<input type='checkbox' name='laudoHpv.adeqAmostAspectoPurulento' value='Amostra com aspecto purulento' <c:if test="${laudoHpv.adeqAmostAspectoPurulento == 'Amostra com aspecto purulento'}">checked="checked"</c:if> />Amostra com aspecto purulento<br/>
								<input type='checkbox' name='laudoHpv.adeqAmostAspectoSanguinolento' value='Amostra com aspecto sanguinolento' <c:if test="${laudoHpv.adeqAmostAspectoSanguinolento == 'Amostra com aspecto sanguinolento'}">checked="checked"</c:if> />Amostra com aspecto sanguinolento<br/>
								<input type='checkbox' name='laudoHpv.adeqAmostAspectoSanguinolentoPurulento' value='Amostra com aspector sanguinolento e purulento' <c:if test="${laudoHpv.adeqAmostAspectoSanguinolentoPurulento == 'Amostra com aspector sanguinolento e purulento'}">checked="checked"</c:if> />Amostra com aspector sanguinolento e purulento<br/>
								<input type='checkbox' name='laudoHpv.adeqAmostInsatisfatoriaAnaliseBiologiaMolecular' value='Amostra insatisfatória para análise por biologia molecular' <c:if test="${laudoHpv.adeqAmostInsatisfatoriaAnaliseBiologiaMolecular == 'Amostra insatisfatória para análise por biologia molecular'}">checked="checked"</c:if> />Amostra insatisfatória para análise por biologia molecular<br/>
								Outros:<br></br>
								<textarea rows="10" cols="20" name="laudoHpv.adeqAmostOutros" onkeyup="this.value=tamanho(this.value,250);" style="width: 95%;height: 45px;">${laudoHpv.adeqAmostOutros}</textarea>
							</td>
						</tr>
						<tr>
							<td class=block colspan="2">Diagnóstico descritivo do resultado</td>
						</tr>
						
						<tr>
							<td class=block colspan="2" align="left" valign="top" >
								<fieldset>
									<input type="hidden" name="laudo.id" value="${laudo.id}"/>
									<legend>Templates</legend>
									
									<select id='texto' onchange="alternarTemplate(this.value);" style="width: 50px;text-align: left;top: 0; " >
										<c:forEach var="templateTextosLaudo" items="${templateTextosLaudos}">
									      	<option value="${templateTextosLaudo.texto}">${templateTextosLaudo.id}</option>
										</c:forEach>
									</select>
									<input type="button" value='inserir' onclick="insertAtCursor();" /> <br></br>
									
									<TEXTAREA id='tempTemplate' cols="10" rows="10" style="width: 96%;height: 85px;" readonly="readonly"></TEXTAREA>
									
								</fieldset>
								<script type="text/javascript">
									function alternarTemplate(valor){
										document.getElementById("tempTemplate").value = valor;
									}
								</script>
							</td>
						</tr>
						
						
						<tr>
							<td style="width: 50px;" class=block>Resultado</td>
							<td class=block>
								<textarea rows="10" cols="20" id='laudoResultado' name="laudoHpv.resultado" style="width: 100%;height: 150px;" onchange="this.value=tamanho(this.value,999);">${laudoHpv.resultado}</textarea>
							</td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="block">
								<input type="reset" value="Limpar" style="margin-right: 30px;"/>
								<input type="submit" value="Salvar" style="margin-left: 30px;" /><!-- chamar funcao de validar dados do formulario -->
							</td>
						</tr>
	
					</table>
				</form>
			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
		<script type="text/javascript">
			function tamanho(str, tam){
				if(str.length <= tam)return str;
				else return str.substr(tam);
			}
			
			function insertAtCursor() {
				var myField = document.getElementById("laudoResultado");
				var myValue = document.getElementById("tempTemplate").value;
				if(myValue != null){
					//IE 
					if (document.selection) {
						myField.focus();
						sel = document.selection.createRange();
						sel.text = myValue + "\r\n";
					}
					//MOZILLA/NETSCAPE
					else if (myField.selectionStart || myField.selectionStart == '0') {
						var startPos = myField.selectionStart;
						var endPos = myField.selectionEnd;
						myField.value = myField.value.substring(0, startPos)
						+ myValue + "\r\n"
						+ myField.value.substring(endPos, myField.value.length);
					} else {
						myField.value += myValue + "\r\n";
					}
				}
			}
			//onload
			if(document.getElementById("tempTemplate").value == null){
				document.getElementById("tempTemplate").enabled = false;
			}else{
				alternarTemplate(document.getElementById("texto").value);
			}
		</script>
	</body>	
</html>