<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<head> 


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
	    
	    	function usuarioDescricao(){

				var restricao = document.getElementById('restricaoAcesso');
				var indice = restricao.selectedIndex;
				var conselho = document.getElementById('conselho');
				var div = document.getElementById('descricaoTipoUsuario');
				
				if(indice == 0){
					conselho.setAttribute('style','visibility:visible;');
					div.innerHTML = '<b style="color:#66CC33; font-size: 10px;">Descri&ccedil;&atilde;o Professor:</b><br /><div style="font-size: 10px;">Cadastrar, visualizar e avaliar todos os dados inseridos por todos os alunos.</div>';
				}else if(indice == 1){
					conselho.setAttribute('style','visibility:visible;');
					div.innerHTML = '<b style="color:#66CC33;font-size: 10px">Descri&ccedil;&atilde;o Enfermeiro:</b><br /><div style="font-size: 10px;"> Cadastrar, inserir, avaliar e sistematizar os dados do pacientes.</div>';
				}else if(indice == 2){
					conselho.setAttribute('style','visibility:hidden;');
					div.innerHTML = '<b style="color:#66CC33; font-size: 10px">Descri&ccedil;&atilde;o Aluno Laboratório:</b><br /><div style="font-size: 10px;"> Cadastrar, visualizar, admitir, re-admitir, evoluir e dar alta a pacientes fict&iacute;cios.</div>';
				}else if(indice == 3){
					conselho.setAttribute('style','visibility:hidden;');
					div.innerHTML = '<b style="color:#66CC33;font-size: 10px">Descri&ccedil;&atilde;o Aluno Enfermaria:</b><br /><div style="font-size: 10px;"> Cadastrar, inserir, avaliar e sistematizar os dados do pacientes.</div>';
				}
				
			}
	    </script>

		
        <script type="text/javascript">
        	function navegacao(){
	        	var div = window.top.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Usuários Adicionar</a>";
        	}
        	
        	
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
				  });
				  </script>
				  
				 <style>
					.ui-autocomplete-loading {
						background: white url('images/ajax-loader.gif') right center no-repeat;
					}
				</style>
					
				  <style>
				      #map-canvas {
				        height: 500px;
				        width:700px;
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
						      
						      var index = 0;
						<c:forEach items="${investigacoes}" var="investigacao" varStatus="index">
                            	
						 <c:if test="${investigacao.conclusao.latitude != null && investigacao.conclusao.longitude != null}">
					   				
					   				
						 var pos<c:out value="${investigacao.conclusao.id}"></c:out> = new google.maps.LatLng(<c:out value="${investigacao.conclusao.latitude}"></c:out>,
											<c:out value="${investigacao.conclusao.longitude}"></c:out>);
									
									var cor<c:out value="${investigacao.conclusao.id}"></c:out> = "";	
									 <c:if test="${investigacao.conclusao.classificacao == 1}">
												cor<c:out value="${investigacao.conclusao.id}"></c:out> = 'images/preto.png';
										 </c:if>
							 			<c:if test="${investigacao.conclusao.classificacao == 2}">
							 					cor<c:out value="${investigacao.conclusao.id}"></c:out> = 'images/verde.png';
									 </c:if>
										<c:if test="${investigacao.conclusao.classificacao == 3}">
											cor<c:out value="${investigacao.conclusao.id}"></c:out> = 'images/vermelho.png';
								 		</c:if>
								 		<c:if test="${investigacao.conclusao.classificacao == 4}">
								 			cor<c:out value="${investigacao.conclusao.id}"></c:out> = 'images/azul.png';
							 		</c:if>
							 		<c:if test="${investigacao.conclusao.classificacao == 5 || investigacao.conclusao.classificacao == 0}">
							 				cor<c:out value="${investigacao.conclusao.id}"></c:out> = 'images/cinza.png';
								 		</c:if>
						 		
								  var    marker<c:out value="${investigacao.conclusao.id}"></c:out> = new google.maps.Marker({
								        map:map,
								        draggable:false,
								        animation: google.maps.Animation.DROP,
								        position: pos<c:out value="${investigacao.conclusao.id}"></c:out>,
								        icon: cor<c:out value="${investigacao.conclusao.id}"></c:out>
								      });
							    
								      google.maps.event.addListener(marker<c:out value="${investigacao.conclusao.id}"></c:out>, 'click', toggleBounce<c:out value="${investigacao.conclusao.id}"></c:out>);
								      
								      var contentString<c:out value="${investigacao.conclusao.id}"></c:out> = '<div id="content">'+
								      '<div id="siteNotice">'+
								      '</div>'+
								      '<h3 id="firstHeading" class="firstHeading">Dados Gerais</h3>'+
								      '<div id="bodyContent">'+
								      '<b>Data da notificação:</b><c:out value="${investigacao.dadosGerais.dataNotificacaoFormatada}"></c:out> <br />' + 
								      '<b>Estado:</b><c:out value="${investigacao.dadosGerais.cidade.estado.descricao}"></c:out> <br />'+
								      '<b>Cidade:</b><c:out value="${investigacao.dadosGerais.cidade.descricao}"></c:out><br />' +
								      '<b>Unidade de saúde:</b> <c:out value="${investigacao.dadosGerais.unidadeSaude.nome_fantasia}"></c:out> <br />' +
								      '<b>Data Primeiros Sintomas:</b><c:out value="${investigacao.dadosGerais.dataPrimeirosSintomasFormatada}"></c:out><br />'  +
								      '<br /><p>Mais informações, <a target="_blank" href="relatorio.do?method=mostrarRelatorioIndividual&idFicha='+<c:out value="${investigacao.id}"></c:out> +'">'+
								      'clique aqui</a> '+
								      '</p>'+
								      '</div>'+
								      '</div>';
								      
								      var infowindow<c:out value="${investigacao.conclusao.id}"></c:out> = new google.maps.InfoWindow({
								          content: contentString<c:out value="${investigacao.conclusao.id}"></c:out>
								      });
								      
								      function toggleBounce<c:out value="${investigacao.conclusao.id}"></c:out>() {
										    
										  if (marker<c:out value="${investigacao.conclusao.id}"></c:out>.getAnimation() != null) {
										    marker<c:out value="${investigacao.conclusao.id}"></c:out>.setAnimation(null);
										  } else {
										    marker<c:out value="${investigacao.conclusao.id}"></c:out>.setAnimation(google.maps.Animation.BOUNCE);
										    infowindow<c:out value="${investigacao.conclusao.id}"></c:out>.open(map,marker<c:out value="${investigacao.conclusao.id}"></c:out>);
										  
										  }
										}
								      
							  </c:if>
						  	</c:forEach>
                            
				   		    }, function() {
				   		      handleNoGeolocation(true);
				   		    });
				   		  } 
				   		
				   		
					
				 
				  
				  
				}
				
				
				google.maps.event.addDomListener(window, 'load', initialize);
				 </script>
			
		 
