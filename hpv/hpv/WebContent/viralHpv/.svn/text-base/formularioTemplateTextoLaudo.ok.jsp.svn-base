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
				<h2 style="margin-left: 20px;"><u>Template textos dos laudos do HPV</u></h2>
				<br>
				<ul class="erro">
					<c:forEach var="error" items="${errors.iterator}">
						<li>${error.key}</li>
					</c:forEach>
				</ul>
				<form action="viralHpv.addTemplateTextoLaudo.logic" method="post">
					<input type="hidden" name='templateTextosLaudo.id' value="${templateTextosLaudo.id}">
					
					<table class=block style="width: 100%;">
						<tr>
							<td class=block>Texto</td>
							<td class=block >
								<textarea rows="10" cols="20" name="templateTextosLaudo.texto" onkeyup="this.value=tamanho(this.value,500);" style="width: 95%; height: 95px;">${templateTextosLaudo.texto}</textarea>
							</td>
						</tr>
						
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="block">
								<input type="reset" value="Limpar" style="margin-right: 30px;"/>
								<input type="submit" value="Salvar" style="margin-left: 30px;" />
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
		</script>
	</body>	
</html>