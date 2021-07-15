<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<head> 


		<%@ include file="/JSPs/inc_header.jsp"%>


		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
        
        
		
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        
			<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
	        </script>

			<script language="JavaScript" type="text/javascript" src="jscripts/jquery.js"></script>
        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
			
		
 		 <script type="text/javascript">
        	
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
            
            function assinar(){
            	var r=confirm("Você realmente deseja assiar o atendimento?");
            	if (r==true)
            	  {
            	  
	            	window.location.href = 'assinar.do?method=assinarAtendimento';
            	  }
            	else
            	  {
            	  return;
            	  }
            	
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        //	var div = window.top.document.getElementById('dadosPaciente');
		      //  	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      //  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar' target='conteudo'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"' target='conteudo'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Assinar Atendimento</a>";
        	}
        </script> 
			
			
		 
				  
				  
</head>
<body onload="navegacao();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:700px">
               				
               				
               	 <jsp:include page="menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style=" display:inline-block;width: 600px;  display:inline-block;">
		 
		 
			<p id="titulo-verm" style='' align="left">::Assinar Atendimento</p>   
					<br />
					 <div id="erroMsg">
									   <font color="red"> <h:errors/></font>
									   <font color="red"> 
											${mensagem}
										</font>
									</div>
					<br />
					
					<b>Respons&aacute;vel:</b> <c:out value="${atendimento.usuario.nome}"></c:out>
					<br /><br />
					<b>Paciente:</b> <c:out value="${paciente.nome}"></c:out>
					<br /><br />
					<b>Data de Criação:</b> <c:out value="${atendimento.dataFormatada}"></c:out> <c:out value="${atendimento.horaFormatada}"></c:out>
					<br /><br />
					<b>Data de Atualização:</b> <c:out value="${atendimento.dataAtualizacaoFormatada}"></c:out> <c:out value="${atendimento.horaAtualizacaoFormatada}"></c:out>
					<br /><br />
					 <c:if test="${atendimento.assinar == true }">
						<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						<br /><br />
						<b>Data de Assinatura:</b><c:out value="${atendimento.dataAssinaturaFormatada}"></c:out> <c:out value="${atendimento.horaAssinaturaFormatada}"></c:out>
					 </c:if>
					 <c:if test="${atendimento.assinar == false }">
							<a href="#" onclick="assinar();">Assinar Atendimento</a>
					 </c:if>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>