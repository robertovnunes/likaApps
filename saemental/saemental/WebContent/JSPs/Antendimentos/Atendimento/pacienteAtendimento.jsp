<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<head> 
		<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="imagens/shortcut.png" rel="shortcut icon"/>
        <title>Sae - Sistematiza&ccedil;&atilde;o da Assist&ecirc;ncia de Enfermagem</title>
        
        <link href="Css/helper.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
		
       
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link href="Css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
        <link href="Css/Abas.css" rel="stylesheet" type="text/css" />
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/style.css" />
        
        <script type="text/javascript">
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        	var div = window.top.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Pacientes Buscar</a>";
        	}
        </script>
</head>
<body onload="navegacao();"> 
	<div align="center"> 
	<div id="conteudoNormal" style="width:1024px;height:400px;margin-top:-50px;" >
			 
    		<div id="banner">
            </div>
            
            <c:out value="${TipoUsuario.ALUNOLABORATORIO}"></c:out> 
            
            <jsp:include page="../../menu.jsp"  flush="true"/>	
        

                
                <br />
                
                <div style="margin-top:15px;">
				
				<form action="#"  id="formAtend" name="formAtend">
    	<div id="conteudoNormal" align="center" style="height:800px">
               				
               				
               	 <jsp:include page="menu-atendimentos.jsp"  flush="true"/>				
               				
				
            </div>
		</form>

               	
                </div>
               
          
           <jsp:include page="../../rodape.jsp"  flush="true"/>	
        
          
            </div>
        </div>
</body>
</html>