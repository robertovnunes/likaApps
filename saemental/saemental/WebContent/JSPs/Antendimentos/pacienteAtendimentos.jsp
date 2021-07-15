<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<head> 


		<%@ include file="/JSPs/inc_header.jsp"%>


		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
        
        
        <link rel="stylesheet" type="text/css" href="Css/jTPS.css" />
		<link href="Css/tabela.css" rel="stylesheet" type="text/css" />
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        
		<script language="JavaScript" type="text/javascript" src="jscripts/jquery.js"></script>
        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
		
		 <script>
                $(document).ready(function () {
                        $('#demoTable').jTPS( {perPages:[5,10],scrollStep:1,scrollDelay:30,
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

                function resetarForm(){
                	document.getElementById("form1").tfBusca.value = "";
                }

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
        </script>
        <script type="text/javascript">
                function submeterBusca(){
					var tipo = getCheckedValue(document.atendimentoBuscar.tipoDeBusca);
					if(tipo == "tipo"){
						var valorEscrito = document.atendimentoBuscar.tfBusca.value.toUpperCase();
						if(valorEscrito != "EVOLUÇÃO" && valorEscrito != "READMISSÃO" && valorEscrito != "ADMISSÃO"){
							var erroMsg = document.getElementById("mensagem");
							erroMsg.innerHTML = "Tipo inválido! (Valores válidos: Admissão, Readmissão, Evolução)";
							return false;
						}
					}
					return true;
                }

                function getCheckedValue(radioObj) {
                	if(!radioObj)
                		return "";
                	var radioLength = radioObj.length;
                	if(radioLength == undefined)
                		if(radioObj.checked)
                			return radioObj.value;
                		else
                			return "";
                	for(var i = 0; i < radioLength; i++) {
                		if(radioObj[i].checked) {
                			return radioObj[i].value;
                		}
                	}
                	return "";
                }

                                
                function resetarForm(){
                	document.getElementById("tfBusca").value = "";
                }
        </script>
        
        <style>
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                }
        </style>
		
        <script type="text/javascript">
        	function navegacao(){
	    //    	var div = window.top.document.getElementById('dadosPaciente');
        //	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
       // 	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>

        	var divnavegacao = window.top.document.getElementById('navegacao');
        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'  target='conteudo'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='#'>Atendimentos Paciente</a>";
        	}
        </script>
</head>
<body onload="navegacao();">
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../menu.jsp"  flush="true"/>	
        
		
		<div style="margin-top:0px;">
				
				
				<div id="conteudo" align="center" style="height:700px;">
				
                   <%@ include file="menu.jsp"%>
				
				
                <br/>
                <br/>
                 <br/>
                <div id="buscarPacientes">
                	<div id="erroMsg">
		               <font color="red"> <h:errors/></font>
		               <font color="red" id="mensagem"> 
		              		${mensagem}
						</font>
		                <br /><br />
		            </div>
                    <h:form action="atendimentoBuscar" onsubmit="return submeterBusca();" >
                    	<h:hidden property="method" value="atendimentoBuscar"/>   
                        <div align="center" style="height: 79px">
                            <label>
                                <input type="text" size="60" name="tfBusca" id="tfBusca" onkeypress=" return keyPress(event,this);" />
                            </label>
                             <input type="submit" value="Buscar" />
                            <br/>
                            <label onclick="resetarForm();">
                                Data<input id="tipoDeBusca" name="tipoDeBusca" type="radio" checked="checked" value="data"/>
                            </label>
                            <label onclick="resetarForm();">
                                Tipo<input id="tipoDeBusca" name="tipoDeBusca" type="radio" value="tipo"/>
                            </label>
                            <label onclick="resetarForm();">
                                Autor<input id="tipoDeBusca" name="tipoDeBusca" type="radio" value="autor"/>
                            </label>
                        </div>
                   </h:form>
					Adendo<img src="imagens/avaliacao.png" width="20" height="20" border="0" />
					Avalia&ccedil;&atilde;o <img src="imagens/obs.png" width="20" height="20" border="0" /> 
					Assinado <img src="imagens/signature.png" width="20" height="20" border="0" /> 
					
                    <p id="titulo-verm" style='margin-left: 440px;' align="left">Atendimentos</p>
                    
                    <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                       <thead>
               			 <tr>
	                       <th sort="autor">Autor(Enfermeiro)</th>
                            <th >Data</th>
                            <th >Hora</th>
                            <th>Tipo do Atendimento</th>
                            <th>Adendos/Avalia&ccedil;&otilde;es</th>
	                 	</tr>
	                 	</thead>
	                 
                   <tbody>
                   	<c:forEach items="${atendimentos}" var="atendimento" varStatus="index">
                   		<tr>
                            <td align="center">
                               ${atendimento.usuario.nome}
                            </td>
                            <td align="center">
                                ${atendimento.dataFormatada }
                            </td>
                            <td align="center">
                                ${atendimento.horaFormatada }
                            </td>
                            <td align="center">
                                <a href="atendimento.do?method=atendimentoEdit&idAtendimento=<c:out value="${atendimento.id}"></c:out>&tipo=<c:out value="${atendimento.tipo}"></c:out>" >
                                	<c:if test="${atendimento.tipo == 'ADMISSAO'}">Admissão </c:if>
	                            	<c:if test="${atendimento.tipo == 'READMISSAO'}">Readmissão</c:if>
	                            	<c:if test="${atendimento.tipo == 'EVOLUCAO'}">Evolução</c:if>
	                            	
                          		</a>
                            </td>
                            <td style="cursor: auto;" align="center">
                            	<c:if test="${atendimento.possuiAdendo == true}">
									<img src="imagens/avaliacao.png" width="20" height="20" border="0" />
                            	</c:if>
                            	<c:if test="${atendimento.possuiAvaliacao == true}">
									<img src="imagens/obs.png" width="20" height="20" border="0" />
                            	</c:if>
                            	<c:if test="${atendimento.dataHoraAssinatura != null}">
									<img src="imagens/signature.png" width="20" height="20" border="0" />
                            	</c:if>
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