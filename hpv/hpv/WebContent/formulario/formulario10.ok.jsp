<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<script  src="./css/dhtmlxCalendar/codebase/dhtmlxcalendar.js"></script>
		<script  src="./css/dhtmlxCalendar/codebase/dhtmlxcommon.js"></script>
		<link rel="STYLESHEET" type="text/css" href="./css/dhtmlxCalendar/codebase/dhtmlxcalendar.css">
		<!--<script  src="./css/dhtmlxMenu/codebase/dhtmlxcommon.js"></script>-->
	    <%@include file="../head.jsp" %>
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
				<h2>10. CONSIDERAÇÕES FINAIS</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
				
				<br>
				<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 10 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
							<br />	
				
				
				<br>
				<form action="formulario.addFormulario10.logic" method="post">
					<input type="hidden" name="formulario.id" value="${formulario.id}"/>
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					<table class="block" style="width: 100%;">
						<tr>
							<td class="block">
								Estado de aten&ccedil;&atilde;o do entrevistado
							</td>
							<td class="block">
								<select name="formulario.estadoAtencaoEntrevistado">
									<option value=''>selecione...</option>
									<option value="Bastante disperso" <c:if test="${formulario.estadoAtencaoEntrevistado == 'Bastante disperso' }">selected='selected'</c:if>>Bastante disperso</option>
									<option value="Disperso" <c:if test="${formulario.estadoAtencaoEntrevistado == 'Disperso'}">selected='selected'</c:if>>Disperso</option>
									<option value="Atento" <c:if test="${formulario.estadoAtencaoEntrevistado == 'Atento'}">selected='selected'</c:if>>Atento</option>
									<option value="Bastante atento" <c:if test="${formulario.estadoAtencaoEntrevistado == 'Bastante atento'}">selected='selected'</c:if>>Bastante atento</option>
									<option value="Outros" <c:if test="${formulario.estadoAtencaoEntrevistado == 'Outros'}">selected='selected'</c:if>>Outros</option>
								</select> 
							</td>
						</tr>
						<tr>
							<td class="block">
								Compreens&atilde;o do entrevistado
							</td>
							<td class="block">
								<select name="formulario.compreensaoEntrevistado">
									<option value=''>selecione...</option>
									<option value="Não compreende" <c:if test="${formulario.compreensaoEntrevistado == 'Não compreende'}">selected='selected'</c:if>>Não compreende</option>
									<option value="Compreende com dificuldade" <c:if test="${formulario.compreensaoEntrevistado == 'Compreende com dificuldade'}">selected='selected'</c:if>>Compreende com dificuldade</option>
									<option value="Compreende" <c:if test="${formulario.compreensaoEntrevistado == 'Compreende'}">selected='selected'</c:if>>Compreende</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="block">
								Data Entrevista:
							</td>
							<td class="block">
								<div style="position:relative;border:1px solid navy;width:199px">
									<input type="text" name="formulario.dataEntrevista" value='${formulario.dataEntrevista}' id="questionarioDateEntrevista" style="border-width:0px;width:179px;font-size:12px;" readonly="readonly"><img style="cursor:pointer;" onClick="rb(1)" src="css/dhtmlxCalendar/codebase/imgs/calendar.gif" align="absmiddle">
						      		<div id="calendar" style="position:absolute;left:199px;top:0px;display:none"></div>
						      	</div>
							</td>
						</tr>
						<tr>
							<td class="block">
								Entrevistador:
							</td>
							<td class="block">
								<input type='text' name='formulario.nomeEntrevistador' value='${formulario.nomeEntrevistador}' style=width:100%;' maxlength="130"/>
							</td>
						</tr>
						<tr><td> </td><td><br/> </td>  </tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	<script>
		    var cal1 = new dhtmlxCalendarObject('calendar');
		    cal1.attachEvent("onClick",function(date){
				document.getElementById("questionarioDateEntrevista").value=cal1.getFormatedDate("%d/%m/%Y",date);
				document.getElementById("calendar").style.display='none';
				return true;
		    })
		    function rb(){
				document.getElementById('calendar').style.display='block';
			}
	</script>
	</body>
	
</html>
