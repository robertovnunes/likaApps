<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head> 


			<script language="JavaScript" type="text/javascript" src="jscripts/jquery.js"></script>
		<%@ include file="/JSPs/inc_header.jsp"%>


		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
        
        
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        
			<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
	        </script>

        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
			
		
 		  <script type="text/javascript">
        	
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
        </script>
         <script type="text/javascript">
         function atualizarDroga(){
				if(document.getElementById('resumo').innerHTML == "<br>"){
					document.getElementById('resumo').innerHTML = "";
				}
				var selectEscolha = document.getElementById('escolhaDroga');
				var selectEscolhido = document.getElementById('escolhidosDroga');
				var jahEscolhido = '';
				if(selectEscolha.options[0].selected == false) {
					
					  for (var i=0; i < 17; i++) {
					      if (selectEscolha.options[i].selected == true) {
					    	  if(selectEscolha.options[i].style.color == 'red'){
					    		  jahEscolhido += selectEscolha.options[i].text+', ';
								}else{
								    var texto = selectEscolha.options[i].text;
								    selectEscolha.options[i].style.color = 'red';
								    selectEscolha.options[i].selected = false;
								    selectEscolhido.options[selectEscolhido.options.length] = new Option(texto, i);
								    document.getElementById('resumo').innerHTML += texto+"<br/>";
								}
					      }
					}
					if(jahEscolhido != ''){
						alert('Campo(s): '+jahEscolhido+' j?? adicionado(s)!');
					}
				
					
				}else {
				    window.alert("Selecione uma op????o 11");
				}
								
				selectEscolha.options[0].selected = true;
				
			}
         
         function atualizarDrogaLoad(){
				if(document.getElementById('resumo').innerHTML == "<br>"){
					document.getElementById('resumo').innerHTML = "";
				}
				var selectEscolha = document.getElementById('escolhaDroga');
				var selectEscolhido = document.getElementById('escolhidosDroga');
				var jahEscolhido = '';
				if(selectEscolha.options[0].selected == false) {
					
					  for (var i=0; i < 17; i++) {
					      if (selectEscolha.options[i].selected == true) {
					    	  if(selectEscolha.options[i].style.color == 'red'){
					    		  jahEscolhido += selectEscolha.options[i].text+', ';
								}else{
								    var texto = selectEscolha.options[i].text;
								    selectEscolha.options[i].style.color = 'red';
								    selectEscolha.options[i].selected = false;
								    selectEscolhido.options[selectEscolhido.options.length] = new Option(texto, i);
								    document.getElementById('resumo').innerHTML += texto+"<br/>";
								}
					      }
					}
					if(jahEscolhido != ''){
						alert('Campo(s): '+jahEscolhido+' j?? adicionado(s)!');
					}
				
					
				}else {
				   // window.alert("Selecione uma op????o 11");
				}
								
				selectEscolha.options[0].selected = true;
				
			}
         
			function addDroga(){
				if(document.getElementById('resumo').innerHTML == "<br>"){
					document.getElementById('resumo').innerHTML = "";
				}
				var selectEscolha = document.getElementById('escolhaDroga');
				var selectEscolhido = document.getElementById('escolhidosDroga');
				var jahEscolhido = '';
				if(selectEscolha.options[0].selected == false) {
					
					  for (var i=0; i < 17; i++) {
					      if (selectEscolha.options[i].selected == true) {
					    	  if(selectEscolha.options[i].style.color == 'red'){
					    		  jahEscolhido += selectEscolha.options[i].text+', ';
								}else{
								    var texto = selectEscolha.options[i].text;
								    selectEscolha.options[i].style.color = 'red';
								    selectEscolha.options[i].selected = false;
								    selectEscolhido.options[selectEscolhido.options.length] = new Option(texto, i);
								    document.getElementById('resumo').innerHTML += texto+"<br/>";
								    document.getElementById('escolhidosDrogaHidden').value += texto+";";	
								   
								}
					      }
					}
					if(jahEscolhido != ''){
						alert('Campo(s): '+jahEscolhido+' j?? adicionado(s)!');
					}
				
					
				}else {
				    window.alert("Selecione uma op????o");
				}
								
				selectEscolha.options[0].selected = true;
				
			}

			function escolheuSim(id){
				var textbox = document.getElementById(id);
				textbox.value = "";
				textbox.disabled = false;
				
            }
            function escolheuNao(id){
				var textbox = document.getElementById(id);
				textbox.value = "N??o";
				textbox.disabled = false;
            }

			function addOutas(){
				var texto = document.getElementById('outras').value;
				if(texto != ''){
					var selectEscolhido = document.getElementById('escolhidosDroga');
					var indexUltimo = selectEscolhido.options.length;
					var jahInseriu = false;
					for (i = indexUltimo-1; i > 0; i--) {
						  if(selectEscolhido.options[i].value == texto){
							  jahInseriu = true;
							  alert('Comorbidade j?? adicionada');
						   }
				   }
					if(jahInseriu == false){
					 	selectEscolhido.options[selectEscolhido.options.length] = new Option(texto);
					 	document.getElementById('resumo').innerHTML += texto+"<br/>";
					 	 document.getElementById('escolhidosDrogaHidden').value += texto+";";	
						    
					}
				}else{
					alert('Campo Outras esta vazio!');
				}
			}


			function removerDroga(){
				var selectEscolha = document.getElementById('escolhaDroga');
				var selectEscolhido = document.getElementById('escolhidosDroga');
				document.getElementById('resumo').innerHTML = "";
				document.getElementById('escolhidosDrogaHidden').value = "";	
				    
				var indexUltimo = selectEscolhido.options.length;
				var selecionados = new Array();
				if(selectEscolhido.options[0].selected == false) {
					  for (i = indexUltimo-1; i > 0; i--) {
						  if(selectEscolhido.options[i].selected == true){
							  var indexEscolha = selectEscolhido.options[i].value;

							  if(indexEscolha != selectEscolhido.options[i].text){
								  selectEscolha.options[indexEscolha].style.color = 'black';
							  }

							  selectEscolhido.options[i] = selectEscolhido.options[indexUltimo];
							  selectEscolhido.optionslength = indexUltimo - 1;
						   }else{
							   var texto = selectEscolhido.options[i].text;
							   document.getElementById('resumo').innerHTML += texto+"<br/>";
							   document.getElementById('escolhidosDrogaHidden').value += texto+";";	
							    
						   }
					  }
				}else {
				    window.alert("Selecione uma op????o");
				}
				
				selectEscolhido.options[0].selected = true;

				if(document.getElementById('resumo').innerHTML == ""){
					document.getElementById('resumo').innerHTML = "<br>";
					}
			}
		</script>
        <script type="text/javascript">
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });

            function atualizarAntecedente(){
            	var selectEscolha = document.getElementById('escolhaCaracteristicas');
				var selectEscolhido = document.getElementById('escolhidosCaracteristicas');
				var jahEscolhido = '';
			
				if(selectEscolha.options[0].selected == false) {
					
					  for (var i=0; i < 19; i++) {
					      if (selectEscolha.options[i].selected == true) {
					    	  if(selectEscolha.options[i].style.color == 'red'){
					    		  jahEscolhido += selectEscolha.options[i].text+', ';
								}else{
								    var texto = selectEscolha.options[i].text;
								    selectEscolha.options[i].style.color = 'red';
								    selectEscolha.options[i].selected = false;
								    selectEscolhido.options[selectEscolhido.options.length] = new Option(texto, i);
								    document.getElementById('resumoPsiquica').innerHTML += texto+"<br/>";
								}
					      }
					}
					if(jahEscolhido != ''){
						alert('Campo(s): '+jahEscolhido+' j?? adicionado(s)!');
					}
				
					
				}else {
				    window.alert("Selecione uma op????o");
				}
								
				selectEscolha.options[0].selected = true;
            }

			function addAntecedente(){
				var selectEscolha = document.getElementById('escolhaCaracteristicas');
				var selectEscolhido = document.getElementById('escolhidosCaracteristicas');
				var jahEscolhido = '';
			
				if(selectEscolha.options[0].selected == false) {
					
					  for (var i=0; i < 19; i++) {
					      if (selectEscolha.options[i].selected == true) {
					    	  if(selectEscolha.options[i].style.color == 'red'){
					    		  jahEscolhido += selectEscolha.options[i].text+', ';
								}else{
								    var texto = selectEscolha.options[i].text;
								    selectEscolha.options[i].style.color = 'red';
								    selectEscolha.options[i].selected = false;
								    selectEscolhido.options[selectEscolhido.options.length] = new Option(texto, i);
								    document.getElementById('resumoPsiquica').innerHTML += texto+"<br/>";
								    document.getElementById('escolhidosCaractComport').value += texto+";";					
								    
								}
					      }
					}
					if(jahEscolhido != ''){
						alert('Campo(s): '+jahEscolhido+' j?? adicionado(s)!');
					}
				
					
				}else {
				    window.alert("Selecione uma op????o");
				}
								
				selectEscolha.options[0].selected = true;
				
			}

			function removerAntecedente(){
				var selectEscolha = document.getElementById('escolhaCaracteristicas');
				var selectEscolhido = document.getElementById('escolhidosCaracteristicas');
				document.getElementById('resumoPsiquica').innerHTML = "";
				document.getElementById('escolhidosCaractComport').value = "";

				var indexUltimo = selectEscolhido.options.length;
				var selecionados = new Array();
				if(selectEscolhido.options[0].selected == false) {
					  for (i = indexUltimo-1; i > 0; i--) {
						  if(selectEscolhido.options[i].selected == true){
							  var indexEscolha = selectEscolhido.options[i].value;

							  if(indexEscolha != selectEscolhido.options[i].text){
								  selectEscolha.options[indexEscolha].style.color = 'black';
							  }

							  selectEscolhido.options[i] = selectEscolhido.options[indexUltimo];
							  selectEscolhido.optionslength = indexUltimo - 1;
						   }else{
							   var texto = selectEscolhido.options[i].text;
							   document.getElementById('resumoPsiquica').innerHTML += texto+"<br/>";
							   document.getElementById('escolhidosCaractComport').value += texto+";";
						   }
					  }
				}else {
				    window.alert("Selecione uma op????o");
				}
				
				selectEscolhido.options[0].selected = true;
			}

			function addOutasAntecedentes(){
				var texto = document.getElementById('habitos').value;
				if(texto != ''){
					var selectEscolhido = document.getElementById('escolhidosCaracteristicas');
					var indexUltimo = selectEscolhido.options.length;
					var jahInseriu = false;
					for (i = indexUltimo-1; i > 0; i--) {
						  if(selectEscolhido.options[i].value == texto){
							  jahInseriu = true;
							  alert('Antecedente j?? adicionada');
						   }
				   }
					if(jahInseriu == false){
					 	selectEscolhido.options[selectEscolhido.options.length] = new Option(texto);
					    document.getElementById('resumoPsiquica').innerHTML += texto+"<br/>";
					    document.getElementById('escolhidosCaractComport').value += texto+";";
					}
				}else{
					alert('Campo Outras esta vazio!');
				}
			}

			function gravidezEscolheu(){
				document.getElementById('resumoGravidez').innerHTML = document.formAntecedentes.gravidez.value;
		    }
		    
			function partoEscolheu(){
				document.getElementById('resumoParto').innerHTML = document.formAntecedentes.parto.value;
		    }
		</script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        	//var div = window.top.document.getElementById('dadosPaciente');
		       // 	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>/saemental'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Antecedentes Pessoais</a>";
        	}
        </script>
			
			
		 
				  
				  
