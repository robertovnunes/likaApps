<%@page import="java.io.PrintWriter"%>
<%@ page isErrorPage="true" %>
<html>
<head>
   <title>Error Page</title>
</head>
<body>
<h2>Your application has generated an error</h2>
<h3>Please notify your help desk.</h3>
<b>Exception:</b><br> 
<%= exception.toString() %>
<%= exception.printStackTrace(new PrintWriter(out)) %>
</body>
</html>