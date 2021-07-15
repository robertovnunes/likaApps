package struts.acoes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.endereco.Bairro;
import model.endereco.Cidade;
import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.Residencia;
import model.endereco.UF;
import model.fichainvestigativa.Conclusao;
import model.fichainvestigativa.DadosClinicosComplicacoes;
import model.fichainvestigativa.DadosGerais;
import model.fichainvestigativa.DadosLaboratoriais;
import model.fichainvestigativa.NotificacaoInvestigativa;
import model.fichainvestigativa.Paciente;
import model.sistema.CNES;
import model.usuario.Usuario;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import util.DataUtil;
import fachada.Fachada;

public class FichaInvestigacaoAcoes extends DispatchAction {

	
	private static final String fDADOSGERAIS = "fDadosGeraisAdd";
	private static final String fNOVAFICHA = "fNovaFicha";
	private static final String fFICHABUSCAR = "fFichaBuscar";
	private static final String fDADOSCLINICOSCONCLUSOES= "fDadosClinicosConclusoes";
	private static final String fINFOCOMPLEMENTARES = "fInfoComplementares";
	private static final String fINVESTIGACAOCONCLUSAO = "fInvestigacaoConclusao";
	private static final String fINVESTIGACAOLABORATORIAIS= "fInvestigacaoLaboratoriais";
	private static final String fPACIENTEIDENT= "fPacienteIdent";
	private static final String fPACIENTERESIDENCIA  = "fPacienteResidencia";
	

	private Fachada fachada;
	
	public FichaInvestigacaoAcoes(){
		fachada = Fachada.getInstancia();
	}
	
	public ActionForward adicionarNovaFicha(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<UF> estados = fachada.getTodosEstados();
		request.getSession().setAttribute("estados", estados);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		
		NotificacaoInvestigativa notificacaoInvestigativa = new NotificacaoInvestigativa();
		notificacaoInvestigativa.setInvestigador((Usuario)request.getSession().getAttribute("usuario"));
		notificacaoInvestigativa = fachada.inserirNotificacaoInvestigativa(notificacaoInvestigativa);
		request.getSession().setAttribute("notificacaoInvestigativa", notificacaoInvestigativa);
		
		request.setAttribute("mensagem", "Ficha Investigativa inserida com sucesso!");
		
			return map.findForward(fNOVAFICHA);
	}
	
