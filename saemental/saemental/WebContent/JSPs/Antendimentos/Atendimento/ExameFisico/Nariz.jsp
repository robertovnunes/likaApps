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
		 	function semQueixa(){
			var check = document.getElementById("semqueixa").checked;
			if(check == true){
				document.getElementById("exame").style.opacity = "0.7";
				document.getElementById("exame").style.filter = "alpha(opacity=70)";
				document.form.palidez.disabled = "disabled";
				document.form.conjuntivite.disabled = "disabled";
				document.form.outros.disabled = "disabled";
				
			}else{
				document.getElementById("exame").style.opacity = "1.0";
				document.getElementById("exame").style.filter = "alpha(opacity=100)";
				document.form.palidez.disabled = false;
				document.form.conjuntivite.disabled = false;
				document.form.outros.disabled = false;
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
	        	//var div = window.top.document.getElementById('dadosPaciente');
		      //  	var div = window.top.document.getElementById('dadosPaciente');
		      //  	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		       // 	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame F??sico</a> :: <a style='color: white;text-decoration: none;' href='#'>Nariz</a>";
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
		 
		 
			<p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Nariz</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<h:form action="nariz">
    	 		 <h:hidden property="method" value="narizSalvar"/> 
	 <div id="conteudoNormal" align="left" style="height:400px;">
	 		 
		  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				<div class="titulo">Nariz</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" type="checkbox" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
		                   Deformidade<input name="deformidade" type="checkbox" <c:if test="${exame.deformidade == true}"> checked="checked"</c:if> />
		                   Dor <input name="dor" <c:if test="${exame.dor == true}"> checked="checked"</c:if> type="checkbox" />
		                   <br/><br/>
		                   Epistaxe <input name="epistaxe" type="checkbox" <c:if test="${exame.dor == true}"> checked="checked"</c:if> />
		                   Obstru&ccedil;&atilde;o Nasal<input name="obstrucao" type="checkbox" <c:if test="${exame.obstrucaoNasal == true}"> checked="checked"</c:if> />
		                   <br/><br/>
		                   Secre&ccedil;&atilde;o Nasal<input name="secrecao" type="checkbox" <c:if test="${exame.secrecaoNasal == true}"> checked="checked"</c:if> />
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
	</h:form>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>