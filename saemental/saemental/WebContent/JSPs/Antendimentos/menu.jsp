
        <link href="Css/Abas.css" rel="stylesheet" type="text/css" />
              
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		
		 <div style="" align="center" id="cssmenu">
                
               		 <ul style="display: inline-block;">
                        <li class="has-sub">
                            <a><span><img src="imagens/novo-atend.png" style="vertical-align:middle" width="22"  height="24" border="0"  />Novo Atendimento</span></a>
                            <ul>
                                <li>
                                    <a href="atendimento.do?method=novoAtendimentoPaciente&tipo=admissao&id=${paciente.id}">Nova Admiss&atilde;o</a>
                                </li>
                                <li>
                                    <a href="atendimento.do?method=novoAtendimentoPaciente&tipo=readmissao&id=${paciente.id}">Nova Readmiss&atilde;o</a>
                                </li>
                                <li class="last">
                                    <a href="atendimento.do?method=novoAtendimentoPaciente&tipo=evolucao&id=${paciente.id}">Nova Evolu&ccedil;&atilde;o</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="antendimento.do?method=antedimentosPaciente&id=${paciente.id}" ><span><img src="imagens/atendimentos.png" style="vertical-align:middle" width="22"  height="24" border="0"  />Atendimentos</span></a>
                        </li>
                        <li class="last">
                            <a href="paciente.do?method=mostrarTelaPacienteEditar&id=${paciente.id}"  ><span><img src="imagens/editar-cad.png" style="vertical-align:middle" width="22"  height="24" border="0"  />Editar Cadastro</span></a>
                        </li>
                    </ul>
                    <div style="vertical-align:middle; color: #37AC76; line-height:50px;display:inline-block">
						<span>Paciente:<b><c:out value="${paciente.nome}"></c:out></b></span>		
				        <span>Cod.:<b><c:out value="${paciente.prontuario.numero}"></c:out>-<c:out value="${paciente.id}"></c:out></b></span>        
                    </div>
                </div>