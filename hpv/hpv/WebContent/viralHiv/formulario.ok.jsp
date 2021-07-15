<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"> </script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
		<script type="text/javascript" src="./javascripts/tamanhoString.js"> </script>
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

					<h2 style="">HIV</h2><br>
					<h2 style="margin-left: 20px;"><u>Viral - HIV</u></h2>
					<br>
					<ul class="erro">
						<c:forEach var="error" items="${errors.iterator}">
							<li>${error.key}</li>
						</c:forEach>
					</ul>
 	

				<form action="viralHiv.add.logic" method="post">
					<input type="hidden" name='laudoHiv.id' value="${laudoHiv.id}">
					<input type="hidden" name='laudoHiv.formulario.id' value='${formulario.id}'>

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
								<input type=text style="width: 300px;" maxlength="99" value='${formulario.informacoesPessoais.nome}' readonly="readonly"/>
							</td>
						</tr>
						<tr> 
							<td class=block>Unidade de Saúde da Família</td>
							<td class=block>
								<input type=text name='laudoHiv.unidadeSaudeFamilia' value="${laudoHiv.unidadeSaudeFamilia}" style="width: 300px;" maxlength="120"/>
							</td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						
						<tr> 
							<td class=block colspan="2"><b>Dados do laudo</b></td>
						</tr>
						<tr>
							<td class=block> Resultado</td>
							<td class=block>
								<div style="padding-top: 0px;">
									<select name="laudoHiv.resultado" id='resultados'>
										<option disabled="disabled" selected="selected" value="">selecionar</option>
										<option value="Não reagente na amostra analisada" <c:if test="${laudoHiv.resultado == 'Não reagente na amostra analisada'}">selected='selected'</c:if>>Não reagente na amostra analisada</option>
										<option value="Reagente na amostra analisada" <c:if test="${laudoHiv.resultado == 'Reagente na amostra analisada'}">selected='selected'</c:if>>Reagente na amostra analisada</option>
										
									</select>
									<br/>
								</div>
							</td>
						</tr>
						
						<tr>
							<td class=block>Teste (reagente)</td>
							<td class=block>
								<div>
									<select id='reagentes' >
									<!-- <option>segundo o teste GENSGREEN® ULTRA HIV Ag-Ab (BIO-RAD Lot 9C0579; data de validade:30/08/2010)</option> -->
										<c:forEach items="${reagentes}" var="reagente">
											<option>${reagente.reagente}</option>
										</c:forEach>
									</select>
									<br/>
									<input type="button" value="selecionar" align="right" onclick="addReagente();">
									<script type="text/javascript">
										function addReagente(){
											var resultado = document.getElementById("laudoHiv.reagente");
											var select = document.getElementById("reagentes");
											var indexSelect = select.selectedIndex;
											var valueSelected = select.options[indexSelect].value;
											resultado.value = resultado.value + valueSelected;
										}
									</script>
									<p>
										<textarea name='laudoHiv.reagente' id='laudoHiv.reagente' style="width: 100%;height: 30px;" onkeyup="this.value=tamanho(this.value,300);">${laudoHiv.reagente}</textarea>
									</p>
								</div>
							</td>
						</tr>



						<tr>
							<td class=block>Data da coleta</td>
							<td class=block>
								<input type='text' name='laudoHiv.dataColeta' value='${laudoHiv.dataColeta}' onkeyup="this.value=formateadata(this.value);" class='data'/>
							</td>
						</tr>
						<tr>
							<td class=block>Data da entrega</td>
							<td class=block>
								<input type='text' name='laudoHiv.dataEntrega' value='${laudoHiv.dataEntrega}' onkeyup="this.value=formateadata(this.value);" class='data'/>
							</td>
						</tr>
						<tr>
							<td class=block>Código</td>
							<td class=block>
								<input type='text' name='laudoHiv.codigo' value='${laudoHiv.codigo}' style="width: 150px;" maxlength="16" />								
							</td>
						</tr>
						
						<tr>
							<td class=block>Observações</td>
							<td class=block>
								<textarea name='laudoHiv.observacoes' style="width: 100%;height: 100px;" onkeyup="this.value=tamanho(this.value,150);">${laudoHiv.observacoes}</textarea>
							</td>	
						</tr>
						
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="block">
								<input type="reset" value="Limpar" style="margin-right: 30px;"/>
								<input type="submit" value="Salvar" style="margin-left: 30px;"/>
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