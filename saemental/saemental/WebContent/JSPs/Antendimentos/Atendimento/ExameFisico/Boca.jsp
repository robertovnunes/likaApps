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
			document.form.cianose.disabled = "disabled";
			
			document.form.lesoes.disabled = "disabled";

			document.form.ressecamento.disabled = "disabled";
			document.form.halitose.disabled = "disabled";
			document.form.labiosoutros.disabled = "disabled";
			
			document.form.ausencia.disabled = "disabled";
			document.form.caries.disabled = "disabled";
			document.form.dentesoutros.disabled = "disabled";
			
			document.form.edemas.disabled = "disabled";
			document.form.vermelhas.disabled = "disabled";
			document.form.estomatites.disabled = "disabled";
			document.form.gengivasoutros.disabled = "disabled";

			document.form.saburrosa.disabled = "disabled";
			document.form.seca.disabled = "disabled";
			document.form.acastanhada.disabled = "disabled";
			document.form.linguaoutros.disabled = "disabled";
			
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";
			document.form.cianose.disabled = false;
			document.form.lesoes.disabled = false;
			document.form.ressecamento.disabled = false;
			document.form.halitose.disabled = false;
			document.form.labiosoutros.disabled = false;
			
			document.form.ausencia.disabled = false;
			document.form.caries.disabled = false;
			document.form.dentesoutros.disabled = false;
			
			document.form.edemas.disabled = false;
			document.form.vermelhas.disabled = false;
			document.form.estomatites.disabled = false;
			document.form.gengivasoutros.disabled = false;

			document.form.saburrosa.disabled = false;
			document.form.seca.disabled = false;
			document.form.acastanhada.disabled = false;
			document.form.linguaoutros.disabled = false;
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
        	
            
        	function horizontal(){
                
        		
                var navItems = document.getElementById("menu_dropdown").getElementsByTagName("li");
                
                for (var i = 0; i < navItems.length; i++) {
                    if (navItems[i].className == "submenu") {
                        if (navItems[i].getElementsByTagName('ul')[0] != null) {
                            navItems[i].onmouseover = function(){
                                this.getElementsByTagName('ul')[0].style.display = "block";
                                this.style.backgroundColor = "#f9f9f9";
                            }
                            navItems[i].onmouseout = function(){
                                this.getElementsByTagName('ul')[0].style.display = "none";
                                this.style.backgroundColor = "#FFFFFF";
                            }
                        }
                    }
                }
                
            }
            
            function vertical(){
            
            	
                var navItems = document.getElementById("nav_atendimentos").getElementsByTagName("li");
                
                for (var i = 0; i < navItems.length; i++) {
                    if (navItems[i].className == "submenu") {
                        navItems[i].onmouseover = function(){
                            this.getElementsByTagName('ul')[0].style.display = "block";
                            this.style.backgroundColor = "#f9f9f9";
							
                        }
                        navItems[i].onmouseout = function(){
                            this.getElementsByTagName('ul')[0].style.display = "none";
                            this.style.backgroundColor = "#FFFFFF";
                        }
                    }
                }
                
                
            }
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        	//var div = window.top.document.getElementById('dadosPaciente');
		      //  	var div = window.top.document.getElementById('dadosPaciente');
//div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      //  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame F??sico</a> :: <a style='color: white;text-decoration: none;' href='#'>Couro Cabeludo</a>";
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
		 
		 
			<p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Boca</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
		<h:form action="boca">
    	 		 <h:hidden property="method" value="bocaSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:550px;">
	 		 
		  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Boca</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input type="checkbox" id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
				  L&aacute;bios<br/>
                                 Cianose<input name="cianose" type="checkbox" <c:if test="${exame.labiosCianose == true}"> checked="checked"</c:if>/>
                                 Les&otilde;es<input type="checkbox" name="lesoesLabios" <c:if test="${exame.labiosLesoes == true}"> checked="checked"</c:if> />
                                 Ressecamento<input type="checkbox" name="ressecamentoLabios" <c:if test="${exame.labiosRessecamento == true}"> checked="checked"</c:if> />
                                 Edema<input type="checkbox" name="edemaLabios" <c:if test="${exame.labiosEdema == true}"> checked="checked"</c:if> />
                                 Hiperemia<input type="checkbox" name="hiperemiaLabios" <c:if test="${exame.labiosHiperamia == true}"> checked="checked"</c:if> />
	           	<br/><br/>
	            Outros <input name="labiosoutros" type="text" size="20" value="<c:out value="${exame.labiosOutros}"></c:out>"/>
	            <br/><br/>
	            Dentes<br/>
	                                 Aus&ecirc;ncia<input type="checkbox" name="ausencia" <c:if test="${exame.dentesAusencia == true}"> checked="checked"</c:if> />
	                                  Dentes Cariados<input type="checkbox" name="cariados" <c:if test="${exame.dentesCariados == true}"> checked="checked"</c:if> />
	                                 Pr&oacute;tese Dent&aacute;ria<input type="checkbox" name="protese" <c:if test="${exame.dentesProtese == true}"> checked="checked"</c:if> />
	           	<br/><br/>
	             Outros <input name="dentesoutros" type="text" size="20" value="<c:out value="${exame.dentesOutros}"></c:out>"/>
	           <br/><br/>
	            Gengivas e bochechas<br/>
	                                 Edema<input name="edemasGengivas" type="checkbox" <c:if test="${exame.gengivasEdema == true}"> checked="checked"</c:if> />
	                                 Hiperemia<input name="hiperamia" type="checkbox" <c:if test="${exame.gengivasHiperamia == true}"> checked="checked"</c:if> />
	                                 Hipertrofia<input name="hipertrofia" type="checkbox" <c:if test="${exame.gengivasHipertrofia == true}"> checked="checked"</c:if> />
	                                 Les&otilde;es<input name="lesoesGengiva" type="checkbox" <c:if test="${exame.gengivasLesoes == true}"> checked="checked"</c:if> />
	                                 Manchas<input name="manchasGengivas" type="checkbox" <c:if test="${exame.gengivasManchas == true}"> checked="checked"</c:if> />
	                                 Sangramento<input name="sangramento" type="checkbox" <c:if test="${exame.gengivasSangramento == true}"> checked="checked"</c:if> />
	           	<br/><br/>
	            Outros <input type="text" size="20" name="gengivasoutros" value="<c:out value="${exame.gengivasOutros}"></c:out>" />
	            <br/><br/>
	            L&iacute;ngua<br/>
	                                 Altera&ccedil;&atilde;o na Cor<input type="checkbox" name="corLingua" <c:if test="${exame.linguaAlteracaoCor == true}"> checked="checked"</c:if> />
	                                 Edema<input type="checkbox" name="edemaLingua" <c:if test="${exame.linguaEdema == true}"> checked="checked"</c:if> />
	                                 Les&otilde;es<input type="checkbox" name="lesoesLingua" <c:if test="${exame.linguaLesoes == true}"> checked="checked"</c:if> />
	                                 L&iacute;ngua Lisa<input type="checkbox" name="lisa"<c:if test="${exame.linguaLinguaLisa == true}"> checked="checked"</c:if> />
	                                Manchas<input type="checkbox" name="manchasLingua" <c:if test="${exame.linguaManchas == true}"> checked="checked"</c:if> />
	           	<br/><br/>
	            Outros <input name="linguaoutros" type="text" size="20" value="<c:out value="${exame.linguaOutros}"></c:out>" />

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
	</h:form>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>