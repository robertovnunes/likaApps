<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
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
			
			<div id="contentListar" >
				<h2>LISTAR</h2><!-- campo obrigatorio o h2 no css!!! -->
				
				<!--<div id='divConsulta'>
					 <form action="#" method = "post">
						<table class="block" id="procurar" >
							<tr>
								<td class='block' colspan="2" style="text-align: left;font-size: 9pt;color:gray;">
									Selecione um campo de busca:
								</td>
							</tr>
							<tr class='block'>
								<td class='block'>
									<select name='busca'>
										<option>N&uacute;mero do prontu&aacute;rio</option>
										<option>C&oacute;digo PRONEX</option>									
										<option>Local Coleta</option>
										<option>Grupo do participante - CASO</option>
										<option>Grupo do participante - CONTROLE</option>
										<option>Nome do Paciente</option>
									</select>
									<input type='text' style="width: 200px;">
								</td>
								<td class='block'>
									<input type="submit" value="procurar">
								</td>
							</tr>
						</table>
					</form>
					<br/>
				</div>
 -->
				<div id='resultadoListar'>
					<display:table requestURI="viralSifilis.list.logic" name="${laudosSifilis}" export="true" id="laudoSifilis" list="${laudosSifilis}" pagesize="30" sort="list" class="displaytag">
						<display:column title="N&uacute;mero do prontu&aacute;rio" sortable="true">${laudoSifilis.formulario.numeroProntuario}</display:column>
						<display:column title="C&oacute;digo PRONEX"  sortable="true">${laudoSifilis.formulario.codigoPronex}</display:column>
						<display:column title="Grupo Participante"  sortable="true">${laudoSifilis.formulario.grupoParticipante}</display:column>
						<display:column title="Data coleta"  sortable="true">${laudoSifilis.dataColeta}</display:column>
						<display:column title="Data entrega"  sortable="true">${laudoSifilis.dataEntrega}</display:column>
						<display:column title="Resultado"  sortable="true">${laudoSifilis.resultado}</display:column>
						<display:column title="C�digo"  sortable="true">${laudoSifilis.codigo}</display:column>
						<display:column title="visualizar"><i style="color:red;">disabled</i></display:column>
						<display:column title="editar"><a href="viralSifilis.formulario.logic?formulario.id=${laudoSifilis.formulario.id}">editar</a></display:column>
						<display:column title="remover"><a href="viralSifilis.remove.logic?laudoSifilis.id=${laudoSifilis.id}">remover</a></display:column>						
						
						<display:setProperty name="paging.banner.placement" value="bottom" />
						<display:setProperty name="basic.empty.showtable" value="true" />
						<display:setProperty name="export.excel" value="true" />
						<display:setProperty name="export.xml" value="true" /> 
						<display:setProperty name="export.csv" value="false" />  
						<display:setProperty name="export.pdf" value="true" />  
						<display:setProperty name="export.excel.filename" value="lista.xls" /> 
						<display:setProperty name="export.pdf.filename" value="lista.pdf" />
					</display:table>
				</div>


			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>
