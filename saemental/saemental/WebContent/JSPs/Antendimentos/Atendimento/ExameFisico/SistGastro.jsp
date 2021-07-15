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

			document.form.abdomennormal.disabled = "disabled";
			document.form.abdomenplano.disabled = "disabled";
			document.form.abdomenbatraquio.disabled = "disabled";
			document.form.abdomenpendular.disabled = "disabled";
			document.form.abdomenavental.disabled = "disabled";
			document.form.abdomenescavado.disabled = "disabled";
			document.form.abdomenoutros.disabled = "disabled";

			document.form.cicatrizplano.disabled = "disabled";
			document.form.cicatrizretraido.disabled = "disabled";
			document.form.cicatrizprotruso.disabled = "disabled";
			document.form.cicatrizoutros.disabled = "disabled";

			document.getElementById('retraidosim').disabled = "disabled";
			document.getElementById('retraidoNao').disabled = "disabled";

			document.getElementById('indigestaosim').disabled = "disabled";
			document.getElementById('indigestaoNao').disabled = "disabled";

			document.getElementById('vomitossim').disabled = "disabled";
			document.getElementById('vomitosNao').disabled = "disabled";

			document.getElementById('hematemesesim').disabled = "disabled";
			document.getElementById('hematemeseNao').disabled = "disabled";

			document.getElementById('diarreiasim').disabled = "disabled";
			document.getElementById('diarreiaNao').disabled = "disabled";

			document.getElementById('constipacaosim').disabled = "disabled";
			document.getElementById('constipacaoNao').disabled = "disabled";
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";

			document.form.abdomennormal.disabled = false;
			document.form.abdomenplano.disabled = false;
			document.form.abdomenbatraquio.disabled = false;
			document.form.abdomenpendular.disabled = false;
			document.form.abdomenavental.disabled = false;
			document.form.abdomenescavado.disabled = false;
			document.form.abdomenoutros.disabled = false;

			document.form.cicatrizplano.disabled = false;
			document.form.cicatrizretraido.disabled = false;
			document.form.cicatrizprotruso.disabled = false;
			document.form.cicatrizoutros.disabled = false;

			document.getElementById('retraidosim').disabled = false;
			document.getElementById('retraidoNao').disabled = false;

			document.getElementById('indigestaosim').disabled = false;
			document.getElementById('indigestaoNao').disabled = false;

			document.getElementById('vomitossim').disabled = false;
			document.getElementById('vomitosNao').disabled = false;

			document.getElementById('hematemesesim').disabled = false;
			document.getElementById('hematemeseNao').disabled = false;

			document.getElementById('diarreiasim').disabled = false;
			document.getElementById('diarreiaNao').disabled = false;

			document.getElementById('constipacaosim').disabled = false;
			document.getElementById('constipacaoNao').disabled = false;
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
        	
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        	//var div = window.top.document.getElementById('dadosPaciente');
		       // 	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		        //	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Sistema Gastrointestinal</a>";
        	}
        </script>
			
			
		 
				  
				  