	public ActionForward mostrarTelaFichaInvestigativaBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fFICHABUSCAR);
		
		List<UF> estados = fachada.getTodosEstados();
		request.getSession().setAttribute("estados", estados);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		
		return retorno;
	}
	
	public ActionForward buscarFichaInvestigativa(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fFICHABUSCAR);
		ActionMessages errors = new ActionMessages();
		try{
			String tipo = ((DynaActionForm)form).getString("tipoDeBusca");
			String valor = ((DynaActionForm)form).getString("tfBusca");
			
			List<NotificacaoInvestigativa> fichas = fachada.getNotificacaoInvestigativaPorFiltro(tipo, valor); 	
			
			request.getSession().setAttribute("fichasInvestigativas", fichas);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	
	public ActionForward mostrarTelaDadosGeraisEdit(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fDADOSGERAIS); 
		
		try{
			String idFicha = ((DynaActionForm)form).getString("idFicha");
			NotificacaoInvestigativa notificacao = fachada.getNotificacaoInvestigativaPorID(Integer.parseInt(idFicha));
			
			if(notificacao == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				request.getSession().setAttribute("notificacaoInvestigativa", notificacao);
				
				List<UF> estados = fachada.getTodosEstados();
				request.getSession().setAttribute("estados", estados);
				if(notificacao.getDadosGerais().getEstado() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}
				request.getSession().setAttribute("cidades", null);
				if(notificacao.getDadosGerais().getCidade() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getCidade().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}else if(notificacao.getDadosGerais().getEstado() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
		
			return retorno;
	}
	
	public ActionForward removerFicha(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		 
		try{
			String idFicha = ((DynaActionForm)form).getString("idFicha");
			
			if(idFicha != null){
				NotificacaoInvestigativa notificacao = fachada.getNotificacaoInvestigativaPorID(Integer.parseInt(idFicha));
				fachada.removerFichaNotificacao(notificacao);
				request.setAttribute("mensagem", "Notificação Removida com sucesso!");
				request.getSession().setAttribute("fichasInvestigativas", null);
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
		
			return map.findForward(fFICHABUSCAR);
	}
	
	
	
	public ActionForward mostrarTelaDadosGerais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fDADOSGERAIS); 
		NotificacaoInvestigativa notificacao = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
		
		try{
			
			if(notificacao == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				request.getSession().setAttribute("notificacaoInvestigativa", notificacao);
				
				List<UF> estados = fachada.getTodosEstados();
				request.getSession().setAttribute("estados", estados);
				if(notificacao.getDadosGerais().getEstado() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}
				request.getSession().setAttribute("cidades", null);
				if(notificacao.getDadosGerais().getCidade() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getCidade().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}else if(notificacao.getDadosGerais().getEstado() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacao.getDadosGerais().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
		
			return retorno;
	}
	
	public ActionForward salvarDadosGerais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fDADOSGERAIS); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				String inputDate = (String) request.getParameter("inputDate");
				String inputDate2 = (String) request.getParameter("inputDate2");
				String autocomplete = (String) request.getParameter("autocomplete");
				String estado = (String) request.getParameter("estado");
				String cidadeStr = (String) request.getParameter("cidade");
				
				DadosGerais dadosGerais = notificacaoInvestigativa.getDadosGerais();
				dadosGerais.setDataNotificacao(DataUtil.parseDate(inputDate));
				dadosGerais.setDataPrimeirosSintomas(DataUtil.parseDate(inputDate2));
				Cidade cidade = fachada.getCidadePorID(Integer.parseInt(cidadeStr));
				
				try{
					String codigoCnes = autocomplete.split(" - ")[1] + "";
					CNES unidadeSaude = fachada.buscarUnidadeSaudePorIDCNES(codigoCnes);
					dadosGerais.setUnidadeSaude(unidadeSaude);
					
				}catch(Exception ex){
					request.setAttribute("mensagem", "Unidade de Saúde inválida");
					return retorno;
				}
				
				dadosGerais.setCidade(cidade);
				fachada.persistirDadosGerais(dadosGerais);
				request.setAttribute("mensagem", "Dados Gerais salvos com sucesso!");
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward salvarIdentificacaoPaciente(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fPACIENTEIDENT); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				
				String nome = (String) request.getParameter("nome");
				String inputDate = (String) request.getParameter("inputDate");
				String idade = (String) request.getParameter("idade");
				String idadeBebe = (String) request.getParameter("idadeBebe");
				String sexo = (String) request.getParameter("sexo");
				String gestante = (String) request.getParameter("gestante");
				String raca = (String) request.getParameter("racaCor");
				String escolaridade = (String) request.getParameter("escolaridade");
				String cartaoSus = (String) request.getParameter("numeroCartaoSUS");
				String nomeMae = (String) request.getParameter("nomeMae");
				
				Paciente paciente = notificacaoInvestigativa.getPaciente();
				paciente.setNome(nome);
				paciente.setDataNascimento(DataUtil.parseDate(inputDate));
				paciente.setIdade(idade);
				paciente.setIdadeBebe(idadeBebe);
				paciente.setSexo(sexo);
				if(gestante != null && !gestante.equals("")){
					paciente.setGestante(Integer.parseInt(gestante));
				}
				paciente.setRacaCor(Integer.parseInt(raca));
				paciente.setEscolaridade(Integer.parseInt(escolaridade));
				paciente.setNomeMae(nomeMae);
				paciente.setNumeroCartaoSUS(cartaoSus);
				
				fachada.persistirPaciente(paciente);
				request.setAttribute("mensagem", "Dados de identificação do paciente salvos com sucesso!");
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward salvarResidenciaPaciente(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fPACIENTERESIDENCIA); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				
				String numero = (String) request.getParameter("numero");
				String complemento = (String) request.getParameter("complemento");
				String referencia = (String) request.getParameter("referencia");
				String distrito = (String) request.getParameter("distrito");
				String zona = (String) request.getParameter("zona");
				String cep = (String) request.getParameter("cep");
				String rua = (String) request.getParameter("endereco");
				
				String bairro = (String) request.getParameter("bairro");
				String cidade = (String) request.getParameter("cidade");
				String estado = (String) request.getParameter("estado");
				String pais = (String) request.getParameter("pais");
				
				String geocampo1 = (String) request.getParameter("geocampo1");
				String geocampo2 = (String) request.getParameter("geocampo2");
				String telefone = (String) request.getParameter("telefone");
				
				Pais paisTemp = new Pais();
				paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
				
				Logradouro logradouroTemp = null;
				Residencia enderecoPaciente = notificacaoInvestigativa.getPaciente().getResidencia();
				Cidade cidadeTemp = null;
				UF estadoTemp = null;
				String erro = "";
				
				if(cep != null && !cep.equals("")){
					logradouroTemp = fachada.getLogradouroPorCep(cep);
				}else{
					if(bairro != null && !bairro.equals("")){
						Bairro bairroTemp = new Bairro();
						bairroTemp.setCodigo(Integer.parseInt(bairro));
						logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
					}else if(cidade != null && !cidade.equals("")){
						cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
						
						if(estado != null && !estado.equals("")){
							erro = "Estado não selecionado";
							request.setAttribute("mensagem", erro);
							return map.findForward(fPACIENTERESIDENCIA);
						}else{
							estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
						}
						logradouroTemp = new Logradouro(null,cep,rua,complemento);
					}
					
					fachada.inserirLogradouro(logradouroTemp);
				}
				
				enderecoPaciente.setLogradouro(logradouroTemp);
				enderecoPaciente.setNumero(numero);
				enderecoPaciente.setComplemento(complemento);
				enderecoPaciente.setReferencia(referencia);
				enderecoPaciente.setPais(paisTemp);
				
				if(cidadeTemp != null){
					enderecoPaciente.setCidade(cidadeTemp);
				}
				if(estadoTemp != null){
					enderecoPaciente.setEstado(estadoTemp);
				}
				
				enderecoPaciente.setZona(Integer.parseInt(zona));
				enderecoPaciente.setDistrito(distrito);
				
				enderecoPaciente.setGeocampo1(geocampo1);
				enderecoPaciente.setGeocampo2(geocampo2);
				enderecoPaciente.setTelefone(telefone);
				
				enderecoPaciente = fachada.persistirResidencia(enderecoPaciente);
				request.setAttribute("mensagem", "Dados de residência do paciente salvos com sucesso!");
				
				if(estado != null && !estado.equals("")){
					List<Cidade> cidades = fachada.getCidadesPorUF(estado);
					request.getSession().setAttribute("cidades", cidades);
				}
				
				if(cidade != null && !cidade.equals("")){
					List<Bairro> bairros = fachada.getBairroPorCidade(cidade);
					request.getSession().setAttribute("bairros", bairros);
				}
				NotificacaoInvestigativa notificacao = fachada.getNotificacaoInvestigativaPorID(notificacaoInvestigativa.getId());
				request.getSession().setAttribute("notificacaoInvestigativa", notificacao);
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	
	public ActionForward salvarInvestigacaoLaboratoriais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fINVESTIGACAOLABORATORIAIS); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				
				String dataInvestigacao = (String) request.getParameter("inputDate");
				String ocupacao = (String) request.getParameter("ocupacao");
				String dataColetaIgm = (String) request.getParameter("inputDate2");
				String resultadoIgm = (String) request.getParameter("resultadoIgm");
				String dataColetaNs1 = (String) request.getParameter("inputDate3");
				String resultadoNs1 = (String) request.getParameter("resultadoNs1");
				String dataColetaViral = (String) request.getParameter("inputDate4");
				String resultadoViral = (String) request.getParameter("resultadoViral");
				String dataColetaRT_PCR = (String) request.getParameter("inputDate5");
				String resultadoRT_PCR = (String) request.getParameter("resultadoRT_PCR");
				
				String dataColetaPCRBiosensor = (String) request.getParameter("inputDate6");
				String resultadoPCRBiosensor = (String) request.getParameter("resultadoPCRBiosensor");
				
				String sorotipo = (String) request.getParameter("sorotipo");
				String resultadoHistopatologia = (String) request.getParameter("resultadoHistopatologia");
				String resultadoImunohistoquimica = (String) request.getParameter("resultadoImunohistoquimica");

				DadosLaboratoriais dadosLaboratoriais = notificacaoInvestigativa.getDadosLaboratoriais();
				dadosLaboratoriais.setDataInvestigacao(DataUtil.parseDate(dataInvestigacao));
				dadosLaboratoriais.setOcupacao(ocupacao);
				dadosLaboratoriais.setDataColetaIgm(DataUtil.parseDate(dataColetaIgm));
				if(resultadoIgm != null && !resultadoIgm.equals("")){
					dadosLaboratoriais.setResultadoIgm(Integer.parseInt(resultadoIgm));
				}
				dadosLaboratoriais.setDataColetaNs1(DataUtil.parseDate(dataColetaNs1));
				if(resultadoNs1 != null && !resultadoNs1.equals("")){
					dadosLaboratoriais.setResultadoNs1(Integer.parseInt(resultadoNs1));
				}
				dadosLaboratoriais.setDataColetaViral(DataUtil.parseDate(dataColetaViral));
				if(resultadoViral != null && !resultadoViral.equals("")){
					dadosLaboratoriais.setResultadoViral(Integer.parseInt(resultadoViral));
				}
				dadosLaboratoriais.setDataColetaRT_PCR(DataUtil.parseDate(dataColetaRT_PCR));
				if(resultadoRT_PCR != null && !resultadoRT_PCR.equals("")){
					dadosLaboratoriais.setResultadoRT_PCR(Integer.parseInt(resultadoRT_PCR));
				}
				dadosLaboratoriais.setDataColetaPCRBiosensor(DataUtil.parseDate(dataColetaPCRBiosensor));
				if(resultadoPCRBiosensor != null && !resultadoPCRBiosensor.equals("")){
					dadosLaboratoriais.setResultadoPCRBiosensor(Integer.parseInt(resultadoPCRBiosensor));
				}
				
				if(sorotipo != null && !sorotipo.equals("")){
					dadosLaboratoriais.setSorotipo(Integer.parseInt(sorotipo));
				}
				if(resultadoHistopatologia != null && !resultadoHistopatologia.equals("")){
					dadosLaboratoriais.setResultadoHistopatologia(Integer.parseInt(resultadoHistopatologia));
				}
				if(resultadoImunohistoquimica != null && !resultadoImunohistoquimica.equals("")){
					dadosLaboratoriais.setResultadoImunohistoquimica(Integer.parseInt(resultadoImunohistoquimica));
				}
				
				fachada.persistirDadosLaboratoriais(dadosLaboratoriais);
				request.setAttribute("mensagem", "Investigação - Dados laboratoriais salvos com sucesso!");
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward salvarInvestigacaoConclusao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fINVESTIGACAOCONCLUSAO); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
				
				String classificacao = (String) request.getParameter("classificacao");
				String criterioConfirmacao = (String) request.getParameter("criterioConfirmacao");
				String localInfeccao = (String) request.getParameter("localInfeccao");
				
				String cep = (String) request.getParameter("cep");
				String numero = (String) request.getParameter("numero");
				String complemento = (String) request.getParameter("complemento");
				String pais = (String) request.getParameter("pais");
				String estado = (String) request.getParameter("estado");
				String cidade = (String) request.getParameter("cidade");
				String distrito = (String) request.getParameter("distrito");
				String bairro = (String) request.getParameter("bairro");
				String rua = (String) request.getParameter("endereco");
				
				String latitude = (String) request.getParameter("latitude");
				String longitude = (String) request.getParameter("longitude");
				String doencaTrabalho = (String) request.getParameter("doencaTrabalho");
				String evolucaoCaso = (String) request.getParameter("evolucaoCaso");
				String dataObito = (String) request.getParameter("inputDate");
				String dataEncerramento = (String) request.getParameter("inputDate2");
				
				Pais paisTemp = new Pais();
				paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
				
				Logradouro logradouroTemp = null;
				Cidade cidadeTemp = null;
				UF estadoTemp = null;
				Bairro bairroTemp = null;
				String erro = "";
				
				if(cep != null && !cep.equals("")){
					logradouroTemp = fachada.getLogradouroPorCep(cep);
					
					bairroTemp = new Bairro();
					bairroTemp.setCodigo(Integer.parseInt(bairro));
					cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
					estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
				}else{
					if(bairro != null && !bairro.equals("")){
						bairroTemp = new Bairro();
						bairroTemp.setCodigo(Integer.parseInt(bairro));
						logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
					}else if(cidade != null && !cidade.equals("")){
						cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
						
						if(estado != null && !estado.equals("")){
							erro = "Estado não selecionado";
							request.setAttribute("mensagem", erro);
							return map.findForward(fINVESTIGACAOCONCLUSAO);
						}else{
							estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
						}
						logradouroTemp = new Logradouro(null,cep,rua,complemento);
					}
					
					fachada.inserirLogradouro(logradouroTemp);
				}
				
				Conclusao conclusao = notificacaoInvestigativa.getConclusao();
				conclusao.setClassificacao(Integer.parseInt(classificacao));
				conclusao.setCriterioConfirmacao(Integer.parseInt(criterioConfirmacao));
				conclusao.setLocalInfeccao(Integer.parseInt(localInfeccao));
				conclusao.setDoencaTrabalho(Integer.parseInt(doencaTrabalho));
				conclusao.setEvolucaoCaso(Integer.parseInt(evolucaoCaso));
				
				conclusao.setLogradouro(logradouroTemp);
				conclusao.setNumero(numero);
				conclusao.setComplemento(complemento);
				conclusao.setPais(paisTemp);
				
				if(bairroTemp != null){
					conclusao.setBairro(bairroTemp);
				}
				if(cidadeTemp != null){
					conclusao.setCidade(cidadeTemp);
				}
				if(estadoTemp != null){
					conclusao.setEstado(estadoTemp);
				}
				if(dataEncerramento!= null && !dataEncerramento.equals("")){
					conclusao.setDataEncerramento(DataUtil.parseDate(dataEncerramento));
				}
				if(dataObito!= null && !dataObito.equals("")){
					conclusao.setDataObito(DataUtil.parseDate(dataObito));
				}
				
				conclusao.setDistrito(distrito);
				
				conclusao.setLatitude(latitude);
				conclusao.setLongitude(longitude);
				
				fachada.persistirConclusao(conclusao);
				if(latitude != null && !latitude.equals("")
						&& longitude != null && !longitude.equals("")) {
					request.setAttribute("latitude", latitude);
					request.setAttribute("longitude", longitude);
				}else{
					request.setAttribute("latitude", null);
					request.setAttribute("longitude", null);
				}
				
				request.setAttribute("mensagem", "Dados Investigação - Conclusão salvos com sucesso!");
				
				request.setAttribute("notificacaoInvestigativa", notificacaoInvestigativa);
				
				if(notificacaoInvestigativa.getConclusao().getCidade() != null ){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getConclusao().getCidade().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}else if(notificacaoInvestigativa.getConclusao().getLogradouro() != null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getConclusao().getLogradouro().getBairro().getCidade().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}else{
					request.getSession().setAttribute("cidades", null);
				}
				
				if(notificacaoInvestigativa.getConclusao().getBairro() != null ){
					List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getConclusao().getCidade().getCodigo_cidade()+"");
					request.getSession().setAttribute("bairros", bairros);
				}else if(notificacaoInvestigativa.getConclusao().getLogradouro() != null){
					List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getConclusao().getLogradouro().getBairro().getCidade().getCodigo_cidade()+"");
					request.getSession().setAttribute("bairros", bairros);
				}else{
					request.getSession().setAttribute("bairros", null);
				}
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward salvarComplicacoes(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =map.findForward(fDADOSCLINICOSCONCLUSOES); 
		
		try{
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}else{
			
				
				String hemorragica = (String) request.getParameter("hemorragica");
				String hemorragicaLocal = (String) request.getParameter("hemorragicaLocal");
				String extravasamentoPlasmatico = (String) request.getParameter("extravasamentoPlasmatico");
				String extravasamentoEvidenciado = (String) request.getParameter("extravasamentoEvidenciado");
				String plaquetas = (String) request.getParameter("plaquetas");
				String FHD_SCD = (String) request.getParameter("FHD_SCD");
				String complicacoesTipo = (String) request.getParameter("complicacoesTipo");
				String ocorreuHospitalizacao = (String) request.getParameter("ocorreuHospitalizacao");
				String inputDate = (String) request.getParameter("inputDate");
				String autocomplete = (String) request.getParameter("autocomplete");
				String telefoneHospital = (String) request.getParameter("telefoneHospital");
				
				DadosClinicosComplicacoes complicacoes = notificacaoInvestigativa.getDadosClinicosComplicacoes();
				complicacoes.setHemorragica(Integer.parseInt(hemorragica));
				complicacoes.setHemorragicaLocal(hemorragicaLocal);
				complicacoes.setExtravasamentoPlasmatico(Integer.parseInt(extravasamentoPlasmatico));
				
				if(extravasamentoEvidenciado != null && !extravasamentoEvidenciado.equals("")){
					complicacoes.setExtravasamentoEvidenciado(Integer.parseInt(extravasamentoEvidenciado));
				}
				if(plaquetas != null && !plaquetas.equals("")){
					complicacoes.setPlaquetas(Integer.parseInt(plaquetas));
				}
				if(FHD_SCD != null && !FHD_SCD.equals("")){
					complicacoes.setFHD_SCD(Integer.parseInt(FHD_SCD));
				}
				if(complicacoesTipo != null && !complicacoesTipo.equals("")){
					complicacoes.setComplicacoesTipo(Integer.parseInt(complicacoesTipo));
				}
				complicacoes.setOcorreuHospitalizacao(Integer.parseInt(ocorreuHospitalizacao));
				complicacoes.setDataInternacao(DataUtil.parseDate(inputDate));
				complicacoes.setTelefoneHospital(telefoneHospital);
				
				try{
					String codigoCnes = autocomplete.split(" - ")[1] + "";
					CNES unidadeSaude = fachada.buscarUnidadeSaudePorIDCNES(codigoCnes);
					complicacoes.setHospital(unidadeSaude);
					
				}catch(Exception ex){
					request.setAttribute("mensagem", "Local de Hospitalização inválido");
					return retorno;
				}
				
				
				fachada.persistirDadosClinicosComplicacoes(complicacoes);
				request.setAttribute("mensagem", "Dados Clínicos (complicações) salvos com sucesso!");
			}
		}catch(Exception ex){
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward salvarObservacoesAdicionais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			ActionForward retorno =map.findForward(fINFOCOMPLEMENTARES); 
			try{
				NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				String observacoesAdicionais = (String) request.getParameter("observacoesAdicionais");
				notificacaoInvestigativa.setObservacoesAdicionais(observacoesAdicionais);
				fachada.persistirNotificacaoInvestigativa(notificacaoInvestigativa);
				request.setAttribute("notificacaoInvestigativa", notificacaoInvestigativa);
				request.setAttribute("mensagem", "Observações adicionais salvas com sucesso!");
			}catch(Exception ex){
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}
			
				return retorno;
	}
	
	public ActionForward mostrarTelaPacienteIdentificacao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			
			ActionForward retorno =map.findForward(fPACIENTEIDENT); 
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}
				return retorno;
	}
	
	public ActionForward mostrarTelaPacienteResidencia(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<UF> estados = fachada.getTodosEstados();
		List<Pais> paises = fachada.getTodosPaises();
		NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
		ActionForward retorno =map.findForward(fPACIENTERESIDENCIA); 
				
		if(notificacaoInvestigativa == null){
			retorno = map.findForward(fFICHABUSCAR); 
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}else{
			
			request.getSession().setAttribute("estados", estados);
			request.getSession().setAttribute("paises", paises);
			
			if(notificacaoInvestigativa.getPaciente().getResidencia().getEstado() != null){
				List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getPaciente().getResidencia().getEstado().getCodigo()+"");
				request.getSession().setAttribute("cidades", cidades);
			}else{
				if(notificacaoInvestigativa.getPaciente()!= null && notificacaoInvestigativa.getPaciente().getResidencia()!= null
						&& notificacaoInvestigativa.getPaciente().getResidencia().getLogradouro()!= null){
					List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getPaciente().getResidencia().getLogradouro().getBairro().getCidade().getEstado().getCodigo()+"");
					request.getSession().setAttribute("cidades", cidades);
				}else{
					request.getSession().setAttribute("cidades", null);
				}
			}
			
			if(notificacaoInvestigativa.getPaciente()!= null && notificacaoInvestigativa.getPaciente().getResidencia()!= null
					&& notificacaoInvestigativa.getPaciente().getResidencia().getLogradouro()!= null){
				List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getPaciente().getResidencia().getLogradouro().getBairro().getCidade().getCodigo_cidade()+"");
				request.getSession().setAttribute("bairros", bairros);
			}else{
				if(notificacaoInvestigativa.getPaciente().getResidencia().getCidade() != null){
					List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getPaciente().getResidencia().getCidade().getCodigo_cidade()+"");
					request.getSession().setAttribute("bairros", bairros);
				}else{
					request.getSession().setAttribute("bairros", null);
				}
			}
				
		}
			return retorno;
	}
	
	public ActionForward mostrarTelaDadosLaboratoriais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			
			ActionForward retorno =map.findForward(fINVESTIGACAOLABORATORIAIS); 
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}
				return retorno;
	}
	
	public ActionForward mostrarTelaInvestigacaoConclusao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno =map.findForward(fINVESTIGACAOCONCLUSAO); 
		NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
		
		if(notificacaoInvestigativa == null){
			retorno = map.findForward(fFICHABUSCAR); 
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}else{
			List<UF> estados = fachada.getTodosEstados();
			List<Pais> paises = fachada.getTodosPaises();
			request.getSession().setAttribute("estados", estados);
			request.getSession().setAttribute("paises", paises);
			
			if(notificacaoInvestigativa.getConclusao().getCidade() != null ){
				List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getConclusao().getCidade().getEstado().getCodigo()+"");
				request.getSession().setAttribute("cidades", cidades);
			}else if(notificacaoInvestigativa.getConclusao().getLogradouro() != null){
				List<Cidade> cidades = fachada.getCidadesPorUF(notificacaoInvestigativa.getConclusao().getLogradouro().getBairro().getCidade().getEstado().getCodigo()+"");
				request.getSession().setAttribute("cidades", cidades);
			}else{
				request.getSession().setAttribute("cidades", null);
			}
			
			if(notificacaoInvestigativa.getConclusao().getBairro() != null ){
				List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getConclusao().getCidade().getCodigo_cidade()+"");
				request.getSession().setAttribute("bairros", bairros);
			}else if(notificacaoInvestigativa.getConclusao().getLogradouro() != null){
				List<Bairro> bairros = fachada.getBairroPorCidade(notificacaoInvestigativa.getConclusao().getLogradouro().getBairro().getCidade().getCodigo_cidade()+"");
				request.getSession().setAttribute("bairros", bairros);
			}else{
				request.getSession().setAttribute("bairros", null);
			}
			
			if(notificacaoInvestigativa.getConclusao().getLatitude() != null && !notificacaoInvestigativa.getConclusao().getLatitude().equals("")
					&& notificacaoInvestigativa.getConclusao().getLongitude() != null && !notificacaoInvestigativa.getConclusao().getLongitude().equals("")) {
				request.setAttribute("latitude", notificacaoInvestigativa.getConclusao().getLatitude());
				request.setAttribute("longitude", notificacaoInvestigativa.getConclusao().getLongitude());
			}else{
				request.setAttribute("latitude", null);
				request.setAttribute("longitude", null);
			}
			
		}
				return retorno;	
	}
	
	public ActionForward mostrarTelaDadosClinicos(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<UF> estados = fachada.getTodosEstados();
		request.getSession().setAttribute("estados", estados);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		
		ActionForward retorno =map.findForward(fDADOSCLINICOSCONCLUSOES); 
		NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
			
		if(notificacaoInvestigativa == null){
			retorno = map.findForward(fFICHABUSCAR); 
			request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
		}
			return retorno;
	}
	
	public ActionForward mostrarTelaInformacoesComplementares(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			ActionForward retorno =map.findForward(fINFOCOMPLEMENTARES); 
			NotificacaoInvestigativa notificacaoInvestigativa = (NotificacaoInvestigativa)request.getSession().getAttribute("notificacaoInvestigativa");
				
			if(notificacaoInvestigativa == null){
				retorno = map.findForward(fFICHABUSCAR); 
				request.setAttribute("mensagem", "Erro de conexão com banco de dados!");
			}
				return retorno;
	}
	
}
