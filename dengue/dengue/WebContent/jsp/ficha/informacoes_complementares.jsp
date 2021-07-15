<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<head> 
		<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
		
		
		<%@ include file="/jsp/inc_header.jsp"%>
		

		
        <link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
		
       
        <link href="css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
        <link href="css/Abas.css" rel="stylesheet" type="text/css" />
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style.css" />
        
        <script type="text/javascript" src="js/tiny_mce/tiny_mce.js">
	        </script>
        
        
 		 <link rel="stylesheet" href="js/jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
 		 
 		 
			<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
		<script type="text/javascript" src="js/getCep.js"></script>
        
         <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		  
        	
		 <script type="text/javascript">
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });
           </script>
    
		
		 <script type="text/javascript">
        	function navegacao(){
	        	var div = window.t	op.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Pacientes Buscar</a>";
        	}
        </script>
        
	       
	         <script>
				  $(document).ready(function(){
					  
					  
					  function log( message ) {
						//	$( "<div>" ).text( message ).prependTo( "#log" );
					//		$( "#log" ).scrollTop( 0 );
						}
					  
					  
					
				  });
				  </script>
				  
				 <style>
					.ui-autocomplete-loading {
						background: white url('images/ajax-loader.gif') right center no-repeat;
					}
				</style>
</head>
<body onload=""> 
<%@ include file="/jsp/inc_topo.jsp"%>


<div align='center' id="main-content"  style="background-image: none !important;" >
		
			<jsp:include page="../menu.jsp"  flush="true"/>	
			
		<div style="margin-top:15px;">
					
				<div id="conteudo" align="center" style="height:700px;">
         
						<div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			                <br /><br />
			            </div>
               				
               	 <jsp:include page="menu_ficha.jsp"  flush="true"/>		
               	 
               
               	 
               	 <div  align="left" style="display:inline-block; width: 750px">
               	  	 <p id="titulo-verm" style="" align="left">::Informações complementares e observações</p>
               	 			<form action="ficha.do" method="post">
	               	  	 <input type="hidden" name="method" value="salvarObservacoesAdicionais" />
                                <div>
		                                <font face="Arial">
		                                	Observações Adicionais:<br />
		                               		 <textarea id="elm1" name="observacoesAdicionais"  rows="15" cols="80" style="width: 600px;">
		                               		 <c:out value="${notificacaoInvestigativa.observacoesAdicionais}"></c:out>
	                  						  </textarea>
		                                </font>
                                </div>
                                <br /><br /><br />
                                 <div align="right" style="">
		                               <input type="submit" value="Salvar"/>
                                </div>
                                
                            </form>
               	 		
               	 </div>		
               				
				</div>
         </div>
</div>
       
<%@ include file="/jsp/inc_rodape.jsp"%>
</body>
</html>