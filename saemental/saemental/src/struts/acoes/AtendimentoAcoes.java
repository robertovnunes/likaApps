package struts.acoes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.paciente.Paciente;
import model.paciente.prontuario.atendimento.Adendo;
import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Alta;
import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.AvaliacaoProfessor;
import model.paciente.prontuario.atendimento.Evolucao;
import model.paciente.prontuario.atendimento.TipoAtendimento;
import model.paciente.prontuario.atendimento.antecedentes.AntecedenteFamiliar;
import model.paciente.prontuario.atendimento.antecedentes.Antecedentes;
import model.paciente.prontuario.atendimento.antecedentes.AntecedentesFamiliares;
import model.paciente.prontuario.atendimento.antecedentes.AntecedentesPessoais;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Cipe;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Intervencoes;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Nic;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Noc;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Resultados;
import model.paciente.prontuario.atendimento.examefisico.ExameFisico;
import model.paciente.prontuario.atendimento.examemental.ExameMental;
import model.paciente.prontuario.atendimento.examemental.ExameMentalGeral;
import model.paciente.prontuario.atendimento.examemental.ExameMentalMiniMental;
import model.paciente.prontuario.atendimento.necessidades.NecessidadesBasicas;
import model.paciente.prontuario.atendimento.queixa.Cid;
import model.paciente.prontuario.atendimento.queixa.Queixa;
import model.usuario.Professor;
import model.usuario.Usuario;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import fachada.Fachada;

public class AtendimentoAcoes extends DispatchAction  {
	
	private static final String fATENDIMENTO = "fAtendimento";
	private static final String fATENDIMENTOQUEIXA = "fAtendimentoQueixa";
	private static final String fATENDIMENTOANTPESSOAIS = "fAtendimentoAntPessoais";
	private static final String fATENDIMENTOANTFAMILIARES = "fAtendimentoAntFamiliares";
	private static final String fATENDIMENTONESSECIDADES = "fAtendimentoNecessidades";
	private static final String fATENDIMENTOEXAMEFISICO = "fAtendimentoExameFisico";
	private static final String fATENDIMENTOEXMENTALGERAL = "fAtendimentoExMentalGeral";
	private static final String fATENDIMENTOEXMENTALMINI = "fAtendimentoExMentalMini";
	private static final String fATENDIMENTOPROCENFERMAGEM = "fAtendimentoProcEnfermagem";
	private static final String fATENDIMENTOALTA = "fAtendimentoAlta";
	private static final String fATENDIMENTOASSATENDIMENTO = "fAtendimentoAssAtendimento";
	private static final String fATENDIMENTOOBSATENDIMENTO = "fAtendimentoObsAtendimento";
	private static final String fATENDIMENTOOBSATENDIMENTOSELECIONADO = "fAtendimentoObsAtendimentoSelecionado";
	private static final String fATENDIMENTOAVALIACOESPRROF = "fAtendimentoAvaliacoesProf";
	private static final String fATENDIMENTOAVALIACOESPRROFSELECIONADA = "fAtendimentoAvaliacoesProfSelecionada";
	private static final String fDIAGNOSTICOADD = "fDiagnosticoAdd";
	private static final String fDIAGNOSTICOESCOLHIDO = "fDiagnosticoEscolhido";
	
	private Fachada fachada;
	
	public AtendimentoAcoes(){
		fachada = Fachada.getInstancia();
	}

