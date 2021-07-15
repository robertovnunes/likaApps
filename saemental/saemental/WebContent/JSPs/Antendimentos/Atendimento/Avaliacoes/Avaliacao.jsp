<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<head> 
		<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
		
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
         <link rel="stylesheet" type="text/css" href="Css/jTPS.css" />
        <link rel="stylesheet" href="Css/style.css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        <script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
        </script>
        <script language="JavaScript" type="text/javascript" src="jscripts/jquery.js"></script>
        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
<!-- TinyMCE -->
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "simple"
	});
	

</script>
<!-- /TinyMCE -->

</head>
<body>

<div align="center">
<form method="post" action="http://tinymce.moxiecode.com/dump.php?example=true">
	<h3>Avaliação</h3>
	<b>Professor:</b> <c:out value="${avaliacao.professor.nome}"></c:out>
	<b>Data:</b>  <c:out value="${avaliacao.dataHoraFormatada}"></c:out>
	<br /><br />
	<!-- Gets replaced with TinyMCE, remember HTML in a textarea should be encoded -->
	<textarea id="elm1" name="avaliacao" maxlength="255" rows="15" cols="80" style="width: 100%" disabled="disabled" readonly="readonly">
		  <c:out value="${avaliacao.descricao}"></c:out>
	</textarea>
	<br /><br /><br />

</form>
</div>
</body>
</html>
