	<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

                <br/>
                <br/>
                <link href="css/menuAtendimentos.css" rel="stylesheet" type="text/css" />
                <div id="menu3" style="display:inline-block; vertical-align:top; text-align: justify; margin-right: 50px;">
                
                   	 <p id="titulo-verm" style='' align="left">
                   	 </p>
					<b>
						Identificação:F<c:out value="${notificacaoInvestigativa.id}"></c:out>-I<c:out value="${notificacaoInvestigativa.investigador.id}"></c:out>
	               	</b>	
	               	<br />
	               	Investigador:<c:out value="${notificacaoInvestigativa.investigador.nome}"></c:out>
               		<br /><br />
               		<div id='menu-atendimento' style="text-align: left;">
                    <ul style="z-index:2 !important;">
                        <li>
                           <a href="ficha.do?method=mostrarTelaDadosGerais"  onclick="redimensionar('1100px');">Dados Gerais</a>
                        </li>
                         <li class='has-sub'>
                            <a href="#">Paciente</a>
                            <ul>
                                <li>
                                    <a href="ficha.do?method=mostrarTelaPacienteIdentificacao"  onclick="redimensionar('3500px');">Dados Identificação</a>
                                </li>
                                <li class='last'>
                                    <a href="ficha.do?method=mostrarTelaPacienteResidencia"  onclick="redimensionar('700px');">Residência</a>
                                </li>
                            </ul>
                        </li>
						 <li class='has-sub'>
                            <a href="#">Investigação</a>
                             <ul>
                                <li>
                                    <a href="ficha.do?method=mostrarTelaDadosLaboratoriais"  onclick="redimensionar('2000px');">Dados Laboratoriais</a>
                                </li>
                                <li class='last'>
                                    <a href="ficha.do?method=mostrarTelaInvestigacaoConclusao"  onclick="redimensionar('1500px');">Conclusão</a>
                                </li>
                            </ul>
                        </li>
                      </ul>
					</div>
					
					<br /><br />
				   <div id='menu-atendimento'>
                      <ul>
                          <li>
                            <a href="ficha.do?method=mostrarTelaDadosClinicos"  onclick="redimensionar('800px');">Dados clínicos (complicações)</a>
                        </li>
                   </ul>
                   </div>

					<br /><br />                   
                    <div id='menu-atendimento'>
                      <ul>
                        <li>
                            <a href="ficha.do?method=mostrarTelaInformacoesComplementares"  onclick="redimensionar('700px');">Informações Complementares</a>
                        </li>
                     </ul>
                    </div>
                    
                    
                   
                </div>