	public ActionForward mostrarTelaAtendimentoQueixa(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOQUEIXA);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			//Carregando Cids e colocando na sessao.
			if(admissao.getQueixa() != null && admissao.getQueixa().getCids() != null){ 
				List<Cid> cids = fachada.getCidsQueixa(admissao.getQueixa().getId());
				request.getSession().setAttribute("cids", cids);
			}else{
				request.getSession().removeAttribute("cids");
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			//Carregando Cids e colocando na sessao.
			if(evolucao.getQueixa() != null && evolucao.getQueixa().getCids() != null){ 
				List<Cid> cids = fachada.getCidsQueixa(evolucao.getQueixa().getId());
				request.getSession().setAttribute("cids", cids);
			}else{
				request.getSession().removeAttribute("cids");
			}
		}
		return retorno;
	}
	
	public ActionForward mostrarTelaAtendimentoAntPessoais(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOANTPESSOAIS);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			//Carregando caracteristicas e colocando na sessao.
			if(admissao.getAntecedentes() != null && admissao.getAntecedentes().getAntecedentesPessoais() != null && admissao.getAntecedentes().getAntecedentesPessoais().getCaracteristicasComportamentais() != null){ 
				String[] caracteristicas = admissao.getAntecedentes().getAntecedentesPessoais().getCaracteristicasComportamentais().split(";");
				request.getSession().setAttribute("caracteristicas", caracteristicas);
			}else{
				request.getSession().setAttribute("caracteristicas", "");
				request.getSession().removeAttribute("caracteristicas");
			}
			
			//Carregando drogas e colocando na sessao.
			if(admissao.getAntecedentes() != null && admissao.getAntecedentes().getAntecedentesPessoais() != null && admissao.getAntecedentes().getAntecedentesPessoais().getAdulto_substanciasIlicitasSelecionadas() != null){ 
				String[] substanciasIlicitas = admissao.getAntecedentes().getAntecedentesPessoais().getAdulto_substanciasIlicitasSelecionadas().split(";");
				request.getSession().setAttribute("substanciasIlicitas", substanciasIlicitas);
			}else{
				request.getSession().setAttribute("substanciasIlicitas", "");
				request.getSession().removeAttribute("substanciasIlicitas");
			}
		}
		
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoAntFamiliares(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOANTFAMILIARES);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		Admissao admissao = (Admissao) atendimento;
		
		//Carregando antecedentes familiares (parentes e patolodias) e colocando na sessao.
		if(admissao.getAntecedentes() != null && admissao.getAntecedentes().getAntecedentesFamiliares() != null){ 
			List<AntecedenteFamiliar> antecedentes = fachada.pesquisarAntecedentesFamiliarPorIdAntFamiliarPaciente(admissao.getAntecedentes().getAntecedentesFamiliares().getId());
			request.getSession().setAttribute("antecedentesFamiliares", antecedentes);
			
			String parentes = "";
			String patologias = "";
			for (AntecedenteFamiliar antecedenteFamiliar : antecedentes) {
				parentes += antecedenteFamiliar.getParente()+";"; 
				patologias += antecedenteFamiliar.getPatologia()+";";
			}
			
			request.getSession().setAttribute("parentes", parentes);
			request.getSession().setAttribute("patologias", patologias);
			
		}else{
			request.getSession().setAttribute("parentes", "");
			request.getSession().removeAttribute("parentes");
			request.getSession().setAttribute("patologias", "");
			request.getSession().removeAttribute("patologias");
		}
		
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoNecessidades(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTONESSECIDADES);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			request.getSession().setAttribute("necessidades", admissao.getNecessidadesBasicas());
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			request.getSession().setAttribute("necessidades", evolucao.getNecessidadesBasicas());
		}
		
		return retorno;
	}
	public ActionForward mostrarTelaAdmissaExameFisico(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOEXAMEFISICO);
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoExMentalGeral(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOEXMENTALGERAL);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			if(admissao.getExameMental() != null){
				ExameMentalGeral exame = admissao.getExameMental().getExameMentalGeral();
				request.setAttribute("exame", exame);
			}
		}else{
			Evolucao evolucao = (Evolucao) atendimento;
			if(evolucao.getExameMental() != null){
				ExameMentalGeral exame = evolucao.getExameMental().getExameMentalGeral();
				request.setAttribute("exame", exame);
			}
		}
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoExMentalMini(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOEXMENTALMINI);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			if(admissao.getExameMental() != null){
				ExameMentalMiniMental exame = admissao.getExameMental().getExameMentalMiniMental();
				request.setAttribute("exame", exame);
			}
		}else{
			Evolucao evolucao = (Evolucao) atendimento;
			if(evolucao.getExameMental() != null){
				ExameMentalMiniMental exame = evolucao.getExameMental().getExameMentalMiniMental();
				request.setAttribute("exame", exame);
			}
		}
		return retorno;
	}
	public ActionForward mostrarTelaAdmissaProcEnfermagem(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOPROCENFERMAGEM);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			List<Diagnostico> diagnosticos = fachada.listarDiagnosticosAtendimento(atendimento);
			List<Intervencoes> intervencoes = new ArrayList<Intervencoes>();
			List<Resultados> resultados = new ArrayList<Resultados>();
			for (Diagnostico diagnostico : diagnosticos) {
				intervencoes.addAll(fachada.listarIntervencoesDiagnostico(diagnostico));
				resultados.addAll(fachada.listarResultadosDiagnostico(diagnostico));
			}
			
			request.getSession().setAttribute("diagnosticos", diagnosticos);
			request.getSession().setAttribute("intervencoes", intervencoes);
			request.getSession().setAttribute("resultados", resultados);
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoAlta(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOALTA);
		return retorno;
	}
	public ActionForward mostrarTelaAtendimentoAssAtendimento(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOASSATENDIMENTO);
		return retorno;
	}
	
	public ActionForward mostrarTelaAdmissaObsAtendimento(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOOBSATENDIMENTO);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			
			List<Adendo> adendos = fachada.getAdendosAtendimento(atendimento);
			
			request.getSession().setAttribute("adendos", adendos);
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward observacoesBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOOBSATENDIMENTO);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			String valor = request.getParameter("tfBusca");
			String tipo = request.getParameter("tipoDeBusca");
			
			List<Adendo> adendos = fachada.getAdendosPorConsulta(tipo, valor, atendimento);
			request.getSession().setAttribute("adendos", adendos);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}

	public ActionForward selecionarAdendo(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOOBSATENDIMENTOSELECIONADO);
		
		try{
			String idAdendo = request.getParameter("id");
			
			Adendo adendo = fachada.getAdendoPorId(idAdendo);
			request.getSession().setAttribute("adendo", adendo);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward adicionarAdendo(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOOBSATENDIMENTO);
		
		try{
			
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			String adendoDescr = request.getParameter("adendo");
			
			if(adendoDescr != null && !adendoDescr.equals("") && adendoDescr.length() >= 255){
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("quantidade.caracteres.alta"));
				this.saveErrors(request, errors);
			}else{
				Adendo adendo = new Adendo();
				adendo.setDescricao(adendoDescr);
				adendo.setDataHora(new Date());
				adendo.setAtendimento(atendimento);
				adendo.setAutor(usuario);
				
				fachada.inserirAdendo(adendo);
				
				List<Adendo> adendos = fachada.getAdendosAtendimento(atendimento);
				request.getSession().setAttribute("adendos", adendos);
				request.getSession().setAttribute("mensagem", "Adendo adicionado com sucesso!");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward mostrarTelaAtendimentoAvaliacaoProf(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOAVALIACOESPRROF);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			
			List<AvaliacaoProfessor> avaliacoes = fachada.getAvaliacaoProfessorAtendimento(atendimento);
			
			request.getSession().setAttribute("avaliacoes", avaliacoes);
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	public ActionForward adicionarAvaliacao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOAVALIACOESPRROF);
		
		try{
			
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			Professor usuario = (Professor) request.getSession().getAttribute("usuario");
			String avaliacaoDescr = request.getParameter("avaliacao");
			
			if(avaliacaoDescr != null && !avaliacaoDescr.equals("") && avaliacaoDescr.length() >= 255){
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("quantidade.caracteres.alta"));
				this.saveErrors(request, errors);
			}else{
				
				AvaliacaoProfessor avaliacao = new AvaliacaoProfessor();
				avaliacao.setDescricao(avaliacaoDescr);
				avaliacao.setDataHora(new Date());
				avaliacao.setAtendimento(atendimento);
				avaliacao.setProfessor(usuario);
				
				fachada.inserirAvaliacaoProfessor(avaliacao);
				
				List<AvaliacaoProfessor> avaliacoes = fachada.getAvaliacaoProfessorAtendimento(atendimento);
				request.getSession().setAttribute("avaliacoes", avaliacoes);
				request.getSession().setAttribute("mensagem", "Avalia????o adicionada com sucesso!");
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward avaliacoesBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOAVALIACOESPRROF);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			String valor = request.getParameter("tfBusca");
			String tipo = request.getParameter("tipoDeBusca");
			
			List<AvaliacaoProfessor> avaliacoes = fachada.getAvaliacaoProfessorPorConsulta(tipo, valor, atendimento);
			request.getSession().setAttribute("avaliacoes", avaliacoes);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	public ActionForward selecionarAvaliacao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOAVALIACOESPRROFSELECIONADA);
		
		try{
			String idAvaliacao = request.getParameter("id");
			
			AvaliacaoProfessor avaliacao = fachada.getAvaliacaoProfessorPorId(idAvaliacao);
			request.getSession().setAttribute("avaliacao", avaliacao);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward mostrarTelaDiagnosticoEscolhido(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		
		try{
			String id = request.getParameter("diagnostico");

			if(id != null && !id.equals("")){
				Diagnostico diagnostico = fachada.getDiagnosticoPorId(Integer.parseInt(id));
				List<Intervencoes> intervencoes = new ArrayList<Intervencoes>();
				List<Resultados> resultados = new ArrayList<Resultados>();
				intervencoes.addAll(fachada.listarIntervencoesDiagnostico(diagnostico));
				resultados.addAll(fachada.listarResultadosDiagnostico(diagnostico));
				
				request.getSession().setAttribute("diagnostico", diagnostico);
				request.getSession().setAttribute("intervencoes", intervencoes);
				request.getSession().setAttribute("resultados", resultados);
			}
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	public ActionForward novoAtendimentoPaciente(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTO);
		String tipo = request.getParameter("tipo");
		
		if(tipo.equals("admissao")){
			Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
			Admissao admissao = new Admissao();
			admissao.setProntuario(paciente.getProntuario());
			admissao.setDataHoraCriacao(new Date());
			admissao.setDataHoraAtualizacao(new Date());
			admissao.setEhReadmissao(false);
			admissao.setTipo(TipoAtendimento.ADMISSAO);
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			admissao.setUsuario(usuario);
			admissao.setAssinar(false);
			Admissao admissaoAnterior = fachada.getultimoAtendimentoAdmissao(paciente.getProntuario().getId());
            if (admissaoAnterior != null) {
                if (admissaoAnterior.getAntecedentes() != null) {
                    admissao.setAntecedentes(admissaoAnterior.getAntecedentes());
                }
            }
			admissao = fachada.inserirAdmissao(admissao);
			request.getSession().setAttribute("atendimento", admissao);
		}else if(tipo.equals("readmissao")){
			Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
			Admissao admissao = new Admissao();
			admissao.setProntuario(paciente.getProntuario());
			admissao.setDataHoraCriacao(new Date());
			admissao.setDataHoraAtualizacao(new Date());
			admissao.setEhReadmissao(true);
			admissao.setTipo(TipoAtendimento.READMISSAO);
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			admissao.setUsuario(usuario);
			admissao.setAssinar(false);
			Admissao admissaoAnterior = fachada.getultimoAtendimentoAdmissao(paciente.getProntuario().getId());
			if (admissaoAnterior != null) {
				if (admissaoAnterior.getAntecedentes() != null) {
					admissao.setAntecedentes(admissaoAnterior.getAntecedentes());
				}
			}
			Atendimento ultimoAtendimento = fachada.getUltimoAtendimento(paciente.getProntuario().getId());
			if (ultimoAtendimento instanceof Evolucao) {
				Evolucao evolucaoAnterior = (Evolucao) ultimoAtendimento;
				if (evolucaoAnterior.getQueixa() != null) {
					Queixa queixa = evolucaoAnterior.getQueixa().clone();
					fachada.inserirQueixa(queixa);
					admissao.setQueixa(queixa);
				}
				if (evolucaoAnterior.getNecessidadesBasicas() != null) {
					NecessidadesBasicas necessidadesBasicas = evolucaoAnterior.getNecessidadesBasicas().clone();
					fachada.inserirNecessidadesBasicas(necessidadesBasicas);
					admissao.setNecessidadesBasicas(necessidadesBasicas);
				}
				if (evolucaoAnterior.getExameFisico() != null) {
					ExameFisico exameFisico = evolucaoAnterior.getExameFisico().clone();
					fachada.inserirExameFisico(exameFisico);
					admissao.setExameFisico(exameFisico);
				}
				if (evolucaoAnterior.getExameMental() != null) {
					ExameMental exameMental = evolucaoAnterior.getExameMental().clone();
					fachada.inserirExameMental(exameMental);
					admissao.setExameMental(exameMental);
				}
			}
			
			admissao = fachada.inserirAdmissao(admissao);
			request.getSession().setAttribute("atendimento", admissao);
			request.setAttribute("observacao", "Readmiss??o inserida! Obs.: Alguns formul??rios foram recuperados do ??ltimo atendimento.");
			
			List<Diagnostico> diagnosticos = fachada.listarDiagnosticosAtendimento(ultimoAtendimento);
			List<Intervencoes> intervencoes = new ArrayList<Intervencoes>();
			List<Resultados> resultados = new ArrayList<Resultados>();
			for (Diagnostico d : diagnosticos) {
				intervencoes.addAll(fachada.listarIntervencoesDiagnostico(d));
				resultados.addAll(fachada.listarResultadosDiagnostico(d));
				Diagnostico diagnostico = d.clone();
				diagnostico.setAtendimento(admissao);
				fachada.inserirDiagnostico(diagnostico);
				for (Intervencoes i : intervencoes) {
					Intervencoes intervencao = i.clone();
					intervencao.setDiagnostico(diagnostico);
					fachada.inserirIntervencao(intervencao);
				}
				for (Resultados r : resultados) {
					Resultados resultado = r.clone();
					resultado.setDiagnostico(diagnostico);
					fachada.inserirResultados(resultado);
				}
			}
		}else if(tipo.equals("evolucao")){
			Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
			Evolucao evolucao = new Evolucao();
			evolucao.setProntuario(paciente.getProntuario());
			evolucao.setDataHoraCriacao(new Date());
			evolucao.setDataHoraAtualizacao(new Date());
			evolucao.setTipo(TipoAtendimento.EVOLUCAO);
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			evolucao.setUsuario(usuario);
			evolucao.setAssinar(false);
			Atendimento ultimoAtendimento = fachada.getUltimoAtendimento(paciente.getProntuario().getId());
			if (ultimoAtendimento instanceof Admissao) {
				Admissao admissaoAnterior = (Admissao) ultimoAtendimento;
				if (admissaoAnterior.getQueixa() != null) {
					Queixa queixa = admissaoAnterior.getQueixa().clone();
					fachada.inserirQueixa(queixa);
					evolucao.setQueixa(queixa);
				}
				if (admissaoAnterior.getNecessidadesBasicas() != null) {
					NecessidadesBasicas necessidadesBasicas = admissaoAnterior.getNecessidadesBasicas().clone();
					fachada.inserirNecessidadesBasicas(necessidadesBasicas);
					evolucao.setNecessidadesBasicas(necessidadesBasicas);
				}
				if (admissaoAnterior.getExameFisico() != null) {
					ExameFisico exameFisico = admissaoAnterior.getExameFisico().clone();
					fachada.inserirExameFisico(exameFisico);
					evolucao.setExameFisico(exameFisico);
				}
				if (admissaoAnterior.getExameMental() != null) {
					ExameMental exameMental = admissaoAnterior.getExameMental().clone();
					fachada.inserirExameMental(exameMental);
					evolucao.setExameMental(exameMental);
				}
			} else if (ultimoAtendimento instanceof Evolucao) {
				Evolucao evolucaoAnterior = (Evolucao) ultimoAtendimento;
				if (evolucaoAnterior.getQueixa() != null) {
					Queixa queixa = evolucaoAnterior.getQueixa().clone();
					fachada.inserirQueixa(queixa);
					evolucao.setQueixa(queixa);
				}
				if (evolucaoAnterior.getNecessidadesBasicas() != null) {
					NecessidadesBasicas necessidadesBasicas = evolucaoAnterior.getNecessidadesBasicas().clone();
					fachada.inserirNecessidadesBasicas(necessidadesBasicas);
					evolucao.setNecessidadesBasicas(necessidadesBasicas);
				}
				if (evolucaoAnterior.getExameFisico() != null) {
					ExameFisico exameFisico = evolucaoAnterior.getExameFisico().clone();
					fachada.inserirExameFisico(exameFisico);
					evolucao.setExameFisico(exameFisico);
				}
				if (evolucaoAnterior.getExameMental() != null) {
					ExameMental exameMental = evolucaoAnterior.getExameMental().clone();
					fachada.inserirExameMental(exameMental);
					evolucao.setExameMental(exameMental);
				}
			}
			
			evolucao = fachada.inserirEvolucao(evolucao);
			request.getSession().setAttribute("atendimento", evolucao);
			request.setAttribute("observacao", "Evolu????o inserida! Obs.: Alguns formul??rios foram recuperados do ??ltimo atendimento.");
			
			
			List<Diagnostico> diagnosticos = fachada.listarDiagnosticosAtendimento(ultimoAtendimento);
			List<Intervencoes> intervencoes = new ArrayList<Intervencoes>();
			List<Resultados> resultados = new ArrayList<Resultados>();
			for (Diagnostico d : diagnosticos) {
				intervencoes.addAll(fachada.listarIntervencoesDiagnostico(d));
				resultados.addAll(fachada.listarResultadosDiagnostico(d));
				Diagnostico diagnostico = d.clone();
				diagnostico.setAtendimento(evolucao);
				fachada.inserirDiagnostico(diagnostico);
				for (Intervencoes i : intervencoes) {
					Intervencoes intervencao = i.clone();
					intervencao.setDiagnostico(diagnostico);
					fachada.inserirIntervencao(intervencao);
				}
				for (Resultados r : resultados) {
					Resultados resultado = r.clone();
					resultado.setDiagnostico(diagnostico);
					fachada.inserirResultados(resultado);
				}
			}
		}
		
		request.setAttribute("tipo", tipo);
		
		return retorno;
	}
	
	public ActionForward atendimentoEdit(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTO);
		String id = request.getParameter("idAtendimento");
		String tipo = request.getParameter("tipo");
		
		if(tipo.equals("admissao")){
			Admissao atendimento = fachada.getAdmissaoPorId(new Integer(id));
			atendimento.setTipo(TipoAtendimento.ADMISSAO);
			request.getSession().setAttribute("atendimento", atendimento);
			
			//Carregando Cids e colocando na sessao.
			if(atendimento.getQueixa() != null && atendimento.getQueixa().getCids() != null){ 
				List<Cid> cids = fachada.getCidsQueixa(atendimento.getQueixa().getId());
				request.getSession().setAttribute("cids", cids);
			}else{
				request.getSession().setAttribute("cids", "");
				request.getSession().removeAttribute("cids");
			}
		}else if(tipo.equals("readmissao")){
			Admissao atendimento = fachada.getAdmissaoPorId(new Integer(id));
			atendimento.setTipo(TipoAtendimento.READMISSAO);
			request.getSession().setAttribute("atendimento", atendimento);
			
			//Carregando Cids e colocando na sessao.
			if(atendimento.getQueixa() != null && atendimento.getQueixa().getCids() != null){ 
				List<Cid> cids = fachada.getCidsQueixa(atendimento.getQueixa().getId());
				request.getSession().setAttribute("cids", cids);
			}else{
				request.getSession().setAttribute("cids", "");
				request.getSession().removeAttribute("cids");
			}

		}else if(tipo.equals("evolucao")){
			Evolucao atendimento = fachada.getEvolucaoPorId(new Integer(id));
			atendimento.setTipo(TipoAtendimento.EVOLUCAO);
			request.getSession().setAttribute("atendimento", atendimento);
			
			//Carregando Cids e colocando na sessao.
			if(atendimento.getQueixa() != null && atendimento.getQueixa().getCids() != null){ 
				List<Cid> cids = fachada.getCidsQueixa(atendimento.getQueixa().getId());
				request.getSession().setAttribute("cids", cids);
			}else{
				request.getSession().setAttribute("cids", "");
				request.getSession().removeAttribute("cids");
			}

		}
		
		
		return retorno;
	}
	
	public ActionForward queixaSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOQUEIXA);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		List<Cid> cids = (List<Cid>) request.getSession().getAttribute("cids");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			String queixaPrincipal = ((DynaActionForm)form).getString("queixa");
			String medicacoes = ((DynaActionForm)form).getString("medicacoes");
			
			Queixa queixa = admissao.getQueixa();
			if(admissao.getQueixa() == null){
				queixa = new Queixa();
			}
			queixa.setMedicacoes(medicacoes);
			queixa.setQueixaPrincipal(queixaPrincipal);
			queixa.setCids(cids);
			
			try{
				fachada.inserirQueixa(queixa);
				admissao.setQueixa(queixa);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Queixa salva com sucesso!");
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.autenticacao"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			String queixaPrincipal = ((DynaActionForm)form).getString("queixa");
			String medicacoes = ((DynaActionForm)form).getString("medicacoes");
			
			Queixa queixa = evolucao.getQueixa();
			if(evolucao.getQueixa() == null){
				queixa = new Queixa();
			}
			queixa.setMedicacoes(medicacoes);
			queixa.setQueixaPrincipal(queixaPrincipal);
			queixa.setCids(cids);
			
			try{
				fachada.inserirQueixa(queixa);
				evolucao.setQueixa(queixa);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Queixa salva com sucesso!");
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward cidAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOQUEIXA);
		String cidEscolhido = (String) request.getParameter("autocomplete");
		
		if(cidEscolhido == null || cidEscolhido.equals("")){
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("cid.invalido"));
			this.saveErrors(request, errors);
			return retorno;
		}
		try{
			String[] cidEscolhidoSplit = cidEscolhido.split("-");
			String codigo = "";
			
			if(cidEscolhidoSplit != null && cidEscolhidoSplit.length > 0){
				codigo = cidEscolhidoSplit[cidEscolhidoSplit.length-1];
				codigo = codigo.replaceFirst(";", "");
			}else{
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
				return retorno;
			}
			
			List<Cid> cids = (List<Cid>) request.getSession().getAttribute("cids");
			if(cids == null){
				cids = new ArrayList<Cid>();
			}
			Cid cid = fachada.getCidPorIdentificador(codigo);
			boolean contemCid = false;
			for (Cid cidTemp : cids) {
				if(cidTemp.getId() == cid.getId()){
					contemCid = true;
				}
			}
			if(contemCid == false){
				cids.add(cid);
				request.setAttribute("mensagem", "Cid adicionado com sucesso!");
			}else{
				request.setAttribute("mensagem", "Cid j?? adicionado!");
			}
			
			request.getSession().setAttribute("cids", cids);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}

		return retorno;
	}
	
	public ActionForward removerCid(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOQUEIXA);
		String cidId = (String) request.getParameter("id");
		
		try{
			List<Cid> cids = (List<Cid>) request.getSession().getAttribute("cids");
			if(cids == null){
				cids = new ArrayList<Cid>();
			}
			for (int i = 0; i < cids.size(); i++) {
				if(cids.get(i).getId() == Integer.parseInt(cidId)){
					cids.remove(i);
					request.setAttribute("mensagem", "Cid removido com sucesso!");
					i = cids.size();
				}
			}
			
			request.getSession().setAttribute("cids", cids);
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}

		return retorno;
	}
	
	public ActionForward antPessoaisSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOANTPESSOAIS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String escolhidosCaractComport = ((DynaActionForm)form).getString("escolhidosCaractComport");
		String gravidez = ((DynaActionForm)form).getString("gravidez");
		String parto = ((DynaActionForm)form).getString("parto");
		String tbqualMotora = ((DynaActionForm)form).getString("tbqualMotora");
		String tbqualLinguagem = ((DynaActionForm)form).getString("tbqualLinguagem");
		String tbqualVisao = ((DynaActionForm)form).getString("tbqualVisao");
		String tbqualAudicao = ((DynaActionForm)form).getString("tbqualAudicao");
		String tbqualPaladar = ((DynaActionForm)form).getString("tbqualPaladar");
		String tbqualOlfato = ((DynaActionForm)form).getString("tbqualOlfato");
		String tbqualTato = ((DynaActionForm)form).getString("tbqualTato");
		String ativo = ((DynaActionForm)form).getString("ativo");
		String timido = ((DynaActionForm)form).getString("timido");
		String impaciente = ((DynaActionForm)form).getString("impaciente");
		String agressivo = ((DynaActionForm)form).getString("agressivo");
		String distraido = ((DynaActionForm)form).getString("distraido");
		String inseguro = ((DynaActionForm)form).getString("inseguro");
		String chorava = ((DynaActionForm)form).getString("chorava");
		String tbqualOutros = ((DynaActionForm)form).getString("tbqualOutros");
		String puberdade = ((DynaActionForm)form).getString("puberdade");
		String relacionamentoAdolecentes = ((DynaActionForm)form).getString("relacionamentoAdolecentes");
		String grauAnsiedade = ((DynaActionForm)form).getString("grauAnsiedade");
		String relacPais = ((DynaActionForm)form).getString("relacPais");
		String relacAutoridades = ((DynaActionForm)form).getString("relacAutoridades");
		String autoEstima = ((DynaActionForm)form).getString("autoEstima");
		String dependencia = ((DynaActionForm)form).getString("dependencia");
		String notasAdolec = ((DynaActionForm)form).getString("notasAdolec");
		String idadeSexualVidaSexual = ((DynaActionForm)form).getString("idadeSexualVidaSexual");
		String orientacaoSexual = ((DynaActionForm)form).getString("orientacaoSexual");
		String usoDrogas = ((DynaActionForm)form).getString("usoDrogas");
		String escolhidosDroga = ((DynaActionForm)form).getString("escolhidosDrogaHidden");
		String antecPessoaisOutrasInfo = ((DynaActionForm)form).getString("antecPessoaisOutrasInfo");

		Admissao admissao = (Admissao) atendimento;
		
		if(admissao.getAntecedentes() == null){
			admissao.setAntecedentes(new Antecedentes());
		}
		
		AntecedentesPessoais antecedentes = admissao.getAntecedentes().getAntecedentesPessoais();
		if(admissao.getAntecedentes().getAntecedentesPessoais() == null){
			antecedentes = new AntecedentesPessoais();
		}
		antecedentes.setCaracteristicasComportamentais(escolhidosCaractComport);
		antecedentes.setGravidez(gravidez);
		antecedentes.setParto(parto);
		antecedentes.setHistObs_motora(tbqualMotora);
		antecedentes.setHistObs_linguagem(tbqualLinguagem);
		antecedentes.setHistObs_visao(tbqualVisao);
		antecedentes.setHistObs_audicao(tbqualAudicao);
		antecedentes.setHistObs_paladar(tbqualPaladar);
		antecedentes.setHistObs_olfato(tbqualOlfato);
		antecedentes.setHistObs_tato(tbqualTato);
		antecedentes.setHistObs_ativo(ativo);
		antecedentes.setHistObs_timido(timido);
		antecedentes.setHistObs_impaciente(impaciente);
		antecedentes.setHistObs_agressivo(agressivo);
		antecedentes.setHistObs_distraido(distraido);
		antecedentes.setHistObs_inseguro(inseguro);
		antecedentes.setHistObs_choro(chorava);
		antecedentes.setHistObs_outros(tbqualOutros);
		
		antecedentes.setHistObs_escolar(notasAdolec);

		antecedentes.setAdolescencia_puberdade(puberdade);
		antecedentes.setAdolescencia_relacionamentoOutros(relacionamentoAdolecentes);
		antecedentes.setAdolescencia_ansiedade(grauAnsiedade);
		antecedentes.setAdolescencia_relacionamentoPais(relacPais);
		antecedentes.setAdolescencia_autoridades(relacAutoridades);
		antecedentes.setAdolescencia_autoestima(autoEstima);
		antecedentes.setAdolescencia_dependencia(dependencia);
		antecedentes.setAdolescencia_notas(notasAdolec);
		
		antecedentes.setAdulto_vidasexual(idadeSexualVidaSexual);
		antecedentes.setAdulto_orientacaosexual(orientacaoSexual);
		antecedentes.setAdulto_substanciasIlicitasSelecionadas(escolhidosDroga);
		antecedentes.setAdulto_usoDeSubstanciasIlicitas(usoDrogas);

		antecedentes.setOutrasInformacoes(antecPessoaisOutrasInfo);
			
		
		try{
			fachada.inserirAntecedentes(admissao.getAntecedentes());
			fachada.inserirAntecedentesPessoais(antecedentes);
			admissao.getAntecedentes().setAntecedentesPessoais(antecedentes);
			fachada.inserirAdmissao(admissao);
			request.setAttribute("mensagem", "Antecedentes Pessoais salvos com sucesso!");
			
			//Carregando caracteristicas e colocando na sessao.
			if(admissao.getAntecedentes() != null && admissao.getAntecedentes().getAntecedentesPessoais() != null && admissao.getAntecedentes().getAntecedentesPessoais().getCaracteristicasComportamentais() != null){ 
				String[] caracteristicas = admissao.getAntecedentes().getAntecedentesPessoais().getCaracteristicasComportamentais().split(";");
				request.getSession().setAttribute("caracteristicas", caracteristicas);
			}
			
			//Carregando drogas e colocando na sessao.
			if(admissao.getAntecedentes() != null && admissao.getAntecedentes().getAntecedentesPessoais() != null && admissao.getAntecedentes().getAntecedentesPessoais().getAdulto_substanciasIlicitasSelecionadas() != null){ 
				String[] substanciasIlicitas = admissao.getAntecedentes().getAntecedentesPessoais().getAdulto_substanciasIlicitasSelecionadas().split(";");
				request.getSession().setAttribute("substanciasIlicitas", substanciasIlicitas);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	public ActionForward antFamiliaresSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOANTFAMILIARES);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String parentes = ((DynaActionForm)form).getString("parentes");
		String patologias = ((DynaActionForm)form).getString("patologias");
		
		Admissao admissao = (Admissao) atendimento;
		
		if(admissao.getAntecedentes() == null){
			admissao.setAntecedentes(new Antecedentes());
		}
		
		AntecedentesFamiliares antecedentes = admissao.getAntecedentes().getAntecedentesFamiliares();
		if(admissao.getAntecedentes().getAntecedentesFamiliares() == null){
			antecedentes = new AntecedentesFamiliares();
		}	
		
		try{
			fachada.inserirAntecedentes(admissao.getAntecedentes());
			fachada.inserirAntecedentesFamiliares(antecedentes);
			admissao.getAntecedentes().setAntecedentesFamiliares(antecedentes);
			fachada.inserirAdmissao(admissao);
			
			if(parentes != null && !parentes.equals("") && patologias != null && !patologias.equals("")){
				
				fachada.removerAntecedenteFamiliarPorIdAntFamiliarPaciente(antecedentes.getId());
				String[] todosParentes = parentes.split(";");
				String[] todasPatologias = patologias.split(";"); 
				
				int index = 0;
				for (String parente : todosParentes) {
					AntecedenteFamiliar ant = new AntecedenteFamiliar();
					ant.setAntecedentesFamiliares(antecedentes);
					ant.setParente(parente);
					if(index < todasPatologias.length){
						ant.setPatologia(todasPatologias[index]);
						fachada.inserirAntecedenteFamiliar(ant);
					}
					index++;
				}
			}
			request.setAttribute("mensagem", "Antecedentes Familiares salvos com sucesso!");
			mostrarTelaAtendimentoAntFamiliares(map, form, request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}

		return retorno;
	}
	
	public ActionForward necessidadesSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fATENDIMENTONESSECIDADES);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String sono = ((DynaActionForm)form).getString("sono");
		String sonoQual = ((DynaActionForm)form).getString("sonoQual");
		String eliminacao = ((DynaActionForm)form).getString("eliminacao");
		String eliminacaoQual = ((DynaActionForm)form).getString("eliminacaoQual");
		String nutricao = ((DynaActionForm)form).getString("nutricao");
		String nutricaoQual = ((DynaActionForm)form).getString("nutricaoQual");
	
		String sexualidade = ((DynaActionForm)form).getString("sexualidade");
		String sexualidadeQual = ((DynaActionForm)form).getString("sexualidadeQual");
	
		String percepcao = ((DynaActionForm)form).getString("percepcao");
		String percepcaoQual = ((DynaActionForm)form).getString("percepcaoQual");
		
		String exercicio = ((DynaActionForm)form).getString("exercicio");
		String exercicioQual = ((DynaActionForm)form).getString("exercicioQual");
		String cognicao = ((DynaActionForm)form).getString("cognicao");
		String cognicaoQual = ((DynaActionForm)form).getString("cognicaoQual");
		String relacionamentos = ((DynaActionForm)form).getString("relacionamentos");
		String relacionamentosQual = ((DynaActionForm)form).getString("relacionamentosQual");
		
		String estresse = ((DynaActionForm)form).getString("estresse");
		String estresseQual = ((DynaActionForm)form).getString("estresseQual");
		
		String autoconceito = ((DynaActionForm)form).getString("autoconceito");
		String autoconceitoQual = ((DynaActionForm)form).getString("autoconceitoQual");
		String espirituais = ((DynaActionForm)form).getString("espirituais");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			NecessidadesBasicas necessidades = admissao.getNecessidadesBasicas();
			if(necessidades == null){
				necessidades = new NecessidadesBasicas();
			}else{
				necessidades.limparDados();
			}
			
			if(sono != null && !sono.equals("")){
				if(sono.equals("Adequada")){
					necessidades.setSonoAdequada(true);
				}else{
					necessidades.setSonoAlterada(true);
				}
			}
			necessidades.setSonoRepousoQual(sonoQual);
			if(eliminacao != null && !eliminacao.equals("")){
				if(eliminacao.equals("Adequada")){
					necessidades.setElimincaAdequada(true);
				}else{
					necessidades.setElimincaAlterada(true);
				}
			}
			necessidades.setElimincaoQual(eliminacaoQual);
			if(nutricao != null && !nutricao.equals("")){
				if(nutricao.equals("Adequada")){
					necessidades.setNutricaoMetabolismoAdequada(true);
				}else{
					necessidades.setNutricaoMetabolismoAlterada(true);
				}
			}
			necessidades.setNutricaoMetabolismoQual(nutricaoQual);
			
			if(sexualidade != null && !sexualidade.equals("")){
				if(sexualidade.equals("Adequada")){
					necessidades.setSexualidadeReproducaoAdequada(true);
				}else{
					necessidades.setSexualidadeReproducaoAlterada(true);
				}
			}
			necessidades.setSexualidadeReproducaoQual(sexualidadeQual);
			
			if(percepcao != null && !percepcao.equals("")){
				if(percepcao.equals("Adequada")){
					necessidades.setPercepcaoSaudeAdequada(true);
				}else{
					necessidades.setPercepcaoSaudeAlterada(true);
				}
			}
			necessidades.setPercepcaoSaudeQual(percepcaoQual);
			
			if(exercicio != null && !exercicio.equals("")){
				if(exercicio.equals("Adequada")){
					necessidades.setExercicioAdequada(true);
				}else{
					necessidades.setExercicioAlterada(true);
				}
			}
			necessidades.setExercicioQual(exercicioQual);
			
			
			
			if(cognicao != null && !cognicao.equals("")){
				if(cognicao.equals("Adequada")){
					necessidades.setCognicaoAdequada(true);
				}else{
					necessidades.setCognicaoAlterada(true);
				}
			}
			necessidades.setCognicaoQual(cognicaoQual);
			if(relacionamentos != null && !relacionamentos.equals("")){
				if(relacionamentos.equals("Adequada")){
					necessidades.setPapeisRelacionamentosAdequada(true);
				}else{
					necessidades.setPapeisRelacionamentosAlterada(true);
				}
			}
			necessidades.setPapeisRelacionamentosQual(relacionamentosQual);
			if(estresse != null && !estresse.equals("")){
				if(estresse.equals("Adequada")){
					necessidades.setGerenciamentoEstresseAdequada(true);
				}else{
					necessidades.setGerenciamentoEstresseAlterada(true);
				}
			}
			necessidades.setGerenciamentoEstresseQual(estresseQual);
			if(autoconceito != null && !autoconceito.equals("")){
				if(autoconceito.equals("Adequada")){
					necessidades.setAutoconceitoAdequada(true);
				}else{
					necessidades.setAutoconceitoAlterada(true);
				}
			}
			necessidades.setAutoconceitoQual(autoconceitoQual);
			
			if(espirituais != null && !espirituais.equals("")){
				if(espirituais.equals("Atendidas")){
					necessidades.setNecessidadesEspirituaisSim(true);
				}else{
					necessidades.setNecessidadesEspirituaisNao(true);
				}
			}
			
			try{
				fachada.inserirNecessidadesBasicas(necessidades);
				admissao.setNecessidadesBasicas(necessidades);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Necessidades B??sicas salvas com sucesso!");
				request.getSession().setAttribute("necessidades", admissao.getNecessidadesBasicas());
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			NecessidadesBasicas necessidades = evolucao.getNecessidadesBasicas();
			if(necessidades == null){
				necessidades = new NecessidadesBasicas();
			}else{
				necessidades.limparDados();
			}
			
			if(sono != null && !sono.equals("")){
				if(sono.equals("Adequada")){
					necessidades.setSonoAdequada(true);
				}else{
					necessidades.setSonoAlterada(true);
				}
			}
			necessidades.setSonoRepousoQual(sonoQual);
			if(eliminacao != null && !eliminacao.equals("")){
				if(eliminacao.equals("Adequada")){
					necessidades.setElimincaAdequada(true);
				}else{
					necessidades.setElimincaAlterada(true);
				}
			}
			necessidades.setElimincaoQual(eliminacaoQual);
			if(nutricao != null && !nutricao.equals("")){
				if(nutricao.equals("Adequada")){
					necessidades.setNutricaoMetabolismoAdequada(true);
				}else{
					necessidades.setNutricaoMetabolismoAlterada(true);
				}
			}
			necessidades.setNutricaoMetabolismoQual(nutricaoQual);
			
			if(sexualidade != null && !sexualidade.equals("")){
				if(sexualidade.equals("Adequada")){
					necessidades.setSexualidadeReproducaoAdequada(true);
				}else{
					necessidades.setSexualidadeReproducaoAlterada(true);
				}
			}
			necessidades.setSexualidadeReproducaoQual(sexualidadeQual);
			if(percepcao != null && !percepcao.equals("")){
				if(percepcao.equals("Adequada")){
					necessidades.setPercepcaoSaudeAdequada(true);
				}else{
					necessidades.setPercepcaoSaudeAlterada(true);
				}
			}
			necessidades.setPercepcaoSaudeQual(percepcaoQual);
			
			
			if(exercicio != null && !exercicio.equals("")){
				if(exercicio.equals("Adequada")){
					necessidades.setExercicioAdequada(true);
				}else{
					necessidades.setExercicioAlterada(true);
				}
			}
			necessidades.setExercicioQual(exercicioQual);
			
			
			if(cognicao != null && !cognicao.equals("")){
				if(cognicao.equals("Adequada")){
					necessidades.setCognicaoAdequada(true);
				}else{
					necessidades.setCognicaoAlterada(true);
				}
			}
			necessidades.setCognicaoQual(cognicaoQual);
			if(relacionamentos != null && !relacionamentos.equals("")){
				if(relacionamentos.equals("Adequada")){
					necessidades.setPapeisRelacionamentosAdequada(true);
				}else{
					necessidades.setPapeisRelacionamentosAlterada(true);
				}
			}
			necessidades.setPapeisRelacionamentosQual(relacionamentosQual);
			if(estresse != null && !estresse.equals("")){
				if(estresse.equals("Adequada")){
					necessidades.setGerenciamentoEstresseAdequada(true);
				}else{
					necessidades.setGerenciamentoEstresseAlterada(true);
				}
			}
			necessidades.setGerenciamentoEstresseQual(estresseQual);
			if(autoconceito != null && !autoconceito.equals("")){
				if(autoconceito.equals("Adequada")){
					necessidades.setAutoconceitoAdequada(true);
				}else{
					necessidades.setAutoconceitoAlterada(true);
				}
			}
			necessidades.setAutoconceitoQual(autoconceitoQual);
			
			if(espirituais != null && !espirituais.equals("")){
				if(espirituais.equals("Atendidas")){
					necessidades.setNecessidadesEspirituaisSim(true);
				}else{
					necessidades.setNecessidadesEspirituaisNao(true);
				}
			}
			
			try{
				fachada.inserirNecessidadesBasicas(necessidades);
				evolucao.setNecessidadesBasicas(necessidades);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Necessidades B??sicas salvas com sucesso!");
				
				request.getSession().setAttribute("necessidades", evolucao.getNecessidadesBasicas());
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		
		return retorno;
		
	}
	
	public ActionForward exameMentalGeralSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fATENDIMENTOEXMENTALGERAL);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String aparencia = request.getParameter("aparencia");
		String comportamentoMotorSemAnormalidade = request.getParameter("comportamentoMotorSemAnormalidade");
		String comportamentoMotorHiperativo = request.getParameter("comportamentoMotorHiperativo");
		String comportamentoMotorHipoativo = request.getParameter("comportamentoMotorHipoativo");
		String comportamentoMotorEstereotipias = request.getParameter("comportamentoMotorEstereotipias");
		String comportamentoMotorOutros = request.getParameter("comportamentoMotorOutros");
		String comportamentoEntrevistadorIrritado = request.getParameter("comportamentoEntrevistadorIrritado");
		String comportamentoEntrevistadorCauteloso = request.getParameter("comportamentoEntrevistadorCauteloso");
		String comportamentoEntrevistadorApatico = request.getParameter("comportamentoEntrevistadorApatico");
		String comportamentoEntrevistadorSarcastico = request.getParameter("comportamentoEntrevistadorSarcastico");
		String comportamentoEntrevistadorTaciturno = request.getParameter("comportamentoEntrevistadorTaciturno");
		String comportamentoEntrevistadorCooperativo = request.getParameter("comportamentoEntrevistadorCooperativo");
		String comportamentoEntrevistadorOutros = request.getParameter("comportamentoEntrevistadorOutros");
		String estadoEmocionalTranquilo = request.getParameter("estadoEmocionalTranquilo");
		String estadoEmocionalTenso = request.getParameter("estadoEmocionalTenso");
		String estadoEmocionalEmPanico = request.getParameter("estadoEmocionalEmPanico");
		String estadoEmocionalTriste = request.getParameter("estadoEmocionalTriste");
		String estadoEmocionalOutros = request.getParameter("estadoEmocionalOutros");
		String humorEutimico = request.getParameter("humorEutimico");
		String humorDisforico = request.getParameter("humorDisforico");
		String humorExpansivo = request.getParameter("humorExpansivo");
		String humorIrritavel = request.getParameter("humorIrritavel");
		String humorOutros = request.getParameter("humorOutros");
		String afetoAdequadoAoConteudo = request.getParameter("afetoAdequadoAoConteudo");
		String afetoLabil = request.getParameter("afetoLabil");
		String afetoEmbotado = request.getParameter("afetoEmbotado");
		String afetoOutros = request.getParameter("afetoOutros");
		String discursoCoerente = request.getParameter("discursoCoerente");
		String discursoIncoerente = request.getParameter("discursoIncoerente");
		String discursoFluxoAcelerado = request.getParameter("discursoFluxoAcelerado");
		String discursoFluxoLento = request.getParameter("discursoFluxoLento");
		String discursoProlixo = request.getParameter("discursoProlixo");
		String discursoPodre = request.getParameter("discursoPodre");
		String discursoOutros = request.getParameter("discursoOutros");
		String disturbiosAfetividade = request.getParameter("disturbiosAfetividade");
		String disturbiosLinguagem = request.getParameter("disturbiosLinguagem");
		String disturbiosSensoPercepcao = request.getParameter("disturbiosSensoPercepcao");
		String disturbiosAtencao = request.getParameter("disturbiosAtencao");
		String disturbiosMemoria = request.getParameter("disturbiosMemoria");
		String disturbiosHumor = request.getParameter("disturbiosHumor");
		String disturbiosOrientacao = request.getParameter("disturbiosOrientacao");
		String disturbiosConsciencia = request.getParameter("disturbiosConsciencia");
		String disturbiosOutros = request.getParameter("disturbiosOutros");
		String formaDoPensamentoAdequada = request.getParameter("formaDoPensamentoAdequada");
		String formaDoPensamentoFugaDeIdeias = request.getParameter("formaDoPensamentoFugaDeIdeias");
		String formaDoPensamentoPerseveracao = request.getParameter("formaDoPensamentoPerseveracao");
		String formaDoPensamentoTangencialidade = request.getParameter("formaDoPensamentoTangencialidade");
		String formaDoPensamentoCircunstancialidade = request.getParameter("formaDoPensamentoCircunstancialidade");
		String formaDoPensamentoNeologismos = request.getParameter("formaDoPensamentoNeologismos");
		String formaDoPensamentoBloqueioDePensamento = request.getParameter("formaDoPensamentoBloqueioDePensamento");
		String formaDoPensamentoPensamentoIncoerente = request.getParameter("formaDoPensamentoPensamentoIncoerente");
		String formaDoPensamentoEcolalia = request.getParameter("formaDoPensamentoEcolalia");
		String formaDoPensamentoOutros = request.getParameter("formaDoPensamentoOutros");
		String conteudoDoPensamentoAdequado = request.getParameter("conteudoDoPensamentoAdequado");
		String conteudoDoPensamentoDepressivo = request.getParameter("conteudoDoPensamentoDepressivo");
		String conteudoDoPensamentoAnsioso = request.getParameter("conteudoDoPensamentoAnsioso");
		String conteudoDoPensamentoFobico = request.getParameter("conteudoDoPensamentoFobico");
		String conteudoDoPensamentoObsessivo = request.getParameter("conteudoDoPensamentoObsessivo");
		String conteudoDoPensamentoOutros = request.getParameter("conteudoDoPensamentoOutros");
		String capacidadeDeAbstracao = request.getParameter("capacidadeDeAbstracao");
		String criticaPercepcaoDeUmProblemaFisicoMental = request.getParameter("criticaPercepcaoDeUmProblemaFisicoMental");
		String criticaNegacaoDaDoenca = request.getParameter("criticaNegacaoDaDoenca");
		String criticaReconhecimentoDaNecessidadeDeTratamento = request.getParameter("criticaReconhecimentoDaNecessidadeDeTratamento");
		
		
		ExameMental mental = null;
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			 mental = admissao.getExameMental();
			 if(mental == null){
				 mental = new ExameMental();
			 }
			
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			 mental = evolucao.getExameMental();
			 if(mental == null){
				 mental = new ExameMental();
			 }
		}
		
		ExameMentalGeral exame = mental.getExameMentalGeral();
		if(exame == null){
			exame = new ExameMentalGeral();
		}
		
		exame.setComportamentoMotorOutros(comportamentoMotorOutros);
		exame.setComportamentoEntrevistadorOutros(comportamentoEntrevistadorOutros);
		exame.setEstadoEmocionalOutros(estadoEmocionalOutros);
		exame.setHumorOutros(humorOutros);
		exame.setAfetoOutros(afetoOutros);
		exame.setDiscursoOutros(discursoOutros);
		exame.setDisturbiosOutros(disturbiosOutros);
		exame.setFormaDoPensamentoOutros(formaDoPensamentoOutros);
		exame.setConteudoDoPensamentoOutros(conteudoDoPensamentoOutros);
		
		
		if(aparencia != null && !aparencia.equals("") && aparencia.equals("aparenciaHigienizado")){
			exame.setAparenciaHigienizado(true);
		}else if(aparencia != null && !aparencia.equals("") && aparencia.equals("aparenciaNaoHigienizado")){
			exame.setAparenciaNaoHigienizado(true);
		}
		if(comportamentoMotorSemAnormalidade != null && !comportamentoMotorSemAnormalidade.equals("") && comportamentoMotorSemAnormalidade.equals("on")){
			exame.setComportamentoMotorSemAnormalidade(true);
		}else {
			exame.setComportamentoMotorSemAnormalidade(false);
		}
		if(comportamentoMotorHiperativo != null && !comportamentoMotorHiperativo.equals("") && comportamentoMotorHiperativo.equals("on")){
			exame.setComportamentoMotorHiperativo(true);
		}else {
			exame.setComportamentoMotorHiperativo(false);
		}
		if(comportamentoMotorHipoativo != null && !comportamentoMotorHipoativo.equals("") && comportamentoMotorHipoativo.equals("on")){
			exame.setComportamentoMotorHipoativo(true);
		}else {
			exame.setComportamentoMotorHipoativo(false);
		}
		if(comportamentoMotorEstereotipias != null && !comportamentoMotorEstereotipias.equals("") && comportamentoMotorEstereotipias.equals("on")){
			exame.setComportamentoMotorEstereotipias(true);
		}else {
			exame.setComportamentoMotorEstereotipias(false);
		}
		if(comportamentoEntrevistadorIrritado != null && !comportamentoEntrevistadorIrritado.equals("") && comportamentoEntrevistadorIrritado.equals("on")){
			exame.setComportamentoEntrevistadorIrritado(true);
		}else {
			exame.setComportamentoEntrevistadorIrritado(false);
		}
		if(comportamentoEntrevistadorCauteloso != null && !comportamentoEntrevistadorCauteloso.equals("") && comportamentoEntrevistadorCauteloso.equals("on")){
			exame.setComportamentoEntrevistadorCauteloso(true);
		}else {
			exame.setComportamentoEntrevistadorCauteloso(false);
		}
		if(comportamentoEntrevistadorApatico != null && !comportamentoEntrevistadorApatico.equals("") && comportamentoEntrevistadorApatico.equals("on")){
			exame.setComportamentoEntrevistadorApatico(true);
		}else {
			exame.setComportamentoEntrevistadorApatico(false);
		}
		if(comportamentoEntrevistadorSarcastico != null && !comportamentoEntrevistadorSarcastico.equals("") && comportamentoEntrevistadorSarcastico.equals("on")){
			exame.setComportamentoEntrevistadorSarcastico(true);
		}else {
			exame.setComportamentoEntrevistadorSarcastico(false);
		}
		if(comportamentoEntrevistadorTaciturno != null && !comportamentoEntrevistadorTaciturno.equals("") && comportamentoEntrevistadorTaciturno.equals("on")){
			exame.setComportamentoEntrevistadorTaciturno(true);
		}else {
			exame.setComportamentoEntrevistadorTaciturno(false);
		}
		if(comportamentoEntrevistadorCooperativo != null && !comportamentoEntrevistadorCooperativo.equals("") && comportamentoEntrevistadorCooperativo.equals("on")){
			exame.setComportamentoEntrevistadorCooperativo(true);
		}else {
			exame.setComportamentoEntrevistadorCooperativo(false);
		}
		if(estadoEmocionalTranquilo != null && !estadoEmocionalTranquilo.equals("") && estadoEmocionalTranquilo.equals("on")){
			exame.setEstadoEmocionalTranquilo(true);
		}else {
			exame.setEstadoEmocionalTranquilo(false);
		}
		if(estadoEmocionalTenso != null && !estadoEmocionalTenso.equals("") && estadoEmocionalTenso.equals("on")){
			exame.setEstadoEmocionalTenso(true);
		}else {
			exame.setEstadoEmocionalTenso(false);
		}
		if(estadoEmocionalEmPanico != null && !estadoEmocionalEmPanico.equals("") && estadoEmocionalEmPanico.equals("on")){
			exame.setEstadoEmocionalEmPanico(true);
		}else {
			exame.setEstadoEmocionalEmPanico(false);
		}
		if(estadoEmocionalTriste != null && !estadoEmocionalTriste.equals("") && estadoEmocionalTriste.equals("on")){
			exame.setEstadoEmocionalTriste(true);
		}else {
			exame.setEstadoEmocionalTriste(false);
		}
		if(humorEutimico != null && !humorEutimico.equals("") && humorEutimico.equals("on")){
			exame.setHumorEutimico(true);
		}else {
			exame.setHumorEutimico(false);
		}
		if(humorDisforico != null && !humorDisforico.equals("") && humorDisforico.equals("on")){
			exame.setHumorDisforico(true);
		}else {
			exame.setHumorDisforico(false);
		}
		if(humorExpansivo != null && !humorExpansivo.equals("") && humorExpansivo.equals("on")){
			exame.setHumorExpansivo(true);
		}else {
			exame.setHumorExpansivo(false);
		}
		if(humorIrritavel != null && !humorIrritavel.equals("") && humorIrritavel.equals("on")){
			exame.setHumorIrritavel(true);
		}else {
			exame.setHumorIrritavel(false);
		}
		if(afetoAdequadoAoConteudo != null && !afetoAdequadoAoConteudo.equals("") && afetoAdequadoAoConteudo.equals("on")){
			exame.setAfetoAdequadoAoConteudo(true);
		}else {
			exame.setAfetoAdequadoAoConteudo(false);
		}
		if(afetoLabil != null && !afetoLabil.equals("") && afetoLabil.equals("on")){
			exame.setAfetoLabil(true);
		}else {
			exame.setAfetoLabil(false);
		}
		if(afetoEmbotado != null && !afetoEmbotado.equals("") && afetoEmbotado.equals("on")){
			exame.setAfetoEmbotado(true);
		}else {
			exame.setAfetoEmbotado(false);
		}
		if(discursoCoerente != null && !discursoCoerente.equals("") && discursoCoerente.equals("on")){
			exame.setDiscursoCoerente(true);
		}else {
			exame.setDiscursoCoerente(false);
		}
		if(discursoIncoerente != null && !discursoIncoerente.equals("") && discursoIncoerente.equals("on")){
			exame.setDiscursoIncoerente(true);
		}else {
			exame.setDiscursoIncoerente(false);
		}
		if(discursoFluxoAcelerado != null && !discursoFluxoAcelerado.equals("") && discursoFluxoAcelerado.equals("on")){
			exame.setDiscursoFluxoAcelerado(true);
		}else {
			exame.setDiscursoFluxoAcelerado(false);
		}
		if(discursoFluxoLento != null && !discursoFluxoLento.equals("") && discursoFluxoLento.equals("on")){
			exame.setDiscursoFluxoLento(true);
		}else {
			exame.setDiscursoFluxoLento(false);
		}
		if(discursoProlixo != null && !discursoProlixo.equals("") && discursoProlixo.equals("on")){
			exame.setDiscursoProlixo(true);
		}else {
			exame.setDiscursoProlixo(false);
		}
		if(discursoPodre != null && !discursoPodre.equals("") && discursoPodre.equals("on")){
			exame.setDiscursoPodre(true);
		}else {
			exame.setDiscursoPodre(false);
		}
		if(disturbiosAfetividade != null && !disturbiosAfetividade.equals("") && disturbiosAfetividade.equals("on")){
			exame.setDisturbiosAfetividade(true);
		}else {
			exame.setDisturbiosAfetividade(false);
		}
		if(disturbiosLinguagem != null && !disturbiosLinguagem.equals("") && disturbiosLinguagem.equals("on")){
			exame.setDisturbiosLinguagem(true);
		}else {
			exame.setDisturbiosLinguagem(false);
		}
		if(disturbiosSensoPercepcao != null && !disturbiosSensoPercepcao.equals("") && disturbiosSensoPercepcao.equals("on")){
			exame.setDisturbiosSensoPercepcao(true);
		}else {
			exame.setDisturbiosSensoPercepcao(false);
		}
		if(disturbiosAtencao != null && !disturbiosAtencao.equals("") && disturbiosAtencao.equals("on")){
			exame.setDisturbiosAtencao(true);
		}else {
			exame.setDisturbiosAtencao(false);
		}
		if(disturbiosMemoria != null && !disturbiosMemoria.equals("") && disturbiosMemoria.equals("on")){
			exame.setDisturbiosMemoria(true);
		}else {
			exame.setDisturbiosMemoria(false);
		}
		if(disturbiosHumor != null && !disturbiosHumor.equals("") && disturbiosHumor.equals("on")){
			exame.setDisturbiosHumor(true);
		}else {
			exame.setDisturbiosHumor(false);
		}
		if(disturbiosOrientacao != null && !disturbiosOrientacao.equals("") && disturbiosOrientacao.equals("on")){
			exame.setDisturbiosOrientacao(true);
		}else {
			exame.setDisturbiosOrientacao(false);
		}
		if(disturbiosConsciencia != null && !disturbiosConsciencia.equals("") && disturbiosConsciencia.equals("on")){
			exame.setDisturbiosConsciencia(true);
		}else {
			exame.setDisturbiosConsciencia(false);
		}
		if(formaDoPensamentoAdequada != null && !formaDoPensamentoAdequada.equals("") && formaDoPensamentoAdequada.equals("on")){
			exame.setFormaDoPensamentoAdequada(true);
		}else {
			exame.setFormaDoPensamentoAdequada(false);
		}
		if(formaDoPensamentoFugaDeIdeias != null && !formaDoPensamentoFugaDeIdeias.equals("") && formaDoPensamentoFugaDeIdeias.equals("on")){
			exame.setFormaDoPensamentoFugaDeIdeias(true);
		}else {
			exame.setFormaDoPensamentoFugaDeIdeias(false);
		}
		if(formaDoPensamentoPerseveracao != null && !formaDoPensamentoPerseveracao.equals("") && formaDoPensamentoPerseveracao.equals("on")){
			exame.setFormaDoPensamentoPerseveracao(true);
		}else {
			exame.setFormaDoPensamentoPerseveracao(false);
		}
		if(formaDoPensamentoTangencialidade != null && !formaDoPensamentoTangencialidade.equals("") && formaDoPensamentoTangencialidade.equals("on")){
			exame.setFormaDoPensamentoTangencialidade(true);
		}else {
			exame.setFormaDoPensamentoTangencialidade(false);
		}
		if(formaDoPensamentoCircunstancialidade != null && !formaDoPensamentoCircunstancialidade.equals("") && formaDoPensamentoCircunstancialidade.equals("on")){
			exame.setFormaDoPensamentoCircunstancialidade(true);
		}else {
			exame.setFormaDoPensamentoCircunstancialidade(false);
		}
		if(formaDoPensamentoNeologismos != null && !formaDoPensamentoNeologismos.equals("") && formaDoPensamentoNeologismos.equals("on")){
			exame.setFormaDoPensamentoNeologismos(true);
		}else {
			exame.setFormaDoPensamentoNeologismos(false);
		}
		if(formaDoPensamentoBloqueioDePensamento != null && !formaDoPensamentoBloqueioDePensamento.equals("") && formaDoPensamentoBloqueioDePensamento.equals("on")){
			exame.setFormaDoPensamentoBloqueioDePensamento(true);
		}else {
			exame.setFormaDoPensamentoBloqueioDePensamento(false);
		}
		if(formaDoPensamentoPensamentoIncoerente != null && !formaDoPensamentoPensamentoIncoerente.equals("") && formaDoPensamentoPensamentoIncoerente.equals("on")){
			exame.setFormaDoPensamentoPensamentoIncoerente(true);
		}else {
			exame.setFormaDoPensamentoPensamentoIncoerente(false);
		}
		if(formaDoPensamentoEcolalia != null && !formaDoPensamentoEcolalia.equals("") && formaDoPensamentoEcolalia.equals("on")){
			exame.setFormaDoPensamentoEcolalia(true);
		}else {
			exame.setFormaDoPensamentoEcolalia(false);
		}
		if(conteudoDoPensamentoAdequado != null && !conteudoDoPensamentoAdequado.equals("") && conteudoDoPensamentoAdequado.equals("on")){
			exame.setConteudoDoPensamentoAdequado(true);
		}else {
			exame.setConteudoDoPensamentoAdequado(false);
		}
		if(conteudoDoPensamentoDepressivo != null && !conteudoDoPensamentoDepressivo.equals("") && conteudoDoPensamentoDepressivo.equals("on")){
			exame.setConteudoDoPensamentoDepressivo(true);
		}else {
			exame.setConteudoDoPensamentoDepressivo(false);
		}
		if(conteudoDoPensamentoAnsioso != null && !conteudoDoPensamentoAnsioso.equals("") && conteudoDoPensamentoAnsioso.equals("on")){
			exame.setConteudoDoPensamentoAnsioso(true);
		}else {
			exame.setConteudoDoPensamentoAnsioso(false);
		}
		if(conteudoDoPensamentoFobico != null && !conteudoDoPensamentoFobico.equals("") && conteudoDoPensamentoFobico.equals("on")){
			exame.setConteudoDoPensamentoFobico(true);
		}else {
			exame.setConteudoDoPensamentoFobico(false);
		}
		if(conteudoDoPensamentoObsessivo != null && !conteudoDoPensamentoObsessivo.equals("") && conteudoDoPensamentoObsessivo.equals("on")){
			exame.setConteudoDoPensamentoObsessivo(true);
		}else {
			exame.setConteudoDoPensamentoObsessivo(false);
		}
		if(capacidadeDeAbstracao != null && !capacidadeDeAbstracao.equals("") && capacidadeDeAbstracao.equals("capacidadeDeAbstracaoSim")){
			exame.setCapacidadeDeAbstracaoSim(true);
		}else if(capacidadeDeAbstracao != null && !capacidadeDeAbstracao.equals("") && capacidadeDeAbstracao.equals("capacidadeDeAbstracaoNao")){
			exame.setCapacidadeDeAbstracaoNao(true);
		}
		if(criticaPercepcaoDeUmProblemaFisicoMental != null && !criticaPercepcaoDeUmProblemaFisicoMental.equals("") && criticaPercepcaoDeUmProblemaFisicoMental.equals("criticaPercepcaoDeUmProblemaFisicoMentalSim")){
			exame.setCriticaPercepcaoDeUmProblemaFisicoMentalSim(true);
		}else if(criticaPercepcaoDeUmProblemaFisicoMental != null && !criticaPercepcaoDeUmProblemaFisicoMental.equals("") && criticaPercepcaoDeUmProblemaFisicoMental.equals("criticaPercepcaoDeUmProblemaFisicoMentalNao")){
			exame.setCriticaPercepcaoDeUmProblemaFisicoMentalNao(true);
		}
		if(criticaNegacaoDaDoenca != null && !criticaNegacaoDaDoenca.equals("") && criticaNegacaoDaDoenca.equals("criticaNegacaoDaDoencaSim")){
			exame.setCriticaNegacaoDaDoencaSim(true);
		}else if(criticaNegacaoDaDoenca != null && !criticaNegacaoDaDoenca.equals("") && criticaNegacaoDaDoenca.equals("criticaNegacaoDaDoencaNao")){
			exame.setCriticaNegacaoDaDoencaNao(true);
		}
		if(criticaReconhecimentoDaNecessidadeDeTratamento != null && !criticaReconhecimentoDaNecessidadeDeTratamento.equals("") && criticaReconhecimentoDaNecessidadeDeTratamento.equals("criticaReconhecimentoDaNecessidadeDeTratamentoSim")){
			exame.setCriticaReconhecimentoDaNecessidadeDeTratamentoSim(true);
		}else if(criticaReconhecimentoDaNecessidadeDeTratamento != null && !criticaReconhecimentoDaNecessidadeDeTratamento.equals("") && criticaReconhecimentoDaNecessidadeDeTratamento.equals("criticaReconhecimentoDaNecessidadeDeTratamentoNao")){
			exame.setCriticaReconhecimentoDaNecessidadeDeTratamentoNao(true);
		}
		
		
		if(atendimento instanceof Admissao){
			mental.setExameMentalGeral(exame);
			Admissao admissao = (Admissao) atendimento;
			admissao.setExameMental(mental);
			
			try{
				fachada.inserirExameMentalGeral(exame);
				fachada.inserirExameMental(mental);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Mental Geral salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
			
		}else if(atendimento instanceof Evolucao){
			mental.setExameMentalGeral(exame);
			Evolucao evolucao = (Evolucao) atendimento;
			evolucao.setExameMental(mental);
			
			try{
				fachada.inserirExameMentalGeral(exame);
				fachada.inserirExameMental(mental);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Mental Geral salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
			
		
		return retorno;
	}
	
	public ActionForward exameMentalMiniMentalSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fATENDIMENTOEXMENTALMINI);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String emQueAnoEstamos = request.getParameter("emQueAnoEstamos");
		String emQueMesEstamos = request.getParameter("emQueMesEstamos");
		String emQueDiaDoMesEstamos = request.getParameter("emQueDiaDoMesEstamos");
		String emQueDiaDaSemanaEstamos = request.getParameter("emQueDiaDaSemanaEstamos");
		String emQueEstacaoDoAnoEstamos = request.getParameter("emQueEstacaoDoAnoEstamos");
		String emQuePaisEstamos = request.getParameter("emQuePaisEstamos");
		String emQueDistritoVive = request.getParameter("emQueDistritoVive");
		String emQueTerraVive = request.getParameter("emQueTerraVive");
		String emQueCasaEstamos = request.getParameter("emQueCasaEstamos");
		String emQueAndarEstamos = request.getParameter("emQueAndarEstamos");
		String retensaoPera = request.getParameter("retensaoPera");
		String retensaoGato = request.getParameter("retensaoGato");
		String retensaoBola = request.getParameter("retensaoBola");
		String atencaoCalculo = request.getParameter("atencaoCalculo");
		String evocacaoPera = request.getParameter("evocacaoPera");
		String evocacaoGato = request.getParameter("evocacaoGato");
		String evocacaoBola = request.getParameter("evocacaoBola");
		String linguagemRelogio = request.getParameter("linguagemRelogio");
		String linguagemLapis = request.getParameter("linguagemLapis");
		String fraseDecorar = request.getParameter("fraseDecorar");
		int pontuacao = 0;
		
		ExameMental mental = null;
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			 mental = admissao.getExameMental();
			 if(mental == null){
				 mental = new ExameMental();
			 }
			
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			 mental = evolucao.getExameMental();
			 if(mental == null){
				 mental = new ExameMental();
			 }
		}
		
		ExameMentalMiniMental exame = mental.getExameMentalMiniMental();
		if(exame == null){
			exame = new ExameMentalMiniMental();
		}
		
		if(emQueAnoEstamos != null && !emQueAnoEstamos.equals("") && emQueAnoEstamos.equals("on")){
			exame.setEmQueAnoEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueAnoEstamos(false);
		}
		if(emQueMesEstamos != null && !emQueMesEstamos.equals("") && emQueMesEstamos.equals("on")){
			exame.setEmQueMesEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueMesEstamos(false);
		}
		if(emQueDiaDoMesEstamos != null && !emQueDiaDoMesEstamos.equals("") && emQueDiaDoMesEstamos.equals("on")){
			exame.setEmQueDiaDoMesEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueDiaDoMesEstamos(false);
		}
		if(emQueDiaDaSemanaEstamos != null && !emQueDiaDaSemanaEstamos.equals("") && emQueDiaDaSemanaEstamos.equals("on")){
			exame.setEmQueDiaDaSemanaEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueDiaDaSemanaEstamos(false);
		}
		if(emQueEstacaoDoAnoEstamos != null && !emQueEstacaoDoAnoEstamos.equals("") && emQueEstacaoDoAnoEstamos.equals("on")){
			exame.setEmQueEstacaoDoAnoEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueEstacaoDoAnoEstamos(false);
		}
		if(emQuePaisEstamos != null && !emQuePaisEstamos.equals("") && emQuePaisEstamos.equals("on")){
			exame.setEmQuePaisEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQuePaisEstamos(false);
		}
		if(emQueDistritoVive != null && !emQueDistritoVive.equals("") && emQueDistritoVive.equals("on")){
			exame.setEmQueDistritoVive(true);
			pontuacao++;
		}else {
			exame.setEmQueDistritoVive(false);
		}
		if(emQueTerraVive != null && !emQueTerraVive.equals("") && emQueTerraVive.equals("on")){
			exame.setEmQueTerraVive(true);
			pontuacao++;
		}else {
			exame.setEmQueTerraVive(false);
		}
		if(emQueCasaEstamos != null && !emQueCasaEstamos.equals("") && emQueCasaEstamos.equals("on")){
			exame.setEmQueCasaEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueCasaEstamos(false);
		}
		if(emQueAndarEstamos != null && !emQueAndarEstamos.equals("") && emQueAndarEstamos.equals("on")){
			exame.setEmQueAndarEstamos(true);
			pontuacao++;
		}else {
			exame.setEmQueAndarEstamos(false);
		}
		
		if(retensaoPera != null && !retensaoPera.equals("") && retensaoPera.equals("on")){
			exame.setRetensaoPera(true);
			pontuacao++;
		}else {
			exame.setRetensaoPera(false);
		}
		if(retensaoGato != null && !retensaoGato.equals("") && retensaoGato.equals("on")){
			exame.setRetensaoGato(true);
			pontuacao++;
		}else {
			exame.setRetensaoGato(false);
		}
		if(retensaoBola != null && !retensaoBola.equals("") && retensaoBola.equals("on")){
			exame.setRetensaoBola(true);
			pontuacao++;
		}else {
			exame.setRetensaoBola(false);
		}
		exame.setAtencaoCalculo(atencaoCalculo);
		if(atencaoCalculo != null && !atencaoCalculo.equals("")){
			pontuacao += Integer.parseInt(atencaoCalculo);
		}
		if(evocacaoPera != null && !evocacaoPera.equals("") && evocacaoPera.equals("on")){
			exame.setEvocacaoPera(true);
			pontuacao++;
		}else {
			exame.setEvocacaoPera(false);
		}
		if(evocacaoGato != null && !evocacaoGato.equals("") && evocacaoGato.equals("on")){
			exame.setEvocacaoGato(true);
			pontuacao++;
		}else {
			exame.setEvocacaoGato(false);
		}
		if(evocacaoBola != null && !evocacaoBola.equals("") && evocacaoBola.equals("on")){
			exame.setEvocacaoBola(true);
			pontuacao++;
		}else {
			exame.setEvocacaoBola(false);
		}
		if(linguagemRelogio != null && !linguagemRelogio.equals("") && linguagemRelogio.equals("on")){
			exame.setLinguagemRelogio(true);
			pontuacao++;
		}else {
			exame.setLinguagemRelogio(false);
		}
		if(linguagemLapis != null && !linguagemLapis.equals("") && linguagemLapis.equals("on")){
			exame.setLinguagemLapis(true);
			pontuacao++;
		}else {
			exame.setLinguagemLapis(false);
		}
		if(fraseDecorar != null && !fraseDecorar.equals("") && fraseDecorar.equals("on")){
			exame.setFraseDecorar(true);
			pontuacao++;
		}else {
			exame.setFraseDecorar(false);
		}
		exame.setPontuacao(pontuacao);
		
		if(atendimento instanceof Admissao){
			mental.setExameMentalMiniMental(exame);
			Admissao admissao = (Admissao) atendimento;
			admissao.setExameMental(mental);
			
			try{
				fachada.inserirExameMentalMiniMental(exame);
				fachada.inserirExameMental(mental);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Mental Mini Mental salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
			
		}else if(atendimento instanceof Evolucao){
			mental.setExameMentalMiniMental(exame);
			Evolucao evolucao = (Evolucao) atendimento;
			evolucao.setExameMental(mental);
			
			try{
				fachada.inserirExameMentalMiniMental(exame);
				fachada.inserirExameMental(mental);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Mental Mini Mental salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
			
		
		return retorno;
	}
	
	public ActionForward cipeBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String valor = request.getParameter("valor");
		ActionForward retorno = map.findForward(fATENDIMENTOPROCENFERMAGEM);
		
		try{
			List<Cipe> cipes = fachada.listarCipe(valor);
			request.setAttribute("cipeList", cipes);
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward diagnosticoAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		String idCipe = request.getParameter("id");
		
		if(idCipe != null && !idCipe.equals("")){
			try{
				Cipe cipe = fachada.getCipePorId(Integer.parseInt(idCipe));
				request.getSession().setAttribute("cipe", cipe);
				
				Diagnostico diagnostico = new Diagnostico();
				diagnostico.setCipe(cipe);
				request.getSession().setAttribute("diagnostico", diagnostico);
				request.getSession().removeAttribute("nics");
				request.getSession().removeAttribute("nocs");
				
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		return retorno;
	}
	
	public ActionForward nicNocBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String valor = request.getParameter("valor");
		String tipo = request.getParameter("tipo");
		String acao = request.getParameter("buscarNicNoc");
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		if(acao != null && !acao.equals("") && acao.equals("editar")){
			retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		}
		
		try{
			if(tipo != null && tipo.equals("intervencao")){
				List<Nic> nics = fachada.listarNic(valor);
				request.setAttribute("nicList", nics);
			}else {
				List<Noc> nocs = fachada.listarNoc(valor);
				request.setAttribute("nocList", nocs);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		
		return retorno;
	}
	
	public ActionForward nicAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		
		String idNic = request.getParameter("id");
		if(idNic != null && !idNic.equals("")){
			try{
				List<Nic> nics = (List<Nic>) request.getSession().getAttribute("nics");
				Nic nic = fachada.getNicPorId(Integer.parseInt(idNic));
				if(nic != null ){
					if(nics == null){
						nics = new ArrayList<Nic>();
					}
					
					boolean contem = false;
					for (Nic nicTemp : nics) {
						if(nic.getId() == nicTemp.getId()){
							contem = true;
						}
					}
					
					if(!contem){
						nics.add(nic);
					}
					
				}
				request.getSession().setAttribute("nics", nics);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		
		return retorno;
	}
	
	public ActionForward nocAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		
		String idNoc = request.getParameter("id");
		if(idNoc != null && !idNoc.equals("")){
			try{
				List<Noc> nocs = (List<Noc>) request.getSession().getAttribute("nocs");
				Noc noc = fachada.getNocPorId(Integer.parseInt(idNoc));
				
				if(noc != null){
					if(nocs == null){
						nocs = new ArrayList<Noc>();
					}
					
					boolean contem = false;
					for (Noc nocTemp : nocs) {
						if(noc.getId() == nocTemp.getId()){
							contem = true;
						}
					}
					
					if(!contem){
						nocs.add(noc);
					}
					
				}
				
				request.getSession().setAttribute("nocs", nocs);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward removerNoc(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		
		String idNoc = request.getParameter("idNoc");
		if(idNoc != null && !idNoc.equals("")){
			try{
				List<Noc> nocs = (List<Noc>) request.getSession().getAttribute("nocs");
				
				if(idNoc != null && !idNoc.equals("")){
					for (int i = 0; i < nocs.size(); i++) {
						Noc noc = nocs.get(i);
						if(noc.getId() == Integer.parseInt(idNoc)){
							nocs.remove(i);
							i = nocs.size();
						}
					}
				}
					
				request.getSession().setAttribute("nocs", nocs);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward removerNic(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
		
		String idNic = request.getParameter("idNic");
		if(idNic != null && !idNic.equals("")){
			try{
				List<Nic> nics = (List<Nic>) request.getSession().getAttribute("nics");
				
				if(idNic != null && !idNic.equals("")){
					for (int i = 0; i < nics.size(); i++) {
						Nic nic = nics.get(i);
						if(nic.getId() == Integer.parseInt(idNic)){
							nics.remove(i);
							i = nics.size();
						}
					}
				}
					
				request.getSession().setAttribute("nics", nics);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward diagnosticoSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOADD);
	
		Cipe cipe = (Cipe) request.getSession().getAttribute("cipe");
		List<Noc> nocs = (List<Noc>) request.getSession().getAttribute("nocs");
		List<Nic> nics = (List<Nic>) request.getSession().getAttribute("nics");
		
		try{
			Diagnostico diagnostico = new Diagnostico();
			diagnostico.setCipe(cipe);
			
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			diagnostico.setAtendimento(atendimento);
			
			diagnostico = fachada.inserirDiagnostico(diagnostico);
			
			if(nics != null && !nics.isEmpty()){
				for (Nic nic : nics) {
					Intervencoes intervencoes = new Intervencoes();
					intervencoes.setDiagnostico(diagnostico);
					intervencoes.setNic(nic);
					fachada.inserirIntervencao(intervencoes);
				}
			}
			
			if(nocs != null && !nocs.isEmpty()){
				for (Noc noc : nocs) {
					Resultados resultados = new Resultados();
					resultados.setDiagnostico(diagnostico);
					resultados.setNoc(noc);
					fachada.inserirResultados(resultados);
				}
			}
			
			request.setAttribute("mensagem", "Diagn??stico salvo com sucesso!");
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	
	public ActionForward intervencaoAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		
		String idNic = request.getParameter("id");
		if(idNic != null && !idNic.equals("")){
			try{
				List<Intervencoes> intervencoes = (List<Intervencoes>) request.getSession().getAttribute("intervencoes");
				
				
				Nic nic = fachada.getNicPorId(Integer.parseInt(idNic));
				if(nic != null ){
					if(intervencoes == null){
						intervencoes = new ArrayList<Intervencoes>();
					}
					
					boolean contem = false;
					for (Intervencoes inter : intervencoes) {
						Nic nicTemp = inter.getNic();
						if(nic.getId() == nicTemp.getId()){
							contem = true;
						}
					}
					
					if(!contem){
						Diagnostico diagnostico = (Diagnostico) request.getSession().getAttribute("diagnostico");
						Intervencoes novaInter = new Intervencoes();
						novaInter.setDiagnostico(diagnostico);
						novaInter.setNic(nic);
						
						novaInter = fachada.inserirIntervencao(novaInter);
						intervencoes.add(novaInter);
						
					}
					
				}
				request.getSession().setAttribute("intervencoes", intervencoes);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		
		return retorno;
	}
	
	public ActionForward resultadoAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		
		String idNoc = request.getParameter("id");
		if(idNoc != null && !idNoc.equals("")){
			try{
				List<Resultados> resultados = (List<Resultados>) request.getSession().getAttribute("resultados");
				
				Noc noc = fachada.getNocPorId(Integer.parseInt(idNoc));
				if(noc != null ){
					if(resultados == null){
						resultados = new ArrayList<Resultados>();
					}
					
					boolean contem = false;
					for (Resultados inter : resultados) {
						Noc nocTemp = inter.getNoc();
						if(noc.getId() == nocTemp.getId()){
							contem = true;
						}
					}
					
					if(!contem){
						Diagnostico diagnostico = (Diagnostico) request.getSession().getAttribute("diagnostico");
						Resultados novoResult = new Resultados();
						novoResult.setDiagnostico(diagnostico);
						novoResult.setNoc(noc);
						
						novoResult = fachada.inserirResultados(novoResult);
						resultados.add(novoResult);
						
					}
					
				}
				request.getSession().setAttribute("resultados", resultados);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		
		return retorno;
	}
	
	public ActionForward removerResultado(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		
		String idResultado = request.getParameter("id");
		if(idResultado != null && !idResultado.equals("")){
			try{
				List<Resultados> resultados = (List<Resultados>) request.getSession().getAttribute("resultados");
				
				if(resultados == null){
					resultados = new ArrayList<Resultados>();
				}
				
				for (int i = 0; i < resultados.size(); i++) {
					Resultados result = resultados.get(i);
					
					if(result.getId() == Integer.parseInt(idResultado)){
						fachada.removerResultados(result);
						resultados.remove(i);
						
						i = resultados.size();
					}
				}
				
					
				request.getSession().setAttribute("resultados", resultados);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward removerIntervencao(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fDIAGNOSTICOESCOLHIDO);
		
		String idIntervencoes = request.getParameter("id");
		if(idIntervencoes != null && !idIntervencoes.equals("")){
			try{
				List<Intervencoes> intervencoes = (List<Intervencoes>) request.getSession().getAttribute("intervencoes");
				
				if(intervencoes == null){
					intervencoes = new ArrayList<Intervencoes>();
				}
				
				for (int i = 0; i < intervencoes.size(); i++) {
					Intervencoes inter = intervencoes.get(i);
					
					if(inter.getId() == Integer.parseInt(idIntervencoes)){
						fachada.removerIntervencao(inter);
						intervencoes.remove(i);
						
						i = intervencoes.size();
					}
				}
				
					
				request.getSession().setAttribute("intervencoes", intervencoes);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}
		
		return retorno;
	}
	
	public ActionForward altaSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOALTA);
		
		try{
			String descricao = request.getParameter("alta");
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			Alta alta = new Alta();
			alta.setDataHora(new Date());
			alta.setDescricao(descricao);
			atendimento.setAlta(alta);
			
			alta = fachada.inserirAlta(alta);
			atendimento.setAlta(alta);
			fachada.inserirAtendimento(atendimento);
			
			request.getSession().setAttribute("atendimento", atendimento);
			request.setAttribute("mensagem", "Orienta????es para Alta salvas com sucesso!");
			
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		
		return retorno;
	}
	
	public ActionForward assinarAtendimento(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fATENDIMENTOASSATENDIMENTO);
		
		try{
			Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
			if(atendimento.getAssinar() != null && atendimento.getAssinar() == false){
				Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
				
				atendimento.setAssinar(true);
				atendimento.setDataHoraAssinatura(new Date());
				atendimento.setUsuarioAssinou(usuario);
				fachada.inserirAtendimento(atendimento);
				
				request.getSession().setAttribute("atendimento", atendimento);
				request.setAttribute("mensagem", "Atendimento assinado com sucesso!");
			}else{
				request.setAttribute("mensagem", "Atendimento j?? assinado!");

			}
		}catch (Exception e) {
			e.printStackTrace();
			ActionMessages errors = new ActionMessages();
			errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	
}
