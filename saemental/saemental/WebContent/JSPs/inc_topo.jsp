<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<div id="topo_cinza">
</div>
<div id="topo_content" align="center">

<table border="0">
	<tr>
	<td style="vertical-align:top; background: none; border: 0 none;" >
		<img alt="SaeMental Logo" src="imagens/logo-sae.png" id="logo"/>
	</td>
	<td style="background: none;border: 0 none;">
		<img src="imagens/doctor.png" id="doctor"/>
	</td>
	<td style="vertical-align:top; background: none;border: 0 none;">
		<%@ include file="/JSPs/barra_login.jsp"%>

	</td>
	</tr>
</table>
<div style="clear:both;"></div>

<%
	if(session.getAttribute("usuario") == null){
%>
<div id="barra_azul" >
<img src="imagens/barra_azul.png"  id="logo" width="100%" height="100px" />
</div>
<%}else{ %>
<div id="barra_azul_menor" style="margin-top: -50px">
<img src="imagens/barra_azul2.png"  id="ba" width="100%" height="50px" />
</div>
<%} %>

</div>



