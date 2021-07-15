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

			document.form.coloracaopalidez.disabled = "disabled";
			document.form.coloracaocianose.disabled = "disabled";
			document.form.coloracaoictericia.disabled = "disabled";
			document.form.coloracaoeritema.disabled = "disabled";
			document.form.coloracaopetequias.disabled = "disabled";
			document.form.coloracaoequimoses.disabled = "disabled";
			document.form.coloracaohipocromia.disabled = "disabled";
			document.form.coloracaohipercromia.disabled = "disabled";
			document.form.coloracaooutros.disabled = "disabled";

			document.form.hidraxerodermia.disabled = "disabled";
			document.form.hidrahiperdrose.disabled = "disabled";
			document.form.hidrahidratada.disabled = "disabled";
			document.form.hidrataoutros.disabled = "disabled";

			document.getElementById('turgorpreservado').disabled = "disabled";
			document.getElementById('turgornaopreservado').disabled = "disabled";
			document.form.turgoroutros.disabled = "disabled";

			document.form.lesoespapula.disabled = "disabled";
			document.form.lesoesnodulo.disabled = "disabled";
			document.form.lesoestumor.disabled = "disabled";
			document.form.lesoesurticaria.disabled = "disabled";
			document.form.lesoesvesicula.disabled = "disabled";
			document.form.lesoesbolha.disabled = "disabled";
			document.form.lesoespustula.disabled = "disabled";
			document.form.lesoesabscesso.disabled = "disabled";
			document.form.lesoeshematoma.disabled = "disabled";
			document.form.lesoescicatriz.disabled = "disabled";
			document.form.lesoesescara.disabled = "disabled";
			document.form.lesoeserosao.disabled = "disabled";
			document.form.lesoesfissura.disabled = "disabled";
			document.form.lesoesfistula.disabled = "disabled";
			document.form.edema.disabled = "disabled";
			document.form.lesoesoutros.disabled = "disabled";
			
			document.form.feridascronicas.disabled = "disabled";
			document.form.feridascirurgicas.disabled = "disabled";
			document.form.feridastraumaticas.disabled = "disabled";
			document.form.feridasinfectadas.disabled = "disabled";
			document.form.feridastecido.disabled = "disabled";
			document.form.feridasgranuladas.disabled = "disabled";
			document.form.feridaseptelizadas.disabled = "disabled";
			document.form.feridasoutros.disabled = "disabled";

			document.form.unhaspalidez.disabled = "disabled";
			document.form.unhascianose.disabled = "disabled";
			document.form.unhasacastanhada.disabled = "disabled";
			document.form.unhasonicofagia.disabled = "disabled";
			document.form.unhasproniquia.disabled = "disabled";
			document.form.unhasescleroniquia.disabled = "disabled";
			document.form.unhasonicolise.disabled = "disabled";
			document.form.unhassujidade.disabled = "disabled";
			document.form.unhasoutros.disabled = "disabled";

			document.form.peloshipertricose.disabled = "disabled";
			document.form.peloshipotricose.disabled = "disabled";
			document.form.pelosalopecia.disabled = "disabled";
			document.form.pelosoutros.disabled = "disabled";
			
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";

			document.form.coloracaopalidez.disabled = false;
			document.form.coloracaocianose.disabled = false;
			document.form.coloracaoictericia.disabled = false;
			document.form.coloracaoeritema.disabled = false;
			document.form.coloracaopetequias.disabled = false;
			document.form.coloracaoequimoses.disabled = false;
			document.form.coloracaohipocromia.disabled = false;
			document.form.coloracaohipercromia.disabled = false;
			document.form.coloracaooutros.disabled = false;

			document.form.hidraxerodermia.disabled = false;
			document.form.hidrahiperdrose.disabled = false;
			document.form.hidrahidratada.disabled = false;
			document.form.hidrataoutros.disabled = false;

			document.getElementById('turgorpreservado').disabled = false;
			document.getElementById('turgornaopreservado').disabled = false;
			document.form.turgoroutros.disabled = false;

			document.form.lesoespapula.disabled = false;
			document.form.lesoesnodulo.disabled = false;
			document.form.lesoestumor.disabled = false;
			document.form.lesoesurticaria.disabled = false;
			document.form.lesoesvesicula.disabled = false;
			document.form.lesoesbolha.disabled = false;
			document.form.lesoespustula.disabled = false;
			document.form.lesoesabscesso.disabled = false;
			document.form.lesoeshematoma.disabled = false;
			document.form.lesoescicatriz.disabled = false;
			document.form.lesoesescara.disabled = false;
			document.form.lesoeserosao.disabled = false;
			document.form.lesoesfissura.disabled = false;
			document.form.lesoesfistula.disabled = false;
			document.form.edema.disabled = false;
			document.form.lesoesoutros.disabled = false;
			
			document.form.feridascronicas.disabled = false;
			document.form.feridascirurgicas.disabled = false;
			document.form.feridastraumaticas.disabled = false;
			document.form.feridasinfectadas.disabled = false;
			document.form.feridastecido.disabled = false;
			document.form.feridasgranuladas.disabled = false;
			document.form.feridaseptelizadas.disabled = false;
			document.form.feridasoutros.disabled = false;

			document.form.unhaspalidez.disabled = false;
			document.form.unhascianose.disabled = false;
			document.form.unhasacastanhada.disabled = false;
			document.form.unhasonicofagia.disabled = false;
			document.form.unhasproniquia.disabled = false;
			document.form.unhasescleroniquia.disabled = false;
			document.form.unhasonicolise.disabled = false;
			document.form.unhassujidade.disabled = false;
			document.form.unhasoutros.disabled = false;

			document.form.peloshipertricose.disabled = false;
			document.form.peloshipotricose.disabled = false;
			document.form.pelosalopecia.disabled = false;
			document.form.pelosoutros.disabled = false;
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
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Peles e Anexos</a>";
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
		 
			   <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Peles e Anexos</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<form name="pelesAnexos" method="get" action="pelesAnexos.do" >
    	 		 <h:hidden property="method" value="pelesAnexosSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:900px;">
			  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Peles e Anexos</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				 <div id="exame">
				  Colora&ccedil;&atilde;o da Pele <br/>
                                 Palidez<input name="coloracaopalidez" type="checkbox"<c:if test="${exame.coloracaoPalidez == true}"> checked="checked"</c:if> />
                                 Cianose<input type="checkbox" name="coloracaocianose" <c:if test="${exame.coloracaoCianose == true}"> checked="checked"</c:if>/>
                                 Icter&iacute;cia <input type="checkbox" name="coloracaoictericia" <c:if test="${exame.coloracaoIctericia == true}"> checked="checked"</c:if>/>
                                 Eritema<input type="checkbox" name="coloracaoeritema" <c:if test="${exame.coloracaoEritema == true}"> checked="checked"</c:if>/><br />
                                 Petéquias<input type="checkbox" name="coloracaopetequias"<c:if test="${exame.coloracaoPetequias == true}"> checked="checked"</c:if> />
                                 Equimoses <input type="checkbox" name="coloracaoequimoses"<c:if test="${exame.coloracaoEquimoses == true}"> checked="checked"</c:if> />
                                 Hipocromia<input type="checkbox" name="coloracaohipocromia" <c:if test="${exame.coloracaoHipocromia == true}"> checked="checked"</c:if>/>
                                 Hipercromia<input type="checkbox" name="coloracaohipercromia"<c:if test="${exame.coloracaoHipercromia == true}"> checked="checked"</c:if> />
			           	<br/><br/>
			             Outros <input type="text" size="20" name="coloracaooutros"  value="<c:out value="${exame.coloracaoOutros}"></c:out>" />
			       <br/><br/>
			  
			        Hidrata&ccedil;&atilde;o da pele <br/>
                                 Hidratada <input type="checkbox" name="hidrahidratada"<c:if test="${exame.hidratacaoHidratada == true}"> checked="checked"</c:if> />
                                 Xerodermia<input name="hidraxerodermia" type="checkbox" <c:if test="${exame.hidratacaoXerodermia == true}"> checked="checked"</c:if>/>
                                 Hiperidrose<input type="checkbox" name="hidrahiperdrose" <c:if test="${exame.hidratacaoHiperidrose == true}"> checked="checked"</c:if>/>
			           	<br/><br/>
			             Outros <input type="text" size="20" name="hidrataoutros" value="<c:out value="${exame.hidratacaoOutros}"></c:out>"/>
			       <br/><br/>
			        Turgor <br/>
                                 Preservado<input type="radio" name="turgor" id="turgorpreservado" value="turgorpreservado" <c:if test="${exame.tugorPreservado == true}"> checked="checked"</c:if>/>
                                 N&atilde;o-preservado<input type="radio" name="turgor" id="turgornaopreservado"  value="turgornaopreservado"<c:if test="${exame.tugorNaoPreservado == true}"> checked="checked"</c:if> />
			           	<br/><br/>
			             Outros <input type="text" size="20" name="turgoroutros" value="<c:out value="${exame.tugorOutros}"></c:out>"  />
			       <br/><br/>
			
			        Les&otilde;es <br/>
                                 P&aacute;pula<input name="lesoespapula" type="checkbox" <c:if test="${exame.lesoesPapula == true}"> checked="checked"</c:if>/>
                                 N&oacute;dulo<input type="checkbox" name="lesoesnodulo"<c:if test="${exame.lesoesNodulo == true}"> checked="checked"</c:if> />
                                 Tumor <input type="checkbox" name="lesoestumor" <c:if test="${exame.lesoesTumor == true}"> checked="checked"</c:if>/>
                                 Urtic&aacute;ria<input type="checkbox" name="lesoesurticaria" <c:if test="${exame.lesoesUrticaria == true}"> checked="checked"</c:if>/>
                                 Ves&iacute;cula<input type="checkbox" name="lesoesvesicula"<c:if test="${exame.lesoesVesicula == true}"> checked="checked"</c:if> />
                                 Bolha <input type="checkbox" name="lesoesbolha" <c:if test="${exame.lesoesBolha == true}"> checked="checked"</c:if>/>
                                 Pústula <input type="checkbox" name="lesoespustula" <c:if test="${exame.lesoesPustula == true}"> checked="checked"</c:if>/>
                                 Abscesso<input type="checkbox" name="lesoesabscesso" <c:if test="${exame.lesoesAbscesso == true}"> checked="checked"</c:if>/><br />
                                 Hematoma <input type="checkbox" name="lesoeshematoma"<c:if test="${exame.lesoesHematoma == true}"> checked="checked"</c:if> />
                                 Cicatriz <input type="checkbox" name="lesoescicatriz" <c:if test="${exame.lesoesCicatriz == true}"> checked="checked"</c:if>/>
                                 Escara<input type="checkbox" name="lesoesescara" <c:if test="${exame.lesoesEscara == true}"> checked="checked"</c:if>/>
                                 Eros&atilde;o <input type="checkbox" name="lesoeserosao" <c:if test="${exame.lesoesErosao == true}"> checked="checked"</c:if>/>
                                 Fissura <input type="checkbox" name="lesoesfissura"<c:if test="${exame.lesoesFissura == true}"> checked="checked"</c:if> />
                                 Fistula<input type="checkbox" name="lesoesfistula"<c:if test="${exame.lesoesFistula == true}"> checked="checked"</c:if> />
                                 Edema - Op&ccedil;&otilde;es
                                 <select name="edema">
                                 	<option value="">Selecione...</option>
                                 	<option value="+" <c:if test="${exame.lesoesEdema == '+'}"> selected="selected"</c:if>>+</option>
                                 	<option value="2+" <c:if test="${exame.lesoesEdema == '2+'}"> selected="selected"</c:if>>2+</option>
                                 	<option value="3+" <c:if test="${exame.lesoesEdema == '3+'}"> selected="selected"</c:if>>3+</option>
                                 	<option value="4+" <c:if test="${exame.lesoesEdema == '4+'}"> selected="selected"</c:if>>4+</option>
                                 </select>
			           	<br/><br/>
			             Outros <input type="text" size="20" name="lesoesoutros"  value="<c:out value="${exame.lesoesOutros}"></c:out>" />
			       <br/><br/>
			        Feridas <br/>
                                 Crônica<input name="feridascronicas" type="checkbox" <c:if test="${exame.feridasCronica == true}"> checked="checked"</c:if>/>
                                 Cirúrgica<input type="checkbox" name="feridascirurgicas" <c:if test="${exame.feridasCirurgica == true}"> checked="checked"</c:if>/>
                                 Traum&aacute;tica <input type="checkbox" name="feridastraumaticas" <c:if test="${exame.feridasTraumatica == true}"> checked="checked"</c:if> />
                                 Infectada<input type="checkbox" name="feridasinfectadas" <c:if test="${exame.feridasInfectada == true}"> checked="checked"</c:if>/><br />
                                 Tecido desvitalizado<input type="checkbox" name="feridastecido" <c:if test="${exame.feridasTecidoDesvitalizado == true}"> checked="checked"</c:if>/>
                                 Granulada <input type="checkbox" name="feridasgranuladas" <c:if test="${exame.feridasGranulada == true}"> checked="checked"</c:if>/>
                                 Epitelizada<input type="checkbox" name="feridaseptelizadas" <c:if test="${exame.feridasEpitelizada == true}"> checked="checked"</c:if>/>
			        <br/><br/>
			             Outros <input type="text" size="20" name="feridasoutros"  value="<c:out value="${exame.feridasOutros}"></c:out>" />
			       	<br/><br/>
			        Unhas <br/>
			        
                                 Palidez<input name="unhaspalidez" type="checkbox" <c:if test="${exame.unhasPalidez == true}"> checked="checked"</c:if>/>
                                 Cianose<input type="checkbox" name="unhascianose" <c:if test="${exame.unhasCianose == true}"> checked="checked"</c:if>/>
                                 Onicofagia<input type="checkbox" name="unhasonicofagia" <c:if test="${exame.unhasOnicofagia == true}"> checked="checked"</c:if>/><br />
                                 Sujidade <input type="checkbox" name="unhassujidade" <c:if test="${exame.unhasSujidade == true}"> checked="checked"</c:if>/>
                                 Hipercromia<input type="checkbox" name="unhashipercromia" <c:if test="${exame.unhasHipercromia == true}"> checked="checked"</c:if>/>
			           	<br/><br/>
			             Outros <input type="text" size="20" name="unhasoutros"  value="<c:out value="${exame.unhasOutros}"></c:out>" />
			        <br/><br/>
			        P&ecirc;los <br/>
                                 Hipertricose<input name="peloshipertricose" type="checkbox" <c:if test="${exame.pelosHipertricose == true}"> checked="checked"</c:if>/>
                                 Hipotricose<input type="checkbox" name="peloshipotricose" <c:if test="${exame.pelosHipotricose == true}"> checked="checked"</c:if>/>
                                 Alopecia <input type="checkbox" name="pelosalopecia" <c:if test="${exame.pelosAlopecia == true}"> checked="checked"</c:if>/>
			           	<br/><br/>
			             Outros <input type="text" size="20" name="pelosoutros"  value="<c:out value="${exame.pelosOutros}"></c:out>" />
				</div>
				<br/><br/>
			           <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
			          <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
		<br />	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
	</div>
	</form>
				
				<!--   -->
		 
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>