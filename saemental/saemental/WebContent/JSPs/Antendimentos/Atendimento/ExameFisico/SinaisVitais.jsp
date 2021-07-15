<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
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
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });

           
           </script>
        
        <script type="text/javascript">
        	
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		    //    	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Padrão</a>";
        	}
        </script>
			
			
		 
				  
				  
</head>
<body onload="navegacao();semQueixa();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1100px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1000px; display:inline-block;">
		 
		 
			<p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Padr&atilde;o</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
		<h:form action="sinaisVitais">
    	 		 <h:hidden property="method" value="sinaisVitaisSalvar"/>  
		 <div id="conteudoNormal" align="left" style="height:450px;">
		 
		  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 	<div class="titulo">Padr&atilde;o</div>
  					<div class="sessao"></div>
                        
                            Temperatura(ºC): <input type="text" size="3" name="temperatura" value="<c:out value="${exame.temperatura}"></c:out>" />
                            Local: 
                            <select name="tempLocal">
                            	 <option >Selecione...</option>
                                <option value="Oral"  <c:if test="${exame.temperaturaLocal == 'Oral'}">selected="selected"</c:if> >Oral</option>
                                <option value="Axilar"   <c:if test="${exame.temperaturaLocal == 'Axilar'}">selected="selected"</c:if> >Axilar</option>
                                <option value="Retal" <c:if test="${exame.temperaturaLocal == 'Retal'}">selected="selected"</c:if> >Retal</option>
                            </select>
                            Pulso: <input type="text" name="pulso" size="3" value="<c:out value="${exame.pulso}"></c:out>" />
                            Local: 
                            <select name="pulsoLocal">
                                <option value=""  >Selecione...</option>
                                <option value="Carótida" <c:if test="${exame.pulsoLocal == 'Carótida'}">selected="selected"</c:if> >Carot&iacute;deo</option>
                                <option value="Temporal" <c:if test="${exame.pulsoLocal == 'Temporal'}">selected="selected"</c:if> >Temporal</option>
                                <option value="Braquial" <c:if test="${exame.pulsoLocal == 'Braquial'}">selected="selected"</c:if> >Braquial</option>
                                <option value="Radial" <c:if test="${exame.pulsoLocal == 'Radial'}">selected="selected"</c:if>>Radial</option>
                                <option value="Femoral" <c:if test="${exame.pulsoLocal == 'Femoral'}">selected="selected"</c:if>>Femoral</option>
                                <option value="Poplíteo" <c:if test="${exame.pulsoLocal == 'Poplíteo'}">selected="selected"</c:if>>Popl&iacute;teo</option>
                                <option value="Pedioso" <c:if test="${exame.pulsoLocal == 'Pedioso'}">selected="selected"</c:if>>Pedioso</option>
                                <option value="Tibial posterior" <c:if test="${exame.pulsoLocal == 'Tibial posterior'}">selected="selected"</c:if>>Tibial posterior</option>
                            </select>
                            <br/>
                            <br/>
                            Frequ&ecirc;ncia card&iacute;aca(bpm): <input type="text" size="3" value="<c:out value="${exame.frequenciaCard}"></c:out>" name="freqCard" />
                            Padr&atilde;o: 
                            <select name="freqCardPadrao">
                            	<option value=""  >Selecione...</option>
                                <option value="Bradicárdico" <c:if test="${exame.frequenciaCardPadrao == 'Bradicárdico'}">selected="selected"</c:if>>Bradic&aacute;rdico</option>
                                <option value="Normocárdico"  <c:if test="${exame.frequenciaCardPadrao == 'Normocárdico'}">selected="selected"</c:if>>Normoc&aacute;rdico </option>
                                <option value="Taquicárdico" <c:if test="${exame.frequenciaCardPadrao == 'Taquicárdico'}">selected="selected"</c:if>>Taquic&aacute;rdico</option>
                            </select>
                            Press&atilde;o Arterial(mmHg): <input name="pressaoArt" type="text" size="5" value="<c:out value="${exame.pressaoArterial}"></c:out>" />
                            <br/><br/>
                            Local: 
                            <select name="pressaoLocal">
                            	<option value=""  >Selecione...</option>
                                <option value="MMSS"  <c:if test="${exame.pressaoArterialLocal == 'MMSS'}">selected="selected"</c:if>>MMSS</option>
                                <option value="MMII" <c:if test="${exame.pressaoArterialLocal == 'MMII'}">selected="selected"</c:if>>MMII</option>
                            </select>
                            Freqü&ecirc;ncia Respirat&oacute;ria(mpm): <input name="freqResp" type="text" size="3" value="<c:out value="${exame.frequenciaRespiratoria}"></c:out>" />
                            Padr&atilde;o: 
                            <select name="freqRespLocal">
                            	<option value=""  >Selecione...</option>
                                <option value="Eupnéico" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Eupnéico'}">selected="selected"</c:if>>Eupnéico</option>
                                <option value="Dispnéico" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Dispnéico'}">selected="selected"</c:if>>Dispnéico</option>
                                <option value="Taquipnéico" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Taquipnéico'}">selected="selected"</c:if>>Taquipnéico</option>
                                <option value="Bradipnéico" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Bradipnéico'}">selected="selected"</c:if>>Bradipnéico</option>
                                <option value="Ortopnéico" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Ortopnéico'}">selected="selected"</c:if>>Ortopnéico</option>
                                <option value="Outros" <c:if test="${exame.frequenciaRespiratoriaPadrao == 'Outros'}">selected="selected"</c:if> >Outros</option>
                            </select>
                            <br/>
                            <br/><br/><br/>
                            
                                <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                                 <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                   <br />   	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
                       </div>
                      </h:form>
				
				<!--   -->
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>