</head>
<body>
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
				
			<div style="float:left; width: 300px; margin-left: 300px; text-align: justify;" align="left">
				  <div style="width:300px;"><h4 align="left" style="">Relatório Geográfico</h4></div>
		     		<form action="relatorio.do" method="post">
               	  	 <input type="hidden" name="method" value="filtrarRelatorioGeografico" />
               	
					<br/>
					Filtro<br/>
					Data:  <input size="13" id="inputDate" name="inputDate" value="" /> à  <input size="13" id="inputDate2" name="inputDate2" value="" /> 
					<br /><br/>
					<div style="">
						<table>
							<tr>
								<td>
			                       <font face="Arial">
			                           CEP
			                           <input onblur="getEndereco();" style="width: 100px;"  type="text"  id="cep" maxlength="9" size="20" name="cep" value="" />
			                       </font>
								</td>
								<td>
			                         <div style="margin-right: 10px;">
										<img id="loader" style="visibility:hidden;width:16px; heigth:16px;" src="images/ajax-loader.gif" alt="loading" />
									</div>
								</td>
							</tr>
						</table>
                   </div>
                         <br />           
					<div style="margin-right: 10px; float:left;">
                          <font face="Arial">
                              Estado
                              <font color="red">
                                  
                              </font>
                              <select id="estado" name="estado" onchange="listarCidades()" >
                               <option value=""><c:out value="SELECIONE"></c:out></option>
                              	<c:forEach items="${estados}" var="estado" varStatus="index">
                              	
                                   <option value="${estado.codigo}" <c:if test="${usuarioRet.residencia.estado.codigo == estado.codigo}">selected="selected"</c:if> ><c:out value="${estado.descricao}"></c:out></option>
                              	</c:forEach>
                              												
                              </select>
                          </font>
                      </div>
                       <br /><br/>
                		 <div style="margin-right: 10px; ">
                          <font face="Arial">
                              Cidade
                              <font color="red">
                              </font>
                              <select id="cidade" name="cidade" onchange="listarBairros()">
                              	<option value=''>SELECIONE</option>
                              	
                              	<c:forEach items="${cidades}" var="cidade" varStatus="index">
                              	
                                   <option value="${cidade.codigo_cidade}" <c:if test="${usuarioRet.residencia.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if>><c:out value="${cidade.descricao}"></c:out></option>
                              	</c:forEach>
                              </select>
                              
                          </font>
                      </div>
                      <br/>
                       <br />
                       <div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">
                                            
                                        </font>
                                        
                                         <select id="bairro" name="bairro">
                                        	<option value=''>SELECIONE</option>
                                        	<c:forEach items="${bairros}" var="bairro" varStatus="index">
                                        	
	                                            <option value="${bairro.codigo}" <c:if test="${usuarioRet.residencia.logradouro.bairro.codigo == bairro.codigo}">selected="selected"</c:if>><c:out value="${bairro.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                        
                                    </font>
                                </div>
                           <br />     <br/>  
                                <div style="margin-right: 10px;  ">
                                	<font face="Arial">
                                		<br/>Unidade de Saúde (ou outra fonte notificadora)<br/>
                                		<input id="autocomplete" name="autocomplete" size="50"  /> 
                               		</font>
                               		
                                </div>
                                  <br /><br />
                             <table>
                             	<tr>
                             		<td><img src="images/mosquito.png" width="40px"/>Clássico <input name="classico" type="checkbox" checked="checked" /></td>
                             		<td><img src="images/mosquitoVerde.png" width="40px"/>Complicações<input name="complicacoes" type="checkbox" checked="checked" /></td>
                             	</tr>
                             	<tr>
                             		<td><br /><br /></td>
                             	</tr>
                             	<tr>
                             		<td><img src="images/mosquitoVermelho.png" width="40px"/>FHD <input name="fhd" type="checkbox" checked="checked" /></td>
                             		<td><img src="images/mosquitoAzul.png" width="40px" />SCD<input name="scd" type="checkbox" checked="checked" /></td>
                             	</tr>
                             	<tr>
                             		<td><br /><br /></td>
                             	</tr>
                             	<tr>
                             		<td><img src="images/mosquitoCinza.png" width="40px" />Descartado <input name="descartado" type="checkbox" checked="checked" /></td>
                             	</tr>
                             </table>
                             
                             <br /><br /><br />
                                 <div align="right" style="">
		                               <input type="submit" value="Filtrar"/>
                                </div>
				</form>
				</div>
				
				
				<div>
					<div id="map-canvas"></div> 
				</div>
				
			
              </div>
			   
                </div>

		
</div>



<%@ include file="/jsp/inc_rodape.jsp"%>
</body>
</html>