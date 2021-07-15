<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
  	</head>
	<body>
	    <div id="container">
			<div id="top"><%@include file="../top.jsp" %></div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>

			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;"><%@include file="leftnav.jsp" %></div>
			
			
			<div id="content">
				<h2>13. ANEXOS</h2>
				<br>
				<div>
					<form action="anexos.add.logic" method="post"  ENCTYPE='multipart/form-data'>
						<input type="hidden" name="anexo.formulario.id" value='${formulario.id}' />
						<table class='block' style="width:100%;">
							<tr><td colspan="2" id=block><b>Anexos</b> </td></tr>

							<tr class=block>
								<td class=block>Adicionar novo arquivo...</td>
								<td class=block>
									<input type="file" name='fileInfo'>
									<input type="submit" value="Salvar" name="Upload"/>
								</td>
							</tr>
							
							<tr>
								<td ></td>
								<td ><br></td>
							</tr>
						</table>
					</form>
				</div>
				<br><br>
				<div class=block>
						<fieldset>
						<legend>Anexos</legend>
						<display:table requestURI="anexos.list.logic" name="${anexos}" export="true" id="anexo" list="${anexos}" pagesize="10" sort="list" class="displaytag">
							<display:column title="nome" style="width:300px;">${anexo.tipo}  </display:column>
							<display:column title="download"><a href="anexos.download.logic?anexo.id=${anexo.id}"><i>download</i></a> </display:column>
							<display:column title="remover"><a href="anexos.remove.logic?anexo.id=${anexo.id}"><i>remove</i></a></display:column>

							<display:setProperty name="paging.banner.placement" value="bottom" />
							<display:setProperty name="basic.empty.showtable" value="true" />
						</display:table>
						</fieldset>
					</div>



			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>	
</html>