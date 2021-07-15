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
 	function semQueixa(){
 		var check = document.getElementById("semqueixa").checked;
		if(check == true){
			document.getElementById("exame").style.opacity = "0.7";
			document.getElementById("exame").style.filter = "alpha(opacity=70)";
			
			document.getElementById('jugularesdistendas').disabled = "disabled";
			document.getElementById('jugularesnormal').disabled = "disabled";
			document.form.jugularoutros.disabled = "disabled";

			document.getElementById('tireoideaumentado').disabled = "disabled";
			document.getElementById('tireoidenormal').disabled = "disabled";
			document.form.tireoideoutros.disabled = "disabled";

			document.form.gangliosaumentados.disabled = "disabled";
			document.form.gangliosdolorosos.disabled = "disabled";
			document.form.gangliosmoveis.disabled = "disabled";
			document.form.gangliosfixos.disabled = "disabled";
			document.form.gangliosoutros.disabled = "disabled";

			document.getElementById("gangliosmoveis").disabled = "disabled";
			document.getElementById("gangliosfixos").disabled = "disabled";
			
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";
			
			document.getElementById('jugularesdistendas').disabled = false;
			document.getElementById('jugularesnormal').disabled = false;
			document.form.jugularoutros.disabled = false;

			document.getElementById('tireoideaumentado').disabled = false;
			document.getElementById('tireoidenormal').disabled = false;
			document.form.tireoideoutros.disabled = false;

			document.form.gangliosaumentados.disabled = false;
			document.form.gangliosdolorosos.disabled = false;
			document.form.gangliosmoveis.disabled = false;
			document.form.gangliosfixos.disabled = false;
			document.form.gangliosoutros.disabled = false;

			document.getElementById("gangliosmoveis").disabled = false;
			document.getElementById("gangliosfixos").disabled = false;
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
        	function navegacao(){
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Pescoço</a>";
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
		 
		 
		 <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Pescoço</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<h:form action="pescoco">
    	 		 <h:hidden property="method" value="pescocoSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:400px;">
	 		 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Pesco&ccedil;o</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				 <div id="exame">
					  Veias Jugulares<br/>
	                                 Distendidas<input name="jugulares"  <c:if test="${exame.veiasDistendidas == true}"> checked="checked"</c:if>  value="jugularesdistendas" value="jugularesdistendas" type="radio" />
	                                 Normais<input value="jugularesnormal" id="jugularesnormal" <c:if test="${exame.veiasNormais == true}"> checked="checked"</c:if> type="radio" name="jugulares" />
	           	<br/><br/>
	            Outros <input type="text" name="jugularoutros" value="<c:out value="${exame.veiasOutros}"></c:out>" size="20" />
	            <br/><br/>
	    
	            Tire&oacute;ide<br/>
	                                 Volume Aumentado<input value="tireoideaumentado" id="tireoideaumentado"  <c:if test="${exame.tireoideVolAumentado == true}"> checked="checked"</c:if> type="radio" name="tireoide" />
	                                 Volume Normal<input type="radio" name="tireoide"  <c:if test="${exame.tireoideVolNormal == true}"> checked="checked"</c:if> value="tireoidenormal"  id="tireoidenormal" />
	           	<br/><br/>
	             Outros <input name="tireoideoutros" type="text" value="<c:out value="${exame.tireoideOutros}"></c:out>" size="20" />
	           <br/><br/>
	            Gânglios<br/>
	                                 M&oacute;veis<input type="radio" name="ganglios" value="gangliosmoveis" id="gangliosmoveis"  <c:if test="${exame.gangliosMoveis == true}"> checked="checked"</c:if> />
	                                 Fixos<input type="radio" name="ganglios"  id="gangliosfixos" value="gangliosfixos"  <c:if test="${exame.gangliosFixos == true}"> checked="checked"</c:if> />
	                                 Palp&aacute;veis<input type="radio" name="ganglios"  id="gangliospalpaveis"  value="gangliospalpaveis"  <c:if test="${exame.gangliosPalpaveis == true}"> checked="checked"</c:if> />
	           	<br/><br/>
	            Outros <input type="text" size="20" value="<c:out value="${exame.gangliosOutros}"></c:out>" name="gangliosoutros" />
            </div>
            <br/><br/>
                  <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                  <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
		<br />	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
	</div>
	</h:form>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>