</head>
<body onload="navegacao();semQueixa();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1700px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1600px; display:inline-block;">
		 
		 
			    <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Sistema Gastrintestinal</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<h:form action="sistGastro">
    	 		 <h:hidden property="method" value="sistGastroSalvar"/> 
	 <div id="conteudoNormal" align="left" style="height:1700px;">
	 	 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Sistema Gastrintestinal</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" type="checkbox" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
				  Forma do abdômen <br/>
								  Plano<input name="abdomenplano" type="checkbox" <c:if test="${exame.plano == true}"> checked="checked"</c:if>/>
                                Globoso<input name="abdomengloboso" type="checkbox" <c:if test="${exame.globoso == true}"> checked="checked"</c:if>/>
                                 Semigloboso<input type="checkbox" name="abdomensemigloboso" <c:if test="${exame.semigloboso == true}"> checked="checked"</c:if>/>
                                 Escavado<input type="checkbox" name="abdomenescavado" <c:if test="${exame.escavado == true}"> checked="checked"</c:if> />
           	<br/><br/>
             Outros <input type="text" name="abdomenoutros" size="20"  value="<c:out value="${exame.abdomenOutros}"></c:out>" />
           <br/><br/>
           	Anorexia<br/>
                                Sim<input type="radio" id="anorexiaSim" value="anorexiaSim" name="anorexia" <c:if test="${exame.anorexiaSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="anorexiaNao" value="anorexiaNao" name="anorexia" <c:if test="${exame.anorexiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           	Ascite <br/>
           						Sim<input type="radio" id="asciteSim" value="asciteSim" name="ascite" <c:if test="${exame.asciteSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="asciteNao" value="asciteNao" name="ascite" <c:if test="${exame.asciteNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           	C&oacute;licas<br/>
                                Sim<input type="radio" id="colicasSim" value="colicasSim" name="colicas" <c:if test="${exame.colicasSim == true}"> checked="checked"</c:if> />
                                 N&atilde;o<input type="radio" id="colicasNao" value="colicasNao" name="colicas" <c:if test="${exame.colicasNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           	Constipa&ccedil;&atilde;o<br/>
                                Sim<input type="radio" id="constipacaoSim" value="constipacaoSim" name="constipacao" <c:if test="${exame.constipacaoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="constipacaoNao" value="constipacaoNao" name="constipacao" <c:if test="${exame.constipacaoNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Diarréia<br/>
           		
                                Sim<input type="radio" id="diarreiaSim" value="diarreiaSim" name="diarreia" <c:if test="${exame.diarreiaSim == true}"> checked="checked"</c:if> />
                                 N&atilde;o<input type="radio" id="diarreiaNao" value="diarreiaNao" name="diarreia"<c:if test="${exame.diarreiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Disfagia<br/>
                                Sim<input type="radio" id="disfagiaSim" value="disfagiaSim" name="disfagia" <c:if test="${exame.disfagiaSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="disfagiaNao" value="disfagiaNao" name="disfagia" <c:if test="${exame.disfagiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Dispepsia<br/>
                                Sim<input type="radio" id="dispepsiaSim" value="dispepsiaSim" name="dispepsia" <c:if test="${exame.dispepsiaSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="dispepsiaNao" value="dispepsiaNao" name="dispepsia" <c:if test="${exame.dispepsiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Distens&atilde;o Abdominal<br/>
                                Sim<input type="radio" id="distensaoSim" value="distensaoSim" name="distensao" <c:if test="${exame.distensaoAbdominalSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="distensaoNao" value="distensaoNao" name="distensao"<c:if test="${exame.distensaoAbdominalNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Eructa&ccedil;&atilde;o<br/>
                                Sim<input type="radio" id="eructacaoSim" value="eructacaoSim" name="eructacao" <c:if test="${exame.eructacaoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="eructacaoNao" value="eructacaoNao" name="eructacao" <c:if test="${exame.eructacaoNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Flatul&ecirc;ncia<br/>
                                Sim<input type="radio" id="flatulenciaSim" value="flatulenciaSim" name="flatulencia" <c:if test="${exame.flatulenciaSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="flatulenciaNao" value="flatulenciaNao" name="flatulencia" <c:if test="${exame.flatulenciaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Ganho de Peso<br/>
                                Sim<input type="radio" id="ganhopesoSim" value="ganhopesoSim" name="ganhopeso" <c:if test="${exame.ganhoPesoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="ganhopesoNao" value="ganhopesoNao" name="ganhopeso" <c:if test="${exame.ganhoPesoNao == true}"> checked="checked"</c:if>/>
             	<br/><br/>
           		Halitose<br/>
                                Sim<input type="radio" id="halitose" value="halitoseSim" name="halitose" <c:if test="${exame.halitoseSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="halitose" value="halitoseNao" name="halitose" <c:if test="${exame.halitoseNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Hemat&ecirc;mese <br/>
                                Sim<input type="radio" id="hematemeseSim" value="hematemeseSim" name="hematemese" <c:if test="${exame.hematemeseSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="hematemeseNao" value="hematemeseNao" name="hematemese" <c:if test="${exame.hematemeseNao == true}"> checked="checked"</c:if>/>    
           <br/><br/>
           Melena<br/>
                                Sim<input type="radio" id="melenaSim" value="melenaSim" name="melena" <c:if test="${exame.melenaSim == true}"> checked="checked"</c:if> />
                                 N&atilde;o<input type="radio" id="melenaNao" value="melenaNao" name="melena" <c:if test="${exame.melenaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		N&aacute;useas<br/>
                                Sim<input type="radio" id="nauseasSim" value="nauseasSim" name="nauseas" <c:if test="${exame.nauseasSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="nauseasNao" value="nauseasNao" name="nauseas" <c:if test="${exame.nauseasNao == true}"> checked="checked"</c:if>/>
             	<br/><br/>
           		Odinofagia<br/>
           		
                                Sim<input type="radio" id="odinofagiaSim" value="odinofagiaSim" name="odinofagia"<c:if test="${exame.odinofagiaSim == true}"> checked="checked"</c:if> />
                                 N&atilde;o<input type="radio" id="odinofagiaNao" value="odinofagiaNao" name="odinofagia" <c:if test="${exame.odinofagiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Perda de Peso<br/>
                                Sim<input type="radio" id="perdapesoSim" value="perdapesoSim" name="perdapeso" <c:if test="${exame.perdaPesoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="perdapesoNao" value="perdapesoNao" name="perdapeso" <c:if test="${exame.perdaPesoNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Pirose<br/>
                                Sim<input type="radio" id="piroseSim" value="piroseSim" name="pirose" <c:if test="${exame.piroseSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="piroseNao" value="piroseNao" name="pirose" <c:if test="${exame.piroseNao == true}"> checked="checked"</c:if>/>
             	<br/><br/>
           		Refluxo<br/>
                                Sim<input type="radio" id="refluxoSim" value="refluxoSim" name="refluxo" <c:if test="${exame.refluxoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="refluxoNao" value="refluxoNao" name="refluxo" <c:if test="${exame.refluxoNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
            	Sialorréia<br/>
                                Sim<input type="radio" id="sialorreiaSim" value="sialorreiaSim" name="sialorreia" <c:if test="${exame.sialorreiaSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="sialorreiaNao" value="sialorreiaNao" name="sialorreia" <c:if test="${exame.sialorreiaNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           		Singulto<br/>
                                Sim<input type="radio" id="singultoSim" value="singultoSim" name="singulto" <c:if test="${exame.singultoSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="singultoNao" value="singultoNao" name="singulto" <c:if test="${exame.singultoNao == true}"> checked="checked"</c:if>/>
             	<br/><br/>
           		Vômitos<br/>
                                Sim<input type="radio" id="vomitosSim" value="vomitosSim" name="vomitos" <c:if test="${exame.vomitosSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="vomitosNao" value="vomitosNao" name="vomitos" <c:if test="${exame.vomitosNao == true}"> checked="checked"</c:if>/>
           	<br/><br/>
           	Dor<br/>
                                Sim<input type="radio" id="dorSim" value="dorSim" name="dor" <c:if test="${exame.dorSim == true}"> checked="checked"</c:if>/>
                                 N&atilde;o<input type="radio" id="dorNao" value="dorNao" name="dor" <c:if test="${exame.dorNao == true}"> checked="checked"</c:if>/>
                                Onde<input name="dorOnde" type="text" id="dorOnde" size="10"  value="<c:out value="${exame.dorOnde}"></c:out>" />
           	<br/><br/>
		                 Outros <input type="text" size="20" name="outros"  value="<c:out value="${exame.outros}"></c:out>"  <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if>/>
		                 
		                <br/><br/>
            </div>
            <br /><br />
                  <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                  <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
			<br /><c:if test="${atendimento.assinar == true }">
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