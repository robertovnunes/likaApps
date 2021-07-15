<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
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
					<h2 style="margin-left: 20px;"><u>Formulário para Cadastro de Novo Reagente para Teste HIV</u></h2>
					<br>
					<ul class="erro">
						<c:forEach var="error" items="${errors.iterator}">
							<li>${error.key}</li>
						</c:forEach>
					</ul>
 	

				<form action="viralHiv.addReagenteHIV.logic" method="post">
					<input type="hidden" name='reagenteHIV.id' value="${reagenteHIV.id}">
					
					<table class=block style="width: 100%;">
						<tr> 
							<td class=block colspan="2"><b>REAGENTES PARA TESTE HIV</b></td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td class=block>Teste</td>
							<td class=block>
								<textarea name='reagenteHIV.reagente' style="width: 100%;height: 100px;" onkeyup="this.value=tamanho(this.value,150);">${reagenteHIV.reagente}</textarea>
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