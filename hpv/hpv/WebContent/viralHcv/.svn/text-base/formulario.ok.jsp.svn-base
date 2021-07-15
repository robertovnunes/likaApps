<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"> </script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
		<script type="text/javascript" src="./javascripts/tamanhoString.js"> </script>
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

					<h2 style="">HCV</h2><br>
					<h2 style="margin-left: 20px;"><u>Viral - HCV</u></h2>
					<br>
				<form action="viralHcv.add.logic" method="post">
					<input type="hidden" name='laudoHcv.id' value="${laudoHcv.id}">
					<input type="hidden" name='laudoHcv.formulario.id' value='${formulario.id}'>

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
								<input type=text name='laudoHcv.unidadeSaudeFamilia' value="${laudoHcv.unidadeSaudeFamilia}" style="width: 300px;" maxlength="120"/>
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
								<!-- <input type="text" name='laudoHcv.resultado' value="${laudoHcv.resultado}" style="width: 100%;" maxlength="100"/> -->
								<select name="laudoHcv.resultado">
									<optgroup label="selecionar">selecionar
										<option value="Não reagente na amostra analisada" <c:if test="${laudoHcv.resultado == 'Não reagente na amostra analisada'}">selected="selected"</c:if>>Não reagente na amostra analisada</option>
										<option value="Reagente na amostra analisada" <c:if test="${laudoHcv.resultado == 'Reagente na amostra analisada'}">selected="selected"</c:if>>Reagente na amostra analisada</option>
									</optgroup> 
								</select>
							</td>
						</tr>
						<tr>
							<td class=block>
								Data da coleta
							</td>
							<td class=block>
								<input type='text' name='laudoHcv.dataColeta' value='${laudoHcv.dataColeta}' onkeyup="this.value=formateadata(this.value);" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td class=block>Data da entrega</td>
							<td class=block>
								<input type='text' name='laudoHcv.dataEntrega' value='${laudoHcv.dataEntrega}' onkeyup="this.value=formateadata(this.value);" style="width: 80px;"/>
							</td>
						</tr>
						<tr>
							<td class=block>Código</td>
							<td class=block>
								<input type='text' name='laudoHcv.codigo' value='${laudoHcv.codigo}' style="width: 80px;" maxlength="16"/>								
							</td>
						</tr>
						
						<tr>
							<td class=block>Observações</td>
							<td class=block>
								<textarea name='laudoHcv.observacoes' style="width: 100%;height: 100px;" onkeyup="this.value=tamanho(this.value,150);" onchange="this.value=tamanho(this.value,150);">${laudoHcv.observacoes}</textarea>
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