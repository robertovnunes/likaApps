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
        
        
        <link rel="stylesheet" type="text/css" href="Css/jTPS.css" />
		<link href="Css/tabela.css" rel="stylesheet" type="text/css" />
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        
			<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
	        </script>

        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
			
		<script language="JavaScript" type="text/javascript" src="jscripts/popup.js" ></script>    
			
		
 		 
		<script>
                $(document).ready(function () {
                	
                        $('#demoTable').jTPS( {perPages:[5],scrollStep:1,scrollDelay:30,
                                clickCallback:function () {     
                                        // target table selector
                                        var table = '#demoTable';
                                        // store pagination + sort in cookie 
                                        document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
                                }
                        });
                        // reinstate sort and pagination if cookie exists
                        var cookies = document.cookie.split(';');
                        for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
                                var cookie = cookies[ci].split('=');
                                if (cookie[0] == 'jTPS') {
                                        var commands = cookie[1].split(',');
                                        for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                                                var command = commands[cm].split(':');
                                                if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                                                } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                                                } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                                                }
                                        }
                                }
                        }
                        // bind mouseover for each tbody row and change cell (td) hover style
                        $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout',
                                function (e) {
                                        // hilight the row
                                        e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                                }
                        );
                        
                });

                function selecionar(){
                	var popup = window.open('Diagnostico.jsp','width=300','height=400',"resizable=no");
                	popup.document.close();
                	popup.focus();
                }

                function diagnosticoAdd(){
                	var popup = window.open('DiagnosticoAdd.jsp','width=100%','height=600px');
                	popup.document.close();
                	popup.focus();
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
	        //	var div = window.top.document.getElementById('dadosPaciente');
		      //  	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar' target='conteudo'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"' target='conteudo'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Diagnóstico e Interveções</a>";
        	}
        </script>
		 <style>
			#demoTable thead th {
				white-space: nowrap;
				overflow-x: hidden;
				padding: 3px;
			}
			
			#demoTable tbody td {
				padding: 3px;
			}
		</style>	
			
		 
				  
				  
</head>
<body onload="navegacao();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1100px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1100px; display:inline-block;">
		 
		 
		 <form name="form" method="post" action="servlet?cmd=processo">
 		<br />
 		<table border="1px">
 			<tr>
 				<th  style="width:210px;">
 					Diagn&oacute;sticos 
 				</th>
 				<th  style="width:210px;">
 					Interven&ccedil;&otilde;es 
 				</th>
 				<th  style="width:210px;">
 					Resultados Esperados
 				</th>
 			</tr>
 			<tr>
 				<td>
 					<ul>
 					
 						<c:forEach items="${diagnosticos}" var="diagnostico" varStatus="index">
	 						<li>
			 					<a href="javascript:void(window.open('diagnostico.do?method=mostrarTelaDiagnosticoEscolhido&diagnostico=<c:out value="${diagnostico.id}"></c:out>','_newwindow', 'toolbar=no,location=no,status=no,directories=no,menubar=no,scrolling=no,scrollbars=yes,width=800,height=600,resize=no'))"  style="cursor: pointer;"><u>
		 							<c:out value="${diagnostico.cipe.titulo}"></c:out>(<c:out value="${diagnostico.cipe.codigo}"></c:out>)<br />
			 					</u></a><br/>
							</li>
							
 						</c:forEach>
 					</ul>
 				</td>
 				<td>
 					<c:forEach items="${intervencoes}" var="intervencao" varStatus="index">
 						<c:out value="${intervencao.nic.descricao}"></c:out>(<c:out value="${intervencao.nic.codigo}"></c:out>)<br />
 					</c:forEach>
 				</td>
 				<td>
 					<c:forEach items="${resultados}" var="resultado" varStatus="index">
 						<c:out value="${resultado.noc.descricao}"></c:out>(<c:out value="${resultado.noc.codigo}"></c:out>)<br />
 					</c:forEach>
 				</td>
 			</tr>
 		</table>
 	 </form>
	 	<h2>Diagn&oacute;stico: </h2>
	 	 <div id="erroMsg">
              <font color="red"> <h:errors/></font>
              <font color="red"> 
             		${mensagem}
			</font>
           </div>
         <form name="cipeBuscar" method="get" action="cipeBuscar.do">
    	 		 <h:hidden property="method" value="cipeBuscar"/>  
		    <input type="text" size="80" name="valor" />
		    <input type="submit" name="btBuscar" id="btBuscar" value="Buscar" />
	   	 </form>
	    <br/><br/>
	     <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                       <thead>
               			 <tr>
	                       <th sort="autor">T&iacute;tulo</th>
                           <th sort="cod">C&oacute;digo</th>
                           <th sort="descr">Descri&ccedil;&atilde;o</th>
                           <th>Adicionar</th>
	                 	</tr>
	                 	</thead>
	                 
                   <tbody>
  						<c:forEach items="${cipeList}" var="cipe" varStatus="index">
  						<tr>
  							<td align="center">
  								 ${cipe.titulo}
  							</td>
  							<td align="center">
  							 	${cipe.codigo}
  							</td>
  							<td align="center">
  								 ${cipe.descricao}
  							</td>
  							<td align="center">
  								<a onclick='window.open("diagnosticoAdd.do?method=diagnosticoAdd&id=<c:out value="${cipe.id}"></c:out>","width=300px","height=600px");' href="#" >Adicionar</a>
  							</td>
  						</tr>
  						</c:forEach>
                     </tbody>
                 	<tfoot class="nav">
               		 <tr>
                        <td colspan=7>
                                <div class="pagination"></div>
                                <div class="paginationTitle">P&aacute;gina</div>
                                <div class="selectPerPage"></div>
                                <div class="status"></div>
                        </td>
                	</tr>
       			 </tfoot>
       			 </table>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>