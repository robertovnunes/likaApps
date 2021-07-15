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

			document.form.sonsbulhas.disabled = "disabled";
			document.form.sonssopro.disabled = "disabled";
			document.form.sonsoestalidos.disabled = "disabled";
			document.form.sonsatritos.disabled = "disabled";
			document.form.sonsgalope.disabled = "disabled";
			document.form.sonsoutros.disabled = "disabled";
			
			document.getElementById('perfusaoadequada').disabled = "disabled";
			document.getElementById('perfusaoinadequada').disabled = "disabled";
			document.form.perfussaoonde.disabled = "disabled";
			document.form.perfusaooutros.disabled = "disabled";

			document.form.arteriasmacio.disabled = "disabled";
			document.form.arteriasduro.disabled = "disabled";
			document.form.compressaooutros.disabled = "disabled";
			
			document.form.arteriasnormal.disabled = "disabled";
			document.form.arteriascheio.disabled = "disabled";
			document.form.arteriasfiliforme.disabled = "disabled";
			document.form.arteriasoutros.disabled = "disabled";

			document.form.obs.disabled = "disabled";
		}else{

			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";

			document.form.sonsbulhas.disabled = false;
			document.form.sonssopro.disabled = false;
			document.form.sonsoestalidos.disabled = false;
			document.form.sonsatritos.disabled = false;
			document.form.sonsgalope.disabled = false;
			document.form.sonsoutros.disabled = false;
			
			document.getElementById('perfusaoadequada').disabled = false;
			document.getElementById('perfusaoinadequada').disabled = false;
			if(document.getElementById('perfusaoinadequada').checked){
				document.form.perfussaoonde.disabled = false;
			}
			document.form.perfusaooutros.disabled = false;

			document.form.arteriasmacio.disabled = false;
			document.form.arteriasduro.disabled = false;
			document.form.compressaooutros.disabled = false;
			
			document.form.arteriasnormal.disabled = false;
			document.form.arteriascheio.disabled = false;
			document.form.arteriasfiliforme.disabled = false;
			document.form.arteriasoutros.disabled = false;

			document.form.obs.disabled = false;
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
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      //  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a  style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a  style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a  style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a  style='color: white;text-decoration: none;' href='#'>Exame Físico</a> :: <a style='color: white;text-decoration: none;' href='#'>Sistema Cardiovascular</a>";
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
		 
		 
		  <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Sistema Cardiovasculas</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>
</c:if>
	<h:form action="sistCardio">
    	 		 <h:hidden property="method" value="sistCardioSalvar"/>  
    	 		 
	 <div id="conteudoNormal" align="left" style="height:600px;">
	  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Sistema Cardiovascular</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
				  Sons Card&iacute;acos<br/>
                                Bulhas normofonéticas<input name="sonsnormofoneticas" type="checkbox" <c:if test="${exame.sonsBulhasMormofoneticas == true}"> checked="checked"</c:if> />
                                 Bulhas hiperfonéticas<input type="checkbox" name="sonshiperfoneticas"  <c:if test="${exame.sonsBulhasHiperfoneticas == true}"> checked="checked"</c:if>/>
                                 Bulhas hipofonéticas <input type="checkbox" name="sonshipofoneticas" <c:if test="${exame.sonsBulhasHipofoneticas == true}"> checked="checked"</c:if>/><br/>
                                 Com sopros<input type="checkbox" name="sonscomsopros" <c:if test="${exame.sonsComSopros == true}"> checked="checked"</c:if> />
                                 Sem sopros<input type="checkbox"  name="sonssemsopros" <c:if test="${exame.sonsSemSopros == true}"> checked="checked"</c:if> />
           	<br/><br/>
            Outros <input name="sonsoutros" type="text" size="20" value="<c:out value="${exame.sonsOutros}"></c:out>"/>
            <br/><br/>
            Perfuss&atilde;o tissular<br/>
                                  Regular<input type="radio" id="perfusaoadequada" value="perfusaoadequada"  <c:if test="${exame.perfusaoRegular == true}"> checked="checked"</c:if> name="perfussao" onclick="escolheuNao('perfusao');" />
                                  Diminu&iacute;da<input type="radio" id="perfusaodiminuida" value="perfusaodiminuida" name="perfussao" <c:if test="${exame.perfusaoDiminuida == true}"> checked="checked"</c:if> onclick="escolheuSim('perfusao');" />
           	<br/><br/>
           	 Outros <input type="text" name="perfusaooutros" size="20" value="<c:out value="${exame.perfusaoOutros}"></c:out>" />
           	 
           	
           <br/><br/>
           	 Dor Tor&aacute;cica -  Car&aacute;ter<br/>
                                Constri&ccedil;&atilde;o<input name="dorconstricao" type="checkbox" <c:if test="${exame.dorConstricao == true}"> checked="checked"</c:if>/>
                                 Compress&atilde;o<input type="checkbox" name="dorcompressao" <c:if test="${exame.dorCompressao == true}"> checked="checked"</c:if> />
                                 Queima&ccedil;&atilde;o <input type="checkbox" name="dorqueimacao" <c:if test="${exame.dorQueimaxao == true}"> checked="checked"</c:if>/>
                                 Peso<input type="checkbox" name="dorpeso" <c:if test="${exame.dorPeso == true}"> checked="checked"</c:if>/>
                                 Pontada<input type="checkbox" name="dorpontada" <c:if test="${exame.dorPontada == true}"> checked="checked"</c:if>/>
           	<br/><br/>
             Outros <input type="text" name="doroutros" size="20" value="<c:out value="${exame.dorOutros}"></c:out>"/>
             
           <br/><br/>
            Dor Tor&aacute;cica -  Localiza&ccedil;&atilde;o<br/>
                                Retroesternal<input name="dorretroesternal" type="checkbox" <c:if test="${exame.dorRetroesternal == true}"> checked="checked"</c:if>/>
                                 Ombro esquerdo<input type="checkbox" name="dorombroesquerdo" <c:if test="${exame.dorOmbroEsquerdo == true}"> checked="checked"</c:if>/>
                                 Pesco&ccedil;o <input type="checkbox" name="dorpescoco" <c:if test="${exame.dorPescoco == true}"> checked="checked"</c:if> />
                                  Face  <input type="checkbox" name="dorface" <c:if test="${exame.dorFace == true}"> checked="checked"</c:if> /><br/>
                                 Regi&atilde;o interescapular<input type="checkbox" name="dorinterescapular" <c:if test="${exame.dorRegiaoInterescapular == true}"> checked="checked"</c:if> />
                                  Epig&aacute;strica  <input type="checkbox" name="dorepigastrica" <c:if test="${exame.dorEpigastrica == true}"> checked="checked"</c:if> />
           	<br/><br/>
           	
             Outros <input type="text" name="dorLocaloutros" size="20" value="<c:out value="${exame.dorLocalOutros}"></c:out>" />
           <br/><br/>
           
            Geral<br/>
                                Palpita&ccedil;&otilde;es <input name="geralpalpitacoes" type="checkbox" <c:if test="${exame.geralPalpitacoes == true}"> checked="checked"</c:if> />
                                 S&iacute;ncope<input type="checkbox" name="geralsincope" <c:if test="${exame.geralSincope == true}"> checked="checked"</c:if> />
                                 Edema em MMII <input type="checkbox" name="geralmmii" <c:if test="${exame.geralEdemaMMII == true}"> checked="checked"</c:if>/>
                                 Edema em MMSS<input type="checkbox" name="geralmmss"<c:if test="${exame.geralEdemaMMSS == true}"> checked="checked"</c:if> /><br/>
                                Anasarca<input type="checkbox" name="geralanasarca" <c:if test="${exame.geralAnasarca == true}"> checked="checked"</c:if> />
                                  Formigamento <input type="checkbox" name="geralformigamento" <c:if test="${exame.geralFormigamento == true}"> checked="checked"</c:if> />
                                  Câimbras<input type="checkbox" name="geralcaimbras" <c:if test="${exame.geralCaimbras == true}"> checked="checked"</c:if>/>
                                 Dor <input type="checkbox" name="geraldor" <c:if test="${exame.geralDor == true}"> checked="checked"</c:if>/><br/>
                                 Localiza&ccedil;&atilde;o<input name="geralLocal" type="text" id="geralLocal" size="10" value="<c:out value="${exame.geralLocal}"></c:out>"/>
                                 
           	<br/><br/>
             Outros <input type="text" name="geralOutros" size="20" value="<c:out value="${exame.geralOutros}"></c:out>"/>
           <br/><br/>
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