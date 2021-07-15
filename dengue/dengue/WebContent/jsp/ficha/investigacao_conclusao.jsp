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
		
			<script language="JavaScript" type="text/javascript" src="js/MascaraValidacao.js"></script>
       
        <link href="css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
        <link href="css/Abas.css" rel="stylesheet" type="text/css" />
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style.css" />
        
 		 <link rel="stylesheet" href="js/jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
 		 
 		 
			<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
		<script type="text/javascript" src="js/getCepMaps.js"></script>
        
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
				
				  <style>
				      #map-canvas {
				        height: 400px;
				        width:400px;
				        margin: 0px;
				        padding: 0px
				      }
				    </style>
				    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
   				<script>
						var pos; 
						
						var marker;
						var map;
						var latitude;
						var longitude;
						var mapOptions = {
							    zoom: 16
							   
							  };
						 	
				
				function initialize() {
						 
				   		if(navigator.geolocation) {
				   		    navigator.geolocation.getCurrentPosition(function(position) {
				   		   
				   		    	var latitude;
				   		    	var longitude;
				   		 <c:if test="${latitude != null && longitude != null}">
				   		 	<c:out value="latitude = ${latitude};"></c:out>
				   		 	<c:out value="longitude = ${longitude};"></c:out>
				   		 </c:if>
				   		  
				   		  if(latitude != null && longitude != null){
				   			pos = new google.maps.LatLng(latitude, longitude);
				   		  }else{
				   			pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);
				   		  }
				   		      
				   		   latitude = position.coords.latitude;
					    	longitude = position.coords.longitude;
					    	
					    	 map = new google.maps.Map(document.getElementById('map-canvas'),
						              mapOptions);
						      
						      map.setCenter(pos);
						      
						      marker = new google.maps.Marker({
						        map:map,
						        draggable:true,
						        animation: google.maps.Animation.DROP,
						        position: pos
						      });
					    
						      document.forms[0].latitude.value = latitude;
						      document.forms[0].longitude.value = longitude;
						      
						      google.maps.event.addListener(marker, 'dragend', function(evt){
						    	  document.forms[0].latitude.value = marker.getPosition().lat();
						    	  document.forms[0].longitude.value = marker.getPosition().lng();
						    	});
					       
				   		    }, function() {
				   		      handleNoGeolocation(true);
				   		    });
				   		  } 
				   		
				   		
					
				  google.maps.event.addListener(marker, 'click', toggleBounce);
				  
				  
				  
				}
				
				function toggleBounce() {
				    
				  if (marker.getAnimation() != null) {
				    marker.setAnimation(null);
				  } else {
				    marker.setAnimation(google.maps.Animation.BOUNCE);
				
				  
				  }
				}
				
				google.maps.event.addDomListener(window, 'load', initialize);
				 </script>
</head>
<body onload=""> 
<%@ include file="/jsp/inc_topo.jsp"%>


