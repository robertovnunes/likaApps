<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../autenticacao.jsp"  flush="true"/>		
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
		
		<script language="JavaScript" type="text/javascript" src="js/MascaraValidacao.js"></script>
       
        <link href="css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
        <link href="css/Abas.css" rel="stylesheet" type="text/css" />
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style.css" />
        
 		 <link rel="stylesheet" href="js/jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
 		 
 		 <script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/getCep.js"></script>
        <script type="text/javascript" src="js/eye.js"></script>
        <script type="text/javascript" src="js/utils.js"></script>
        
			<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
        
         <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		  
         <script type="text/javascript">
        	function selecionouPais(){
        		var cod = $('#pais').val();

        		if(cod != '1058'){
        			$('#estado').attr("disabled","disabled");
        			$('#cidade').attr("disabled","disabled");
        			$('#bairro').attr("disabled","disabled");
        		}else{
        			$('#estado').removeAttr("disabled");
        			$('#cidade').removeAttr("disabled");
        			$('#bairro').removeAttr("disabled");
        		}
        	}
        </script>
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
        
         <script type="text/javascript">
	        $(function() {	    
	        	$("#inputDate").datepicker({
					changeMonth: true,
					changeYear: true,
					dateFormat:'dd/mm/yy',
					yearRange: '1900:2013',
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
		
			<jsp:include page="../../menu.jsp"  flush="true"/>	
			
		<div style="margin-top:15px;">
					
				<div id="conteudo" align="center" style="height:700px;">
         
						<div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			                <br /><br />
			            </div>
               				
               	 <jsp:include page="../menu_ficha.jsp"  flush="true"/>		
               	 
               	 
               	 
               	 <div  align="left" style="display:inline-block; width: 750px">
              
	               	 <p id="titulo-verm" style="" align="left">::Notificação Individual - Residência Paciente</p>
            	 		 <form action="ficha.do" method="post">
               	  		 <input type="hidden" name="method" value="salvarResidenciaPaciente" />
               	 		<div>
               	 		<table>
               	 		 <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CEP
                                        <input onblur="getEndereco();"  onkeypress="return isNumberKey(event)"  id="cep" maxlength="9" size="20" name="cep" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.cep}"></c:out>" />
                                    </font>
                                </div>
								<div style="float:left;margin-right: 10px;">
									<img id="loader" style="visibility:hidden;width:16px; heigth:16px;" src="images/ajax-loader.gif" alt="loading" />
									<input type="button" value="Verificar" />
								</div>
								<div style="float:left;margin-right: 10px;">
									<a href="http://www.correios.com.br/" target="_blank"><u>N&atilde;o sabe o seu CEP? Consulte aqui</u></a>  
								</div>
								
								<div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&uacute;mero
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="7" name="numero" id="numero" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.numero}"></c:out>" required/>
                                    </font>
                                </div>
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Comp.
                                        <input size="7" id="complemento" name="complemento" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.complemento}"></c:out>" />
                                    </font>
                                </div>
							</td>
						</tr>
                          <tr>
                        	<td style="padding-top:10px;">
                             <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Pais
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="pais" name="pais" onchange="selecionouPais()" required>
                                        	<option value=""><c:out value="SELECIONE"></c:out></option>
                                        	<c:forEach items="${paises}" var="pais" varStatus="index">
	                                            <option value="${pais.numeroCodificacao}"  <c:if test="${notificacaoInvestigativa.paciente.residencia.pais.numeroCodificacao == pais.numeroCodificacao}">selected="selected"</c:if>><c:out value="${pais.nome}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                    
                                    Zona:  <font color="red">*</font>
                           		 <select name="zona" required>
                           		 	<option value="">SELECIONE</option>
									<option value="1" <c:if test="${notificacaoInvestigativa.paciente.residencia.zona == 1}">selected="selected"</c:if>>1 - Urbana </option>
									<option value="2" <c:if test="${notificacaoInvestigativa.paciente.residencia.zona == 2}">selected="selected"</c:if>>2 - Rural</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.paciente.residencia.zona == 3}">selected="selected"</c:if>>3 - Periurbana </option>
									<option value="9" <c:if test="${notificacaoInvestigativa.paciente.residencia.zona == 9}">selected="selected"</c:if>>9 - Ignorado</option>
                           		 </select>
                                </div>
                                
                                
                                
                            </td>
                        </tr>
                        
                       <tr>
							<td style="padding-top:10px;">
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="estado" name="estado" onchange="listarCidades()" required>
                                         <option value=""><c:out value="SELECIONE"></c:out></option>
                                        	<c:forEach items="${estados}" var="estado" varStatus="index">
	                                            <option value="${estado.codigo}" <c:if test="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.cidade.estado.codigo == estado.codigo}">selected="selected"</c:if> <c:if test="${notificacaoInvestigativa.paciente.residencia.estado.codigo == estado.codigo}">selected="selected"</c:if> ><c:out value="${estado.descricao}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                </div>
                          		 <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Cidade
                                        <font color="red">*
                                        </font>
                                        <select id="cidade" name="cidade" onchange="listarBairros()" required>
                                        	<option value=''>SELECIONE</option>
                                        	<c:forEach items="${cidades}" var="cidade" varStatus="index">
	                                            <option value="${cidade.codigo_cidade}" <c:if test="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if> <c:if test="${notificacaoInvestigativa.paciente.residencia.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if>><c:out value="${cidade.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Distrito
                                     <input id="Distrito" size="10" name="distrito" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.distrito}"></c:out>" />
                                        
                                    </font>
                                </div>
                                </td>
                           </tr>
                           
                        <tr>
                            <td style="padding-top:10px;">
                            	<div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">*</font>
                                        
                                         <select id="bairro" name="bairro" required>
                                        	<option value=''>SELECIONE</option>
                                        	<c:forEach items="${bairros}" var="bairro" varStatus="index">
                                        	
	                                            <option value="${bairro.codigo}" <c:if test="${notificacaoInvestigativa.paciente.residencia.logradouro.bairro.codigo == bairro.codigo}">selected="selected"</c:if>><c:out value="${bairro.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                        
                                    </font>
                                </div>
                               
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Endere&ccedil;o<font color="red">*</font>
                                        <input id="rua" size="45" name="endereco" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.logradouro.rua}"></c:out>" required/>
                                    </font>
                                </div>
                                
                                
                            </td>
                        </tr>
                        
						
                      
                        <tr>
                            <td style="padding-top:10px;">
                                <div>
                                    <font face="Arial">
                                        Ponto de 
                                        refer&ecirc;ncia
                                        <input size="74" name="referencia" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.referencia}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                             
                        </tr>
                        
                        <tr>
                       		 <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Geo Campo 1
                                        <input size="10" name="geocampo1" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.geocampo1}"></c:out>" />
                                    </font>
                                </div>
                                
                               <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Geo Campo 2
                                        <input size="10" name="geocampo2" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.geocampo2}"></c:out>" />
                                    </font>
                                </div>
                                 <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                       Telefone
                                        <input size="10" name="telefone"  onkeypress="return isNumberKey(event)" value="<c:out value="${notificacaoInvestigativa.paciente.residencia.telefone}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                            
                        </tr>
                        </table>
               	 		</div>
               	 		


						<br />
               	 		
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