</head>
<body onload="navegacao();atualizarAntecedente();atualizarDrogaLoad();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:3300px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:3000px; display:inline-block;">
		 
		 
		 <h:form action="antPessoais">
    	  <h:hidden property="method" value="antPessoaisSalvar"/>     
		 <div id="conteudoNormal" align="left" style="height:2500px; ">
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:3000px;"></div>	
</c:if>    	 
		 			<c:set var="antecedentes" value="${atendimento.antecedentes.antecedentesPessoais}"></c:set>
					<p id="titulo-verm" style='' align="left">::Antecedentes Pessoais</p>
  					<div class="sessao">
  					 <div id="erroMsg">
		               <font color="red"> <h:errors/></font>
		               <font color="red"> 
		              		${mensagem}
						</font>
		            </div>
			 		<table border="1px">
			 			<tr>
			 				<th  style="width:300px;">
			 					Caracter&iacute;sticas Comportamentais
			 				</th>
			 			</tr>
			 			<tr>
			 				<td id="resumoPsiquica">
			 					<c:forEach items="${caracteristicas}" var="caracteristica" varStatus="index">
									<c:set var="contemSubString" value="${fn:contains('Agressividade;Bulimia nervosa;Delinqu??ncia;Desanten????o;Disfemia;Destrutividade;Emtartamudez;Encoprese funcional;Enurese funcional;H??bitos an??nimos de consumo de alimentos;Identidade sexual conflituoso;Impulsividade;Inani????o;Medos neo-realistas;Tiques;Negatividade;Chorosa(o);Ansiedade Cr??nica;' , caracteristica)}"></c:set>
									<c:if test="${contemSubString == false}">
											<c:out value="${caracteristica}"></c:out><br />
									</c:if>
								</c:forEach>	
			 				</td>
			 			</tr>
			 		</table>
			 		<br/>
			 		<br/>
					<div class="titulo">Caracter&iacute;sticas Comportamentais</div>
  					<div class="sessao">
						<br /><br />
						<table align="center">
						<tr>
							<td>
								<select name="escolhaCaracteristicas" id="escolhaCaracteristicas" size="10" style="width:300px" multiple="multiple">
									<option disabled="disabled">Selecione...</option>
									
									<c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Agressividade')}"></c:set>
							        <option value="Agressividade" <c:if test="${contemSubString == true}">selected="selected" </c:if> >Agressividade</option>
							        
					         		<c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Ansiedade Cr??nica')}"></c:set>	
							        <option value="Ansiedade Cr??nica" <c:if test="${contemSubString == true}">selected="selected" </c:if>>Ansiedade Cr??nica</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Bulimia nervosa')}"></c:set>
							        <option value="Bulimia nervosa"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Bulimia nervosa</option>
							       
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Chorosa(o)')}"></c:set>
							        <option value="Chorosa(o)" <c:if test="${contemSubString == true}">selected="selected" </c:if> >Chorosa(o)</option>
							       
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Delinqu??ncia')}"></c:set>
							        <option value="Delinqu??ncia"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Delinqu&ecirc;ncia</option>
							       
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Desanten????o')}"></c:set>
							        <option value="Desanten????o"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Desanten&ccedil;&atilde;o</option>
							       
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Disfemia')}"></c:set>
							        <option value="Disfemia"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Disfemia</option>
							       
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Destrutividade')}"></c:set>
									<option value="Destrutividade"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Destrutividade</option>
									
									<c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Emtartamudez')}"></c:set>
							        <option value="Emtartamudez"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Emtartamudez</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Encoprese funcional')}"></c:set>
							        <option value="Encoprese funcional"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Encoprese funcional</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Enurese funcional')}"></c:set>
							        <option value="Enurese funcional"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Enurese funcional</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'H??bitos an??nimos de consumo de alimentos')}"></c:set>
							        <option value="H??bitos an??nimos de consumo de alimentos"<c:if test="${contemSubString == true}">selected="selected" </c:if> >H&aacute;bitos an??nimos de consumo de alimentos</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Identidade sexual conflituoso')}"></c:set>
							        <option value="Identidade sexual conflituoso"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Identidade sexual conflituoso</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Impulsividade')}"></c:set>
							        <option value="Impulsividade"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Impulsividade </option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Inani????o')}"></c:set>
							        <option value="Inani????o"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Inani&ccedil;&atilde;o</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Medos neo-realistas')}"></c:set>
							        <option value="Medos neo-realistas"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Medos neo-realistas</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Negatividade')}"></c:set>
							        <option value="Negatividade" <c:if test="${contemSubString == true}">selected="selected" </c:if> >Negatividade</option>
							        
							        <c:set var="contemSubString" value="${fn:contains(antecedentes.caracteristicasComportamentais , 'Tiques')}"></c:set>
							        <option value="Tiques"<c:if test="${contemSubString == true}">selected="selected" </c:if> >Tiques</option>
							      
						        </select>
							</td>
							<td>
								<input type="button" value="Adicionar" onclick="addAntecedente();"/>
								<br />	
								<input type="button" value="Remover" onclick="removerAntecedente();"/>
							</td>
							<td>
								<select name="escolhidosCaracteristicas" id="escolhidosCaracteristicas" style="width:300px" size="10" multiple="multiple">
							    	<option selected="selected" disabled="disabled">Selecione...</option>

									<c:forEach items="${caracteristicas}" var="caracteristica" varStatus="index">
										<c:set var="contemSubString" value="${fn:contains('Agressividade;Bulimia nervosa;Delinqu??ncia;Desanten????o;Disfemia;Destrutividade;Emtartamudez;Encoprese funcional;Enurese funcional;H??bitos an??nimos de consumo de alimentos;Identidade sexual conflituoso;Impulsividade;Inani????o;Medos neo-realistas;Tiques;Negatividade;Chorosa(o);Ansiedade Cr??nica;' , caracteristica)}"></c:set>
										<c:if test="${contemSubString == false}">
											<option><c:out value="${caracteristica}"></c:out></option>
										</c:if>
									</c:forEach>		      
							    </select>
							    <input type="hidden" name="escolhidosCaractComport" id="escolhidosCaractComport" value="<c:out value="${antecedentes.caracteristicasComportamentais}"></c:out>" />
							</td>
						</tr>
							<tr>
	                        	<td colspan="3" align="left">
	                        		<br />
	                               Outras caracter&iacute;sticas
	                               <input name="habitos" id="habitos" type="text" size="30" />
	                               <input type="button" value="Adicionar" onclick="addOutasAntecedentes();"/>
	                            </td>
	                        </tr>
						</table>
						<br/>
					</div>
					<br /><br />
					
					<div id="Marcos">
						<div class="titulo">Gravidez/Parto</div>
						<div class="sessao">
						<table>
							<tr>
								<td>
	                               Tipo da Gravidez
	                            </td>
	                            <td>
	                               <select name="gravidez" onchange="gravidezEscolheu();">
									<option disabled="disabled">Selecione...</option>
									<option value="Planejada" <c:if test="${antecedentes.gravidez == 'Planejada'}">selected="selected"</c:if>>Planejada</option>
									<option value="N??o Planejada" <c:if test="${antecedentes.gravidez == 'N??o Planejada'}">selected="selected"</c:if>>N&atilde;o Planejada</option>
								</select>
	                    	 </td>
	                       </tr>
							<tr>
	                        	<td>
	                               Parto
	                            </td>
	                            <td>
				                     <select name="parto" onchange="partoEscolheu();">
										<option disabled="disabled" selected="selected">Selecione...</option>
										<option value="Vaginal" <c:if test="${antecedentes.parto == 'Vaginal'}">selected="selected"</c:if>>Vaginal</option>
										<option value="Vaginal com f??cerps" <c:if test="${antecedentes.parto == 'Vaginal com f??cerps'}">selected="selected"</c:if>>Vaginal com f&oacute;rceps</option>
										<option value="Ces??rea" <c:if test="${antecedentes.parto == 'Ces??rea'}">selected="selected"</c:if>>Ces&aacute;rea</option>
									</select>
								</td>
	                        </tr>
	                       </table>
	                       </div>
					</div>
					                 	
                 	<div class="titulo">Historico Obst??trico</div>
  					<div class="sessao">
                    <table>
						<tr>
							<td colspan="5">
								O indiv&iacute;duo apresentou alguma Altera&ccedil;&atilde;o:								
							</td>
						</tr>
						<tr>
							<td>
								Motora
							</td>
							<td>
								<label>Sim <input onclick="escolheuSim('tbqualMotora');" type="radio" id="simMotora" name="motora" <c:if test="${antecedentes.histObs_motora != 'N??o' && antecedentes.histObs_motora != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input onclick="escolheuNao('tbqualMotora');" type="radio" id="naoMotora" name="motora" <c:if test="${antecedentes.histObs_motora == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_motora == 'N??o'}">disabled="disabled"</c:if> id="tbqualMotora" name="tbqualMotora" value="<c:out value="${antecedentes.histObs_motora}"></c:out>" />
							</td>
						</tr>
						<tr>
							<td>
								Linguagem
							</td>
							<td>
								<label>Sim <input type="radio" onclick="escolheuSim('tbqualLinguagem');"  id="naoMotora" name="linguage" <c:if test="${antecedentes.histObs_linguagem != 'N??o' && antecedentes.histObs_linguagem != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualLinguagem');"  name="linguage" <c:if test="${antecedentes.histObs_linguagem == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_linguagem == 'N??o'}">disabled="disabled"</c:if> id="tbqualLinguagem" name="tbqualLinguagem" value="<c:out value="${antecedentes.histObs_linguagem}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td>
								Vis&atilde;o
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualVisao');"  name="visao" <c:if test="${antecedentes.histObs_visao != 'N??o' && antecedentes.histObs_visao != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualVisao');"  name="visao" <c:if test="${antecedentes.histObs_visao == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_visao == 'N??o'}">disabled="disabled"</c:if> id="tbqualVisao" name="tbqualVisao" value="<c:out value="${antecedentes.histObs_visao}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td>
								Audi&ccedil;&atilde;o
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualAudicao');"  name="audicao" <c:if test="${antecedentes.histObs_audicao != 'N??o' && antecedentes.histObs_audicao != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualAudicao');"  name="audicao" <c:if test="${antecedentes.histObs_audicao == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_audicao == 'N??o'}">disabled="disabled"</c:if> id="tbqualAudicao" name="tbqualAudicao" value="<c:out value="${antecedentes.histObs_audicao}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td>
								Paladar
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualPaladar');"  name="paladar" <c:if test="${antecedentes.histObs_paladar != 'N??o' && antecedentes.histObs_paladar != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualPaladar');"  name="paladar" <c:if test="${antecedentes.histObs_paladar == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_paladar == 'N??o'}">disabled="disabled"</c:if> id="tbqualPaladar" name="tbqualPaladar" value="<c:out value="${antecedentes.histObs_paladar}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td>
								Olfato
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualOlfato');"  name="olfato" <c:if test="${antecedentes.histObs_olfato != 'N??o' && antecedentes.histObs_olfato != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualOlfato');"  name="olfato" <c:if test="${antecedentes.histObs_olfato == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" <c:if test="${antecedentes.histObs_olfato == 'N??o'}">disabled="disabled"</c:if> id="tbqualOlfato" name="tbqualOlfato" value="<c:out value="${antecedentes.histObs_olfato}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td>
								Tato
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualTato');"  name="tato" <c:if test="${antecedentes.histObs_tato != 'N??o' && antecedentes.histObs_tato != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualTato');"  name="tato" <c:if test="${antecedentes.histObs_tato == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15"  <c:if test="${antecedentes.histObs_tato == 'N??o'}">disabled="disabled"</c:if> id="tbqualTato" name="tbqualTato" value="<c:out value="${antecedentes.histObs_tato}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br /><br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								 Em rela&ccedil;&atilde;o ao comportamento, se apresentava:								
							</td>
						</tr>
						<tr>
							<td>
								Ativo
							</td>
							<td>
								<label>Sim <input type="radio" id="simMotora" <c:if test="${antecedentes.histObs_ativo == 'simAtivo'}">checked="checked"</c:if> name="ativo" value="simAtivo"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" <c:if test="${antecedentes.histObs_ativo == 'naoAtivo'}">checked="checked"</c:if> id="naoMotora" name="ativo" value="naoAtivo"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								T&iacute;mido
							</td>
							<td>
								<label>Sim <input type="radio" id="simTimido" <c:if test="${antecedentes.histObs_timido == 'simTimido'}">checked="checked"</c:if> name="timido" value="simTimido"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" <c:if test="${antecedentes.histObs_timido == 'naoTimido'}">checked="checked"</c:if> id="naoTimido" name="timido" value="naoTimido"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Impaciente/Irritado
							</td>
							<td>
								<label>Sim <input type="radio" id="simImaciente" <c:if test="${antecedentes.histObs_impaciente == 'simImpaciente'}">checked="checked"</c:if> value="simImpaciente" name="impaciente"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoImpaciente" <c:if test="${antecedentes.histObs_impaciente == 'naoImpaciente'}">checked="checked"</c:if> value="naoImpaciente" name="impaciente"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Agressivo
							</td>
							<td>
								<label>Sim <input type="radio" id="simAgressivo" value="simAgressivo"  <c:if test="${antecedentes.histObs_agressivo == 'simAgressivo'}">checked="checked"</c:if> name="agressivo"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoAgressivo" value="naoAgressivo" <c:if test="${antecedentes.histObs_agressivo == 'naoAgressivo'}">checked="checked"</c:if> name="agressivo"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Distra&iacute;do
							</td>
							<td>
								<label>Sim <input type="radio" id="simDistraido" value="simDistraido" <c:if test="${antecedentes.histObs_distraido == 'simDistraido'}">checked="checked"</c:if> name="distraido"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoDistraido" value="naoDistraido" <c:if test="${antecedentes.histObs_distraido == 'naoDistraido'}">checked="checked"</c:if> name="distraido"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Inseguro/Medroso
							</td>
							<td>
								<label>Sim <input type="radio" id="simInseguro" <c:if test="${antecedentes.histObs_inseguro == 'simInseguro'}">checked="checked"</c:if>  value="simInseguro" name="inseguro"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoInseguro" value="naoInseguro" <c:if test="${antecedentes.histObs_inseguro == 'naoInseguro'}">checked="checked"</c:if>  name="inseguro"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Choro excessivo 
							</td>
							<td>
								<label>Sim<input type="radio" id="simChoro" value="simChoro" <c:if test="${antecedentes.histObs_choro == 'simChoro'}">checked="checked"</c:if> name="chorava"/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoChoro" value="naoChoro" <c:if test="${antecedentes.histObs_choro == 'naoChoro'}">checked="checked"</c:if> name="chorava"/></label> 
							</td>	
						</tr>
						<tr>
							<td>
								Outros
							</td>
							<td>
								<label>Sim <input type="radio" id="naoMotora" onclick="escolheuSim('tbqualOutros');"  name="outros"  <c:if test="${antecedentes.histObs_outros != 'N??o' && antecedentes.histObs_outros != null}">checked="checked"</c:if>/></label> 
							</td>
							<td>
								<label>N&atilde;o <input type="radio" id="naoMotora" onclick="escolheuNao('tbqualOutros');"  name="outros" <c:if test="${antecedentes.histObs_outros == 'N??o'}">checked="checked"</c:if>/></label> 
							</td>	
							<td>
								Qual: <input type="text" size="15" disabled="disabled" id="tbqualOutros" name="tbqualOutros" value="<c:out value="${antecedentes.histObs_outros}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br /><br />
							</td>
						</tr>
						</table>
						</div>
						<div class="titulo">Adolesc&ecirc;ncia</div>
  						<div class="sessao">
						<table>
						<tr>
							<td colspan="15">
								Idade da Puberdade(anos)
								<input type="text" size="5" name="puberdade" value="<c:out value="${antecedentes.adolescencia_puberdade}"></c:out>"/>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Relacionamento com outros adolescentes
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Bom <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoOutros == 'Bom'}">checked="checked"</c:if> name="relacionamentoAdolecentes" value="Bom"/></label>
								<label>Regular <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoOutros == 'Regular'}">checked="checked"</c:if> name="relacionamentoAdolecentes" value="Regular"/></label>
								<label>P??ssimo <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoOutros == 'P??ssimo'}">checked="checked"</c:if> name="relacionamentoAdolecentes" value="P??ssimo"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Grau de ansiedade
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Tende a reprimir a ansiedade <input type="radio" <c:if test="${antecedentes.adolescencia_ansiedade == 'Tende a reprimir a ansiedade'}">checked="checked"</c:if>  name="grauAnsiedade" value="Tende a reprimir a ansiedade"/></label>
								<label>Moderado <input type="radio" <c:if test="${antecedentes.adolescencia_ansiedade == 'Moderado'}">checked="checked"</c:if>  name="grauAnsiedade" value="Moderado"/></label>
								<label>Alto <input type="radio" name="grauAnsiedade" <c:if test="${antecedentes.adolescencia_ansiedade == 'Alto'}">checked="checked"</c:if>  value="Alto"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Relacionamento com os pais
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Afetuosa/Respeitosa <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoPais == 'Afetuosa/Respeitosa'}">checked="checked"</c:if>  name="relacPais" value="Afetuosa/Respeitosa"/></label>
								<label>Tenta se manter distante <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoPais == 'Tenta se manter distante'}">checked="checked"</c:if>  name="relacPais" value="Tenta se manter distante"/></label>
								<label>Arredia <input type="radio" <c:if test="${antecedentes.adolescencia_relacionamentoPais == 'Arredia'}">checked="checked"</c:if>  name="relacPais" value="Arredia"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Relacionamento com outras autoridades
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Bom <input type="radio" <c:if test="${antecedentes.adolescencia_autoridades == 'Bom'}">checked="checked"</c:if>  name="relacAutoridades" value="Bom"/></label>
								<label>Regular <input type="radio" <c:if test="${antecedentes.adolescencia_autoridades == 'Regular'}">checked="checked"</c:if>  name="relacAutoridades" value="Regular"/></label>
								<label>P??ssima <input type="radio" <c:if test="${antecedentes.adolescencia_autoridades == 'P??ssima'}">checked="checked"</c:if>  name="relacAutoridades" value="P??ssima"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Grau de auto-estima
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Baixa(Facilmente afetado por outros) <input type="radio"  <c:if test="${antecedentes.adolescencia_autoestima == 'Baixa(Facilmente afetado por outros)'}">checked="checked"</c:if> name="autoEstima" value="Baixa(Facilmente afetado por outros)"/></label>
								<label>Normal (Sabe das suas potencialidades) <input type="radio" name="autoEstima" <c:if test="${antecedentes.adolescencia_autoestima == 'Normal (Sabe das suas potencialidades)'}">checked="checked"</c:if> value="Normal (Sabe das suas potencialidades)"/></label>
								<label>Alta <input type="radio" name="autoEstima" value="Alta" <c:if test="${antecedentes.adolescencia_autoestima == 'Alta'}">checked="checked"</c:if>/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Depend&ecirc;ncia de outros
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Muito dependente <input type="radio" name="dependencia" <c:if test="${antecedentes.adolescencia_dependencia == 'Muito dependente'}">checked="checked"</c:if> value="Muito dependente"/></label>
								<label>Dependente <input type="radio" name="dependencia" <c:if test="${antecedentes.adolescencia_dependencia == 'Dependente'}">checked="checked"</c:if> value="Dependente"/></label>
								<label>Autodirigido <input type="radio" <c:if test="${antecedentes.adolescencia_dependencia == 'Autodirigido'}">checked="checked"</c:if> name="dependencia" value="Autodirigido"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Em rela&ccedil;&atilde;o ??s notas escolares							
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>&Oacute;timas <input type="radio" name="notasAdolec" <c:if test="${antecedentes.adolescencia_notas == '??timas'}">checked="checked"</c:if> value="??timas"/></label>
								<label>Boas <input type="radio" name="notasAdolec" value="Boas" <c:if test="${antecedentes.adolescencia_notas == 'Boas'}">checked="checked"</c:if> /></label>
								<label>Regulares <input type="radio" name="notasAdolec" value="Regulares" <c:if test="${antecedentes.adolescencia_notas == 'Regulares'}">checked="checked"</c:if>/></label>
								<label>Ruins <input type="radio" name="notasAdolec" value="Ruins" <c:if test="${antecedentes.adolescencia_notas == 'Ruins'}">checked="checked"</c:if>/></label>
								<label>P??ssimas <input type="radio" name="notasAdolec" value="P??ssimas" <c:if test="${antecedentes.adolescencia_notas == 'P??ssimas'}">checked="checked"</c:if>/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br /><br />
							</td>
						</tr>
						</table>
						</div>
						<div class="titulo">Idade Adulta</div>
  						<div class="sessao">
						<table>
						<tr>
							<td>
								Idade de in&iacute;cio da vida sexual(anos)
								<input type="text" size="5" value="<c:out value="${antecedentes.adulto_vidasexual}"></c:out>" name="idadeSexualVidaSexual" />
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								Orienta&ccedil;&atilde;o sexual
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea id="orientacaoSexual" name="orientacaoSexual" rows="5" cols="20" style="width: 400px;">
										 <c:out value="${antecedentes.adulto_orientacaosexual}"></c:out>				
                   				 </textarea>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br />
							</td>
						</tr>
						
						<tr>
							<td colspan="5">
								Uso de subst??ncias il&iacute;citas
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<label>Sim <input id="drogasSim" type="radio" name="usoDrogas"  <c:if test="${antecedentes.adulto_usoDeSubstanciasIlicitas == 'drogasSim'}">checked="checked"</c:if>  value="drogasSim" /></label>
								<label>N&atilde;o <input id="drogasNao" type="radio" <c:if test="${antecedentes.adulto_usoDeSubstanciasIlicitas == null or antecedentes.adulto_usoDeSubstanciasIlicitas == 'drogasNao'}">checked="checked"</c:if> name="usoDrogas" value="drogasNao"/></label>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<table border="1px">
						 			<tr>
						 				<th  style="width:300px;background-color: #BCD2E6;">
						 					Subst??ncias Selecionadas
						 				</th>
						 			</tr>
						 			<tr>
						 				<td id="resumo">
						 					<c:forEach items="${substanciasIlicitas}" var="substancia" varStatus="index">
													<c:set var="contemSubString" value="${fn:contains('Maconha;Hero??na;Crack;Coca??na;Ecstasy;Anfetamina;Solventes;Barbit??ricos;LSD;??pio;Cogumelos Alucin??genos;' , substancia)}"></c:set>
													<c:if test="${contemSubString == false}">
															<c:out value="${substancia}"></c:out><br />
													</c:if>
											</c:forEach>
						 				</td>
						 			</tr>
						 		</table>
								<table class="mytable" align="center">
									<tr>
				                     		<td>
											<select name="escolhaDroga" id="escolhaDroga" size="10" style="width:300px" multiple="multiple">
												<option <c:if test="${antecedentes.adulto_substanciasIlicitasSelecionadas == ''}">selected="selected"</c:if> disabled="disabled">Selecione...</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Maconha')}"></c:set>
										        <option value="Maconha" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Maconha </option>
										        
										        <c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Hero??na')}"></c:set>
												<option value="Hero??na" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Hero&iacute;na</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Crack')}"></c:set>
												<option value="Crack" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Crack</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Coca??na')}"></c:set>
												<option value="Coca??na" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Coca&iacute;na</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Ecstasy')}"></c:set>
												<option value="Ecstasy" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Ecstasy</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Anfetamina')}"></c:set>
												<option value="Anfetamina" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Anfetamina</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Solventes')}"></c:set>
												<option value="Solventes" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Solventes</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Barbit??ricos')}"></c:set>
												<option value="Barbit??ricos" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Barbit??ricos</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'LSD')}"></c:set>
												<option value="LSD" <c:if test="${contemSubString == true}">selected="selected"</c:if>>LSD</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , '??pio')}"></c:set>
												<option value="??pio" <c:if test="${contemSubString == true}">selected="selected"</c:if>>&Oacute;pio</option>
												
												<c:set var="contemSubString" value="${fn:contains(antecedentes.adulto_substanciasIlicitasSelecionadas , 'Cogumelos Alucin??genos')}"></c:set>
												<option value="Cogumelos Alucin??genos" <c:if test="${contemSubString == true}">selected="selected"</c:if>>Cogumelos Alucin&oacute;genos</option>
										    </select>
										</td>
										<td>
											<input type="button" value="Adicionar" onclick="addDroga();"/>
											<br />	
											<input type="button" value="Remover" onclick="removerDroga();"/>
										</td>
										<td>
											<select name="escolhidosDroga" id="escolhidosDroga" style="width:300px" size="10" multiple="multiple">
										    	<option selected="selected" disabled="disabled">Selecione...</option>
										    	
										    	<c:forEach items="${substanciasIlicitas}" var="substancia" varStatus="index">
													<c:set var="contemSubString" value="${fn:contains('Maconha;Hero??na;Crack;Coca??na;Ecstasy;Anfetamina;Solventes;Barbit??ricos;LSD;??pio;Cogumelos Alucin??genos;' , substancia)}"></c:set>
													<c:if test="${contemSubString == false}">
															<option><c:out value="${substancia}"></c:out></option>
													</c:if>
												</c:forEach>	
										    </select>
										    <input type="hidden" name="escolhidosDrogaHidden" id="escolhidosDrogaHidden" value="<c:out value="${antecedentes.adulto_substanciasIlicitasSelecionadas}"></c:out>" />
										</td>
									</tr>
									<tr>
										<td colspan="4">
											Outras
			                              <input type="text" id="outras" name="outras" size="30" />
			                              <input type="button" value="Adicionar" onclick="addOutas();"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<br /><br />
							</td>
						</tr>
					</table>
					
					</div>
					<br /><br />
					<div class="titulo">Outras informa&ccedil;&otilde;es</div>
  					<div class="sessao">
	                        <textarea id="antecPessoaisOutrasInfo" name="antecPessoaisOutrasInfo" rows="5" cols="20" style="width: 400px;">
	                        	 <c:out value="${antecedentes.outrasInformacoes}"></c:out>	
                   			</textarea>
					</div>
						<br /><br /><br />
						 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
						<div>
							<input type="submit" name="save" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
							<input type="reset" name="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
					<br />	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
						</div>
				</div>
				</div>
		</h:form>
		 
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>