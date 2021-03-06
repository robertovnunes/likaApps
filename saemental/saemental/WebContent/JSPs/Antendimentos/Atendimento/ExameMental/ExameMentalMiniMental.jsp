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
        	
            
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		  <script type="text/javascript">
        	function navegacao(){
	        	//var div = window.top.document.getElementById('dadosPaciente');
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
				
				
    	<div id="conteudoNormal" align="center" style="height:1500px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1500px; display:inline-block;">
		 
		 <c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:1500px; "></div>	
</c:if>
            	<form name="exameMentalMiniMental" method="get" action="exameMentalMiniMental.do" >
    	 		 <h:hidden property="method" value="exameMentalMiniMentalSalvar"/>  
            	 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
            	    <p id="titulo-verm" style='' align="left">::Mini-Mental</p> 
                	
                 	<div class="titulo">Orienta&ccedil;&atilde;o</div>
  				 	<div class="sessao"></div>
  				 	Pontuação do Exame: <c:out value="${exame.pontuacao}"></c:out>
  				 	<br/><br/>
					(1 ponto por cada resposta correta) 
					<br /><br />
                    <table style="color:#003399;font-family:Verdana,Arial;font-size:12px;text-decoration:none;">
						<tr>
						<td>
						Em que ano estamos?									
						</td>
						<td>
							 <input type="checkbox" name="emQueAnoEstamos"  <c:if test="${exame.emQueAnoEstamos == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Em que m&ecirc;s estamos?									
						</td>
						<td>
							 <input type="checkbox" name="emQueMesEstamos"  <c:if test="${exame.emQueMesEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que dia do m&ecirc;s estamos? 										
						</td>
						<td>
							 <input type="checkbox" name="emQueDiaDoMesEstamos"  <c:if test="${exame.emQueDiaDoMesEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que dia da semana estamos?								
						</td>
						<td>
							 <input type="checkbox" name="emQueDiaDaSemanaEstamos"  <c:if test="${exame.emQueDiaDaSemanaEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que esta&ccedil;&atilde;o do ano estamos? 								
						</td>
						<td>
							 <input type="checkbox" name="emQueEstacaoDoAnoEstamos"  <c:if test="${exame.emQueEstacaoDoAnoEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>		
               
						<tr>
						<td>
						Em que pa&iacute;s estamos?									
						</td>
						<td>
							 <input type="checkbox" name="emQuePaisEstamos"  <c:if test="${exame.emQuePaisEstamos == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Em que distrito vive?									
						</td>
						<td>
							 <input type="checkbox" name="emQueDistritoVive"  <c:if test="${exame.emQueDistritoVive == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que terra vive? 										
						</td>
						<td>
							 <input type="checkbox" name="emQueTerraVive"  <c:if test="${exame.emQueTerraVive == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que casa estamos?								
						</td>
						<td>
							 <input type="checkbox" name="emQueCasaEstamos"  <c:if test="${exame.emQueCasaEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
						<tr>
						<td>
						Em que andar estamos? 								
						</td>
						<td>
							 <input type="checkbox" name="emQueAndarEstamos"  <c:if test="${exame.emQueAndarEstamos == true}"> checked="checked"</c:if>/>
						</td>							
						</tr>						
	
					</table>
					<br/><br/>
					<div class="titulo">Reten&ccedil;&atilde;o</div>
  				 	<div class="sessao"></div>
				(contar 1 ponto por cada palavra corretamente repetida) 
				<br />
				"Vou dizer tr&ecirc;s palavras; queria que as repetisse, mas s&oacute; depois que eu disser todas.
					<br /><br />
                    <table style="color:#003399;font-family:Verdana,Arial;font-size:12px;text-decoration:none;">
						<tr>
						<td>
						P&ecirc;ra								
						</td>
						<td>
							 <input type="checkbox" name="retensaoPera"  <c:if test="${exame.retensaoPera == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Gato								
						</td>
						<td>
							 <input type="checkbox" name="retensaoGato"  <c:if test="${exame.retensaoGato == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Bola							
						</td>
						<td>
							 <input type="checkbox" name="retensaoBola"  <c:if test="${exame.retensaoBola == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
                        </table>
                        <br/><br/>
                        <div class="titulo">Aten&ccedil;&atilde;o e C&aacute;lculo</div>
  				 		<div class="sessao"></div>
                        (1 ponto por cada resposta correta.)
                        <br/> <br/>
                        (Caso haja alguma resposta errada, mas depois a resposta continue adequada poderemos considerar as seguintes como corretas. Parar ao fim de 5 respostas) 
                        <br/> <br/>
                        "Agora me diga quantos s&atilde;o 30 menos 3 e depois ao número encontrado volta a tirar 3 e repete assim até eu lhe dizer para parar". 
                        <br/> <br/>
                        27_ 24_ 21 _ 18_ 15_ 	( colocar em check list o valor 0, o valor 1,o valor,2 valor 3, valor 4  e o valor 5)
                        <br/>
                        <br/>
                        <br/>
                        <table style="color:#003399;font-family:Verdana,Arial;font-size:12px;text-decoration:none;">
                            <tr>
                                <td>
                                    Nota:
                                </td>
                                <td>
                                    <select name="atencaoCalculo">
                                    	<option value="0"  <c:if test="${exame.atencaoCalculo == '0'}">selected="selected"</c:if>>0</option>
										<option value="1"  <c:if test="${exame.atencaoCalculo == '1'}">selected="selected"</c:if>>1</option>
										<option value="2"  <c:if test="${exame.atencaoCalculo == '2'}">selected="selected"</c:if>>2</option>
										<option value="3"  <c:if test="${exame.atencaoCalculo == '3'}">selected="selected"</c:if>>3</option>
										<option value="4"  <c:if test="${exame.atencaoCalculo == '4'}">selected="selected"</c:if>>4</option>
										<option value="5"  <c:if test="${exame.atencaoCalculo == '5'}">selected="selected"</c:if>>5</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <br/><br/>
						
                        <div class="titulo">Evoca&ccedil;&atilde;o</div>
  				 		<div class="sessao"></div>
						(1 ponto por cada resposta correta.) <br /><br />
						"Veja se consegue dizer as tr&ecirc;s palavras que pedi h&aacute; pouco para decorar". 
					<br /><br />
                    <table style="color:#003399;font-family:Verdana,Arial;font-size:12px;text-decoration:none;">
						<tr>
						<td>
						P&ecirc;ra								
						</td>
						<td>
							 <input type="checkbox" name="evocacaoPera"  <c:if test="${exame.evocacaoPera == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Gato								
						</td>
						<td>
							 <input type="checkbox" name="evocacaoGato"  <c:if test="${exame.evocacaoGato == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						Bola							
						</td>
						<td>
							 <input type="checkbox" name="evocacaoBola"  <c:if test="${exame.evocacaoBola == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
					</table>
					<br/><br/>
					<div class="titulo">Linguagem</div>
  				 		<div class="sessao"></div>
						(1 ponto por cada resposta correta) <br /><br />
						"Como se chama isto? Mostrar os objetos: 
					<br /><br />
                    <table style="color:#003399;font-family:Verdana,Arial;font-size:12px;text-decoration:none;">
						<tr>
						<td>
						Rel&oacute;gio								
						</td>
						<td>
							 <input type="checkbox" name="linguagemRelogio"  <c:if test="${exame.linguagemRelogio == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						<tr>
						<td>
						L&aacute;pis							
						</td>
						<td>
							 <input type="checkbox" name="linguagemLapis"  <c:if test="${exame.linguagemLapis == true}"> checked="checked"</c:if>/>
						</td>	
						</tr>
						
					</table>
					<br />
					"Repita a frase que eu vou dizer: O RATO ROEU A ROLHA"<input type="checkbox" name="fraseDecorar" <c:if test="${exame.fraseDecorar == true}"> checked="checked"</c:if> />
					<br /><br />
					 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
			            <br /><br />
					<div style="margin-left:100px;">
						<input type="submit" name="save" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
						<input type="reset" name="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
            <br />  	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
                	</div>
                	</form>
		 
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>