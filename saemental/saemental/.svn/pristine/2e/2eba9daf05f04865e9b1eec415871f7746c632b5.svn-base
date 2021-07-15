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
 	function semQueixa(){
		var check = document.getElementById("semqueixa").checked;
		if(check == true){
			document.getElementById("exame").style.opacity = "0.7";
			document.getElementById("exame").style.filter = "alpha(opacity=70)";
			document.form.mastite.disabled = "disabled";
			document.form.nodulacao.disabled = "disabled";
			document.form.displasia.disabled = "disabled";
			document.form.deformidade.disabled = "disabled";
			document.form.neoplasias.disabled = "disabled";
			document.form.ginecomastia.disabled = "disabled";
			document.form.outros.disabled = "disabled";
			document.getElementById("colostroSim").disabled = "disabled";
			document.getElementById("colostroNao").disabled = "disabled";
			
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";
			document.form.mastite.disabled = false;
			document.form.nodulacao.disabled = false;
			document.form.displasia.disabled = false;
			document.form.deformidade.disabled = false;
			document.form.neoplasias.disabled = false;
			document.form.ginecomastia.disabled = false;
			document.form.outros.disabled = false;
			document.getElementById("colostroSim").disabled = false;
			document.getElementById("colostroNao").disabled = false;
		}
 	}

 	function sair(){
 		decisao = confirm("Deseja salvar os dados?");
 		if (decisao){
 		} else {
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
	        	//var div = window.top.document.getElementById('dadosPaciente');
		       // 	var div = window.top.document.getElementById('dadosPaciente');
		       // 	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		       // 	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Exame das Mamas</a>";
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
		 
			  <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico das Mamas</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>
</c:if>
	<h:form action="mamas">
    	 		 <h:hidden property="method" value="mamasSalvar"/>  
	 <div id="conteudoNormal" align="center" style="height:400px;">
	 		 
		  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
	 <div id="conteudoNormal" align="left" style="height:550px;">
				 <br/>
				 <div class="titulo">Exame das Mamas</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa"  <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				 <div id="exame">
                   Mastite<input name="mastite" type="checkbox"  <c:if test="${exame.mastite == true}"> checked="checked"</c:if> />
                   Nodula&ccedil;&atilde;o<input name="nodulacao" type="checkbox"  <c:if test="${exame.nodulacao == true}"> checked="checked"</c:if> />
                   Displasia<input type="checkbox" name="displasia"  <c:if test="${exame.displasia == true}"> checked="checked"</c:if> />
                   Deformidades<input type="checkbox" name="deformidade"  <c:if test="${exame.deformidades == true}"> checked="checked"</c:if> /><br/><br/>
                   Neoplasias<input type="checkbox" name="neoplasias"  <c:if test="${exame.neoplasias == true}"> checked="checked"</c:if> />
                   Ginecomastia<input type="checkbox" name="ginecomastia"  <c:if test="${exame.ginecomastia == true}"> checked="checked"</c:if> />
                    Secre&ccedil;&atilde;o<input type="checkbox" name="secrecao"  <c:if test="${exame.secrecao == true}"> checked="checked"</c:if> />
                   <br/><br/>
                     
			          Presen&ccedil;a de colostro  <br/>
                                 Sim<input type="radio" name="colostro" id="colostroSim" value="colostroSim" <c:if test="${exame.presencaColostroSim == true}"> checked="checked"</c:if> />
                                 N&atilde;o<input type="radio" name="colostro" value="colostroNao" id="colostroNao" <c:if test="${exame.presencaColostroNao == true}"> checked="checked"</c:if> />
			           	<br/><br/>
                   Outros <input type="text" size="20" name="outros"  value="<c:out value="${exame.outros}"></c:out>" />
                   
                   </div>
             	<br/><br/>
                  <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                  <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
		<br /><c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
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