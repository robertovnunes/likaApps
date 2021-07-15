	<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

 				<%@ include file="../menu.jsp"%>
                <br/>
                <br/>
                <link href="Css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
                <div id="menu3" style="display:inline-block; vertical-align:top; text-align: justify; margin-right: 50px;">
                
                   	 <p id="titulo-verm" style='' align="left">
                   		<c:if test="${atendimento.tipo == 'ADMISSAO'}">Admissão</c:if>
                        <c:if test="${atendimento.tipo == 'READMISSAO'}">Readmissão</c:if>
                        <c:if test="${atendimento.tipo == 'EVOLUCAO'}">Evolução</c:if>
                   	 </p>
					<b>
						Ident.:<c:if test="${atendimento.tipo == 'ADMISSAO'}">A</c:if><c:if test="${atendimento.tipo == 'READMISSAO'}">R</c:if><c:if test="${atendimento.tipo == 'EVOLUCAO'}">E</c:if><c:out value="${atendimento.id}"></c:out>-P<c:out value="${atendimento.prontuario.id}"></c:out>
	               	</b>	
	               	
               		<br /><br />
               		<div id='menu-atendimento' style="text-align: left;">
                    <ul style="z-index:2 !important;">
                        <li>
                           <a href="atendimento.do?method=mostrarTelaAtendimentoQueixa"  onclick="redimensionar('1100px');">Queixa da doen&ccedil;a atual</a>
                        </li>
                        <c:if test="${atendimento.tipo != 'EVOLUCAO'}">
                         <li class='has-sub'>
                            <a href="#">Hist&oacute;rico</a>
                            <ul>
                                <li>
                                    <a href="atendimento.do?method=mostrarTelaAtendimentoAntPessoais"  onclick="redimensionar('3500px');">Antecedente Pessoais</a>
                                </li>
                                <li class='last'>
                                    <a href="atendimento.do?method=mostrarTelaAtendimentoAntFamiliares"  onclick="redimensionar('700px');">Antecedentes Familiares</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <li>
                            <a href="atendimento.do?method=mostrarTelaAtendimentoNecessidades"  onclick="redimensionar('600px');">Necessidades B&aacute;sicas</a>
                            
                        </li>
						 <li>
                            <a href="exameFisico.do?method=mostrarTelaExameFisicoEscolhido&exameEscolhido=fExameFisicoSinaisVitais"  onclick="redimensionar('700px');">Exame F&iacute;sico</a>
                           
                        </li>
						 <li class='has-sub'>
                            <a href="#">Exame Mental</a>
                             <ul>
                                <li>
                                    <a href="atendimento.do?method=mostrarTelaAtendimentoExMentalGeral"  onclick="redimensionar('2000px');">Exame Geral</a>
                                </li>
                                <li class='last'>
                                    <a href="atendimento.do?method=mostrarTelaAtendimentoExMentalMini"  onclick="redimensionar('1500px');">Mini-Mental</a>
                                </li>
                            </ul>
                        </li>
                         <li class='last'>
                            <a href="atendimento.do?method=mostrarTelaAdmissaProcEnfermagem"  onclick="redimensionar('1100px');">Diagn&oacute;sticos e Interven&ccedil;&otilde;es</a>
                        </li>
                      </ul>
					</div>
					
					<br /><br />
				   <div id='menu-atendimento'>
                      <ul>
                          <li>
                            <a href="atendimento.do?method=mostrarTelaAtendimentoAlta"  onclick="redimensionar('800px');">Orienta&ccedil;&otilde;es para Alta</a>
                        </li>
                   </ul>
                   </div>

					<br /><br />                   
                    <div id='menu-atendimento'>
                      <ul>
                        <li>
                            <a href="atendimento.do?method=mostrarTelaAtendimentoAssAtendimento"  onclick="redimensionar('700px');">Assinar Atendimento</a>
                        </li>
                     </ul>
                    </div>
                    
                    
                    <br /><br />
                     <div id='menu-atendimento'>
                      <ul>
                         <li>
                            <a href="atendimento.do?method=mostrarTelaAtendimentoAvaliacaoProf"  onclick="redimensionar('700px');">Avalia&ccedil;&otilde;es do Professor</a>
                        </li>
                         <li>
                            <a href="atendimento.do?method=mostrarTelaAdmissaObsAtendimento"  onclick="redimensionar('700px');">Adendos</a>
                        </li>
                    </ul>
                    </div>
                </div>
