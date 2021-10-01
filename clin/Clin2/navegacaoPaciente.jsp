<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSS/menu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<f:subview id="navegacaoPaciente">

<div class="bordaBox1">
	<div id="menuPac" align="center"><h:form>
		<div class="menuPac1">
		<h:commandLink styleClass="diretorio" value="Paciente" /> &nbsp;
		<img alt="" src="images/nav.gif" border="0">&nbsp;
		<h:commandLink styleClass="diretorio" value="Bruno Florêncio" />&nbsp;
		<img alt="" src="images/nav.gif" border="0">&nbsp;
		<h:commandLink styleClass="diretorio" value="Novo Atendimento" />&nbsp;
		</div>

		<a href="QPD.html"><font color="#003399">Novo Atendimento</font></a>
		<font color="#000000"> | </font>
		<a href="historicoPaciente.html"><font color="#003399">Atendimentos</font></a>
		<font color="#000000"> | </font>
		<a href="editarPaciente.html"><font color="#003399">Editar
		Cadastro</font></a>
	</h:form></div>
	<strong class="b4"></strong> <strong class="b3"></strong> <strong
		class="b2"></strong> <strong class="b1"></strong></div>

</f:subview>
</body>
</html>