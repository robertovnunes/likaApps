<%-- 
    Document   : login
    Created on : 11/03/2010, 10:33:05
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<f:view>
	<html>
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BD-Prod</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="wrapper">
	<div id="login"></div>
	<!-- start page -->
	<div id="page"><h:form>
		<!-- start content -->
		<div id="loginContent" align="center"><h:panelGroup>
			<h:panelGrid>
				<h:graphicImage value="../images/lika.jpg" width="250" height="75"
					alt="Lika" title="Lika" style="margin-bottom: 40px;" />
			</h:panelGrid>

			<h:panelGroup>

				<h:outputLabel
					value="Ops! Ocorreu um erro inesperado, por favor tente novamente!"
					style="font-wight:bold;"></h:outputLabel>
				<br />
				<br />


			</h:panelGroup>

			<h:panelGrid columns="1">
				<div style="color: red;"><h:messages style="color:red;"
					layout="table" /></div>
			</h:panelGrid>
		</h:panelGroup></div>
		<!-- end content -->

		<div style="clear: both;">&nbsp;</div>
	</h:form></div>
	<!-- end page --></div>
	<div id="footer"></div>
	</body>
	</html>
</f:view>