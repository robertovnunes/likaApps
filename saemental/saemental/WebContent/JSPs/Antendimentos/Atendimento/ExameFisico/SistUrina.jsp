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

          function escolheuSim(id){
		var textbox = document.getElementById(id);
		textbox.disabled = false;
		
 }
 function escolheuNao(id){
		var textbox = document.getElementById(id);
		textbox.value = "";
		textbox.disabled = 'disable';
 }
 </script>
<script type="text/javascript">
 	function semQueixa(){
		var check = document.getElementById("semqueixa").checked;
		if(check == true){
			document.getElementById("exame").style.opacity = "0.7";
			document.getElementById("exame").style.filter = "alpha(opacity=70)";

			document.form.corlimpida.disabled = "disabled";
			document.form.coramarelada.disabled = "disabled";
			document.form.corcolurica.disabled = "disabled";
			document.form.corconcentrada.disabled = "disabled";
			document.form.coroutros.disabled = "disabled";

			document.form.miccionaisoliguria.disabled = "disabled";
			document.form.micccionaisdisuria.disabled = "disabled";
			document.form.miccionaisanuria.disabled = "disabled";
			document.form.miccionaispolaciuria.disabled = "disabled";
			document.form.miccionaishematuria.disabled = "disabled";
			document.form.miccionaisincotinecia.disabled = "disabled";
			document.form.miccionaisretencao.disabled = "disabled";
			document.form.miccionaisenurese.disabled = "disabled";
			document.form.miccionaisoutros.disabled = "disabled";

			document.getElementById('ciclosim').disabled = "disabled";
			document.getElementById('ciclonao').disabled = "disabled";

			document.getElementById('menopausasim').disabled = "disabled";
			document.getElementById('menopausanao').disabled = "disabled";

			document.getElementById('sangramentossim').disabled = "disabled";
			document.getElementById('sangramentosnao').disabled = "disabled";

			document.getElementById('pruridosim').disabled = "disabled";
			document.getElementById('pruridonao').disabled = "disabled";

			document.getElementById('lesoessim').disabled = "disabled";
			document.getElementById('lesoesnao').disabled = "disabled";

			document.getElementById('odorsim').disabled = "disabled";
			document.getElementById('odornao').disabled = "disabled";

			document.getElementById('secrecoessim').disabled = "disabled";
			document.getElementById('secrecoesnao').disabled = "disabled";

		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";

			document.form.corlimpida.disabled = false;
			document.form.coramarelada.disabled = false;
			document.form.corcolurica.disabled = false;
			document.form.corconcentrada.disabled = false;
			document.form.coroutros.disabled = false;

			document.form.miccionaisoliguria.disabled = false;
			document.form.micccionaisdisuria.disabled = false;
			document.form.miccionaisanuria.disabled = false;
			document.form.miccionaispolaciuria.disabled = false;
			document.form.miccionaishematuria.disabled = false;
			document.form.miccionaisincotinecia.disabled = false;
			document.form.miccionaisretencao.disabled = false;
			document.form.miccionaisenurese.disabled = false;
			document.form.miccionaisoutros.disabled = false;

			document.getElementById('ciclosim').disabled = false;
			document.getElementById('ciclonao').disabled = false;

			document.getElementById('menopausasim').disabled = false;
			document.getElementById('menopausanao').disabled = false;

			document.getElementById('sangramentossim').disabled = false;
			document.getElementById('sangramentosnao').disabled = false;

			document.getElementById('pruridosim').disabled = false;
			document.getElementById('pruridonao').disabled = false;

			document.getElementById('lesoessim').disabled = false;
			document.getElementById('lesoesnao').disabled = false;

			document.getElementById('odorsim').disabled = false;
			document.getElementById('odornao').disabled = false;

			document.getElementById('secrecoessim').disabled = false;
			document.getElementById('secrecoesnao').disabled = false;
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
		       // 	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		       // 	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame F??sico</a> :: <a style='color: white;text-decoration: none;' href='#'>Sistema Genitourin??rio</a>";
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
		 
			  <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Sistema Geniturin&aacute;rio</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<h:form action="sistUrina">
    	 		 <h:hidden property="method" value="sistUrinaSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:900px;">
	 	 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/> 
				 <div class="titulo">Sistema Genitourin&aacute;rio</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if>type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
				  Cor e Aspectos <br/>
                                L&iacute;mpida<input name="corlimpida" type="checkbox" <c:if test="${exame.corlimpida == true}"> checked="checked"</c:if>/>
                                 Col??rica<input type="checkbox" name="corcolurica" <c:if test="${exame.corcolurica == true}"> checked="checked"</c:if>/>
                                 Concentrada<input type="checkbox" name="corconcentrada"<c:if test="${exame.corconcentrada == true}"> checked="checked"</c:if> />
                                 Espumosa<input type="checkbox" name="corespumosa"<c:if test="${exame.corespumosa == true}"> checked="checked"</c:if> />
		           	<br/><br/>
		            Outros <input name="coroutros" type="text" size="20" value="<c:out value="${exame.coroutros}"></c:out>" />
		            <br/><br/>
		            Altera&ccedil;&otilde;es miccionais<br/>
		                                 Olig??ria<input type="checkbox" name="miccionaisoliguria" <c:if test="${exame.miccionaisoliguria == true}"> checked="checked"</c:if>/>
		                                 Dis??ria<input type="checkbox" name="micccionaisdisuria" <c:if test="${exame.micccionaisdisuria == true}"> checked="checked"</c:if>/>
		                                 An??ria<input type="checkbox" name="miccionaisanuria"<c:if test="${exame.miccionaisanuria == true}"> checked="checked"</c:if> />
		                                 Polaci??ria<input type="checkbox" name="miccionaispolaciuria"<c:if test="${exame.miccionaispolaciuria == true}"> checked="checked"</c:if> /><br/>
		                                 Hemat??ria<input type="checkbox" name="miccionaishematuria" <c:if test="${exame.miccionaishematuria == true}"> checked="checked"</c:if>/>
		                                 Incontin&ecirc;ncia urin&aacute;ria<input type="checkbox" name="miccionaisincotinecia"<c:if test="${exame.miccionaisincotinecia == true}"> checked="checked"</c:if> />
		                                 Reten&ccedil;&atilde;o urin&aacute;ria<input type="checkbox" name="miccionaisretencao" <c:if test="${exame.miccionaisretencao == true}"> checked="checked"</c:if>/><br/>
		                                 Enurese<input type="checkbox" name="miccionaisenurese" <c:if test="${exame.miccionaisenurese == true}"> checked="checked"</c:if>/>
		                                 Poli??ria <input type="checkbox" name="miccionaispoliuria" <c:if test="${exame.miccionaispoliuria == true}"> checked="checked"</c:if>/>
		                                 Pi??ria<input type="checkbox" name="miccionaispiuria"<c:if test="${exame.miccionaispiuria == true}"> checked="checked"</c:if> />
		           	<br/><br/>
		    
		             Outros <input type="text" name="miccionaisoutros" size="20" value="<c:out value="${exame.miccionaisoutros}"></c:out>" />
		           <br/><br/>
		           Ciclo menstrual <br/>
		                                Regular<input type="radio" id="cicloSim" value="cicloSim" name="ciclo" <c:if test="${exame.cicloSim == true}"> checked="checked"</c:if>/>
		                                 Irregular<input type="radio" id="cicloNao" value="cicloNao" name="ciclo" <c:if test="${exame.cicloNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           Menopausa<br/>
		                                Sim<input type="radio" id="menopausaSim" value="menopausaSim" name="menopausa" <c:if test="${exame.menopausaSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="menopausaNao" value="menopausaNao" name="menopausa"<c:if test="${exame.menopausaNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	Sangramentos <br/>
		                                Sim<input type="radio" id="sangramentosSim" value="sangramentosSim" name="sangramentos"<c:if test="${exame.sangramentosSim == true}"> checked="checked"</c:if> />
		                                 N&atilde;o<input type="radio" id="sangramentosNao" value="sangramentosNao" name="sangramentos"<c:if test="${exame.sangramentosNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	Prurido  <br/>
		                                Sim<input type="radio" id="pruridoSim" value="pruridoSim" name="prurido" <c:if test="${exame.pruridoSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="pruridoNao" value="pruridoNao" name="prurido"<c:if test="${exame.pruridoNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	Les&otilde;es <br/>
		                                Sim<input type="radio" id="lesoesSim" value="lesoesSim" name="lesoes" <c:if test="${exame.lesoesSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="lesoesNao" value="lesoesNao" name="lesoes"<c:if test="${exame.lesoesNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	Odor <br/>
		                                Sim<input type="radio" id="odorSim" value="odorSim" name="odor" <c:if test="${exame.odorSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="odorNao" value="odorNao" name="odor"<c:if test="${exame.odorNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	Corrimento  <br/>
		                                Sim<input type="radio" id="corrimentoSim" value="corrimentoSim" name="corrimento" <c:if test="${exame.corrimentoSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="corrimentoNao" value="corrimentoNao" name="corrimento"<c:if test="${exame.corrimentoNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		           	C&oacute;licas  <br/>
		                                Sim<input type="radio" id="colicasSim" value="colicasSim" name="colicas" <c:if test="${exame.colicasSim == true}"> checked="checked"</c:if>/>
		                                 N&atilde;o<input type="radio" id="colicasNao" value="colicasNao" name="colicas"<c:if test="${exame.colicasNao == true}"> checked="checked"</c:if>/>
		           	<br/><br/>
		            </div>
        		    <br /><br />
                  <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                  <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
			<br />	<c:if test="${atendimento.assinar == true }">
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