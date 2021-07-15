<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CLIN</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<link href="CSS/tabela.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
	<div id="main_content">
	<div id="top_banner"></div>
	<div id="page_content"><f:subview id="menuPacientes">
		<jsp:include page="MenuPacientes.jsp"></jsp:include>
	</f:subview> <f:subview id="subMenuPaciente">
		<jsp:include page="SubMenuPaciente.jsp"></jsp:include>
	</f:subview>

	<div id="center_section">
	<div class="title" style="margin-left: 90px; margin-bottom: 20px">
	Atendimentos do Paciente</div>
	<table class="mytable" align="center">
		<tr>
			<th align="center" class="mytable">Código</th>
			<th align="center">Tipo de Consulta</th>
			<th align="center">Data de Criação</th>
			<th align="center">Hora</th>
			<th align="center">Autor</th>
		</tr>
		<tr>
			<td align="center" width="100"><a href="VisualizarQPD.html">0211422</a>
			</td>
			<td align="center" width="120">Primeira</td>
			<td align="center" width="120">25/02/2009</td>
			<td align="center" width="100">15:30h</td>
			<td align="center" width="150">Dr. Dolittle</td>
		</tr>
		<tr>
			<td align="center" width="100"><a href="VisualizarQPD.html">0034584</a>
			</td>
			<td align="center" width="120">Retorno</td>
			<td align="center" width="120">16/10/2007</td>
			<td align="center" width="100">14:30h</td>
			<td align="center" width="150">Dr. João</td>
		</tr>
		<tr>
			<td align="center" width="100"><a href="VisualizarQPD.html">0025416</a>
			</td>
			<td align="center" width="120">Primeira</td>
			<td align="center" width="120">01/10/2007</td>
			<td align="center" width="100">10:10h</td>
			<td align="center" width="150">Dra. Suzy</td>
		</tr>
	</table>
	</div>
	<f:subview id="rodape">
		<jsp:include page="Rodape.jsp"></jsp:include>
	</f:subview></div>
	</div>
</f:view>
</body>
</html>