<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ include file="/jsp/inc_header.jsp"%>
</head>
<body>
<%@ include file="/jsp/inc_topo.jsp"%>


<div align='center' id="main-content" >
		<br />
				<table>
				   	<tr>
				   		<td>
							   <img src="images/atencao.png" alt="atencao.png" />
				   		</td>
				   		<td>
				   			<b style="font-size: 18px;">Warning</b><br />
				   			
				   			Something unexpected happened in the system. <br />
				   			Please report the message below to the administrator and try again.<br />
				   			<input type="button" value="Sign in again" onclick="window.location.href = '/dengue';" />
				   			<input type="button" value="Report" onclick="document.forms[0].submit();" />
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



<%@ include file="/jsp/inc_rodape.jsp"%>
</body>
</html>