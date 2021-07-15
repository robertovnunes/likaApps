<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ include file="/JSPs/inc_header.jsp"%>
</head>
	
    <body>
    	
			<%@ include file="/JSPs/inc_topo.jsp"%>
			
			
			<div align='center' id="main-content" >
			
			<%
				if(session.getAttribute("usuario") != null && !session.getAttribute("usuario").equals("deslogado")){
			%>
			<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
			<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
			
			       <jsp:include page="menu.jsp"  flush="true"/>
			
			<%} %>
			
					<div id="nurse" style='display:inline-block;'>
						
					</div>
			
			
					<div id="highligths" style="width: 450px;display:inline-block; vertical-align: top;">
						<h1>SAE Mental</h1>
						<div id="texto">
						Este &eacute; o sistema SAE-sa&uacute;de mental, um ambiente de aprendizagem para os estudantes de gradua&ccedil;&atilde;o
					em Enfermagem da UFPE. Este sistema apresenta o processo de cuidados da Enfermagem para o
					paciente psiqui&aacute;trico seguindo as etapas de: cadastro do paciente, queixa e diagn&oacute;stico inicial, hist&oacute;rico,
					necessidades b&aacute;sicas, exame f&iacute;sico, exame mental, diagn&oacute;stico, interven&ccedil;&otilde;es e resultados, e
					orienta&ccedil;&otilde;es de alta. <br />O objetivo deste sistema &eacute; auxiliar as aulas pr&aacute;ticas em sa&uacute;de mental na gradua&ccedil;&atilde;o,
					buscando o desenvolvimento do estudante, dotando-o de autonomia e de motiva&ccedil;&atilde;o no estudo dos cen&aacute;rios
					pr&aacute;ticos nesta &aacute;rea.     <br />
					<a href="#" onclick="alert('Em construção!')">Acesso Livre.</a>     
						</div>
				
						
				
						<div align="right" style="margin-top:50px;">
						<b>Contato</b><br />
						rosalie.belian@ufpe.br
						</div>
			
					</div>
					
					<br /><br /><br /><br />
					
			</div>
			
			
			
			<%@ include file="/JSPs/inc_rodape.jsp"%>
    	
    	
    	
    </body>
</html>
