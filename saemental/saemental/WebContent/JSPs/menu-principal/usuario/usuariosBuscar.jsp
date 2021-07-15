<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../autenticacao.jsp"  flush="true"/>		
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
                	document.getElementById("tfBusca").value = "";
                }
               
        </script>
        <style>
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
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
	        	//var div = window.top.document.getElementById('dadosPaciente');
	        //	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='#'>Usuário Buscar</a>";
        	}
        </script>
</head>
<body onload="navegacao();">
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../menu.jsp"  flush="true"/>	
        
		<div style="margin-top:15px;">
               	
				 <div id="conteudo" align="center" style="height:700px;">
           		<b style="color: red;"><h:errors/></b>
				<div id="buscarUsuarios">
			         <h:form action="buscarUsuarios" >
		                 <h:hidden property="method" value="buscarUsuarios"/>   
                        <div align="center" style="height: 79px">
                            <label>
                                <input type="text" size="60" name="tfBusca" class="input-text" id="tfBusca" onkeypress=" return keyPress(event, this);" />
                            </label>
                           	<h:submit value="Buscar"/> &nbsp;
                            <br/><br/>
                            <label onclick="resetarForm();">
								Nome<input id="tipoDeBusca" name="tipoDeBusca" checked="checked" type="radio" value="nome" />
							</label>
							<label onclick="resetarForm();">
								CPF<input id="tipoDeBusca"  name="tipoDeBusca" type="radio" value="cpf" />
							</label>
							<label onclick="resetarForm();">	
								Login<input id="tipoDeBusca"  name="tipoDeBusca" type="radio" value="login" />
							</label>
                        </div>
                  </h:form> 
                   
                            <p id="titulo-verm" style='margin-left: 350px;' align="left">Usuários</p>
                   
                    <br/>
                    <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                        <thead>
               			 <tr>
	                        <th sort="index">Nome</th>
	                        <th >CPF</th>
	                        <th sort="idade">Login</th>
	                        <th sort="sexo">Sexo</th>
	                        <th sort="tipo">Tipo</th>
	                        <th>Editar</th>
               			 </tr>
       					 </thead>
       					 <tbody>
       					<c:forEach items="${usuarios}" var="usuario" varStatus="index">
                        <tr>
                            <td align="center">
                                ${usuario.nome}
                            </td>
                            <td align="center">
                                ${usuario.cpf}
                            </td>
                            <td align="center">
                                ${usuario.login}
                            </td>
                            <td align="center">
                                 ${usuario.sexo}
                            </td>
                            <td align="center">
                            	<c:if test="${usuario.tipoUsuario == 'PROFESSOR'}">Professor </c:if>
                            	<c:if test="${usuario.tipoUsuario == 'ENFERMEIRO'}">Enfermeiro</c:if>
                            	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">Aluno Laboratório</c:if>
                            	<c:if test="${usuario.tipoUsuario == 'ALUNOENFERMARIA'}">Aluno Enfermaria </c:if>
                            </td>
                            <td align="center">
                                <a href="usuario.do?method=mostrarTelaUsuarioEdit&id=<c:out value="${usuario.id }"></c:out>" title="Alterar Cadastro do Paciente"><img src="imagens/edit.png" width="20" height="20" border="0" /></a>
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
                    <br/>
                </div>
            </div>

				
                </div>
		

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>
</body>
</html>