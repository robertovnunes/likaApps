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
        
 		 <link rel="stylesheet" href="js/jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
 		 
 		 
			<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
		<script type="text/javascript" src="js/getCep.js"></script>
        
         <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		  
     
         <script type="text/javascript">
	        $(function() {	    
	        	$("#inputDate").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        	$("#inputDate2").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        	$("#inputDate3").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        	$("#inputDate4").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        	
	        	$("#inputDate5").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        	
	        	$("#inputDate6").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2020',
					gotoCurrent: true
				});	
	        });
	        
	       </script>
	       
	         <script>
				  $(document).ready(function(){
					  
					  
					  function log( message ) {
						//	$( "<div>" ).text( message ).prependTo( "#log" );
					//		$( "#log" ).scrollTop( 0 );
						}
					  
					  
					  $( "#autocomplete" ).autocomplete({
							source: "autocomplete",
							minLength: 2,
							select: function( event, ui ) {
								log( ui.item ?
									"Selected: " + ui.item.value + " aka " + ui.item.id :
									"Nothing selected, input was " + this.value );
							}
						});
					  
					  var elements = document.getElementsByTagName("INPUT");
					    for (var i = 0; i < elements.length; i++) {
					        elements[i].oninvalid = function(e) {
					            e.target.setCustomValidity("");
					            if (!e.target.validity.valid) {
					                e.target.setCustomValidity("Campo Obrigatório");
					            }
					        };
					        elements[i].oninput = function(e) {
					            e.target.setCustomValidity("");
					        };
					    }
					    
					    elements = document.getElementsByTagName("SELECT");
					    for (var i = 0; i < elements.length; i++) {
					        elements[i].oninvalid = function(e) {
					            e.target.setCustomValidity("");
					            if (!e.target.validity.valid) {
					                e.target.setCustomValidity("Campo Obrigatório");
					            }
					        };
					        elements[i].oninput = function(e) {
					            e.target.setCustomValidity("");
					        };
					    }
				  });
				  </script>
				  
				 <style>
					.ui-autocomplete-loading {
						background: white url('images/ajax-loader.gif') right center no-repeat;
					}
				</style>
</head>
<body > 
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
               	 <p id="titulo-verm" style="" align="left">::Investigação - Dados laboratoriais</p>
               	   	 <form action="ficha.do" method="post">
               	  	 <input type="hidden" name="method" value="salvarInvestigacaoLaboratoriais" />
               	
               	 		<div> 
               	 		
         	 				<font face="Arial">
                            	Data da Investigação:<font color="red">*</font>
                           		 <input size="13" id="inputDate" name="inputDate" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataInvestigacaoFormatada}"></c:out>" required />
                            </font>
               	 		 <font face="Arial">
                            	Ocupação:
                           		   <input size="100" style="width: 350px;" id="ocupacao" name="ocupacao" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.ocupacao}"></c:out>" />
                            </font>
               	 		</div>
               	 		<br />
               	 		<div> 
               	 		
         	 				<font face="Arial">
                            	Data Coleta Exame Sorológico (IgM):
                           		 <input size="13" id="inputDate2" name="inputDate2" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaIgmFormatada}"></c:out>" />
                            </font>
               	 			 Resultado:  
                           		 <select name="resultadoIgm">
                           		 	<option>SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoIgm == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoIgm == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoIgm == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoIgm == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		<br />
                         <div> 
               	 		
         	 				<font face="Arial">
                            	Data Coleta Exame NS1:
                           		 <input size="13" id="inputDate3" name="inputDate3" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaNs1Formatada}"></c:out>" />
                            </font>
               	 			 Resultado:  
                           		 <select name="resultadoNs1">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoNs1 == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoNs1 == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoNs1 == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoNs1 == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		<br />
                         <div> 
               	 		
         	 				<font face="Arial">
                            	Data Coleta Isolamento Viral:
                           		 <input size="13" id="inputDate4" name="inputDate4" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaViralFormatada}"></c:out>" />
                            </font>
               	 			 Resultado:  
                           		 <select name="resultadoViral" >
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoViral == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoViral == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoViral == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoViral == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		
               	 		<br />
                         <div> 
               	 		
         	 				<font face="Arial">
                            	Data Coleta RT-PCR:
                           		 <input size="13" id="inputDate5" name="inputDate5" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaRT_PCRFormatada}"></c:out>" />
                            </font>
               	 			 Resultado:  
                           		 <select name="resultadoRT_PCR">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoRT_PCR == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoRT_PCR == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoRT_PCR == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoRT_PCR == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		<br />
                         <div> 
               	 		
         	 				<font face="Arial">
                            	Data Coleta RT-Biosensor:
                           		 <input size="13" id="inputDate6" name="inputDate6" value="<c:out value="${notificacaoInvestigativa.dadosLaboratoriais.dataColetaPCRBiosensorFormatada}"></c:out>" />
                            </font>
               	 			 Resultado:  
                           		 <select name="resultadoPCRBiosensor">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoPCRBiosensor == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoPCRBiosensor == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoPCRBiosensor == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoPCRBiosensor == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		<br />
                         <div> 
               	 		
               	 			 Sorotipo:  
                           		 <select name="sorotipo">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.sorotipo  == 1}">selected="selected"</c:if>>1 - DEM 1</option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.sorotipo  == 2}">selected="selected"</c:if>>2 - DEM 2</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.sorotipo  == 3}">selected="selected"</c:if>>3 - DEM 3</option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.sorotipo  == 4}">selected="selected"</c:if>>4 - DEM 4</option>
                           		 </select>
                           		 
                          	 Histopatologia:  
                           		 <select name="resultadoHistopatologia">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoHistopatologia == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoHistopatologia == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoHistopatologia == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoHistopatologia == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
                           	 Imunohistoquímica:  
                           		 <select name="resultadoImunohistoquimica">
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoImunohistoquimica == 1}">selected="selected"</c:if>>1 - Reagente </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoImunohistoquimica == 2}">selected="selected"</c:if>>2 - Não Reagente</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoImunohistoquimica == 3}">selected="selected"</c:if>>3 - Inconclusivo </option>
									<option value="4" <c:if test="${notificacaoInvestigativa.dadosLaboratoriais.resultadoImunohistoquimica == 4}">selected="selected"</c:if>>4 - Não Realizado</option>
                           		 </select>
               	 		</div>
               	 		<font color="red">*Campos Obrigatórios</font>
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