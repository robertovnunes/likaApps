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
			
			document.form.sonsvesiculares.disabled = "disabled";
			document.form.sonsestertores.disabled = "disabled";
			document.form.sonsroncos.disabled = "disabled";
			document.form.sonssibilos.disabled = "disabled";
			document.form.sonsfremitos.disabled = "disabled";
			document.form.sonsoutros.disabled = "disabled";
			
			document.form.dentesausencia.disabled = "disabled";
			document.form.dentescaries.disabled = "disabled";
			document.form.dentesoutros.disabled = "disabled";

			document.getElementById('tossesim').disabled = "disabled";
			document.getElementById('tossenao').disabled = "disabled";

			document.form.expectoausente.disabled = "disabled";
			document.form.expectopurulento.disabled = "disabled";
			document.form.expectomucosa.disabled = "disabled";
			document.form.expectoserosa.disabled = "disabled";
			document.form.expectosanguinea.disabled = "disabled";
			document.form.expectoracao.disabled = "disabled";

			document.getElementById('sonoridadeadequada').disabled = "disabled";
			document.getElementById('sonoridadeinadequada').disabled = "disabled";
			document.form.sonoridadeonde.disabled = "disabled";
			document.form.percussaoutros.disabled = "disabled";

			document.form.hemoptiseausente.disabled = "disabled";
			document.form.hemoptisevivo.disabled = "disabled";
			document.form.hemoptiseespumoso.disabled = "disabled";
			document.form.hemoptisemucoso.disabled = "disabled";
			document.form.hemoptiseoutros.disabled = "disabled";
			
			document.form.outros.disabled = "disabled";
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";
			
			document.form.sonsvesiculares.disabled = false;
			document.form.sonsestertores.disabled = false;
			document.form.sonsroncos.disabled = false;
			document.form.sonssibilos.disabled = false;
			document.form.sonsfremitos.disabled = false;
			document.form.sonsoutros.disabled = false;
			
			document.form.dentesausencia.disabled = false;
			document.form.dentescaries.disabled = false;
			document.form.dentesoutros.disabled = false;

			document.getElementById('tossesim').disabled = false;
			document.getElementById('tossenao').disabled = false;

			document.form.expectoausente.disabled = false;
			document.form.expectopurulento.disabled = false;
			document.form.expectomucosa.disabled = false;
			document.form.expectoserosa.disabled = false;
			document.form.expectosanguinea.disabled = false;
			document.form.expectoracao.disabled = false;

			document.getElementById('sonoridadeadequada').disabled = false;
			document.getElementById('sonoridadeinadequada').disabled = false;
			document.form.sonoridadeonde.disabled = false;
			document.form.percussaoutros.disabled = false;

			document.form.hemoptiseausente.disabled = false;
			document.form.hemoptisevivo.disabled = false;
			document.form.hemoptiseespumoso.disabled = false;
			document.form.hemoptisemucoso.disabled = false;
			document.form.hemoptiseoutros.disabled = false;
			
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
		      //  	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      //  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Sistema Respiratorio</a>";
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
		 
		 
			 <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Sistema Respiratório</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>
</c:if>
	<h:form action="sistRespiratorio">
    	 		 <h:hidden property="method" value="sistRespiratorioSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:500px;">
	 	 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Sistema Respirat&oacute;rio</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				 <div id="exame">
				  Sons<br/>
                                 Murmúrios vesiculares<input name="sonsvesiculares" type="checkbox" <c:if test="${exame.sonsMurmuriosVesiculares == true}"> checked="checked"</c:if> />
                                 Estertores<input type="checkbox" name="sonsestertores" <c:if test="${exame.sonsEstertores == true}"> checked="checked"</c:if> />
                                 Roncos<input type="checkbox" name="sonsroncos" <c:if test="${exame.sonsRoncos == true}"> checked="checked"</c:if> />
                                 Sibilos<input type="checkbox" name="sonssibilos" <c:if test="${exame.sonsSibilos == true}"> checked="checked"</c:if> />
                                 Creptos<input type="checkbox" name="sonssibilos" <c:if test="${exame.sonsCreptos == true}"> checked="checked"</c:if> />
           	<br/><br/>
            Outros <input type="text" size="20" name="sonsoutros" value="<c:out value="${exame.sonsOutros}"></c:out>" />
            <br/><br/>
            Tosse<br/>
            
                                 Sim<input type="radio" name="tosse" id="tossesim" value="tosseSim" <c:if test="${exame.tosseSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" name="tosse" id="tossenao" value="tosseNao" <c:if test="${exame.tosseNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>

		  Expectora&ccedil;&atilde;o<br/>
                                Ausente<input name="expectoausente" type="checkbox" <c:if test="${exame.expectoracaoAusente == true}"> checked="checked"</c:if> />
                                 Purulento<input type="checkbox" name="expectopurulento" <c:if test="${exame.expectoracaoPurulento == true}"> checked="checked"</c:if>/>
                                 Mucosa<input type="checkbox" name="expectomucosa" <c:if test="${exame.expectoracaoMucosa == true}"> checked="checked"</c:if>/>
                                 Serosa<input type="checkbox" name="expectoserosa" <c:if test="${exame.expectoracaoSerosa == true}"> checked="checked"</c:if>/>
                                 Sangu&iacute;nea<input type="checkbox" name="expectosanguinea" <c:if test="${exame.expectoracaoSanguinea == true}"> checked="checked"</c:if>/>
           	<br/><br/>
            Outros <input type="text" size="20" name="expectoracaooutros" value="<c:out value="${exame.expectoracaoOutros}"></c:out>"/>
            <br/><br/>
            Hemoptise<br/>
                                Ausente<input name="hemoptiseausente" type="checkbox" <c:if test="${exame.hemoptiseAusente == true}"> checked="checked"</c:if>/>
                                 Sangue vivo<input type="checkbox" name="hemoptisevivo" <c:if test="${exame.hemoptiseSanqueVivo == true}"> checked="checked"</c:if>/>
                                 Espumoso<input type="checkbox" name="hemoptiseespumoso" <c:if test="${exame.hemoptiseEspumoso == true}"> checked="checked"</c:if>/>
                                 Mucoso<input type="checkbox" name="hemoptisemucoso" <c:if test="${exame.hemoptiseMucoso == true}"> checked="checked"</c:if>/>
           	<br/><br/>
            Outros <input type="text" size="20" name="hemoptiseoutros" value="<c:out value="${exame.hemoptiseOutros}"></c:out>" />
            <br/><br/>
            Dor<br />
             Sim <input type="radio" name="dor" value="dorSim" <c:if test="${exame.dorSim == true}"> checked="checked"</c:if>/>
             N&atilde;o<input type="radio" name="dor" value="dorNao" <c:if test="${exame.dorNao == true}"> checked="checked"</c:if>/>
            <br/><br/>              
           Outros<br />
           <input type="text" size="40" name="outros" value="<c:out value="${exame.outros}"></c:out>" />
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