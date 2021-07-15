


<div id="topo_cinza">
</div>
<div id="topo_content" align="center">

<table border="0">
	<tr>
	<td style="vertical-align:top; background: none; border: 0 none;" >
		<a href="/dengue/sistema.do?method=mostrarTelaLogon" style="text-decoration:none; border:0 ;"><img alt="PillTaking Logo" src="images/logo.png" id="logo"/></a>
	</td>
	<td style="background: none;border: 0 none;">
		<img src="images/doctor.png" id="doctor"/>
	</td>
	<td style="vertical-align:top; background: none;border: 0 none;">
		<%@ include file="/jsp/barra_login.jsp"%>

	</td>
	</tr>
</table>
<div style="clear:both;"></div>

<%
	if(session.getAttribute("usuario") == null){
%>
<div id="barra_azul" >
<img src="images/barra_azul.png"  id="logo" width="100%" height="100px" />
</div>
<%}else{ %>
<div id="barra_azul_menor" style="margin-top: -50px">
<img src="images/barra_azul2.png"  id="ba" width="100%" height="50px" />
</div>
<%} %>

</div>