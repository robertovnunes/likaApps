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
	        	var div = window.top.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}';
	
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
					                e.target.setCustomValidity("Campo Obrigat??rio");
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
					                e.target.setCustomValidity("Campo Obrigat??rio");
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
               	 <p id="titulo-verm" style="" align="left">::Dados cl??nicos (dengue com complica????es, FHD e SCD)</p>
               	 
               	 	<form action="ficha.do" method="post">
	               	  	 <input type="hidden" name="method" value="salvarComplicacoes" />
	               	
               	 	
               	 <div class="titulo">
               	 				A FHD em geral desenvolve-se entre o 3?? e o 5?? dia de doen??a, quando h?? o recrudescimento da febre.
								A presen??a de dor abdominal intensa, hepatomegalia dolorosa, hipotermia com sudorese, letargia/agita????o,
								cianose, arritmias, hipotens??o arterial/postural, v??mitos persistentes, manifesta????es neurol??gicas s??o
								indicadores de que o paciente pode evoluir para FHD ou para um quadro mais grave de dengue.
					</div>
								               	 		
               	 		<br />
               	 		<div>
               	 		
               	 		 Manifesta????es Hemorr??gicas?:  <font color="red">*</font>
                           		 <select name="hemorragica" required>
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragica == 1}">selected="selected"</c:if>>1 - Sim</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragica == 2}">selected="selected"</c:if>>2 - N??o</option>
										<option value="9" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragica == 9}">selected="selected"</c:if>>9 - Ignorado</option>
                         		 </select>
               	 		Se sim, quais?:  <font color="red">*</font>
                           		 <select name="hemorragicaLocal" required>
                           		 	<option value="">SELECIONE</option>
                           		 		<option value="8" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 8}">selected="selected"</c:if>>N??o</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 1}">selected="selected"</c:if>>Epistaxe </option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 2}">selected="selected"</c:if>>Gengivorragia </option>
										<option value="3" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 3}">selected="selected"</c:if>>Metrorragia </option>
										<option value="4" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 4}">selected="selected"</c:if>>Pet??quias</option>
										<option value="5" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 5}">selected="selected"</c:if>>Hemat??ria </option>
										<option value="6" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 6}">selected="selected"</c:if>>Sangramento Gastrointestinal</option> 
										<option value="7" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 7}">selected="selected"</c:if>>Prova do La??o Positiva</option>
										<option value="9" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hemorragicaLocal == 9}">selected="selected"</c:if>>Ignorado</option>
                        		 </select>
               	 		</div>
               	 		<br />
               	 		<div>
               	 		 Houve extravasamento plasm??tico? <font color="red">*</font>
                           		 <select name="extravasamentoPlasmatico" required>
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoPlasmatico == 1}">selected="selected"</c:if>>1 - Sim</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoPlasmatico == 2}">selected="selected"</c:if>>2 - N??o</option>
										<option value="9" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoPlasmatico == 9}">selected="selected"</c:if>>9 - Ignorado</option>
                         		 </select>
                      		Se sim, Evidenciado por:   
                           		 <select name="extravasamentoEvidenciado">
                           		 	<option value="">SELECIONE</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoEvidenciado == 1}">selected="selected"</c:if>>1 - Hemoconcentra????o</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoEvidenciado == 2}">selected="selected"</c:if>>2 - Derrames cavit??rios</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.extravasamentoEvidenciado == 3}">selected="selected"</c:if>>3 - Hipoproteinemia </option>
                        		 </select>
                   		 </div>
                   		 <br />
                   		 <div>
               	 		 Plaquetas (menor)
                           		 <input type="text" name="plaquetas" value="<c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.plaquetas}"></c:out>" />(mm3) 
                      		No Caso de FHD/SCD Especificar:
                      			 <select name="FHD_SCD">
                           		 	<option value="">SELECIONE</option>
										<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.FHD_SCD == 1}">selected="selected"</c:if>>1 - Grau I </option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.FHD_SCD == 2}">selected="selected"</c:if>>2 - Grau II </option>
										<option value="3" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.FHD_SCD == 3}">selected="selected"</c:if>>3 - Grau III </option>
										<option value="4" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.FHD_SCD == 4}">selected="selected"</c:if>>4 - Grau IV </option>
                        		 </select>
                   		 </div>
               	 		<br />
               	 		<div>
               	 		No Caso de Dengue com complica????es, que tipo de complica????es?
                           		 <select name="complicacoesTipo">
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 1}">selected="selected"</c:if>>1-Altera????es neurol??gicas</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 2}">selected="selected"</c:if>>2-Disfun????o cardiorrespirat??ria</option> 
										<option value="3" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 3}">selected="selected"</c:if>>3-Insufici??ncia hep??tica </option>
										<option value="4" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 4}">selected="selected"</c:if>>4-Plaquetas <20.000 mm3</option>
										<option value="5" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 5}">selected="selected"</c:if>>5-Hemorragia digestiva </option>
										<option value="6" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 6}">selected="selected"</c:if>>6-Derrames cavit??rios </option>
										<option value="7" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 7}">selected="selected"</c:if>>7-Leucometria < 1000 </option>
										<option value="8" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.complicacoesTipo == 8}">selected="selected"</c:if>>8-N??o se enquadra nos crit??rios de FHD</option>
                         		 </select>
                         </div>
                         <br />
               	 		<div>
               	 		 Ocorreu Hospitaliza????o?<font color="red">*</font>
                           		 <select name="ocorreuHospitalizacao" required>
                           		 	<option value="">SELECIONE</option>
		                           		<option value="1" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.ocorreuHospitalizacao == 1}">selected="selected"</c:if>>1 - Sim</option>
										<option value="2" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.ocorreuHospitalizacao == 2}">selected="selected"</c:if>>2 - N??o</option>
										<option value="9" <c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.ocorreuHospitalizacao == 9}">selected="selected"</c:if>>9 - Ignorado</option>
                         		 </select>
                         		 
                         		 <font face="Arial">
                            	Data da Interna????o:
                           		 <input size="13" id="inputDate" name="inputDate"  value="<c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.dataInternacaoFormatada}"></c:out>"  />
                            </font>
                         </div>
                         
                         <br />
                         <div>
                         
                          <div style="margin-right: 10px;  ">
                                	<font face="Arial">
                                		Local de Hospitaliza????o:
                                		<input id="autocomplete" name="autocomplete" size="50" value="<c:if test="${notificacaoInvestigativa.dadosClinicosComplicacoes.hospital != null}"><c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.hospital.nome_fantasia}"></c:out> - <c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.hospital.codigo_unidade}"></c:out></c:if>"    /> 
                               		</font>
                               		
                                </div>
                                
                         </div>
                         <br />
                         <div>
                         <font face="Arial">
                                		(DDD) Telefone Hospital
                                		<input id="telefoneHospital" name="telefoneHospital" size="15"  onkeypress="return isNumberKey(event)" value="<c:out value="${notificacaoInvestigativa.dadosClinicosComplicacoes.telefoneHospital}"></c:out>"  /> 
                               		</font>
                         </div>
                         <font color="red">*Campos Obrigat??rios</font>
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