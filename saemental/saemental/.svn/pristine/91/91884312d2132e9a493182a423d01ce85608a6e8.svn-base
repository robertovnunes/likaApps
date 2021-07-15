<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ include file="/JSPs/inc_header.jsp"%>
</head>
	
    <body>
    	
			<%@ include file="/JSPs/inc_topo.jsp"%>
			
			
			<div align='center' id="main-content" >
				
				
				 <div style="height:650px;width:1024px;" id="conteudo" align="center">
				   <br /><br /><br />
				   <table>
				   	<tr>
				   		<td>
							   <img src="imagens/atencao.png" alt="atencao.png" />
				   		</td>
				   		<td>
				   			<b style="font-size: 18px;">Atenção</b><br />
				   			Algo inesperado ocorreu no sistema. <br />
				   			Favor reportar a mensagem abaixo para o administrador e fazer login novamente.<br />
				   			<input type="button" value="Logar Novamente" onclick="window.location.href = '/saemental';" />
				   			<input type="button" value="Reportar Bug" onclick="document.forms[1].submit();" />
				   		</td>
				   	</tr>
				   </table>
				  PrintStackTrace<br />
				  <form name="error" method="post" action="error.do?method=reportarBug">
    	 			 <h:hidden property="method" value="reportarBug"/> 
					   <textarea rows="30" cols="100" name="erroMsg">
						   <c:out value="${erroMsg}" ></c:out>
					   </textarea>
				  </form>
			
            </div>
					<br /><br /><br /><br />
					
					
			</div>
			
			
			
			<%@ include file="/JSPs/inc_rodape.jsp"%>
    	
    	
    	
    </body>
</html>
