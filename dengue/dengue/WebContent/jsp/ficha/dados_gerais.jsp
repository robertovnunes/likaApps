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
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        	var div = window.t	op.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Pacientes Buscar</a>";
        	}
        </script>
        
         <script type="text/javascript">
	        $(function() {	    
	        	$("#inputDate").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2018',
					gotoCurrent: true
				});	
	        	$("#inputDate2").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2018',
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
<body onload="navegacao();"> 
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
               	  	 <form action="ficha.do" method="post">
               	  	 <input type="hidden" name="method" value="salvarDadosGerais" />
               	  	 <p id="titulo-verm" style="" align="left">::Dados Gerais</p>
               	 		<div>Tipo de Notificação: <b><input type="text" value="[2] individual" disabled="disabled"></input></b></div><br />
               	 		<div>Agravo/Doença: <input type="text" value="Dengue" disabled="disabled"></input> CID 10: <input type="text" value="A 90" disabled="disabled"></input> 
               	 		Data Notificação: <font color="red">*</font> <input size="13" id="inputDate" name="inputDate" value="<c:out value="${notificacaoInvestigativa.dadosGerais.dataNotificacaoFormatada}"></c:out>" required />
               	 		</div><br />
               	 		<div style="margin-right: 10px; float:left;">
                                    <font face="Arial">
                                        Estado<font color="red">*</font>
                                        <font color="red">
                                            
                                        </font>
                                        <select id="estado" name="estado" onchange="listarCidades()" required >
                                         <option value="">SELECIONE</option>
                                        	<c:forEach items="${estados}" var="estado" varStatus="index">
                                        	
	                                            <option value="${estado.codigo}" <c:if test="${notificacaoInvestigativa.dadosGerais.cidade.estado.codigo == estado.codigo}">selected="selected"</c:if> ><c:out value="${estado.descricao}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                </div>
                          		 <div style="margin-right: 10px; ">
                                    <font face="Arial">
                                        Cidade<font color="red">*</font>
                                        <font color="red">
                                        </font>
                                        <select id="cidade" name="cidade" onchange="listarBairros()" required>
                                        	<option value=''>SELECIONE</option>
                                        	
                                        	<c:forEach items="${cidades}" var="cidade" varStatus="index">
                                        	
	                                            <option value="${cidade.codigo_cidade}" <c:if test="${notificacaoInvestigativa.dadosGerais.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if>><c:out value="${cidade.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                    </font>
                                </div>
                                <br />
                                <div style="margin-right: 10px;  ">
                                	<font face="Arial">
                                		Unidade de Saúde (ou outra fonte notificadora)<font color="red">*</font>
                                		<input id="autocomplete" name="autocomplete" size="50" value="<c:if test="${notificacaoInvestigativa.dadosGerais.unidadeSaude != null}"><c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.nome_fantasia}"></c:out> - <c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.codigo_unidade}"></c:out></c:if>"  required /> 
                               		</font>
                               		
                                </div>
                                  <br />
                                <div>
		                                <font face="Arial">
		                                	Data dos Primeiros Sintomas:<font color="red">*</font>
		                               		 <input size="13" id="inputDate2" name="inputDate2" value="<c:out value="${notificacaoInvestigativa.dadosGerais.dataPrimeirosSintomasFormatada}"></c:out>" required />
		                                </font>
                                </div><font color="red">*Campos Obrigatórios</font>
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