<div align='center' id="main-content"  style="background-image: none !important;" >
		
			<jsp:include page="../menu.jsp"  flush="true"/>	
			
		<div style="margin-top:15px;">
					
				<div id="conteudo" align="center" style="height:1200px;">
         
						<div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			                <br /><br />
			            </div>
               				
               	 <jsp:include page="menu_ficha.jsp"  flush="true"/>		
               	 
               	 
               	 
               	 <div  align="left" style="display:inline-block; width: 750px">
               	 <p id="titulo-verm" style="" align="left">::Investigação - Conclusão</p>
               	 
               	 		<form action="ficha.do" method="post">
	               	  	 <input type="hidden" name="method" value="salvarInvestigacaoConclusao" />
	               	
               	 		
               	 		<br />
               	 		<div>
               	 		
               	 		 Classificação: <font color="red">*</font>
                           		 <select name="classificacao" required>
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.conclusao.classificacao == 1}">selected="selected"</c:if>>1 - Dengue Clássico</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.conclusao.classificacao == 2}">selected="selected"</c:if>>2 - Dengue com Complicações</option>
										<option value="3" <c:if test="${notificacaoInvestigativa.conclusao.classificacao == 3}">selected="selected"</c:if>>3 - Febre Hemorrágica do Dengue - FHD</option>
										<option value="4" <c:if test="${notificacaoInvestigativa.conclusao.classificacao == 4}">selected="selected"</c:if>>4 - Síndrome do Choque da Dengue - SCD</option>
										<option value="5" <c:if test="${notificacaoInvestigativa.conclusao.classificacao == 5}">selected="selected"</c:if>>5- Descartado</option>
                         		 </select>
                         		 <br /> <br />
               	 		 Critério de Confirmação/Descarte: <font color="red">*</font> 
                           		 <select name="criterioConfirmacao" required>
                           		 	<option value="">SELECIONE</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.conclusao.criterioConfirmacao == 1}">selected="selected"</c:if>>1 - Laboratório </option>
										<option value="2" <c:if test="${notificacaoInvestigativa.conclusao.criterioConfirmacao == 2}">selected="selected"</c:if>>2 - Clínico-Epidemiológico</option>
										<option value="3" <c:if test="${notificacaoInvestigativa.conclusao.criterioConfirmacao == 3}">selected="selected"</c:if>>3 - Em Investigação</option>
                         		 </select>
               	 		</div>
               	 		<br />
               	 		 <p id="titulo-verm" style="" align="left">::Os casos de dengue com complicações, FHD e SCD: preencher o formulário seguinte.</p>
               	 <br />
               	 	<div>
               	 	 Local Provável de Infecção (no período de 15 dias):  <br />
               	 	 O caso é autóctone do município de residência?<font color="red">*</font>
                           		 <select name='localInfeccao' required>
                           		 	<option value="" >SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.conclusao.localInfeccao == 1}">selected="selected"</c:if>>1 - Sim</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.conclusao.localInfeccao == 2}">selected="selected"</c:if>>2 - Não</option>
										<option value="3" <c:if test="${notificacaoInvestigativa.conclusao.localInfeccao == 3}">selected="selected"</c:if>>3 - Indeterminado</option>
                         		 </select>
               	 	
               	 	</div>
               	 	<table>
               	 		 <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CEP
                                        <input onblur="getEndereco();"  onkeypress="return isNumberKey(event)"  id="cep" maxlength="9" size="20" name="cep" value="<c:out value="${notificacaoInvestigativa.conclusao.logradouro.cep}"></c:out>" />
                                    </font>
                                </div>
								<div style="float:left;margin-right: 10px;">
									<img id="loader" style="visibility:hidden;width:16px; heigth:16px;" src="images/ajax-loader.gif" alt="loading" />
									<input type="button" value="Verificar" />
								</div>
								<div style="float:left;margin-right: 10px;">
									<a href="http://www.correios.com.br/"><u>N&atilde;o sabe o seu CEP? Consulte aqui</u></a>  
								</div>
								
								<div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&uacute;mero
                                        <font color="red">
                                            
                                        </font>
                                        <input size="7" name="numero" id="numero" value="<c:out value="${notificacaoInvestigativa.conclusao.numero}"></c:out>" />
                                    </font>
                                </div>
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Comp.
                                        <font color="red">
                                            
                                        </font>
                                        <input size="7" id="complemento" name="complemento" value="<c:out value="${notificacaoInvestigativa.conclusao.numero}"></c:out>" />
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
	                                            <option value="${pais.numeroCodificacao}"  <c:if test="${notificacaoInvestigativa.conclusao.pais.numeroCodificacao == pais.numeroCodificacao}">selected="selected"</c:if>><c:out value="${pais.nome}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                               
                                
                                </div>
                            </td>
                        </tr>
                        
                       <tr>
							<td style="padding-top:10px;">
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado
                                        <font color="red">
                                            
                                        </font>
                                        <select id="estado" name="estado" onchange="listarCidades()" >
                                         <option value=""><c:out value="SELECIONE"></c:out></option>
                                        	<c:forEach items="${estados}" var="estado" varStatus="index">
	                                            <option value="${estado.codigo}" <c:if test="${notificacaoInvestigativa.conclusao.estado.codigo == estado.codigo}">selected="selected"</c:if> ><c:out value="${estado.descricao}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                </div>
                          		 <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Cidade
                                        <font color="red">
                                        </font>
                                        <select id="cidade" name="cidade" onchange="listarBairros()">
                                        	<option value=''>SELECIONE</option>
                                        	
                                        	<c:forEach items="${cidades}" var="cidade" varStatus="index">
                                        	
	                                            <option value="${cidade.codigo_cidade}" <c:if test="${notificacaoInvestigativa.conclusao.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if>><c:out value="${cidade.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Distrito
                                        <font color="red">
                                        </font>
                                     <input id="Distrito" size="10" name="Distrito" value="<c:out value="${notificacaoInvestigativa.conclusao.logradouro.rua}"></c:out>" />
                                        
                                    </font>
                                </div>
                                </td>
                           </tr>
                           
                        <tr>
                            <td style="padding-top:10px;">
                            	<div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">
                                            
                                        </font>
                                        
                                         <select id="bairro" name="bairro">
                                        	<option value=''>SELECIONE</option>
                                        	<c:forEach items="${bairros}" var="bairro" varStatus="index">
                                        	
	                                            <option value="${bairro.codigo}" <c:if test="${notificacaoInvestigativa.conclusao.logradouro.bairro.codigo == bairro.codigo}">selected="selected"</c:if>><c:out value="${bairro.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                        
                                    </font>
                                </div>
                               
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Endere&ccedil;o
                                        <font color="red">
                                            
                                        </font>
                                        <input id="rua" size="45" name="endereco" value="<c:out value="${notificacaoInvestigativa.conclusao.logradouro.rua}"></c:out>" />
                                    </font>
                                </div>
                                
                                
                            </td>
                        </tr>
                        
                        </table>
                         <br />
                      	<div>
                      		<input type="hidden" name="address" id="address" />
						  	Latitude:<input type="text" name="latitude"  value="<c:out value="${notificacaoInvestigativa.conclusao.latitude}"></c:out>" /> Longitude:<input type="text" name="longitude"  value="<c:out value="${notificacaoInvestigativa.conclusao.longitude}"></c:out>" /><br /><br />
						    <div id="map-canvas"></div> 
                        </div> 
                            <br />     <br /> 
                        <div>
               	 	 Doença Relacionada ao Trabalho: <font color="red">*</font>
                           		 <select name="doencaTrabalho" required>
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.conclusao.doencaTrabalho == 1}">selected="selected"</c:if>>1 - Sim</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.conclusao.doencaTrabalho == 2}">selected="selected"</c:if>>2 - Não</option>
										<option value="9" <c:if test="${notificacaoInvestigativa.conclusao.doencaTrabalho == 9}">selected="selected"</c:if>>9 - Ignorado</option>
                         		 </select>
               	 	 Evolução do Caso: <font color="red">*</font>
                           		 <select name="evolucaoCaso" required>
                           		 	<option value="">SELECIONE</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.conclusao.evolucaoCaso == 1}">selected="selected"</c:if>>1 - Cura </option>
										<option value="2" <c:if test="${notificacaoInvestigativa.conclusao.evolucaoCaso == 2}">selected="selected"</c:if>>2- Óbito por dengue</option> 
										<option value="3" <c:if test="${notificacaoInvestigativa.conclusao.evolucaoCaso == 3}">selected="selected"</c:if>>3- Óbito por outras causas </option>
										<option value="4" <c:if test="${notificacaoInvestigativa.conclusao.evolucaoCaso == 4}">selected="selected"</c:if>>4- Óbito em investigação </option>
										<option value="9" <c:if test="${notificacaoInvestigativa.conclusao.evolucaoCaso == 9}">selected="selected"</c:if>>9- Ignorado</option>
                         		 </select>
               	 	</div>
               	 	<br />
					<div>
						<font face="Arial">
                            	Data do Óbito:
                           		 <input size="13" id="inputDate" name="inputDate" value="<c:out value="${notificacaoInvestigativa.conclusao.dataObitoFormatada}"></c:out>" />
                            </font>
                          <font face="Arial">
                            	Data do Encerramento:
                           		 <input size="13" id="inputDate2" name="inputDate2" value="<c:out value="${notificacaoInvestigativa.conclusao.dataEncerramentoFormatada}"></c:out>" />
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