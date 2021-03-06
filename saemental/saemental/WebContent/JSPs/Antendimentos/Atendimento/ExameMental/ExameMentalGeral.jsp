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
       		function selecionouOutros(){
					var textBox = document.getElementById('divCompOutros');
					textBox.style.display = 'block';
            }

       		function naoSelecionouOutros(){
				var textBox = document.getElementById('divCompOutros');
				textBox.style.display = 'none';
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
		     //   	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      //  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Exame Mental Geral</a>";
        	}
        </script>	
			
		 
				  
				  
</head>
<body onload="navegacao();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1650px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1650px; display:inline-block;">
		 
		 <c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:2000px;"></div>	
</c:if>
	<form name="exameMentalGeral" method="get" action="exameMentalGeral.do" >
    	 		 <h:hidden property="method" value="exameMentalGeralSalvar"/>  
    	 		   <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
	<p id="titulo-verm" style='' align="left">::Exame Mental</p>    
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Apar&ecirc;ncia</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="center">
					Higienizado<input type="radio" <c:if test="${exame.aparenciaHigienizado == true}"> checked="checked"</c:if> id="aparenciaHigienizado" name="aparencia" value="aparenciaHigienizado" />
			</td>
			<td align="center">
					N&atilde;o Higienizado<input type="radio" <c:if test="${exame.aparenciaNaoHigienizado == true}"> checked="checked"</c:if> id="aparenciaNaoHigienizado" name="aparencia" value="aparenciaNaoHigienizado" />
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
	</table>
	<br/>
	
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Comportamento Motor</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right">
					Sem Anormalidade<input type="checkbox" id="comportamentoMotorSemAnormalidade" name="comportamentoMotorSemAnormalidade" <c:if test="${exame.comportamentoMotorSemAnormalidade == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Hiperativo<input type="checkbox" id="comportamentoMotorHiperativo" name="comportamentoMotorHiperativo" <c:if test="${exame.comportamentoMotorHiperativo == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Hipoativo<input type="checkbox" id="comportamentoMotorHipoativo" name="comportamentoMotorHipoativo" <c:if test="${exame.comportamentoMotorHipoativo == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Estereotipias<input type="checkbox" id="comportamentoMotorEstereotipias" name="comportamentoMotorEstereotipias" <c:if test="${exame.comportamentoMotorEstereotipias == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>	
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="comportamentoMotorOutros" value="<c:out value="${exame.comportamentoMotorOutros}"></c:out>"/>
			</td>
		</tr>	
	
	</table>
	<br/>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Comportamento com o Entrevistador</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right">
					Irritado<input type="checkbox" id="comportamentoEntrevistadorIrritado" name="comportamentoEntrevistadorIrritado" <c:if test="${exame.comportamentoEntrevistadorIrritado == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Cauteloso<input type="checkbox" id="comportamentoEntrevistadorCauteloso" name="comportamentoEntrevistadorCauteloso" <c:if test="${exame.comportamentoEntrevistadorCauteloso == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="140px">
					Ap&aacute;tico<input type="checkbox" id="comportamentoEntrevistadorApatico" name="comportamentoEntrevistadorApatico" <c:if test="${exame.comportamentoEntrevistadorApatico == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Sarc&aacute;stico<input type="checkbox" id="comportamentoEntrevistadorSarcastico" name="comportamentoEntrevistadorSarcastico" <c:if test="${exame.comportamentoEntrevistadorSarcastico == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="right">
					Taciturno<input type="checkbox" id="comportamentoEntrevistadorTaciturno" name="comportamentoEntrevistadorTaciturno" <c:if test="${exame.comportamentoEntrevistadorTaciturno == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Cooperativo<input type="checkbox" id="comportamentoEntrevistadorCooperativo" name="comportamentoEntrevistadorCooperativo" <c:if test="${exame.comportamentoEntrevistadorCooperativo == true}"> checked="checked"</c:if>/><br/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="comportamentoEntrevistadorOutros" value="<c:out value="${exame.comportamentoEntrevistadorOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<br/>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Estado Emocional</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right">
					Tranquilo<input type="checkbox" id="estadoEmocionalTranquilo" name="estadoEmocionalTranquilo" <c:if test="${exame.estadoEmocionalTranquilo == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Tenso<input type="checkbox" id="estadoEmocionalTenso" name="estadoEmocionalTenso" <c:if test="${exame.estadoEmocionalTenso == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Em p??nico<input type="checkbox" id="estadoEmocionalEmPanico" name="estadoEmocionalEmPanico" <c:if test="${exame.estadoEmocionalEmPanico == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right">
					Triste<input type="checkbox" id="estadoEmocionalTriste" name="estadoEmocionalTriste" <c:if test="${exame.estadoEmocionalTriste == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="estadoEmocionalOutros" value="<c:out value="${exame.estadoEmocionalOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Humor</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">		
					Eut&iacute;mico<input type="checkbox" id="humorEutimico" name="humorEutimico" <c:if test="${exame.humorEutimico == true}"> checked="checked"</c:if>/><br/>
			</td>
			<td align="right" width="100px">		
					Disf&oacute;rico<input type="checkbox" id="humorDisforico" name="humorDisforico" <c:if test="${exame.humorDisforico == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Expansivo<input type="checkbox" id="humorExpansivo" name="humorExpansivo" <c:if test="${exame.humorExpansivo == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Irrit&aacute;vel<input type="checkbox" id="humorIrritavel" name="humorIrritavel" <c:if test="${exame.humorIrritavel == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="humorOutros" value="<c:out value="${exame.humorOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Afeto</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="50px">
			</td>
			<td align="left" width="100px">		
					<div align="right" style="float:left;">Adequado ao<br/>conte??do</div>
					<div align="left"><input type="checkbox" id="afetoAdequadoAoConteudo" name="afetoAdequadoAoConteudo" <c:if test="${exame.afetoAdequadoAoConteudo == true}"> checked="checked"</c:if>/></div>
			</td>
			<td align="left" width="100px">	
					L&aacute;bil<input type="checkbox" id="afetoLabil" name="afetoLabil" <c:if test="${exame.afetoLabil== true}"> checked="checked"</c:if>/>
			</td>
			<td align="left" width="100px">		
					Embotado<input type="checkbox" id="afetoEmbotado" name="afetoEmbotado" <c:if test="${exame.afetoEmbotado == true}"> checked="checked"</c:if> />
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="afetoOutros" value="<c:out value="${exame.afetoOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Discurso</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">		
					Coerente<input type="checkbox" id="discursoCoerente" name="discursoCoerente" <c:if test="${exame.discursoCoerente == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Incoerente<input type="checkbox" id="discursoIncoerente" name="discursoIncoerente" <c:if test="${exame.discursoIncoerente == true}"> checked="checked"</c:if> /><br/>
			</td>
			<td align="right" width="100px">		
					Fluxo Acelerado<input type="checkbox" id="discursoFluxoAcelerado" name="discursoFluxoAcelerado" <c:if test="${exame.discursoFluxoAcelerado == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Fluxo Lento<input type="checkbox" id="discursoFluxoLento" name="discursoFluxoLento" <c:if test="${exame.discursoFluxoLento == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">		
					Prolixo<input type="checkbox" id="discursoProlixo" name="discursoProlixo" <c:if test="${exame.discursoProlixo == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Pobre<input type="checkbox" id="discursoPodre" name="discursoPodre" <c:if test="${exame.discursoPodre == true}"> checked="checked"</c:if>/><br/>
			</td>
			<td align="right" width="50px">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="discursoOutros" value="<c:out value="${exame.discursoOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<br/>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Dist??rbios</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">	
					Afetividade<input type="checkbox" id="disturbiosAfetividade" name="disturbiosAfetividade" <c:if test="${exame.disturbiosAfetividade == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Linguagem<input type="checkbox" id="disturbiosLinguagem" name="disturbiosLinguagem" <c:if test="${exame.disturbiosLinguagem == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Senso-Percep&ccedil;&atilde;o<input type="checkbox" id="disturbiosSensoPercepcao" name="disturbiosSensoPercepcao" <c:if test="${exame.disturbiosSensoPercepcao == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Aten&ccedil;&atilde;o<input type="checkbox" id="disturbiosAtencao" name="disturbiosAtencao" <c:if test="${exame.disturbiosAtencao == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">	
					Mem&oacute;ria<input type="checkbox" id="disturbiosMemoria" name="disturbiosMemoria" <c:if test="${exame.disturbiosMemoria == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Humor<input type="checkbox" id="disturbiosHumor" name="disturbiosHumor" <c:if test="${exame.disturbiosHumor == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Orienta&ccedil;&atilde;o<input type="checkbox" id="disturbiosOrientacao" name="disturbiosOrientacao" <c:if test="${exame.disturbiosOrientacao == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">	
					Consci&ecirc;ncia<input type="checkbox" id="disturbiosConsciencia" name="disturbiosConsciencia" <c:if test="${exame.disturbiosConsciencia == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="disturbiosOutros" value="<c:out value="${exame.disturbiosOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<br/>
	<table>
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Forma do Pensamento</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">
					Adequada<input type="checkbox" id="formaDoPensamentoAdequada" name="formaDoPensamentoAdequada" <c:if test="${exame.formaDoPensamentoAdequada == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Fuga de id??ias<input type="checkbox" id="formaDoPensamentoFugaDeIdeias" name="formaDoPensamentoFugaDeIdeias" <c:if test="${exame.formaDoPensamentoFugaDeIdeias == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Persevera&ccedil;&atilde;o <input type="checkbox" id="formaDoPensamentoPerseveracao" name="formaDoPensamentoPerseveracao" <c:if test="${exame.formaDoPensamentoPerseveracao == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Tangencialidade <input type="checkbox" id="formaDoPensamentoTangencialidade" name="formaDoPensamentoTangencialidade" <c:if test="${exame.formaDoPensamentoTangencialidade == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">		
					Circunstancialidade<input type="checkbox" id="formaDoPensamentoCircunstancialidade" name="formaDoPensamentoCircunstancialidade" <c:if test="${exame.formaDoPensamentoCircunstancialidade == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Neologismos <input type="checkbox" id="formaDoPensamentoNeologismos" name="formaDoPensamentoNeologismos" <c:if test="${exame.formaDoPensamentoNeologismos == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="100px">		
					Bloqueio de <input type="checkbox" id="formaDoPensamentoBloqueioDePensamento" name="formaDoPensamentoBloqueioDePensamento" <c:if test="${exame.formaDoPensamentoBloqueioDePensamento == true}"> checked="checked"</c:if> />
					<span style="margin-right: 20px;">pensamento</span>
			</td>
			<td align="right" width="100px">		
					Pensamento <input type="checkbox" id="formaDoPensamentoPensamentoIncoerente" name="formaDoPensamentoPensamentoIncoerente" <c:if test="${exame.formaDoPensamentoPensamentoIncoerente == true}"> checked="checked"</c:if>/>
					<span style="margin-right: 20px;">incoerente</span>
			</td>
			<td align="right" width="50px">
			
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">		
					Ecolalia<input type="checkbox" id="formaDoPensamentoEcolalia" name="formaDoPensamentoEcolalia" <c:if test="${exame.formaDoPensamentoEcolalia == true}"> checked="checked"</c:if>/>
			</td>
			<td align="right" width="50px">
			
			</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="formaDoPensamentoOutros" value="<c:out value="${exame.formaDoPensamentoOutros}"></c:out>" />
			</td>
		</tr>
	</table>
	<br/>
	<table>	
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Conte??do  do Pensamento</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">     
                     Adequado<input type="checkbox" id="conteudoDoPensamentoAdequado" name="conteudoDoPensamentoAdequado" <c:if test="${exame.conteudoDoPensamentoAdequado == true}"> checked="checked"</c:if>/>
             </td>
			<td align="right" width="100px">       
                     Depressivo<input type="checkbox" id="conteudoDoPensamentoDepressivo" name="conteudoDoPensamentoDepressivo" <c:if test="${exame.conteudoDoPensamentoDepressivo == true}"> checked="checked"</c:if>/>
           </td>
			<td align="right" width="100px">         
                     Ansioso<input type="checkbox" id="conteudoDoPensamentoAnsioso" name="conteudoDoPensamentoAnsioso" <c:if test="${exame.conteudoDoPensamentoAnsioso == true}"> checked="checked"</c:if>/>
           </td>
			<td align="right" width="100px">         
                     F&oacute;bico <input type="checkbox" id="conteudoDoPensamentoFobico" name="conteudoDoPensamentoFobico" <c:if test="${exame.conteudoDoPensamentoFobico == true}"> checked="checked"</c:if>/>
            </td>
            <td align="right" width="50px">
			
			</td>
        </tr>
		<tr>
			<td align="right" width="100px">        
                     Obsessivo<input type="checkbox" id="conteudoDoPensamentoObsessivo" name="conteudoDoPensamentoObsessivo" <c:if test="${exame.conteudoDoPensamentoObsessivo == true}"> checked="checked"</c:if>/>
            </td>
             <td align="right" width="50px">
			
			</td>
       	</tr>
		<tr>
			<td align="center" colspan="7">
				<br/>
				Outros: <input type="text" name="conteudoDoPensamentoOutros" value="<c:out value="${exame.conteudoDoPensamentoOutros}"></c:out>"/>
			</td>
		</tr>
	</table>
	<br/>
	<table>	
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">Capacidade de abstra&ccedil;&atilde;o </div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td align="right" width="100px">
                     Sim<input type="radio" value="capacidadeDeAbstracaoSim" id="capacidadeDeAbstracaoSim" name="capacidadeDeAbstracao" <c:if test="${exame.capacidadeDeAbstracaoSim == true}"> checked="checked"</c:if>/>
             </td>
			<td align="right" width="100px">      
                     N&atilde;o<input type="radio" value="capacidadeDeAbstracaoNao" id="capacidadeDeAbstracaoNao" name="capacidadeDeAbstracao" <c:if test="${exame.capacidadeDeAbstracaoNao == true}"> checked="checked"</c:if>/>
            </td>
             <td align="right" width="50px">
			
			</td>
        </tr>
	</table>
	<br/>
	<table>	
		<tr>
			<td colspan="10" width="650px">
				<div class="titulo">N&iacute;vel de Cr&iacute;tica</div>
  				 <div class="sessao"></div>
			</td>
		</tr>
		<tr>
			<td>
				Percep&ccedil;&atilde;o da presen&ccedil;a de um problema f&iacute;sico ou mental 
				<br/>
                   Sim<input type="radio" id="criticaPercepcaoDeUmProblemaFisicoMentalSim" name="criticaPercepcaoDeUmProblemaFisicoMental"  value="criticaPercepcaoDeUmProblemaFisicoMentalSim" <c:if test="${exame.criticaPercepcaoDeUmProblemaFisicoMentalSim == true}"> checked="checked"</c:if>/>
                    N&atilde;o<input type="radio" id="criticaPercepcaoDeUmProblemaFisicoMentalNao" name="criticaPercepcaoDeUmProblemaFisicoMental" value="criticaPercepcaoDeUmProblemaFisicoMentalNao" <c:if test="${exame.criticaPercepcaoDeUmProblemaFisicoMentalNao == true}"> checked="checked"</c:if>/>
                    <br/><br/>
			</td>
		</tr>
		<tr>
			<td>
				Nega&ccedil;&atilde;o da Doen&ccedil;a 
				<br/>
                   Sim<input type="radio" id="criticaNegacaoDaDoencaSim" name="criticaNegacaoDaDoenca" value="criticaNegacaoDaDoencaSim" <c:if test="${exame.criticaNegacaoDaDoencaSim == true}"> checked="checked"</c:if>/>
                    N&atilde;o<input type="radio" id="criticaNegacaoDaDoencaNao" name="criticaNegacaoDaDoenca" value="criticaNegacaoDaDoencaNao" <c:if test="${exame.criticaNegacaoDaDoencaNao == true}"> checked="checked"</c:if>/>
                    <br/><br/>
			</td>
		</tr>
		<tr>
			<td>
				Reconhecimento da necessidade de tratamento  
				<br/>
                   Sim<input type="radio" id="criticaReconhecimentoDaNecessidadeDeTratamentoSim" name="criticaReconhecimentoDaNecessidadeDeTratamento" value="criticaReconhecimentoDaNecessidadeDeTratamentoSim" <c:if test="${exame.criticaReconhecimentoDaNecessidadeDeTratamentoSim == true}"> checked="checked"</c:if>/>
                    N&atilde;o<input type="radio" id="criticaReconhecimentoDaNecessidadeDeTratamentoNao" name="criticaReconhecimentoDaNecessidadeDeTratamento" value="criticaReconhecimentoDaNecessidadeDeTratamentoNao" <c:if test="${exame.criticaReconhecimentoDaNecessidadeDeTratamentoNao == true}"> checked="checked"</c:if>/>
                    <br/><br/>
			</td>
		</tr>
	</table>
	<br /><br />
                	  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
	<br />
					<div style="margin-left:100px;">
						<input type="submit" name="save" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
						<input type="reset" name="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
                <br />	<c:if test="${atendimento.assinar == true }">
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