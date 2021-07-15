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
              
	               	 <p id="titulo-verm" style="" align="left">::Notificação Individual - Idenficação Paciente</p>
               	 		 <form action="ficha.do" method="post">
               	  		 <input type="hidden" name="method" value="salvarIdentificacaoPaciente" />
               	  	
               	 		<div>Nome do Paciente:<font color="red">*</font> <b><input type="text" value="<c:out value="${notificacaoInvestigativa.paciente.nome}"></c:out>" style="width: 220px;" name="nome" required></input></b>
                            <font face="Arial">
                            	Data de Nascimento:<font color="red">*</font>
                           		 <input size="13" id="inputDate" name="inputDate" value="<c:out value="${notificacaoInvestigativa.paciente.dataNascimentoFormatada}"></c:out>"  required />
                            </font>
               	 		</div><br />
               	 		 <div>
                           		 (ou) Idade:  <input type="text" name="idade"  onkeypress="return isNumberKey(event)" value="<c:out value="${notificacaoInvestigativa.paciente.idade}"></c:out>" size="3"></input> 
                           		 <select name="idadeBebe" >
                           		 	<option value="">SELECIONE</option>
                           		 	<option value="1" <c:if test="${notificacaoInvestigativa.paciente.idadeBebe == 1}">selected="selected"</c:if>>1 - Hora</option>
									<option value="2" <c:if test="${notificacaoInvestigativa.paciente.idadeBebe == 2}">selected="selected"</c:if>>2 - Dia</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.paciente.idadeBebe == 3}">selected="selected"</c:if>>3 - Mês</option>
									<option value="4" <c:if test="${notificacaoInvestigativa.paciente.idadeBebe == 4}">selected="selected"</c:if>>4 - Ano</option>
                           		 </select>
                           		Sexo:  <font color="red">*</font>
                           		 <select name="sexo" required>
                           		 	<option value="">SELECIONE</option>
                           		 	<option value="M" <c:if test="${notificacaoInvestigativa.paciente.sexo == 'M'}">selected="selected"</c:if>>M - Masculino</option>
									<option value="F" <c:if test="${notificacaoInvestigativa.paciente.sexo == 'F'}">selected="selected"</c:if>>F - Feminino</option>
									<option value="I" <c:if test="${notificacaoInvestigativa.paciente.sexo == 'I'}">selected="selected"</c:if>>I - Ignorado</option>
                           		 </select>
                           		 Gestante:  <font color="red">*</font>
                           		 <select name="gestante" required>
                           		 	<option value="">SELECIONE</option>
                           		 	<option value="1" <c:if test="${notificacaoInvestigativa.paciente.gestante == 1}">selected="selected"</c:if>>1-1ºTrimestre</option>
									<option value="2" <c:if test="${notificacaoInvestigativa.paciente.gestante == 2}">selected="selected"</c:if>>2-2ºTrimestre</option>
									<option value="3" <c:if test="${notificacaoInvestigativa.paciente.gestante == 3}">selected="selected"</c:if>>3-3ºTrimestre</option>
									<option value="4" <c:if test="${notificacaoInvestigativa.paciente.gestante == 4}">selected="selected"</c:if>>4- Idade gestacional Ignorada</option>
									<option value="5" <c:if test="${notificacaoInvestigativa.paciente.gestante == 5}">selected="selected"</c:if>>5-Não </option>
									<option value="6" <c:if test="${notificacaoInvestigativa.paciente.gestante == 6}">selected="selected"</c:if>>6- Não se aplica</option>
									<option value="9" <c:if test="${notificacaoInvestigativa.paciente.gestante == 9}">selected="selected"</c:if>>9-Ignorado</option>
                           		 </select>
                          </div>
               	 		<br />
               	 		<div>
               	 		Raça/Cor:  <font color="red">*</font>
                   		 <select name="racaCor" required>
                   		 	<option value="">SELECIONE</option>
							<option value="1" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 1}">selected="selected"</c:if>>1-Branca</option> 
							<option value="2" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 2}">selected="selected"</c:if>>2-Preta</option> 
							<option value="3" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 3}">selected="selected"</c:if>>3-Amarela</option>
							<option value="4" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 4}">selected="selected"</c:if>>4-Parda</option> 
							<option value="5" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 5}">selected="selected"</c:if>>5-Indígena</option> 
							<option value="9" <c:if test="${notificacaoInvestigativa.paciente.racaCor == 9}">selected="selected"</c:if>>9-Ignorado</option>
                   		 </select>
                   		Escolaridade:  <font color="red">*</font>
                   		 <select name="escolaridade" required>
                   		 	<option value="">SELECIONE</option>
							<option value="0" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 0}">selected="selected"</c:if>>0-Analfabeto </option>
							<option value="1" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 1}">selected="selected"</c:if>>1-1ª a 4ª série incompleta do EF (antigo primário ou 1º grau)</option> 
							<option value="2" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 2}">selected="selected"</c:if>>2-4ª série completa do EF (antigo primário ou 1º grau)</option>
							<option value="3" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 3}">selected="selected"</c:if>>3-5ª à 8ª série incompleta do EF (antigo ginásio ou 1º grau) </option>
							<option value="4" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 4}">selected="selected"</c:if>>4-Ensino fundamental completo (antigo ginásio ou 1º grau) </option>
							<option value="5" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 5}">selected="selected"</c:if>>5-Ensino médio incompleto (antigo colegial ou 2º grau )</option>
							<option value="6" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 6}">selected="selected"</c:if>>6-Ensino médio completo (antigo colegial ou 2º grau ) </option>
							<option value="7" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 7}">selected="selected"</c:if>>7-Educação superior incompleta </option>
							<option value="8" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 8}">selected="selected"</c:if>>8-Educação superior completa </option>
							<option value="9" <c:if test="${notificacaoInvestigativa.paciente.escolaridade == 9}">selected="selected"</c:if>>9-Ignorado 10- Não se aplica</option>
                   		 </select>
               	 		</div>
               	 			<br />
						<div>
							Número do Cartão SUS: <input type="text"  onkeypress="return isNumberKey(event)" name="numeroCartaoSUS" value="<c:out value="${notificacaoInvestigativa.paciente.numeroCartaoSUS}"></c:out>" size="10"></input> 
							Nome da Mãe: <font color="red">*</font><input type="text" value="<c:out value="${notificacaoInvestigativa.paciente.nomeMae}"></c:out>" size="25" name="nomeMae" style="width: 300px;" required></input>
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