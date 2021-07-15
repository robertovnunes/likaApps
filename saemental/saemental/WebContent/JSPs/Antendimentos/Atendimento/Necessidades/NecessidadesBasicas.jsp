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
			
		<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
		</script>
        <script type="text/javascript">
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });

            function escolheuSim(id){
		//		var textbox = document.getElementById(id+"Qual");
	//			textbox.disabled = false;
				
            }
            function escolheuNao(id){
		//		var textbox = document.getElementById(id);
		//		textbox.value = "";
		//		textbox.disabled = 'disable';
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
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Necessidades Básicas</a>";
        	}
        </script>
 		 
			
			
		 
				  
				  
</head>
<body onload="navegacao();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:700px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:750px; display:inline-block;">
		 
		 
		 <h:form action="necessidades">
    	 		 <h:hidden property="method" value="necessidadesSalvar"/>    
    	 		 
            <div id="conteudoNormal" align="center" style="height:700px;float: left;">

<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:600px;"></div>	
</c:if>    
                   <p id="titulo-verm" style='' align="left">::Necessidades B&aacute;sicas</p>     
  					<div class="sessao"></div>
  					 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
					<br /><br />
					 <table border="0" cellpadding="0" cellspacing="0" style="border:0;">
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Sono e repouso
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Adequada <input onclick="escolheuNao('sono');" type="radio"  <c:if test="${necessidades.sonoAdequada == true}">checked="checked"  </c:if> value="Adequada"  name="sono"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Alterada <input onclick="escolheuSim('sono');" type="radio" value="Alterada"  <c:if test="${necessidades.sonoAlterada == true}">checked="checked"  </c:if> name="sono"/></label> 
							</td>	
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.sonoAdequada == true || necessidades.sonoAlterada == null}">   </c:if> value="<c:out value="${necessidades.sonoRepousoQual}"></c:out>" id="sonoQual" name="sonoQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; '>
								Elimina&ccedil;&atilde;o
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Adequada <input onclick="escolheuNao('eliminacao');" type="radio" value="Adequada" <c:if test="${necessidades.elimincaAdequada == true}">checked="checked"  </c:if> name="eliminacao"/></label> 
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Alterada <input onclick="escolheuSim('eliminacao');" type="radio" value="Alterada" <c:if test="${necessidades.elimincaAlterada == true}">checked="checked"  </c:if>  name="eliminacao"/></label> 
							</td>	
							<td style='padding: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.elimincaAdequada == true || necessidades.elimincaAlterada == null}">  </c:if> value="<c:out value="${necessidades.elimincaoQual}"></c:out>" id="eliminacaoQual" name="eliminacaoQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Nutri&ccedil;&atilde;o e metabolismo
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Adequada <input onclick="escolheuNao('nutricao');" type="radio" value="Adequada" <c:if test="${necessidades.nutricaoMetabolismoAdequada == true}">checked="checked"  </c:if>  name="nutricao"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Alterada <input onclick="escolheuSim('nutricao');" type="radio" value="Alterada" <c:if test="${necessidades.nutricaoMetabolismoAlterada == true}">checked="checked"  </c:if>  name="nutricao"/></label> 
							</td>	
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.nutricaoMetabolismoAdequada == true || necessidades.nutricaoMetabolismoAlterada == null}">   </c:if> id="nutricaoQual"  name="nutricaoQual" value="<c:out value="${necessidades.nutricaoMetabolismoQual}"></c:out>" />
							</td>
						</tr>
						<tr>
							<td style='padding: 10px;'>
								Sexualidade e reprodu&ccedil;&atilde;o
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Adequada <input onclick="escolheuNao('sexualidade');" value="Adequada" type="radio" <c:if test="${necessidades.sexualidadeReproducaoAdequada == true}">checked="checked"  </c:if> name="sexualidade"/></label> 
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Alterada <input onclick="escolheuSim('sexualidade');" value="Alterada" type="radio" <c:if test="${necessidades.sexualidadeReproducaoAlterada == true}">checked="checked"  </c:if>  name="sexualidade"/></label> 
							</td>	
							<td style='padding: 10px;'>
								Qual: <input type="text" size="15"  <c:if test="${necessidades.sexualidadeReproducaoAdequada == true || necessidades.sexualidadeReproducaoAlterada == null}">  </c:if> value="<c:out value="${necessidades.sexualidadeReproducaoQual}"></c:out>" name="sexualidadeQual" id="sexualidadeQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Percep&ccedil;&atilde;o da saúde e <br/>Gerenciamento da saúde
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Adequada <input onclick="escolheuNao('percepcao');" value="Adequada" type="radio" <c:if test="${necessidades.percepcaoSaudeAdequada == true}">checked="checked"  </c:if> name="percepcao"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Alterada <input onclick="escolheuSim('percepcao');" value="Alterada" type="radio" <c:if test="${necessidades.percepcaoSaudeAlterada == true}">checked="checked"  </c:if>  name="percepcao"/></label> 
							</td>	
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								Qual: <input type="text" size="15"  <c:if test="${necessidades.percepcaoSaudeAdequada == true || necessidades.percepcaoSaudeAlterada == null}">  </c:if> value="<c:out value="${necessidades.percepcaoSaudeQual}"></c:out>" id="percepcaoQual" name="percepcaoQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px;'>
								Atividade e exerc&iacute;cio
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Adequada <input onclick="escolheuNao('exercicio');" value="Adequada" type="radio" <c:if test="${necessidades.exercicioAdequada == true}">checked="checked"  </c:if>  name="exercicio"/></label> 
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Alterada <input onclick="escolheuSim('exercicio');" value="Alterada" type="radio" <c:if test="${necessidades.exercicioAlterada == true}">checked="checked"  </c:if> name="exercicio"/></label> 
							</td>	
							<td style='padding: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.exercicioAdequada == true || necessidades.exercicioAlterada == null}">   </c:if> value="<c:out value="${necessidades.exercicioQual}"></c:out>" id="exercicioQual"  name="exercicioQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Cogni&ccedil;&atilde;o
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Adequada <input onclick="escolheuNao('cognicao');" value="Adequada" type="radio" <c:if test="${necessidades.cognicaoAdequada == true}">checked="checked"  </c:if>  name="cognicao"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Alterada <input onclick="escolheuSim('cognicao');" value="Alterada" type="radio" <c:if test="${necessidades.cognicaoAlterada == true}">checked="checked"  </c:if>  name="cognicao"/></label> 
							</td>	
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.cognicaoAdequada == true || necessidades.cognicaoAlterada == null}">   </c:if> value="<c:out value="${necessidades.cognicaoQual}"></c:out>" id="cognicaoQual" name="cognicaoQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px;'>
								Papéis e relacionamentos
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Adequada  <input onclick="escolheuNao('relacionamentos');" value="Adequada" type="radio" <c:if test="${necessidades.papeisRelacionamentosAdequada == true}">checked="checked"  </c:if>  name="relacionamentos"/></label> 
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Alterada <input onclick="escolheuSim('relacionamentos');" value="Alterada" type="radio" <c:if test="${necessidades.papeisRelacionamentosAlterada == true}">checked="checked"  </c:if> name="relacionamentos"/></label> 
							</td>	
							<td style='padding: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.papeisRelacionamentosAdequada == true || necessidades.papeisRelacionamentosAlterada == null}">  </c:if> value="<c:out value="${necessidades.papeisRelacionamentosQual}"></c:out>" id="relacionamentosQual" name="relacionamentosQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Gerenciamento do estresse
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Adequada <input onclick="escolheuNao('estresse');" value="Adequada" type="radio"  <c:if test="${necessidades.gerenciamentoEstresseAdequada == true}">checked="checked"  </c:if> name="estresse"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Alterada <input onclick="escolheuSim('estresse');" value="Alterada" type="radio" <c:if test="${necessidades.gerenciamentoEstresseAlterada == true}">checked="checked"  </c:if>  name="estresse"/></label> 
							</td>	
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.gerenciamentoEstresseAdequada == true || necessidades.gerenciamentoEstresseAlterada == null}">   </c:if>  value="<c:out value="${necessidades.gerenciamentoEstresseQual}"></c:out>" id="estresseQual" name="estresseQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px;'>
								Autoconceito
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Ajustada  <input onclick="escolheuNao('autoconceito');" value="Adequada" type="radio" <c:if test="${necessidades.autoconceitoAdequada == true}">checked="checked"  </c:if> name="autoconceito"/></label> 
							</td>
							<td align="right" style='padding: 10px;'>
								<label>Alterada <input onclick="escolheuSim('autoconceito');" value="Alterada" type="radio" <c:if test="${necessidades.autoconceitoAlterada == true}">checked="checked"  </c:if> name="autoconceito"/></label> 
							</td>	
							<td style='padding: 10px;'>
								Qual: <input type="text" size="15" <c:if test="${necessidades.autoconceitoAdequada == true || necessidades.autoconceitoAlterada == null || necessidades.autoconceitoAlterada != true}"> </c:if>  value="<c:out value="${necessidades.autoconceitoQual}"></c:out>" id="autoconceitoQual" name="autoconceitoQual"/>
							</td>
						</tr>
						<tr>
							<td style='padding: 10px; background: #f1f1f1; border-top-left-radius: 10px; border-bottom-left-radius: 10px;'>
								Necessidades espirituais
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>Atendidas <input type="radio" value="Atendidas" <c:if test="${necessidades.necessidadesEspirituaisSim == true}">checked="checked"  </c:if> name="espirituais"/></label> 
							</td>
							<td align="right" style='padding: 10px;background: #f1f1f1;'>
								<label>N&atilde;o atendidas <input type="radio" value="Não Atendidas" <c:if test="${necessidades.necessidadesEspirituaisNao == true}">checked="checked"  </c:if> name="espirituais"/></label> 
							</td>
							<td style='padding: 10px;background: #f1f1f1; border-top-right-radius: 10px; border-bottom-right-radius: 10px;'>
								&nbsp;&nbsp;
							</td>	
						</tr>
					</table>
				<div align="left">
					<br />
					<input type="submit" name="save" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
					<input type="reset" name="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
				<br />	<c:if test="${atendimento.assinar == true }">
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