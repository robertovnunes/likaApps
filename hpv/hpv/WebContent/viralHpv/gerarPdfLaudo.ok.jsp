<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body onload="document.forms[0].submit();">
	<form method="post" action="viralHpv.gerarPdfLaudo.logic">
		<input type="hidden" name="formulario.id" value="${formulario.id }" />
	</form>
</body>
</html>