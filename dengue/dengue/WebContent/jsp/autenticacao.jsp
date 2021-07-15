<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String urlBase = request.getContextPath(); %>
<%
	if(session.getAttribute("usuario") == null){
%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
	<script type="text/javascript">
		window.top.location.href = "/dengue/";
	</script>
</head>
<body>

</body>
</html>

<%
	}else{
	}
%>
