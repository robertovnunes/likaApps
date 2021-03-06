package struts.acoes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.Evolucao;
import model.paciente.prontuario.atendimento.examefisico.ExameAuditivo;
import model.paciente.prontuario.atendimento.examefisico.ExameBoca;
import model.paciente.prontuario.atendimento.examefisico.ExameCouroCabeludo;
import model.paciente.prontuario.atendimento.examefisico.ExameFisico;
import model.paciente.prontuario.atendimento.examefisico.ExameMamas;
import model.paciente.prontuario.atendimento.examefisico.ExameNariz;
import model.paciente.prontuario.atendimento.examefisico.ExameOlhos;
import model.paciente.prontuario.atendimento.examefisico.ExamePadrao;
import model.paciente.prontuario.atendimento.examefisico.ExamePescoco;
import model.paciente.prontuario.atendimento.examefisico.ExameSistCardiovascular;
import model.paciente.prontuario.atendimento.examefisico.ExameSistGastroIntestinal;
import model.paciente.prontuario.atendimento.examefisico.ExameSistGenitoUrinario;
import model.paciente.prontuario.atendimento.examefisico.ExameSistPelesAnexos;
import model.paciente.prontuario.atendimento.examefisico.ExameSistRespiratorio;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import fachada.Fachada;

public class ExameFisicoAcoes extends DispatchAction {
	
	private static final String fEXAMEFISICOSINAISVITAIS = "fExameFisicoSinaisVitais";
	private static final String fEXAMEFISICOCABECA = "fExameFisicoCabeca";
	private static final String fEXAMEFISICOOLHOS = "fExameFisicoOlhos";
	private static final String fEXAMEFISICONARIZ = "fExameFisicoNariz";
	private static final String fEXAMEFISICOORELHAS = "fExameFisicoOrelhas";
	private static final String fEXAMEFISICOBOCA = "fExameFisicoBoca";
	private static final String fEXAMEFISICOPESCOCO = "fExameFisicoPescoco";
	private static final String fEXAMEFISICOMAMAS = "fExameFisicoMamas";
	private static final String fEXAMEFISICOSISTRESPIRATORIO = "fExameFisicoSistRespiratorio";
	private static final String fEXAMEFISICOSISTCARDIO = "fExameFisicoSistCardio";
	private static final String fEXAMEFISICOSISTGASTRO = "fExameFisicoSistGastro";
	private static final String fEXAMEFISICOSISTURINA = "fExameFisicoSistUrina";
	private static final String fEXAMEFISICOPELESANEXOS = "fExameFisicoPelesAnexos";
	
	private Fachada fachada;
	
	public ExameFisicoAcoes(){
		fachada = Fachada.getInstancia();
	}

	public ActionForward mostrarTelaExameFisicoEscolhido(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String exameEscolhido = request.getParameter("exameEscolhido");
		ActionForward retorno = map.findForward(exameEscolhido);
		
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			if(exameEscolhido.equals(fEXAMEFISICOSINAISVITAIS)){
				if(admissao.getExameFisico() != null){
					ExamePadrao exame = admissao.getExameFisico().getExamePadrao();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOCABECA)){
				if(admissao.getExameFisico() != null){
					ExameCouroCabeludo exame = admissao.getExameFisico().getExameCouroCabeludo();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOOLHOS)){
				if(admissao.getExameFisico() != null){
					ExameOlhos exame = admissao.getExameFisico().getExameOlhos();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICONARIZ)){
				if(admissao.getExameFisico() != null){
					ExameNariz exame = admissao.getExameFisico().getExameNariz();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOORELHAS)){
				if(admissao.getExameFisico() != null){
					ExameAuditivo exame = admissao.getExameFisico().getExameAuditivo();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOBOCA)){
				if(admissao.getExameFisico() != null){
					ExameBoca exame = admissao.getExameFisico().getExameBoca();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOPESCOCO)){
				if(admissao.getExameFisico() != null){
					ExamePescoco exame = admissao.getExameFisico().getExamePescoco();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOMAMAS)){
				if(admissao.getExameFisico() != null){
					ExameMamas exame = admissao.getExameFisico().getExameMamas();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTRESPIRATORIO)){
				if(admissao.getExameFisico() != null){
					ExameSistRespiratorio exame = admissao.getExameFisico().getExameSistRespiratorio();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTCARDIO)){
				if(admissao.getExameFisico() != null){
					ExameSistCardiovascular exame = admissao.getExameFisico().getExameSistCardiovascular();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTCARDIO)){
				if(admissao.getExameFisico() != null){
					ExameSistCardiovascular exame = admissao.getExameFisico().getExameSistCardiovascular();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTGASTRO)){
				if(admissao.getExameFisico() != null){
					ExameSistGastroIntestinal exame = admissao.getExameFisico().getExameSistGastroIntestinal();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTURINA)){
				if(admissao.getExameFisico() != null){
					ExameSistGenitoUrinario exame = admissao.getExameFisico().getExameSistGenitoUrinario();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOPELESANEXOS)){
				if(admissao.getExameFisico() != null){
					ExameSistPelesAnexos exame = admissao.getExameFisico().getExameSistPelesAnexos();
					request.setAttribute("exame", exame);
				}
			}
			
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			if(exameEscolhido.equals(fEXAMEFISICOSINAISVITAIS)){
				if(evolucao.getExameFisico() != null){
					ExamePadrao exame = evolucao.getExameFisico().getExamePadrao();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOCABECA)){
				if(evolucao.getExameFisico() != null){
					ExameCouroCabeludo exame = evolucao.getExameFisico().getExameCouroCabeludo();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOOLHOS)){
				if(evolucao.getExameFisico() != null){
					ExameOlhos exame = evolucao.getExameFisico().getExameOlhos();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICONARIZ)){
				if(evolucao.getExameFisico() != null){
					ExameNariz exame = evolucao.getExameFisico().getExameNariz();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOORELHAS)){
				if(evolucao.getExameFisico() != null){
					ExameAuditivo exame = evolucao.getExameFisico().getExameAuditivo();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOBOCA)){
				if(evolucao.getExameFisico() != null){
					ExameBoca exame = evolucao.getExameFisico().getExameBoca();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOPESCOCO)){
				if(evolucao.getExameFisico() != null){
					ExamePescoco exame = evolucao.getExameFisico().getExamePescoco();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOMAMAS)){
				if(evolucao.getExameFisico() != null){
					ExameMamas exame = evolucao.getExameFisico().getExameMamas();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTRESPIRATORIO)){
				if(evolucao.getExameFisico() != null){
					ExameSistRespiratorio exame = evolucao.getExameFisico().getExameSistRespiratorio();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTCARDIO)){
				if(evolucao.getExameFisico() != null){
					ExameSistCardiovascular exame = evolucao.getExameFisico().getExameSistCardiovascular();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTGASTRO)){
				if(evolucao.getExameFisico() != null){
					ExameSistGastroIntestinal exame = evolucao.getExameFisico().getExameSistGastroIntestinal();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOSISTURINA)){
				if(evolucao.getExameFisico() != null){
					ExameSistGenitoUrinario exame = evolucao.getExameFisico().getExameSistGenitoUrinario();
					request.setAttribute("exame", exame);
				}
			}else if(exameEscolhido.equals(fEXAMEFISICOPELESANEXOS)){
				if(evolucao.getExameFisico() != null){
					ExameSistPelesAnexos exame = evolucao.getExameFisico().getExameSistPelesAnexos();
					request.setAttribute("exame", exame);
				}
			}
		}
		
		return retorno;
	}
	
	public ActionForward sinaisVitaisSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOSINAISVITAIS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String temperatura = ((DynaActionForm)form).getString("temperatura");
		String tempLocal = ((DynaActionForm)form).getString("tempLocal");
		String pulsoLocal = ((DynaActionForm)form).getString("pulsoLocal");
		String pulso = ((DynaActionForm)form).getString("pulso");
		String freqCard = ((DynaActionForm)form).getString("freqCard");
		String freqCardPadrao = ((DynaActionForm)form).getString("freqCardPadrao");
		String pressaoArt = ((DynaActionForm)form).getString("pressaoArt");
		String pressaoLocal = ((DynaActionForm)form).getString("pressaoLocal");
		String freqResp = ((DynaActionForm)form).getString("freqResp");
		String freqRestLocal = ((DynaActionForm)form).getString("freqRestLocal");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExamePadrao exame = fisico.getExamePadrao();
			if(exame == null){
				exame = new ExamePadrao();
			}
			
			exame.setTemperatura(temperatura);
			exame.setTemperaturaLocal(tempLocal);
			exame.setPulso(pulso);
			exame.setPulsoLocal(pulsoLocal);
			exame.setFrequenciaCardPadrao(freqCardPadrao);
			exame.setFrequenciaCard(freqCard);
			exame.setPressaoArterial(pressaoArt);
			exame.setPressaoArterialLocal(pressaoLocal);
			exame.setFrequenciaRespiratoria(freqResp);
			exame.setFrequenciaRespiratoriaPadrao(freqRestLocal);
			
			fisico.setExamePadrao(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExamePadrao(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Padr??o salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExamePadrao exame = fisico.getExamePadrao();
			if(exame == null){
				exame = new ExamePadrao();
			}
			
			exame.setTemperatura(temperatura);
			exame.setTemperaturaLocal(tempLocal);
			exame.setPulso(pulso);
			exame.setPulsoLocal(pulsoLocal);
			exame.setFrequenciaCardPadrao(freqCardPadrao);
			exame.setFrequenciaCard(freqCard);
			exame.setPressaoArterial(pressaoArt);
			exame.setPressaoArterialLocal(pressaoLocal);
			exame.setFrequenciaRespiratoria(freqResp);
			exame.setFrequenciaRespiratoriaPadrao(freqRestLocal);
			
			fisico.setExamePadrao(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExamePadrao(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Padr??o salvos com sucesso!");
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
	
	public ActionForward couroCabeludoSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOCABECA);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String inflamacoes = ((DynaActionForm)form).getString("inflamacoes");
		String parasitose = ((DynaActionForm)form).getString("parasitose");
		String sujidade = ((DynaActionForm)form).getString("sujidade");
		String deformidadeCraniana = ((DynaActionForm)form).getString("deformidadeCraniana");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameCouroCabeludo exame = fisico.getExameCouroCabeludo();
			if(exame == null){
				exame = new ExameCouroCabeludo();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				
				if(inflamacoes != null && !inflamacoes.equals("") && inflamacoes.equals("on")){
					exame.setLesoes(true);
				}else{
					exame.setLesoes(false);
				}
				if(parasitose != null && !parasitose.equals("") && parasitose.equals("on")){
					exame.setParasitose(true);
				}else{
					exame.setParasitose(false);
				}
				if(sujidade != null && !sujidade.equals("") && sujidade.equals("on")){
					exame.setSujidade(true);
				}else{
					exame.setSujidade(false);
				}
				if(deformidadeCraniana != null && !deformidadeCraniana.equals("") && deformidadeCraniana.equals("on")){
					exame.setDeformidadeCraniana(true);
				}else{
					exame.setDeformidadeCraniana(false);
				}
			}
			
			fisico.setExameCouroCabeludo(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameCouroCabeludo(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Couro Cabeludo salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameCouroCabeludo exame = fisico.getExameCouroCabeludo();
			if(exame == null){
				exame = new ExameCouroCabeludo();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				
				if(inflamacoes != null && !inflamacoes.equals("") && inflamacoes.equals("on")){
					exame.setLesoes(true);
				}else{
					exame.setLesoes(false);
				}
				if(parasitose != null && !parasitose.equals("") && parasitose.equals("on")){
					exame.setParasitose(true);
				}else{
					exame.setParasitose(false);
				}
				if(sujidade != null && !sujidade.equals("") && sujidade.equals("on")){
					exame.setSujidade(true);
				}else{
					exame.setSujidade(false);
				}
				if(deformidadeCraniana != null && !deformidadeCraniana.equals("") && deformidadeCraniana.equals("on")){
					exame.setDeformidadeCraniana(true);
				}else{
					exame.setDeformidadeCraniana(false);
				}
			}
			
			fisico.setExameCouroCabeludo(exame);
			evolucao.setExameFisico(fisico);
			
			try{
				fachada.inserirExameCouroCabeludo(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Couro Cabeludo salvo com sucesso!");
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
	
	public ActionForward olhosSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOOLHOS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String acuidade = ((DynaActionForm)form).getString("acuidade");
		String deformidade = ((DynaActionForm)form).getString("deformidade");
		String dor = ((DynaActionForm)form).getString("dor");
		String edema = ((DynaActionForm)form).getString("edema");
		String hiperemia = ((DynaActionForm)form).getString("hiperemia");
		String ictericia = ((DynaActionForm)form).getString("ictericia");
		String lacrimejamento = ((DynaActionForm)form).getString("lacrimejamento");
		String prurido = ((DynaActionForm)form).getString("prurido");
		String ptose = ((DynaActionForm)form).getString("ptose");
		String ressecamento = ((DynaActionForm)form).getString("ressecamento");
		String secrecao = ((DynaActionForm)form).getString("secrecao");
		String lentes = ((DynaActionForm)form).getString("lentes");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameOlhos exame = fisico.getExameOlhos();
			if(exame == null){
				exame = new ExameOlhos();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(acuidade != null && !acuidade.equals("") && acuidade.equals("diminuida")){
					exame.setAcuidadeDiminuida(true);
				}else if(acuidade != null && !acuidade.equals("") && acuidade.equals("preservada")){
					exame.setAcuidadePreservada(true);
				}
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(edema != null && !edema.equals("") && edema.equals("on")){
					exame.setEdema(true);
				}else{
					exame.setEdema(false);
				}
				if(hiperemia != null && !hiperemia.equals("") && hiperemia.equals("on")){
					exame.setHiperemia(true);
				}else{
					exame.setHiperemia(false);
				}
				if(ictericia != null && !ictericia.equals("") && ictericia.equals("on")){
					exame.setIctericia(true);
				}else{
					exame.setIctericia(false);
				}
				if(lacrimejamento != null && !lacrimejamento.equals("") && lacrimejamento.equals("on")){
					exame.setLacrimejamento(true);
				}else{
					exame.setLacrimejamento(false);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("on")){
					exame.setPrurido(true);
				}else{
					exame.setPrurido(false);
				}
				if(ptose != null && !ptose.equals("") && ptose.equals("on")){
					exame.setPtose(true);
				}else{
					exame.setPtose(false);
				}
				if(ressecamento != null && !ressecamento.equals("") && ressecamento.equals("on")){
					exame.setRessecamento(true);
				}else{
					exame.setRessecamento(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else{
					exame.setSecrecao(false);
				}
				if(lentes != null && !lentes.equals("") && lentes.equals("lentesSim")){
					exame.setLentesCorretivas(true);
				}else if(lentes != null && !lentes.equals("") && lentes.equals("lentesNao")){
					exame.setLentesCorretivas(false);
				}
			}
			
			fisico.setExameOlhos(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameOlhos(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Olhos salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameOlhos exame = fisico.getExameOlhos();
			if(exame == null){
				exame = new ExameOlhos();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(acuidade != null && !acuidade.equals("") && acuidade.equals("diminuida")){
					exame.setAcuidadeDiminuida(true);
				}else if(acuidade != null && !acuidade.equals("") && acuidade.equals("preservada")){
					exame.setAcuidadePreservada(true);
				}
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(edema != null && !edema.equals("") && edema.equals("on")){
					exame.setEdema(true);
				}else{
					exame.setEdema(false);
				}
				if(hiperemia != null && !hiperemia.equals("") && hiperemia.equals("on")){
					exame.setHiperemia(true);
				}else{
					exame.setHiperemia(false);
				}
				if(ictericia != null && !ictericia.equals("") && ictericia.equals("on")){
					exame.setIctericia(true);
				}else{
					exame.setIctericia(false);
				}
				if(lacrimejamento != null && !lacrimejamento.equals("") && lacrimejamento.equals("on")){
					exame.setLacrimejamento(true);
				}else{
					exame.setLacrimejamento(false);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("on")){
					exame.setPrurido(true);
				}else{
					exame.setPrurido(false);
				}
				if(ptose != null && !ptose.equals("") && ptose.equals("on")){
					exame.setPtose(true);
				}else{
					exame.setPtose(false);
				}
				if(ressecamento != null && !ressecamento.equals("") && ressecamento.equals("on")){
					exame.setRessecamento(true);
				}else{
					exame.setRessecamento(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else{
					exame.setSecrecao(false);
				}
				if(lentes != null && !lentes.equals("") && lentes.equals("lentesSim")){
					exame.setLentesCorretivas(true);
				}else if(lentes != null && !lentes.equals("") && lentes.equals("lentesNao")){
					exame.setLentesCorretivas(false);
				}
			}
			
			fisico.setExameOlhos(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameOlhos(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Olhos salvo com sucesso!");
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
	
	public ActionForward narizSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICONARIZ);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");

		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String deformidade = ((DynaActionForm)form).getString("deformidade");
		String dor = ((DynaActionForm)form).getString("dor");
		String epistaxe = ((DynaActionForm)form).getString("epistaxe");
		String obstrucao = ((DynaActionForm)form).getString("obstrucao");
		String secrecao = ((DynaActionForm)form).getString("secrecao");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameNariz exame = fisico.getExameNariz();
			if(exame == null){
				exame = new ExameNariz();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(epistaxe != null && !epistaxe.equals("") && epistaxe.equals("on")){
					exame.setEpistaxe(true);
				}else{
					exame.setEpistaxe(false);
				}
				if(obstrucao != null && !obstrucao.equals("") && obstrucao.equals("on")){
					exame.setObstrucaoNasal(true);
				}else{
					exame.setObstrucaoNasal(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecaoNasal(true);
				}else{
					exame.setSecrecaoNasal(false);
				}
			}
			
			fisico.setExameNariz(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameNariz(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Nariz salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameNariz exame = fisico.getExameNariz();
			if(exame == null){
				exame = new ExameNariz();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(epistaxe != null && !epistaxe.equals("") && epistaxe.equals("on")){
					exame.setEpistaxe(true);
				}else{
					exame.setEpistaxe(false);
				}
				if(obstrucao != null && !obstrucao.equals("") && obstrucao.equals("on")){
					exame.setObstrucaoNasal(true);
				}else{
					exame.setObstrucaoNasal(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecaoNasal(true);
				}else{
					exame.setSecrecaoNasal(false);
				}
			}
			
			fisico.setExameNariz(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameNariz(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Nariz salvo com sucesso!");
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
	
	public ActionForward orelhasSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOORELHAS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String cerume = ((DynaActionForm)form).getString("cerume");
		String deformidade = ((DynaActionForm)form).getString("deformidade");
		String dor = ((DynaActionForm)form).getString("dor");
		String edema = ((DynaActionForm)form).getString("edema");
		String hiperacusia = ((DynaActionForm)form).getString("hiperacusia");
		String hiperemia = ((DynaActionForm)form).getString("hiperemia");
		String hipoacusia = ((DynaActionForm)form).getString("hipoacusia");
		String lesoes = ((DynaActionForm)form).getString("lesoes");
		String otorragia = ((DynaActionForm)form).getString("otorragia");
		String prurido = ((DynaActionForm)form).getString("prurido");
		String secrecao = ((DynaActionForm)form).getString("secrecao");
		String zumbido = ((DynaActionForm)form).getString("zumbido");
		String deficit = ((DynaActionForm)form).getString("deficit");
		String aparelho = ((DynaActionForm)form).getString("aparelho");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameAuditivo exame = fisico.getExameAuditivo();
			if(exame == null){
				exame = new ExameAuditivo();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(cerume != null && !cerume.equals("") && cerume.equals("on")){
					exame.setCerume(true);
				}else{
					exame.setCerume(false);
				}
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(edema != null && !edema.equals("") && edema.equals("on")){
					exame.setEdema(true);
				}else{
					exame.setEdema(false);
				}
				
				if(hiperacusia != null && !hiperacusia.equals("") && hiperacusia.equals("on")){
					exame.setHiperacusia(true);
				}else{
					exame.setHiperacusia(false);
				}
				if(hiperemia != null && !hiperemia.equals("") && hiperemia.equals("on")){
					exame.setHiperemia(true);
				}else{
					exame.setHiperemia(false);
				}
				if(hipoacusia != null && !hipoacusia.equals("") && hipoacusia.equals("on")){
					exame.setHipoacusia(true);
				}else{
					exame.setHipoacusia(false);
				}
				if(lesoes != null && !lesoes.equals("") && lesoes.equals("on")){
					exame.setLesoes(true);
				}else{
					exame.setLesoes(false);
				}
				if(otorragia != null && !otorragia.equals("") && otorragia.equals("on")){
					exame.setOtorragia(true);
				}else{
					exame.setOtorragia(false);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("on")){
					exame.setPrurido(true);
				}else{
					exame.setPrurido(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else{
					exame.setSecrecao(false);
				}
				if(zumbido != null && !zumbido.equals("") && zumbido.equals("on")){
					exame.setZumbido(true);
				}else{
					exame.setZumbido(false);
				}
				if(deficit != null && !deficit.equals("") && deficit.equals("deficitSim")){
					exame.setDeficitAuditivo(true);
				}else if(deficit != null && !deficit.equals("") && deficit.equals("deficitNao")){
					exame.setDeficitAuditivo(false);
				}
				if(aparelho != null && !aparelho.equals("") && aparelho.equals("aparelhoSim")){
					exame.setUsoAparelhoAuditivo(true);
				}else if(aparelho != null && !aparelho.equals("") && aparelho.equals("aparelhoNao")){
					exame.setUsoAparelhoAuditivo(false);
				}
			}
			
			fisico.setExameAuditivo(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameAuditivo(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Auditivo salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameAuditivo exame = fisico.getExameAuditivo();
			if(exame == null){
				exame = new ExameAuditivo();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(cerume != null && !cerume.equals("") && cerume.equals("on")){
					exame.setCerume(true);
				}else{
					exame.setCerume(false);
				}
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidade(true);
				}else{
					exame.setDeformidade(false);
				}
				if(dor != null && !dor.equals("") && dor.equals("on")){
					exame.setDor(true);
				}else{
					exame.setDor(false);
				}
				if(edema != null && !edema.equals("") && edema.equals("on")){
					exame.setEdema(true);
				}else{
					exame.setEdema(false);
				}
				
				if(hiperacusia != null && !hiperacusia.equals("") && hiperacusia.equals("on")){
					exame.setHiperacusia(true);
				}else{
					exame.setHiperacusia(false);
				}
				if(hiperemia != null && !hiperemia.equals("") && hiperemia.equals("on")){
					exame.setHiperemia(true);
				}else{
					exame.setHiperemia(false);
				}
				if(hipoacusia != null && !hipoacusia.equals("") && hipoacusia.equals("on")){
					exame.setHipoacusia(true);
				}else{
					exame.setHipoacusia(false);
				}
				if(lesoes != null && !lesoes.equals("") && lesoes.equals("on")){
					exame.setLesoes(true);
				}else{
					exame.setLesoes(false);
				}
				if(otorragia != null && !otorragia.equals("") && otorragia.equals("on")){
					exame.setOtorragia(true);
				}else{
					exame.setOtorragia(false);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("on")){
					exame.setPrurido(true);
				}else{
					exame.setPrurido(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else{
					exame.setSecrecao(false);
				}
				if(zumbido != null && !zumbido.equals("") && zumbido.equals("on")){
					exame.setZumbido(true);
				}else{
					exame.setZumbido(false);
				}
				if(deficit != null && !deficit.equals("") && deficit.equals("deficitSim")){
					exame.setDeficitAuditivo(true);
				}else if(deficit != null && !deficit.equals("") && deficit.equals("deficitNao")){
					exame.setDeficitAuditivo(true);
				}
				if(aparelho != null && !aparelho.equals("") && aparelho.equals("aparelhoSim")){
					exame.setUsoAparelhoAuditivo(true);
				}else if(aparelho != null && !aparelho.equals("") && aparelho.equals("aparelhoNao")){
					exame.setUsoAparelhoAuditivo(false);
				}
			}
			
			fisico.setExameAuditivo(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameAuditivo(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Auditivo salvo com sucesso!");
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

	public ActionForward bocaSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOBOCA);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String cianose = ((DynaActionForm)form).getString("cianose");
		String lesoesLabios = ((DynaActionForm)form).getString("lesoesLabios");
		String ressecamentoLabios = ((DynaActionForm)form).getString("ressecamentoLabios");
		String edemaLabios = ((DynaActionForm)form).getString("edemaLabios");
		String hiperemiaLabios = ((DynaActionForm)form).getString("hiperemiaLabios");
		String labiosoutros = ((DynaActionForm)form).getString("labiosoutros");
		String ausencia = ((DynaActionForm)form).getString("ausencia");
		String cariados = ((DynaActionForm)form).getString("cariados");
		String protese = ((DynaActionForm)form).getString("protese");
		String dentesoutros = ((DynaActionForm)form).getString("dentesoutros");
		String edemasGengivas = ((DynaActionForm)form).getString("edemasGengivas");
		String hiperamia = ((DynaActionForm)form).getString("hiperamia");
		String hipertrofia = ((DynaActionForm)form).getString("hipertrofia");
		String lesoesGengiva = ((DynaActionForm)form).getString("lesoesGengiva");
		String manchasGengivas = ((DynaActionForm)form).getString("manchasGengivas");
		String sangramento = ((DynaActionForm)form).getString("sangramento");
		String gengivasoutros = ((DynaActionForm)form).getString("gengivasoutros");
		String corLingua = ((DynaActionForm)form).getString("corLingua");
		String edemaLingua = ((DynaActionForm)form).getString("edemaLingua");
		String lesoesLingua = ((DynaActionForm)form).getString("lesoesLingua");
		String lisa = ((DynaActionForm)form).getString("lisa");
		String manchasLingua = ((DynaActionForm)form).getString("manchasLingua");
		String outrosLingua = ((DynaActionForm)form).getString("linguaoutros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameBoca exame = fisico.getExameBoca();
			if(exame == null){
				exame = new ExameBoca();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				
				if(cianose != null && !cianose.equals("") && cianose.equals("on")){
					exame.setLabiosCianose(true);
				}else{
					exame.setLabiosCianose(false);
				}
				if(lesoesLabios != null && !lesoesLabios.equals("") && lesoesLabios.equals("on")){
					exame.setLabiosLesoes(true);
				}else{
					exame.setLabiosLesoes(false);
				}
				if(ressecamentoLabios != null && !ressecamentoLabios.equals("") && ressecamentoLabios.equals("on")){
					exame.setLabiosRessecamento(true);
				}else{
					exame.setLabiosRessecamento(false);
				}
				if(edemaLabios != null && !edemaLabios.equals("") && edemaLabios.equals("on")){
					exame.setLabiosEdema(true);
				}else{
					exame.setLabiosEdema(false);
				}
				if(hiperemiaLabios != null && !hiperemiaLabios.equals("") && hiperemiaLabios.equals("on")){
					exame.setLabiosHiperamia(true);
				}else{
					exame.setLabiosHiperamia(false);
				}
				exame.setLabiosOutros(labiosoutros);
				if(ausencia != null && !ausencia.equals("") && ausencia.equals("on")){
					exame.setDentesAusencia(true);
				}else{
					exame.setDentesAusencia(false);
				}
				if(cariados != null && !cariados.equals("") && cariados.equals("on")){
					exame.setDentesCariados(true);
				}else{
					exame.setDentesCariados(false);
				}
				if(protese != null && !protese.equals("") && protese.equals("on")){
					exame.setDentesProtese(true);
				}else{
					exame.setDentesProtese(false);
				}
				exame.setDentesOutros(dentesoutros);
				if(edemasGengivas != null && !edemasGengivas.equals("") && edemasGengivas.equals("on")){
					exame.setGengivasEdema(true);
				}else{
					exame.setGengivasEdema(false);
				}
				if(hiperamia != null && !hiperamia.equals("") && hiperamia.equals("on")){
					exame.setGengivasHiperamia(true);
				}else{
					exame.setGengivasHiperamia(false);
				}
				if(hipertrofia != null && !hipertrofia.equals("") && hipertrofia.equals("on")){
					exame.setGengivasHipertrofia(true);
				}else{
					exame.setGengivasHipertrofia(false);
				}
				if(lesoesGengiva != null && !lesoesGengiva.equals("") && lesoesGengiva.equals("on")){
					exame.setGengivasLesoes(true);
				}else{
					exame.setGengivasLesoes(false);
				}
				if(manchasGengivas != null && !manchasGengivas.equals("") && manchasGengivas.equals("on")){
					exame.setGengivasManchas(true);
				}else {
					exame.setGengivasManchas(false);
				}
				if(sangramento != null && !sangramento.equals("") && sangramento.equals("on")){
					exame.setGengivasSangramento(true);
				}else {
					exame.setGengivasSangramento(false);
				}
				exame.setGengivasOutros(gengivasoutros);
				if(corLingua != null && !corLingua.equals("") && corLingua.equals("on")){
					exame.setLinguaAlteracaoCor(true);
				}else {
					exame.setLinguaAlteracaoCor(false);
				}
				if(edemaLingua != null && !edemaLingua.equals("") && edemaLingua.equals("on")){
					exame.setLinguaEdema(true);
				}else {
					exame.setLinguaEdema(false);
				}
				if(lesoesLingua != null && !lesoesLingua.equals("") && lesoesLingua.equals("on")){
					exame.setLinguaLesoes(true);
				}else {
					exame.setLinguaLesoes(false);
				}
				if(lisa != null && !lisa.equals("") && lisa.equals("on")){
					exame.setLinguaLinguaLisa(true);
				}else {
					exame.setLinguaLinguaLisa(false);
				}
				if(manchasLingua != null && !manchasLingua.equals("") && manchasLingua.equals("on")){
					exame.setLinguaManchas(true);
				}else {
					exame.setLinguaManchas(false);
				}
				exame.setLinguaOutros(outrosLingua);
			}
			
			fisico.setExameBoca(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameBoca(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Boca salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameBoca exame = fisico.getExameBoca();
			if(exame == null){
				exame = new ExameBoca();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				
				if(cianose != null && !cianose.equals("") && cianose.equals("on")){
					exame.setLabiosCianose(true);
				}else{
					exame.setLabiosCianose(false);
				}
				if(lesoesLabios != null && !lesoesLabios.equals("") && lesoesLabios.equals("on")){
					exame.setLabiosLesoes(true);
				}else{
					exame.setLabiosLesoes(false);
				}
				if(ressecamentoLabios != null && !ressecamentoLabios.equals("") && ressecamentoLabios.equals("on")){
					exame.setLabiosRessecamento(true);
				}else{
					exame.setLabiosRessecamento(false);
				}
				if(edemaLabios != null && !edemaLabios.equals("") && edemaLabios.equals("on")){
					exame.setLabiosEdema(true);
				}else{
					exame.setLabiosEdema(false);
				}
				if(hiperemiaLabios != null && !hiperemiaLabios.equals("") && hiperemiaLabios.equals("on")){
					exame.setLabiosHiperamia(true);
				}else{
					exame.setLabiosHiperamia(false);
				}
				exame.setLabiosOutros(labiosoutros);
				if(ausencia != null && !ausencia.equals("") && ausencia.equals("on")){
					exame.setDentesAusencia(true);
				}else{
					exame.setDentesAusencia(false);
				}
				if(cariados != null && !cariados.equals("") && cariados.equals("on")){
					exame.setDentesCariados(true);
				}else{
					exame.setDentesCariados(false);
				}
				if(protese != null && !protese.equals("") && protese.equals("on")){
					exame.setDentesProtese(true);
				}else{
					exame.setDentesProtese(false);
				}
				exame.setDentesOutros(dentesoutros);
				if(edemasGengivas != null && !edemasGengivas.equals("") && edemasGengivas.equals("on")){
					exame.setGengivasEdema(true);
				}else{
					exame.setGengivasEdema(false);
				}
				if(hiperamia != null && !hiperamia.equals("") && hiperamia.equals("on")){
					exame.setGengivasHiperamia(true);
				}else{
					exame.setGengivasHiperamia(false);
				}
				if(hipertrofia != null && !hipertrofia.equals("") && hipertrofia.equals("on")){
					exame.setGengivasHipertrofia(true);
				}else{
					exame.setGengivasHipertrofia(false);
				}
				if(lesoesGengiva != null && !lesoesGengiva.equals("") && lesoesGengiva.equals("on")){
					exame.setGengivasLesoes(true);
				}else{
					exame.setGengivasLesoes(false);
				}
				if(manchasGengivas != null && !manchasGengivas.equals("") && manchasGengivas.equals("on")){
					exame.setGengivasManchas(true);
				}else {
					exame.setGengivasManchas(false);
				}
				if(sangramento != null && !sangramento.equals("") && sangramento.equals("on")){
					exame.setGengivasSangramento(true);
				}else {
					exame.setGengivasSangramento(false);
				}
				exame.setGengivasOutros(gengivasoutros);
				if(corLingua != null && !corLingua.equals("") && corLingua.equals("on")){
					exame.setLinguaAlteracaoCor(true);
				}else {
					exame.setLinguaAlteracaoCor(false);
				}
				if(edemaLingua != null && !edemaLingua.equals("") && edemaLingua.equals("on")){
					exame.setLinguaEdema(true);
				}else {
					exame.setLinguaEdema(false);
				}
				if(lesoesLingua != null && !lesoesLingua.equals("") && lesoesLingua.equals("on")){
					exame.setLinguaLesoes(true);
				}else {
					exame.setLinguaLesoes(false);
				}
				if(lisa != null && !lisa.equals("") && lisa.equals("on")){
					exame.setLinguaLinguaLisa(true);
				}else {
					exame.setLinguaLinguaLisa(false);
				}
				if(manchasLingua != null && !manchasLingua.equals("") && manchasLingua.equals("on")){
					exame.setLinguaManchas(true);
				}else {
					exame.setLinguaManchas(false);
				}
				exame.setLinguaOutros(outrosLingua);
			}
			
			fisico.setExameBoca(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameBoca(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Boca salvo com sucesso!");
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

	public ActionForward pescocoSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOPESCOCO);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String jugulares = ((DynaActionForm)form).getString("jugulares");
		String jugularoutros = ((DynaActionForm)form).getString("jugularoutros");
		String tireoide = ((DynaActionForm)form).getString("tireoide");
		String tireoideoutros = ((DynaActionForm)form).getString("tireoideoutros");
		String ganglios = ((DynaActionForm)form).getString("ganglios");
		String gangliosoutros = ((DynaActionForm)form).getString("gangliosoutros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExamePescoco exame = fisico.getExamePescoco();
			if(exame == null){
				exame = new ExamePescoco();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				if(jugulares != null && !jugulares.equals("") && jugulares.equals("jugularesdistendas")){
					exame.setVeiasDistendidas(true);
				}else if(jugulares != null && !jugulares.equals("") && jugulares.equals("jugularesnormal")){
					exame.setVeiasNormais(true);
				}
				exame.setVeiasOutros(jugularoutros);
				if(tireoide != null && !tireoide.equals("") && tireoide.equals("tireoideaumentado")){
					exame.setTireoideVolAumentado(true);
				}else if(tireoide != null && !tireoide.equals("") && tireoide.equals("tireoidenormal")){
					exame.setTireoideVolNormal(true);
				}
				exame.setTireoideOutros(tireoideoutros);
				if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliosmoveis")){
					exame.setGangliosMoveis(true);
				}else if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliosfixos")){
					exame.setGangliosFixos(true);
				}else if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliospalpaveis")){
					exame.setGangliosPalpaveis(true);
				}
				exame.setGangliosOutros(gangliosoutros);
			}
			
			fisico.setExamePescoco(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExamePescoco(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Pesco??o salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExamePescoco exame = fisico.getExamePescoco();
			if(exame == null){
				exame = new ExamePescoco();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				if(jugulares != null && !jugulares.equals("") && jugulares.equals("jugularesdistendas")){
					exame.setVeiasDistendidas(true);
				}else if(jugulares != null && !jugulares.equals("") && jugulares.equals("jugularesnormal")){
					exame.setVeiasNormais(true);
				}
				exame.setVeiasOutros(jugularoutros);
				if(tireoide != null && !tireoide.equals("") && tireoide.equals("tireoideaumentado")){
					exame.setTireoideVolAumentado(true);
				}else if(tireoide != null && !tireoide.equals("") && tireoide.equals("tireoidenormal")){
					exame.setTireoideVolNormal(true);
				}
				exame.setTireoideOutros(tireoideoutros);
				if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliosmoveis")){
					exame.setGangliosMoveis(true);
				}else if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliosfixos")){
					exame.setGangliosFixos(true);
				}else if(ganglios != null && !ganglios.equals("") && ganglios.equals("gangliospalpaveis")){
					exame.setGangliosPalpaveis(true);
				}
				exame.setGangliosOutros(gangliosoutros);
			}
			
			fisico.setExamePescoco(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExamePescoco(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Pesco??o salvo com sucesso!");
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
	
	public ActionForward mamasSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOMAMAS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String mastite = ((DynaActionForm)form).getString("mastite");
		String nodulacao = ((DynaActionForm)form).getString("nodulacao");
		String displasia = ((DynaActionForm)form).getString("displasia");
		String deformidade = ((DynaActionForm)form).getString("deformidade");
		String neoplasias = ((DynaActionForm)form).getString("neoplasias");
		String ginecomastia = ((DynaActionForm)form).getString("ginecomastia");
		String secrecao = ((DynaActionForm)form).getString("secrecao");
		String colostro = ((DynaActionForm)form).getString("colostro");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameMamas exame = fisico.getExameMamas();
			if(exame == null){
				exame = new ExameMamas();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(colostro != null && !colostro.equals("") && colostro.equals("colostroSim")){
					exame.setPresencaColostroSim(true);
				}else if(colostro != null && !colostro.equals("") && colostro.equals("colostroNao")){
					exame.setPresencaColostroNao(true);
				}
				
				if(ginecomastia != null && !ginecomastia.equals("") && ginecomastia.equals("on")){
					exame.setGinecomastia(true);
				}else {
					exame.setGinecomastia(false);
				}
				
				if(neoplasias != null && !neoplasias.equals("") && neoplasias.equals("on")){
					exame.setNeoplasias(true);
				}else {
					exame.setNeoplasias(false);
				}
				
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidades(true);
				}else {
					exame.setDeformidades(false);
				}
				
				if(displasia != null && !displasia.equals("") && displasia.equals("on")){
					exame.setDisplasia(true);
				}else {
					exame.setDisplasia(false);
				}
				
				if(nodulacao != null && !nodulacao.equals("") && nodulacao.equals("on")){
					exame.setNodulacao(true);
				}else {
					exame.setNodulacao(false);
				}
				
				if(mastite != null && !mastite.equals("") && mastite.equals("on")){
					exame.setMastite(true);
				}else {
					exame.setMastite(false);
				}
				
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else {
					exame.setSecrecao(false);
				}
				
				
			}
			
			fisico.setExameMamas(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameMamas(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Mamas salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameMamas exame = fisico.getExameMamas();
			if(exame == null){
				exame = new ExameMamas();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(colostro != null && !colostro.equals("") && colostro.equals("colostroSim")){
					exame.setPresencaColostroSim(true);
				}else if(colostro != null && !colostro.equals("") && colostro.equals("colostroNao")){
					exame.setPresencaColostroNao(true);
				}
				
				if(ginecomastia != null && !ginecomastia.equals("") && ginecomastia.equals("on")){
					exame.setGinecomastia(true);
				}else {
					exame.setGinecomastia(false);
				}
				
				if(neoplasias != null && !neoplasias.equals("") && neoplasias.equals("on")){
					exame.setNeoplasias(true);
				}else {
					exame.setNeoplasias(false);
				}
				
				if(deformidade != null && !deformidade.equals("") && deformidade.equals("on")){
					exame.setDeformidades(true);
				}else {
					exame.setDeformidades(false);
				}
				
				if(displasia != null && !displasia.equals("") && displasia.equals("on")){
					exame.setDisplasia(true);
				}else {
					exame.setDisplasia(false);
				}
				
				if(nodulacao != null && !nodulacao.equals("") && nodulacao.equals("on")){
					exame.setNodulacao(true);
				}else {
					exame.setNodulacao(false);
				}
				
				if(mastite != null && !mastite.equals("") && mastite.equals("on")){
					exame.setMastite(true);
				}else {
					exame.setMastite(false);
				}
				if(secrecao != null && !secrecao.equals("") && secrecao.equals("on")){
					exame.setSecrecao(true);
				}else {
					exame.setSecrecao(false);
				}
				
			}
			
			fisico.setExameMamas(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameMamas(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Mamas salvo com sucesso!");
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

	public ActionForward sistRespiratorioSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOSISTRESPIRATORIO);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String sonsvesiculares = ((DynaActionForm)form).getString("sonsvesiculares");
		String sonsestertores = ((DynaActionForm)form).getString("sonsestertores");
		String sonsroncos = ((DynaActionForm)form).getString("sonsroncos");
		String sonsoutros = ((DynaActionForm)form).getString("sonsoutros");
		String tosse = ((DynaActionForm)form).getString("tosse");
		String expectoausente = ((DynaActionForm)form).getString("expectoausente");
		String expectopurulento = ((DynaActionForm)form).getString("expectopurulento");
		String expectomucosa = ((DynaActionForm)form).getString("expectomucosa");
		String expectoserosa = ((DynaActionForm)form).getString("expectoserosa");
		String expectosanguinea = ((DynaActionForm)form).getString("expectosanguinea");
		String expectoracaooutros = ((DynaActionForm)form).getString("expectoracaooutros");
		String hemoptiseausente = ((DynaActionForm)form).getString("hemoptiseausente");
		String hemoptisevivo = ((DynaActionForm)form).getString("hemoptisevivo");
		String hemoptiseespumoso = ((DynaActionForm)form).getString("hemoptiseespumoso");
		String hemoptisemucoso = ((DynaActionForm)form).getString("hemoptisemucoso");
		String hemoptiseoutros = ((DynaActionForm)form).getString("hemoptiseoutros");
		String dor = ((DynaActionForm)form).getString("dor");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistRespiratorio exame = fisico.getExameSistRespiratorio();
			if(exame == null){
				exame = new ExameSistRespiratorio();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(tosse != null && !tosse.equals("") && tosse.equals("tosseSim")){
					exame.setTosseSim(true);
				}else if(tosse != null && !tosse.equals("") && tosse.equals("tosseNao")){
					exame.setTosseNao(true);
				}
				if(dor != null && !dor.equals("") && dor.equals("dorSim")){
					exame.setDorSim(true);
				}else if(dor != null && !dor.equals("") && dor.equals("dorNao")){
					exame.setDorNao(true);
				}
				if(sonsvesiculares != null && !sonsvesiculares.equals("") && sonsvesiculares.equals("on")){
					exame.setSonsMurmuriosVesiculares(true);
				}else {
					exame.setSonsMurmuriosVesiculares(false);
				}
				if(sonsestertores != null && !sonsestertores.equals("") && sonsestertores.equals("on")){
					exame.setSonsEstertores(true);
				}else {
					exame.setSonsEstertores(false);
				}
				if(sonsroncos != null && !sonsroncos.equals("") && sonsroncos.equals("on")){
					exame.setSonsRoncos(true);
				}else {
					exame.setSonsRoncos(false);
				}
				exame.setSonsOutros(sonsoutros);
				if(expectoausente != null && !expectoausente.equals("") && expectoausente.equals("on")){
					exame.setExpectoracaoAusente(true);
				}else {
					exame.setExpectoracaoAusente(false);
				}
				if(expectopurulento != null && !expectopurulento.equals("") && expectopurulento.equals("on")){
					exame.setExpectoracaoPurulento(true);
				}else {
					exame.setExpectoracaoPurulento(false);
				}
				if(expectomucosa != null && !expectomucosa.equals("") && expectomucosa.equals("on")){
					exame.setExpectoracaoMucosa(true);
				}else {
					exame.setExpectoracaoMucosa(false);
				}
				if(expectoserosa != null && !expectoserosa.equals("") && expectoserosa.equals("on")){
					exame.setExpectoracaoSerosa(true);
				}else {
					exame.setExpectoracaoSerosa(false);
				}
				if(expectosanguinea != null && !expectosanguinea.equals("") && expectosanguinea.equals("on")){
					exame.setExpectoracaoSanguinea(true);
				}else {
					exame.setExpectoracaoSanguinea(false);
				}
				exame.setExpectoracaoOutros(expectoracaooutros);
				
				if(hemoptiseausente != null && !hemoptiseausente.equals("") && hemoptiseausente.equals("on")){
					exame.setHemoptiseAusente(true);
				}else {
					exame.setHemoptiseAusente(false);
				}
				if(hemoptisevivo != null && !hemoptisevivo.equals("") && hemoptisevivo.equals("on")){
					exame.setHemoptiseSanqueVivo(true);
				}else {
					exame.setHemoptiseSanqueVivo(false);
				}
				if(hemoptiseespumoso != null && !hemoptiseespumoso.equals("") && hemoptiseespumoso.equals("on")){
					exame.setHemoptiseEspumoso(true);
				}else {
					exame.setHemoptiseEspumoso(false);
				}
				if(hemoptisemucoso != null && !hemoptisemucoso.equals("") && hemoptisemucoso.equals("on")){
					exame.setHemoptiseMucoso(true);
				}else {
					exame.setHemoptiseMucoso(false);
				}
				exame.setHemoptiseOutros(hemoptiseoutros);
			}
			
			fisico.setExameSistRespiratorio(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistRespiratorio(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Sistema Respirat??rio salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistRespiratorio exame = fisico.getExameSistRespiratorio();
			if(exame == null){
				exame = new ExameSistRespiratorio();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				if(tosse != null && !tosse.equals("") && tosse.equals("tosseSim")){
					exame.setTosseSim(true);
				}else if(tosse != null && !tosse.equals("") && tosse.equals("tosseNao")){
					exame.setTosseNao(true);
				}
				if(dor != null && !dor.equals("") && dor.equals("dorSim")){
					exame.setDorSim(true);
				}else if(dor != null && !dor.equals("") && dor.equals("dorNao")){
					exame.setDorNao(true);
				}
				if(sonsvesiculares != null && !sonsvesiculares.equals("") && sonsvesiculares.equals("on")){
					exame.setSonsMurmuriosVesiculares(true);
				}else {
					exame.setSonsMurmuriosVesiculares(false);
				}
				if(sonsestertores != null && !sonsestertores.equals("") && sonsestertores.equals("on")){
					exame.setSonsEstertores(true);
				}else {
					exame.setSonsEstertores(false);
				}
				if(sonsroncos != null && !sonsroncos.equals("") && sonsroncos.equals("on")){
					exame.setSonsRoncos(true);
				}else {
					exame.setSonsRoncos(false);
				}
				exame.setSonsOutros(sonsoutros);
				if(expectoausente != null && !expectoausente.equals("") && expectoausente.equals("on")){
					exame.setExpectoracaoAusente(true);
				}else {
					exame.setExpectoracaoAusente(false);
				}
				if(expectopurulento != null && !expectopurulento.equals("") && expectopurulento.equals("on")){
					exame.setExpectoracaoPurulento(true);
				}else {
					exame.setExpectoracaoPurulento(false);
				}
				if(expectomucosa != null && !expectomucosa.equals("") && expectomucosa.equals("on")){
					exame.setExpectoracaoMucosa(true);
				}else {
					exame.setExpectoracaoMucosa(false);
				}
				if(expectoserosa != null && !expectoserosa.equals("") && expectoserosa.equals("on")){
					exame.setExpectoracaoSerosa(true);
				}else {
					exame.setExpectoracaoSerosa(false);
				}
				if(expectosanguinea != null && !expectosanguinea.equals("") && expectosanguinea.equals("on")){
					exame.setExpectoracaoSanguinea(true);
				}else {
					exame.setExpectoracaoSanguinea(false);
				}
				exame.setExpectoracaoOutros(expectoracaooutros);
				
				if(hemoptiseausente != null && !hemoptiseausente.equals("") && hemoptiseausente.equals("on")){
					exame.setHemoptiseAusente(true);
				}else {
					exame.setHemoptiseAusente(false);
				}
				if(hemoptisevivo != null && !hemoptisevivo.equals("") && hemoptisevivo.equals("on")){
					exame.setHemoptiseSanqueVivo(true);
				}else {
					exame.setHemoptiseSanqueVivo(false);
				}
				if(hemoptiseespumoso != null && !hemoptiseespumoso.equals("") && hemoptiseespumoso.equals("on")){
					exame.setHemoptiseEspumoso(true);
				}else {
					exame.setHemoptiseEspumoso(false);
				}
				if(hemoptisemucoso != null && !hemoptisemucoso.equals("") && hemoptisemucoso.equals("on")){
					exame.setHemoptiseMucoso(true);
				}else {
					exame.setHemoptiseMucoso(false);
				}
				exame.setHemoptiseOutros(hemoptiseoutros);
			}
			
			fisico.setExameSistRespiratorio(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistRespiratorio(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Sistema Respirat??rio salvo com sucesso!");
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
	
	public ActionForward sistCardioSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOSISTCARDIO);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String sonsnormofoneticas = ((DynaActionForm)form).getString("sonsnormofoneticas");
		String sonshiperfoneticas = ((DynaActionForm)form).getString("sonshiperfoneticas");
		String sonshipofoneticas = ((DynaActionForm)form).getString("sonshipofoneticas");
		String sonscomsopros = ((DynaActionForm)form).getString("sonscomsopros");
		String sonssemsopros = ((DynaActionForm)form).getString("sonssemsopros");
		String sonsoutros = ((DynaActionForm)form).getString("sonsoutros");
		String perfussao = ((DynaActionForm)form).getString("perfussao");
		String perfusaooutros = ((DynaActionForm)form).getString("perfusaooutros");
		String dorconstricao = ((DynaActionForm)form).getString("dorconstricao");
		String dorcompressao = ((DynaActionForm)form).getString("dorcompressao");
		String dorqueimacao = ((DynaActionForm)form).getString("dorqueimacao");
		String dorpeso = ((DynaActionForm)form).getString("dorpeso");
		String dorpontada = ((DynaActionForm)form).getString("dorpontada");
		String doroutros = ((DynaActionForm)form).getString("doroutros");
		
		String dorretroesternal = ((DynaActionForm)form).getString("dorretroesternal");
		String dorombroesquerdo = ((DynaActionForm)form).getString("dorombroesquerdo");
		String dorpescoco = ((DynaActionForm)form).getString("dorpescoco");
		String dorface = ((DynaActionForm)form).getString("dorface");
		String dorinterescapular = ((DynaActionForm)form).getString("dorinterescapular");
		String dorepigastrica = ((DynaActionForm)form).getString("dorepigastrica");
		String dorLocaloutros = ((DynaActionForm)form).getString("dorLocaloutros");

		String geralpalpitacoes = ((DynaActionForm)form).getString("geralpalpitacoes");
		String geralsincope = ((DynaActionForm)form).getString("geralsincope");
		String geralmmii = ((DynaActionForm)form).getString("geralmmii");
		String geralmmss = ((DynaActionForm)form).getString("geralmmss");
		String geralanasarca = ((DynaActionForm)form).getString("geralanasarca");
		String geralformigamento = ((DynaActionForm)form).getString("geralformigamento");
		String geralcaimbras = ((DynaActionForm)form).getString("geralcaimbras");
		String geraldor = ((DynaActionForm)form).getString("geraldor");
		String geralLocal = ((DynaActionForm)form).getString("geralLocal");
		String geralOutros = ((DynaActionForm)form).getString("geralOutros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistCardiovascular exame = fisico.getExameSistCardiovascular();
			if(exame == null){
				exame = new ExameSistCardiovascular();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setGeralOutros(geralOutros);
				
				if(perfussao != null && !perfussao.equals("") && perfussao.equals("perfusaoadequada")){
					exame.setPerfusaoRegular(true);
				}else if(perfussao != null && !perfussao.equals("") && perfussao.equals("perfusaodiminuida")){
					exame.setPerfusaoDiminuida(true);
				}
				exame.setPerfusaoOutros(perfusaooutros);
				
				if(sonsnormofoneticas != null && !sonsnormofoneticas.equals("") && sonsnormofoneticas.equals("on")){
					exame.setSonsBulhasMormofoneticas(true);
				}else {
					exame.setSonsBulhasMormofoneticas(false);
				}
				if(sonshiperfoneticas != null && !sonshiperfoneticas.equals("") && sonshiperfoneticas.equals("on")){
					exame.setSonsBulhasHiperfoneticas(true);
				}else {
					exame.setSonsBulhasHiperfoneticas(false);
				}
				if(sonshipofoneticas != null && !sonshipofoneticas.equals("") && sonshipofoneticas.equals("on")){
					exame.setSonsBulhasHipofoneticas(true);
				}else {
					exame.setSonsBulhasHipofoneticas(false);
				}
				exame.setSonsOutros(sonsoutros);
				if(sonscomsopros != null && !sonscomsopros.equals("") && sonscomsopros.equals("on")){
					exame.setSonsComSopros(true);
				}else {
					exame.setSonsComSopros(false);
				}
				if(sonssemsopros != null && !sonssemsopros.equals("") && sonssemsopros.equals("on")){
					exame.setSonsSemSopros(true);
				}else {
					exame.setSonsSemSopros(false);
				}
				exame.setSonsOutros(sonsoutros);
				
				if(dorconstricao != null && !dorconstricao.equals("") && dorconstricao.equals("on")){
					exame.setDorConstricao(true);
				}else {
					exame.setDorConstricao(false);
				}
				if(dorcompressao != null && !dorcompressao.equals("") && dorcompressao.equals("on")){
					exame.setDorCompressao(true);
				}else {
					exame.setDorCompressao(false);
				}
				if(dorqueimacao != null && !dorqueimacao.equals("") && dorqueimacao.equals("on")){
					exame.setDorQueimaxao(true);
				}else {
					exame.setDorQueimaxao(false);
				}
				if(dorpeso != null && !dorpeso.equals("") && dorpeso.equals("on")){
					exame.setDorPeso(true);
				}else {
					exame.setDorPeso(false);
				}
				if(dorpontada != null && !dorpontada.equals("") && dorpontada.equals("on")){
					exame.setDorPontada(true);
				}else {
					exame.setDorPontada(false);
				}
				exame.setDorOutros(doroutros);
				
				if(dorretroesternal != null && !dorretroesternal.equals("") && dorretroesternal.equals("on")){
					exame.setDorRetroesternal(true);
				}else {
					exame.setDorRetroesternal(false);
				}
				if(dorombroesquerdo != null && !dorombroesquerdo.equals("") && dorombroesquerdo.equals("on")){
					exame.setDorOmbroEsquerdo(true);
				}else {
					exame.setDorOmbroEsquerdo(false);
				}
				if(dorpescoco != null && !dorpescoco.equals("") && dorpescoco.equals("on")){
					exame.setDorPescoco(true);
				}else {
					exame.setDorPescoco(false);
				}
				if(dorface != null && !dorface.equals("") && dorface.equals("on")){
					exame.setDorFace(true);
				}else {
					exame.setDorFace(false);
				}
				if(dorinterescapular != null && !dorinterescapular.equals("") && dorinterescapular.equals("on")){
					exame.setDorRegiaoInterescapular(true);
				}else {
					exame.setDorRegiaoInterescapular(false);
				}
				if(dorepigastrica != null && !dorepigastrica.equals("") && dorepigastrica.equals("on")){
					exame.setDorEpigastrica(true);
				}else {
					exame.setDorEpigastrica(false);
				}
				exame.setDorLocalOutros(dorLocaloutros);
				if(geralpalpitacoes != null && !geralpalpitacoes.equals("") && geralpalpitacoes.equals("on")){
					exame.setGeralPalpitacoes(true);
				}else {
					exame.setGeralPalpitacoes(false);
				}
				if(geralsincope != null && !geralsincope.equals("") && geralsincope.equals("on")){
					exame.setGeralSincope(true);
				}else {
					exame.setGeralSincope(false);
				}
				if(geralmmii != null && !geralmmii.equals("") && geralmmii.equals("on")){
					exame.setGeralEdemaMMII(true);
				}else {
					exame.setGeralEdemaMMII(false);
				}
				if(geralmmss != null && !geralmmss.equals("") && geralmmss.equals("on")){
					exame.setGeralEdemaMMSS(true);
				}else {
					exame.setGeralEdemaMMSS(false);
				}
				if(geralanasarca != null && !geralanasarca.equals("") && geralanasarca.equals("on")){
					exame.setGeralAnasarca(true);
				}else {
					exame.setGeralAnasarca(false);
				}
				if(geralformigamento != null && !geralformigamento.equals("") && geralformigamento.equals("on")){
					exame.setGeralFormigamento(true);
				}else {
					exame.setGeralFormigamento(false);
				}
				if(geralcaimbras != null && !geralcaimbras.equals("") && geralcaimbras.equals("on")){
					exame.setGeralCaimbras(true);
				}else {
					exame.setGeralCaimbras(false);
				}
				if(geraldor != null && !geraldor.equals("") && geraldor.equals("on")){
					exame.setGeralDor(true);
				}else {
					exame.setGeralDor(false);
				}
				exame.setGeralLocal(geralLocal);
			}
			
			fisico.setExameSistCardiovascular(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistCardiovascular(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Sistema Cardiovascular salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistCardiovascular exame = fisico.getExameSistCardiovascular();
			if(exame == null){
				exame = new ExameSistCardiovascular();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setGeralOutros(geralOutros);
				
				if(perfussao != null && !perfussao.equals("") && perfussao.equals("perfusaoadequada")){
					exame.setPerfusaoRegular(true);
				}else if(perfussao != null && !perfussao.equals("") && perfussao.equals("perfusaodiminuida")){
					exame.setPerfusaoDiminuida(true);
				}
				exame.setPerfusaoOutros(perfusaooutros);
				
				if(sonsnormofoneticas != null && !sonsnormofoneticas.equals("") && sonsnormofoneticas.equals("on")){
					exame.setSonsBulhasMormofoneticas(true);
				}else {
					exame.setSonsBulhasMormofoneticas(false);
				}
				if(sonshiperfoneticas != null && !sonshiperfoneticas.equals("") && sonshiperfoneticas.equals("on")){
					exame.setSonsBulhasHiperfoneticas(true);
				}else {
					exame.setSonsBulhasHiperfoneticas(false);
				}
				if(sonshipofoneticas != null && !sonshipofoneticas.equals("") && sonshipofoneticas.equals("on")){
					exame.setSonsBulhasHipofoneticas(true);
				}else {
					exame.setSonsBulhasHipofoneticas(false);
				}
				exame.setSonsOutros(sonsoutros);
				if(sonscomsopros != null && !sonscomsopros.equals("") && sonscomsopros.equals("on")){
					exame.setSonsComSopros(true);
				}else {
					exame.setSonsComSopros(false);
				}
				if(sonssemsopros != null && !sonssemsopros.equals("") && sonssemsopros.equals("on")){
					exame.setSonsSemSopros(true);
				}else {
					exame.setSonsSemSopros(false);
				}
				exame.setSonsOutros(sonsoutros);
				
				if(dorconstricao != null && !dorconstricao.equals("") && dorconstricao.equals("on")){
					exame.setDorConstricao(true);
				}else {
					exame.setDorConstricao(false);
				}
				if(dorcompressao != null && !dorcompressao.equals("") && dorcompressao.equals("on")){
					exame.setDorCompressao(true);
				}else {
					exame.setDorCompressao(false);
				}
				if(dorqueimacao != null && !dorqueimacao.equals("") && dorqueimacao.equals("on")){
					exame.setDorQueimaxao(true);
				}else {
					exame.setDorQueimaxao(false);
				}
				if(dorpeso != null && !dorpeso.equals("") && dorpeso.equals("on")){
					exame.setDorPeso(true);
				}else {
					exame.setDorPeso(false);
				}
				if(dorpontada != null && !dorpontada.equals("") && dorpontada.equals("on")){
					exame.setDorPontada(true);
				}else {
					exame.setDorPontada(false);
				}
				exame.setDorOutros(doroutros);
				
				if(dorretroesternal != null && !dorretroesternal.equals("") && dorretroesternal.equals("on")){
					exame.setDorRetroesternal(true);
				}else {
					exame.setDorRetroesternal(false);
				}
				if(dorombroesquerdo != null && !dorombroesquerdo.equals("") && dorombroesquerdo.equals("on")){
					exame.setDorOmbroEsquerdo(true);
				}else {
					exame.setDorOmbroEsquerdo(false);
				}
				if(dorpescoco != null && !dorpescoco.equals("") && dorpescoco.equals("on")){
					exame.setDorPescoco(true);
				}else {
					exame.setDorPescoco(false);
				}
				if(dorface != null && !dorface.equals("") && dorface.equals("on")){
					exame.setDorFace(true);
				}else {
					exame.setDorFace(false);
				}
				if(dorinterescapular != null && !dorinterescapular.equals("") && dorinterescapular.equals("on")){
					exame.setDorRegiaoInterescapular(true);
				}else {
					exame.setDorRegiaoInterescapular(false);
				}
				if(dorepigastrica != null && !dorepigastrica.equals("") && dorepigastrica.equals("on")){
					exame.setDorEpigastrica(true);
				}else {
					exame.setDorEpigastrica(false);
				}
				exame.setDorLocalOutros(dorLocaloutros);
				if(geralpalpitacoes != null && !geralpalpitacoes.equals("") && geralpalpitacoes.equals("on")){
					exame.setGeralPalpitacoes(true);
				}else {
					exame.setGeralPalpitacoes(false);
				}
				if(geralsincope != null && !geralsincope.equals("") && geralsincope.equals("on")){
					exame.setGeralSincope(true);
				}else {
					exame.setGeralSincope(false);
				}
				if(geralmmii != null && !geralmmii.equals("") && geralmmii.equals("on")){
					exame.setGeralEdemaMMII(true);
				}else {
					exame.setGeralEdemaMMII(false);
				}
				if(geralmmss != null && !geralmmss.equals("") && geralmmss.equals("on")){
					exame.setGeralEdemaMMSS(true);
				}else {
					exame.setGeralEdemaMMSS(false);
				}
				if(geralanasarca != null && !geralanasarca.equals("") && geralanasarca.equals("on")){
					exame.setGeralAnasarca(true);
				}else {
					exame.setGeralAnasarca(false);
				}
				if(geralformigamento != null && !geralformigamento.equals("") && geralformigamento.equals("on")){
					exame.setGeralFormigamento(true);
				}else {
					exame.setGeralFormigamento(false);
				}
				if(geralcaimbras != null && !geralcaimbras.equals("") && geralcaimbras.equals("on")){
					exame.setGeralCaimbras(true);
				}else {
					exame.setGeralCaimbras(false);
				}
				if(geraldor != null && !geraldor.equals("") && geraldor.equals("on")){
					exame.setGeralDor(true);
				}else {
					exame.setGeralDor(false);
				}
				exame.setGeralLocal(geralLocal);
			}
			
			fisico.setExameSistCardiovascular(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistCardiovascular(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Sistema Cardiovascular salvo com sucesso!");
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

	public ActionForward sistGastroSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOSISTGASTRO);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String abdomenplano = ((DynaActionForm)form).getString("abdomenplano");
		String abdomengloboso = ((DynaActionForm)form).getString("abdomengloboso");
		String abdomensemigloboso = ((DynaActionForm)form).getString("abdomensemigloboso");
		String abdomenescavado = ((DynaActionForm)form).getString("abdomenescavado");
		String abdomenoutros = ((DynaActionForm)form).getString("abdomenoutros");
		String anorexia = ((DynaActionForm)form).getString("anorexia");
		String ascite = ((DynaActionForm)form).getString("ascite");
		String colicas = ((DynaActionForm)form).getString("colicas");
		String constipacao = ((DynaActionForm)form).getString("constipacao");
		String diarreia = ((DynaActionForm)form).getString("diarreia");
		String disfagia = ((DynaActionForm)form).getString("disfagia");
		String dispepsia = ((DynaActionForm)form).getString("dispepsia");
		String distensao = ((DynaActionForm)form).getString("distensao");
		String eructacao = ((DynaActionForm)form).getString("eructacao");
		String flatulencia = ((DynaActionForm)form).getString("flatulencia");
		String ganhopeso = ((DynaActionForm)form).getString("ganhopeso");
		String halitose = ((DynaActionForm)form).getString("halitose");
		String hematemese = ((DynaActionForm)form).getString("hematemese");
		String melena = ((DynaActionForm)form).getString("melena");
		String nauseas = ((DynaActionForm)form).getString("nauseas");
		String odinofagia = ((DynaActionForm)form).getString("odinofagia");
		String perdapeso = ((DynaActionForm)form).getString("perdapeso");
		String pirose = ((DynaActionForm)form).getString("pirose");
		String refluxo = ((DynaActionForm)form).getString("refluxo");
		String sialorreia = ((DynaActionForm)form).getString("sialorreia");
		String singulto = ((DynaActionForm)form).getString("singulto");
		String vomitos = ((DynaActionForm)form).getString("vomitos");
		String dor = ((DynaActionForm)form).getString("dor");
		String dorOnde = ((DynaActionForm)form).getString("dorOnde");
		String outros = ((DynaActionForm)form).getString("outros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistGastroIntestinal exame = fisico.getExameSistGastroIntestinal();
			if(exame == null){
				exame = new ExameSistGastroIntestinal();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				
				if(abdomenplano != null && !abdomenplano.equals("") && abdomenplano.equals("on")){
					exame.setPlano(true);
				}else {
					exame.setPlano(false);
				}
				if(abdomengloboso != null && !abdomengloboso.equals("") && abdomengloboso.equals("on")){
					exame.setGloboso(true);
				}else {
					exame.setGloboso(false);
				}
				if(abdomensemigloboso != null && !abdomensemigloboso.equals("") && abdomensemigloboso.equals("on")){
					exame.setSemigloboso(true);
				}else {
					exame.setSemigloboso(false);
				}
				if(abdomenescavado != null && !abdomenescavado.equals("") && abdomenescavado.equals("on")){
					exame.setEscavado(true);
				}else {
					exame.setEscavado(false);
				}
				exame.setAbdomenOutros(abdomenoutros);
				if(anorexia != null && !anorexia.equals("") && anorexia.equals("anorexiaSim")){
					exame.setAnorexiaSim(true);
				}else if(anorexia != null && !anorexia.equals("") && anorexia.equals("anorexiaNao")){
					exame.setAnorexiaNao(true);
				}
				if(ascite != null && !ascite.equals("") && ascite.equals("asciteSim")){
					exame.setAsciteSim(true);
				}else if(ascite != null && !ascite.equals("") && ascite.equals("asciteNao")){
					exame.setAsciteNao(true);
				}
				
				if(colicas != null && !colicas.equals("") && colicas.equals("colicasSim")){
					exame.setColicasSim(true);
				}else if(colicas != null && !colicas.equals("") && colicas.equals("colicasNao")){
					exame.setColicasNao(true);
				}
				if(constipacao != null && !constipacao.equals("") && constipacao.equals("constipacaoSim")){
					exame.setConstipacaoSim(true);
				}else if(constipacao != null && !constipacao.equals("") && constipacao.equals("constipacaoNao")){
					exame.setConstipacaoNao(true);
				}
				if(diarreia != null && !diarreia.equals("") && diarreia.equals("diarreiaSim")){
					exame.setDiarreiaSim(true);
				}else if(diarreia != null && !diarreia.equals("") && diarreia.equals("diarreiaNao")){
					exame.setDiarreiaNao(true);
				}
				if(disfagia != null && !disfagia.equals("") && disfagia.equals("disfagiaSim")){
					exame.setDisfagiaSim(true);
				}else if(disfagia != null && !disfagia.equals("") && disfagia.equals("disfagiaNao")){
					exame.setDisfagiaNao(true);
				}
				if(dispepsia != null && !dispepsia.equals("") && dispepsia.equals("dispepsiaSim")){
					exame.setDispepsiaSim(true);
				}else if(dispepsia != null && !dispepsia.equals("") && dispepsia.equals("dispepsiaNao")){
					exame.setDispepsiaNao(true);
				}
				if(distensao != null && !distensao.equals("") && distensao.equals("distensaoSim")){
					exame.setDistensaoAbdominalSim(true);
				}else if(distensao != null && !distensao.equals("") && distensao.equals("distensaoNao")){
					exame.setDistensaoAbdominalNao(true);
				}
				if(eructacao != null && !eructacao.equals("") && eructacao.equals("eructacaoSim")){
					exame.setEructacaoSim(true);
				}else if(eructacao != null && !eructacao.equals("") && eructacao.equals("eructacaoNao")){
					exame.setEructacaoNao(true);
				}
				if(flatulencia != null && !flatulencia.equals("") && flatulencia.equals("flatulenciaSim")){
					exame.setFlatulenciaSim(true);
				}else if(flatulencia != null && !flatulencia.equals("") && flatulencia.equals("flatulenciaNao")){
					exame.setFlatulenciaNao(true);
				}
				if(ganhopeso != null && !ganhopeso.equals("") && ganhopeso.equals("ganhopesoSim")){
					exame.setGanhoPesoSim(true);
				}else if(ganhopeso != null && !ganhopeso.equals("") && ganhopeso.equals("ganhopesoNao")){
					exame.setGanhoPesoNao(true);
				}
				if(halitose != null && !halitose.equals("") && halitose.equals("halitoseSim")){
					exame.setHalitoseSim(true);
				}else if(halitose != null && !halitose.equals("") && halitose.equals("halitoseNao")){
					exame.setHalitoseNao(true);
				}
				if(hematemese != null && !hematemese.equals("") && hematemese.equals("hematemeseSim")){
					exame.setHematemeseSim(true);
				}else if(hematemese != null && !hematemese.equals("") && hematemese.equals("hematemeseNao")){
					exame.setHematemeseNao(true);
				}
				if(melena != null && !melena.equals("") && melena.equals("melenaSim")){
					exame.setMelenaSim(true);
				}else if(melena != null && !melena.equals("") && melena.equals("melenaNao")){
					exame.setMelenaNao(true);
				}
				if(nauseas != null && !nauseas.equals("") && nauseas.equals("nauseasSim")){
					exame.setNauseasSim(true);
				}else if(nauseas != null && !nauseas.equals("") && nauseas.equals("nauseasNao")){
					exame.setNauseasNao(true);
				}
				if(odinofagia != null && !odinofagia.equals("") && odinofagia.equals("odinofagiaSim")){
					exame.setOdinofagiaSim(true);
				}else if(odinofagia != null && !odinofagia.equals("") && odinofagia.equals("odinofagiaNao")){
					exame.setOdinofagiaNao(true);
				}
				if(perdapeso != null && !perdapeso.equals("") && perdapeso.equals("perdapesoSim")){
					exame.setPerdaPesoSim(true);
				}else if(perdapeso != null && !perdapeso.equals("") && perdapeso.equals("perdapesoNao")){
					exame.setPerdaPesoNao(true);
				}
				if(pirose != null && !pirose.equals("") && pirose.equals("piroseSim")){
					exame.setPiroseSim(true);
				}else if(pirose != null && !pirose.equals("") && pirose.equals("piroseNao")){
					exame.setPiroseNao(true);
				}
				if(refluxo != null && !refluxo.equals("") && refluxo.equals("refluxoSim")){
					exame.setRefluxoSim(true);
				}else if(refluxo != null && !refluxo.equals("") && refluxo.equals("refluxoNao")){
					exame.setRefluxoNao(true);
				}
				if(sialorreia != null && !sialorreia.equals("") && sialorreia.equals("sialorreiaSim")){
					exame.setSialorreiaSim(true);
				}else if(sialorreia != null && !sialorreia.equals("") && sialorreia.equals("sialorreiaNao")){
					exame.setSialorreiaNao(true);
				}
				if(singulto != null && !singulto.equals("") && singulto.equals("singultoSim")){
					exame.setSingultoSim(true);
				}else if(singulto != null && !singulto.equals("") && singulto.equals("singultoNao")){
					exame.setSingultoNao(true);
				}
				if(vomitos != null && !vomitos.equals("") && vomitos.equals("vomitosSim")){
					exame.setVomitosSim(true);
				}else if(vomitos != null && !vomitos.equals("") && vomitos.equals("vomitosNao")){
					exame.setVomitosNao(true);
				}
				if(dor != null && !dor.equals("") && dor.equals("dorSim")){
					exame.setDorSim(true);
				}else if(dor != null && !dor.equals("") && dor.equals("dorNao")){
					exame.setDorNao(true);
				}
				exame.setDorOnde(dorOnde);
				
				
			}
			
			fisico.setExameSistGastroIntestinal(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistGrastroIntestinal(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Sistema Gastrointestinal salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistGastroIntestinal exame = fisico.getExameSistGastroIntestinal();
			if(exame == null){
				exame = new ExameSistGastroIntestinal();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setOutros(outros);
				
				if(abdomenplano != null && !abdomenplano.equals("") && abdomenplano.equals("on")){
					exame.setPlano(true);
				}else {
					exame.setPlano(false);
				}
				if(abdomengloboso != null && !abdomengloboso.equals("") && abdomengloboso.equals("on")){
					exame.setGloboso(true);
				}else {
					exame.setGloboso(false);
				}
				if(abdomensemigloboso != null && !abdomensemigloboso.equals("") && abdomensemigloboso.equals("on")){
					exame.setSemigloboso(true);
				}else {
					exame.setSemigloboso(false);
				}
				if(abdomenescavado != null && !abdomenescavado.equals("") && abdomenescavado.equals("on")){
					exame.setEscavado(true);
				}else {
					exame.setEscavado(false);
				}
				exame.setAbdomenOutros(abdomenoutros);
				if(anorexia != null && !anorexia.equals("") && anorexia.equals("anorexiaSim")){
					exame.setAnorexiaSim(true);
				}else if(anorexia != null && !anorexia.equals("") && anorexia.equals("anorexiaNao")){
					exame.setAnorexiaNao(true);
				}
				if(ascite != null && !ascite.equals("") && ascite.equals("asciteSim")){
					exame.setAsciteSim(true);
				}else if(ascite != null && !ascite.equals("") && ascite.equals("asciteNao")){
					exame.setAsciteNao(true);
				}
				
				if(colicas != null && !colicas.equals("") && colicas.equals("colicasSim")){
					exame.setColicasSim(true);
				}else if(colicas != null && !colicas.equals("") && colicas.equals("colicasNao")){
					exame.setColicasNao(true);
				}
				if(constipacao != null && !constipacao.equals("") && constipacao.equals("constipacaoSim")){
					exame.setConstipacaoSim(true);
				}else if(constipacao != null && !constipacao.equals("") && constipacao.equals("constipacaoNao")){
					exame.setConstipacaoNao(true);
				}
				if(diarreia != null && !diarreia.equals("") && diarreia.equals("diarreiaSim")){
					exame.setDiarreiaSim(true);
				}else if(diarreia != null && !diarreia.equals("") && diarreia.equals("diarreiaNao")){
					exame.setDiarreiaNao(true);
				}
				if(disfagia != null && !disfagia.equals("") && disfagia.equals("disfagiaSim")){
					exame.setDisfagiaSim(true);
				}else if(disfagia != null && !disfagia.equals("") && disfagia.equals("disfagiaNao")){
					exame.setDisfagiaNao(true);
				}
				if(dispepsia != null && !dispepsia.equals("") && dispepsia.equals("dispepsiaSim")){
					exame.setDispepsiaSim(true);
				}else if(dispepsia != null && !dispepsia.equals("") && dispepsia.equals("dispepsiaNao")){
					exame.setDispepsiaNao(true);
				}
				if(distensao != null && !distensao.equals("") && distensao.equals("distensaoSim")){
					exame.setDistensaoAbdominalSim(true);
				}else if(distensao != null && !distensao.equals("") && distensao.equals("distensaoNao")){
					exame.setDistensaoAbdominalNao(true);
				}
				if(eructacao != null && !eructacao.equals("") && eructacao.equals("eructacaoSim")){
					exame.setEructacaoSim(true);
				}else if(eructacao != null && !eructacao.equals("") && eructacao.equals("eructacaoNao")){
					exame.setEructacaoNao(true);
				}
				if(flatulencia != null && !flatulencia.equals("") && flatulencia.equals("flatulenciaSim")){
					exame.setFlatulenciaSim(true);
				}else if(flatulencia != null && !flatulencia.equals("") && flatulencia.equals("flatulenciaNao")){
					exame.setFlatulenciaNao(true);
				}
				if(ganhopeso != null && !ganhopeso.equals("") && ganhopeso.equals("ganhopesoSim")){
					exame.setGanhoPesoSim(true);
				}else if(ganhopeso != null && !ganhopeso.equals("") && ganhopeso.equals("ganhopesoNao")){
					exame.setGanhoPesoNao(true);
				}
				if(halitose != null && !halitose.equals("") && halitose.equals("halitoseSim")){
					exame.setHalitoseSim(true);
				}else if(halitose != null && !halitose.equals("") && halitose.equals("halitoseNao")){
					exame.setHalitoseNao(true);
				}
				if(hematemese != null && !hematemese.equals("") && hematemese.equals("hematemeseSim")){
					exame.setHematemeseSim(true);
				}else if(hematemese != null && !hematemese.equals("") && hematemese.equals("hematemeseNao")){
					exame.setHematemeseNao(true);
				}
				if(melena != null && !melena.equals("") && melena.equals("melenaSim")){
					exame.setMelenaSim(true);
				}else if(melena != null && !melena.equals("") && melena.equals("melenaNao")){
					exame.setMelenaNao(true);
				}
				if(nauseas != null && !nauseas.equals("") && nauseas.equals("nauseasSim")){
					exame.setNauseasSim(true);
				}else if(nauseas != null && !nauseas.equals("") && nauseas.equals("nauseasNao")){
					exame.setNauseasNao(true);
				}
				if(odinofagia != null && !odinofagia.equals("") && odinofagia.equals("odinofagiaSim")){
					exame.setOdinofagiaSim(true);
				}else if(odinofagia != null && !odinofagia.equals("") && odinofagia.equals("odinofagiaNao")){
					exame.setOdinofagiaNao(true);
				}
				if(perdapeso != null && !perdapeso.equals("") && perdapeso.equals("perdapesoSim")){
					exame.setPerdaPesoSim(true);
				}else if(perdapeso != null && !perdapeso.equals("") && perdapeso.equals("perdapesoNao")){
					exame.setPerdaPesoNao(true);
				}
				if(pirose != null && !pirose.equals("") && pirose.equals("piroseSim")){
					exame.setPiroseSim(true);
				}else if(pirose != null && !pirose.equals("") && pirose.equals("piroseNao")){
					exame.setPiroseNao(true);
				}
				if(refluxo != null && !refluxo.equals("") && refluxo.equals("refluxoSim")){
					exame.setRefluxoSim(true);
				}else if(refluxo != null && !refluxo.equals("") && refluxo.equals("refluxoNao")){
					exame.setRefluxoNao(true);
				}
				if(sialorreia != null && !sialorreia.equals("") && sialorreia.equals("sialorreiaSim")){
					exame.setSialorreiaSim(true);
				}else if(sialorreia != null && !sialorreia.equals("") && sialorreia.equals("sialorreiaNao")){
					exame.setSialorreiaNao(true);
				}
				if(singulto != null && !singulto.equals("") && singulto.equals("singultoSim")){
					exame.setSingultoSim(true);
				}else if(singulto != null && !singulto.equals("") && singulto.equals("singultoNao")){
					exame.setSingultoNao(true);
				}
				if(vomitos != null && !vomitos.equals("") && vomitos.equals("vomitosSim")){
					exame.setVomitosSim(true);
				}else if(vomitos != null && !vomitos.equals("") && vomitos.equals("vomitosNao")){
					exame.setVomitosNao(true);
				}
				if(dor != null && !dor.equals("") && dor.equals("dorSim")){
					exame.setDorSim(true);
				}else if(dor != null && !dor.equals("") && dor.equals("dorNao")){
					exame.setDorNao(true);
				}
				exame.setDorOnde(dorOnde);
				
				
			}
			
			fisico.setExameSistGastroIntestinal(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistGrastroIntestinal(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Sistema Gastrointestinal salvo com sucesso!");
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
	
	public ActionForward sistUrinaSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fEXAMEFISICOSISTURINA);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String corlimpida = ((DynaActionForm)form).getString("corlimpida");
		String corcolurica = ((DynaActionForm)form).getString("corcolurica");
		String corconcentrada = ((DynaActionForm)form).getString("corconcentrada");
		String corespumosa = ((DynaActionForm)form).getString("corespumosa");
		String coroutros = ((DynaActionForm)form).getString("coroutros");
		String miccionaisoliguria = ((DynaActionForm)form).getString("miccionaisoliguria");
		String micccionaisdisuria = ((DynaActionForm)form).getString("micccionaisdisuria");
		String miccionaisanuria = ((DynaActionForm)form).getString("miccionaisanuria");
		String miccionaispolaciuria = ((DynaActionForm)form).getString("miccionaispolaciuria");
		String miccionaishematuria = ((DynaActionForm)form).getString("miccionaishematuria");
		String miccionaisincotinecia = ((DynaActionForm)form).getString("miccionaisincotinecia");
		String miccionaisretencao = ((DynaActionForm)form).getString("miccionaisretencao");
		String miccionaisenurese = ((DynaActionForm)form).getString("miccionaisenurese");
		String miccionaispoliuria = ((DynaActionForm)form).getString("miccionaispoliuria");
		String miccionaispiuria = ((DynaActionForm)form).getString("miccionaispiuria");
		String miccionaisoutros = ((DynaActionForm)form).getString("miccionaisoutros");
		String ciclo = ((DynaActionForm)form).getString("ciclo");
		String menopausa = ((DynaActionForm)form).getString("menopausa");
		String sangramentos = ((DynaActionForm)form).getString("sangramentos");
		String prurido = ((DynaActionForm)form).getString("prurido");
		String lesoes = ((DynaActionForm)form).getString("lesoes");
		String odor = ((DynaActionForm)form).getString("odor");
		String corrimento = ((DynaActionForm)form).getString("corrimento");
		String colicas = ((DynaActionForm)form).getString("colicas");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistGenitoUrinario exame = fisico.getExameSistGenitoUrinario();
			if(exame == null){
				exame = new ExameSistGenitoUrinario();
			}
			
			System.out.println(">>> |" + semqueixa + "|");
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setMiccionaisoutros(miccionaisoutros);
				exame.setCoroutros(coroutros);
				if(corlimpida != null && !corlimpida.equals("") && corlimpida.equals("on")){
					exame.setCorlimpida(true);
				}else {
					exame.setCorlimpida(false);
				}
				if(corcolurica != null && !corcolurica.equals("") && corcolurica.equals("on")){
					exame.setCorcolurica(true);
				}else {
					exame.setCorcolurica(false);
				}
				if(corconcentrada != null && !corconcentrada.equals("") && corconcentrada.equals("on")){
					exame.setCorconcentrada(true);
				}else {
					exame.setCorconcentrada(false);
				}
				if(corespumosa != null && !corespumosa.equals("") && corespumosa.equals("on")){
					exame.setCorespumosa(true);
				}else {
					exame.setCorespumosa(false);
				}
				if(miccionaisoliguria != null && !miccionaisoliguria.equals("") && miccionaisoliguria.equals("on")){
					exame.setMiccionaisoliguria(true);
				}else {
					exame.setMiccionaisoliguria(false);
				}
				if(micccionaisdisuria != null && !micccionaisdisuria.equals("") && micccionaisdisuria.equals("on")){
					exame.setMicccionaisdisuria(true);
				}else {
					exame.setMicccionaisdisuria(false);
				}
				if(miccionaisanuria != null && !miccionaisanuria.equals("") && miccionaisanuria.equals("on")){
					exame.setMiccionaisanuria(true);
				}else {
					exame.setMiccionaisanuria(false);
				}
				if(miccionaispolaciuria != null && !miccionaispolaciuria.equals("") && miccionaispolaciuria.equals("on")){
					exame.setMiccionaispolaciuria(true);
				}else {
					exame.setMiccionaispolaciuria(false);
				}
				if(miccionaishematuria != null && !miccionaishematuria.equals("") && miccionaishematuria.equals("on")){
					exame.setMiccionaishematuria(true);
				}else {
					exame.setMiccionaishematuria(false);
				}
				if(miccionaisincotinecia != null && !miccionaisincotinecia.equals("") && miccionaisincotinecia.equals("on")){
					exame.setMiccionaisincotinecia(true);
				}else {
					exame.setMiccionaisincotinecia(false);
				}
				if(miccionaisretencao != null && !miccionaisretencao.equals("") && miccionaisretencao.equals("on")){
					exame.setMiccionaisretencao(true);
				}else {
					exame.setMiccionaisretencao(false);
				}
				if(miccionaisenurese != null && !miccionaisenurese.equals("") && miccionaisenurese.equals("on")){
					exame.setMiccionaisenurese(true);
				}else {
					exame.setMiccionaisenurese(false);
				}
				if(miccionaispoliuria != null && !miccionaispoliuria.equals("") && miccionaispoliuria.equals("on")){
					exame.setMiccionaispoliuria(true);
				}else {
					exame.setMiccionaispoliuria(false);
				}
				if(miccionaispiuria != null && !miccionaispiuria.equals("") && miccionaispiuria.equals("on")){
					exame.setMiccionaispiuria(true);
				}else {
					exame.setMiccionaispiuria(false);
				}
				if(ciclo != null && !ciclo.equals("") && ciclo.equals("cicloSim")){
					exame.setCicloSim(true);
				}else if(ciclo != null && !ciclo.equals("") && ciclo.equals("cicloNao")){
					exame.setCicloNao(true);
				}
				if(menopausa != null && !menopausa.equals("") && menopausa.equals("menopausaSim")){
					exame.setMenopausaSim(true);
				}else if(menopausa != null && !menopausa.equals("") && menopausa.equals("menopausaNao")){
					exame.setMenopausaNao(true);
				}
				if(sangramentos != null && !sangramentos.equals("") && sangramentos.equals("sangramentosSim")){
					exame.setSangramentosSim(true);
				}else if(sangramentos != null && !sangramentos.equals("") && sangramentos.equals("sangramentosNao")){
					exame.setSangramentosNao(true);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("pruridoSim")){
					exame.setPruridoSim(true);
				}else if(prurido != null && !prurido.equals("") && prurido.equals("pruridoNao")){
					exame.setPruridoNao(true);
				}
				if(lesoes != null && !lesoes.equals("") && lesoes.equals("lesoesSim")){
					exame.setLesoesSim(true);
				}else if(lesoes != null && !lesoes.equals("") && lesoes.equals("lesoesNao")){
					exame.setLesoesNao(true);
				}
				if(odor != null && !odor.equals("") && odor.equals("odorSim")){
					exame.setOdorSim(true);
				}else if(odor != null && !odor.equals("") && odor.equals("odorNao")){
					exame.setOdorNao(true);
				}
				if(corrimento != null && !corrimento.equals("") && corrimento.equals("corrimentoSim")){
					exame.setCorrimentoSim(true);
				}else if(corrimento != null && !corrimento.equals("") && corrimento.equals("corrimentoNao")){
					exame.setCorrimentoNao(true);
				}
				if(colicas != null && !colicas.equals("") && colicas.equals("colicasSim")){
					exame.setColicasSim(true);
				}else if(colicas != null && !colicas.equals("") && colicas.equals("colicasNao")){
					exame.setColicasNao(true);
				}
			}
			
			fisico.setExameSistGenitoUrinario(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistGenitoUrinario(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Sistema Genitourin??rio salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistGenitoUrinario exame = fisico.getExameSistGenitoUrinario();
			if(exame == null){
				exame = new ExameSistGenitoUrinario();
			}

			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setMiccionaisoutros(miccionaisoutros);
				exame.setCoroutros(coroutros);
				if(corlimpida != null && !corlimpida.equals("") && corlimpida.equals("on")){
					exame.setCorlimpida(true);
				}else {
					exame.setCorlimpida(false);
				}
				if(corcolurica != null && !corcolurica.equals("") && corcolurica.equals("on")){
					exame.setCorcolurica(true);
				}else {
					exame.setCorcolurica(false);
				}
				if(corconcentrada != null && !corconcentrada.equals("") && corconcentrada.equals("on")){
					exame.setCorconcentrada(true);
				}else {
					exame.setCorconcentrada(false);
				}
				if(corespumosa != null && !corespumosa.equals("") && corespumosa.equals("on")){
					exame.setCorespumosa(true);
				}else {
					exame.setCorespumosa(false);
				}
				if(miccionaisoliguria != null && !miccionaisoliguria.equals("") && miccionaisoliguria.equals("on")){
					exame.setMiccionaisoliguria(true);
				}else {
					exame.setMiccionaisoliguria(false);
				}
				if(micccionaisdisuria != null && !micccionaisdisuria.equals("") && micccionaisdisuria.equals("on")){
					exame.setMicccionaisdisuria(true);
				}else {
					exame.setMicccionaisdisuria(false);
				}
				if(miccionaisanuria != null && !miccionaisanuria.equals("") && miccionaisanuria.equals("on")){
					exame.setMiccionaisanuria(true);
				}else {
					exame.setMiccionaisanuria(false);
				}
				if(miccionaispolaciuria != null && !miccionaispolaciuria.equals("") && miccionaispolaciuria.equals("on")){
					exame.setMiccionaispolaciuria(true);
				}else {
					exame.setMiccionaispolaciuria(false);
				}
				if(miccionaishematuria != null && !miccionaishematuria.equals("") && miccionaishematuria.equals("on")){
					exame.setMiccionaishematuria(true);
				}else {
					exame.setMiccionaishematuria(false);
				}
				if(miccionaisincotinecia != null && !miccionaisincotinecia.equals("") && miccionaisincotinecia.equals("on")){
					exame.setMiccionaisincotinecia(true);
				}else {
					exame.setMiccionaisincotinecia(false);
				}
				if(miccionaisretencao != null && !miccionaisretencao.equals("") && miccionaisretencao.equals("on")){
					exame.setMiccionaisretencao(true);
				}else {
					exame.setMiccionaisretencao(false);
				}
				if(miccionaisenurese != null && !miccionaisenurese.equals("") && miccionaisenurese.equals("on")){
					exame.setMiccionaisenurese(true);
				}else {
					exame.setMiccionaisenurese(false);
				}
				if(miccionaispoliuria != null && !miccionaispoliuria.equals("") && miccionaispoliuria.equals("on")){
					exame.setMiccionaispoliuria(true);
				}else {
					exame.setMiccionaispoliuria(false);
				}
				if(miccionaispiuria != null && !miccionaispiuria.equals("") && miccionaispiuria.equals("on")){
					exame.setMiccionaispiuria(true);
				}else {
					exame.setMiccionaispiuria(false);
				}
				if(ciclo != null && !ciclo.equals("") && ciclo.equals("cicloSim")){
					exame.setCicloSim(true);
				}else if(ciclo != null && !ciclo.equals("") && ciclo.equals("cicloNao")){
					exame.setCicloNao(true);
				}
				if(menopausa != null && !menopausa.equals("") && menopausa.equals("menopausaSim")){
					exame.setMenopausaSim(true);
				}else if(menopausa != null && !menopausa.equals("") && menopausa.equals("menopausaNao")){
					exame.setMenopausaNao(true);
				}
				if(sangramentos != null && !sangramentos.equals("") && sangramentos.equals("sangramentosSim")){
					exame.setSangramentosSim(true);
				}else if(sangramentos != null && !sangramentos.equals("") && sangramentos.equals("sangramentosNao")){
					exame.setSangramentosNao(true);
				}
				if(prurido != null && !prurido.equals("") && prurido.equals("pruridoSim")){
					exame.setPruridoSim(true);
				}else if(prurido != null && !prurido.equals("") && prurido.equals("pruridoNao")){
					exame.setPruridoNao(true);
				}
				if(lesoes != null && !lesoes.equals("") && lesoes.equals("lesoesSim")){
					exame.setLesoesSim(true);
				}else if(lesoes != null && !lesoes.equals("") && lesoes.equals("lesoesNao")){
					exame.setLesoesNao(true);
				}
				if(odor != null && !odor.equals("") && odor.equals("odorSim")){
					exame.setOdorSim(true);
				}else if(odor != null && !odor.equals("") && odor.equals("odorNao")){
					exame.setOdorNao(true);
				}
				if(corrimento != null && !corrimento.equals("") && corrimento.equals("corrimentoSim")){
					exame.setCorrimentoSim(true);
				}else if(corrimento != null && !corrimento.equals("") && corrimento.equals("corrimentoNao")){
					exame.setCorrimentoNao(true);
				}
				if(colicas != null && !colicas.equals("") && colicas.equals("colicasSim")){
					exame.setColicasSim(true);
				}else if(colicas != null && !colicas.equals("") && colicas.equals("colicasNao")){
					exame.setColicasNao(true);
				}
			}
			
			fisico.setExameSistGenitoUrinario(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistGenitoUrinario(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Sistema Genitourin??rio salvo com sucesso!");
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

	
	public ActionForward pelesAnexosSalvar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
		ActionForward retorno = map.findForward(fEXAMEFISICOPELESANEXOS);
		Atendimento atendimento = (Atendimento) request.getSession().getAttribute("atendimento");
		
		String semqueixa = ((DynaActionForm)form).getString("semqueixa");
		String coloracaopalidez = ((DynaActionForm)form).getString("coloracaopalidez");
		String coloracaocianose = ((DynaActionForm)form).getString("coloracaocianose");
		String coloracaoictericia = ((DynaActionForm)form).getString("coloracaoictericia");
		String coloracaoeritema = ((DynaActionForm)form).getString("coloracaoeritema");
		String coloracaopetequias = ((DynaActionForm)form).getString("coloracaopetequias");
		String coloracaoequimoses = ((DynaActionForm)form).getString("coloracaoequimoses");
		String coloracaohipocromia = ((DynaActionForm)form).getString("coloracaohipocromia");
		String coloracaohipercromia = ((DynaActionForm)form).getString("coloracaohipercromia");
		String coloracaooutros = ((DynaActionForm)form).getString("coloracaooutros");
		String hidrahidratada = ((DynaActionForm)form).getString("hidrahidratada");
		String hidraxerodermia = ((DynaActionForm)form).getString("hidraxerodermia");
		String hidrahiperdrose = ((DynaActionForm)form).getString("hidrahiperdrose");
		String hidrataoutros = ((DynaActionForm)form).getString("hidrataoutros");
		String turgor = ((DynaActionForm)form).getString("turgor");
		String turgoroutros = ((DynaActionForm)form).getString("turgoroutros");
		String lesoespapula = ((DynaActionForm)form).getString("lesoespapula");
		String lesoesnodulo = ((DynaActionForm)form).getString("lesoesnodulo");
		String lesoestumor = ((DynaActionForm)form).getString("lesoestumor");
		String lesoesurticaria = ((DynaActionForm)form).getString("lesoesurticaria");
		String lesoesvesicula = ((DynaActionForm)form).getString("lesoesvesicula");
		String lesoesbolha = ((DynaActionForm)form).getString("lesoesbolha");
		String lesoespustula = ((DynaActionForm)form).getString("lesoespustula");
		String lesoesabscesso = ((DynaActionForm)form).getString("lesoesabscesso");
		String lesoeshematoma = ((DynaActionForm)form).getString("lesoeshematoma");
		String lesoescicatriz = ((DynaActionForm)form).getString("lesoescicatriz");
		String lesoesescara = ((DynaActionForm)form).getString("lesoesescara");
		String lesoeserosao = ((DynaActionForm)form).getString("lesoeserosao");
		String lesoesfissura = ((DynaActionForm)form).getString("lesoesfissura");
		String lesoesfistula = ((DynaActionForm)form).getString("lesoesfistula");
		String edema = ((DynaActionForm)form).getString("edema");
		String lesoesoutros = ((DynaActionForm)form).getString("lesoesoutros");
		String feridascronicas = ((DynaActionForm)form).getString("feridascronicas");
		String feridascirurgicas = ((DynaActionForm)form).getString("feridascirurgicas");
		String feridastraumaticas = ((DynaActionForm)form).getString("feridastraumaticas");
		String feridasinfectadas = ((DynaActionForm)form).getString("feridasinfectadas");
		String feridastecido = ((DynaActionForm)form).getString("feridastecido");
		String feridasgranuladas = ((DynaActionForm)form).getString("feridasgranuladas");
		String feridaseptelizadas = ((DynaActionForm)form).getString("feridaseptelizadas");
		String feridasoutros = ((DynaActionForm)form).getString("feridasoutros");
		String unhaspalidez = ((DynaActionForm)form).getString("unhaspalidez");
		String unhascianose = ((DynaActionForm)form).getString("unhascianose");
		String unhasonicofagia = ((DynaActionForm)form).getString("unhasonicofagia");
		String unhassujidade = ((DynaActionForm)form).getString("unhassujidade");
		String unhashipercromia = ((DynaActionForm)form).getString("unhashipercromia");
		String unhasoutros = ((DynaActionForm)form).getString("unhasoutros");
		String peloshipertricose = ((DynaActionForm)form).getString("peloshipertricose");
		String peloshipotricose = ((DynaActionForm)form).getString("peloshipotricose");
		String pelosalopecia = ((DynaActionForm)form).getString("pelosalopecia");
		String pelosoutros = ((DynaActionForm)form).getString("pelosoutros");
		
		if(atendimento instanceof Admissao){
			Admissao admissao = (Admissao) atendimento;
			
			ExameFisico fisico = admissao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistPelesAnexos exame = fisico.getExameSistPelesAnexos();
			if(exame == null){
				exame = new ExameSistPelesAnexos();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setColoracaoOutros(coloracaooutros);
				exame.setHidratacaoOutros(hidrataoutros);
				exame.setTugorOutros(turgoroutros);
				exame.setLesoesEdema(edema);
				exame.setFeridasOutros(feridasoutros);
				exame.setLesoesOutros(lesoesoutros);
				exame.setUnhasOutros(unhasoutros);
				exame.setPelosOutros(pelosoutros);
				if(turgor != null && !turgor.equals("") && turgor.equals("turgorpreservado")){
					exame.setTugorPreservado(true);
				}else if(turgor != null && !turgor.equals("") && turgor.equals("turgornaopreservado")){
					exame.setTugorNaoPreservado(true);
				}
				if(coloracaopalidez != null && !coloracaopalidez.equals("") && coloracaopalidez.equals("on")){
					exame.setColoracaoPalidez(true);
				}else {
					exame.setColoracaoPalidez(false);
				}
				if(coloracaocianose != null && !coloracaocianose.equals("") && coloracaocianose.equals("on")){
					exame.setColoracaoCianose(true);
				}else {
					exame.setColoracaoCianose(false);
				}
				if(coloracaoictericia != null && !coloracaoictericia.equals("") && coloracaoictericia.equals("on")){
					exame.setColoracaoIctericia(true);
				}else {
					exame.setColoracaoIctericia(false);
				}
				if(coloracaoeritema != null && !coloracaoeritema.equals("") && coloracaoeritema.equals("on")){
					exame.setColoracaoEritema(true);
				}else {
					exame.setColoracaoEritema(false);
				}
				if(coloracaopetequias != null && !coloracaopetequias.equals("") && coloracaopetequias.equals("on")){
					exame.setColoracaoPetequias(true);
				}else {
					exame.setColoracaoPetequias(false);
				}
				if(coloracaoequimoses != null && !coloracaoequimoses.equals("") && coloracaoequimoses.equals("on")){
					exame.setColoracaoEquimoses(true);
				}else {
					exame.setColoracaoEquimoses(false);
				}
				if(coloracaohipocromia != null && !coloracaohipocromia.equals("") && coloracaohipocromia.equals("on")){
					exame.setColoracaoHipocromia(true);
				}else {
					exame.setColoracaoHipocromia(false);
				}
				if(coloracaohipercromia != null && !coloracaohipercromia.equals("") && coloracaohipercromia.equals("on")){
					exame.setColoracaoHipercromia(true);
				}else {
					exame.setColoracaoHipercromia(false);
				}
				if(hidrahidratada != null && !hidrahidratada.equals("") && hidrahidratada.equals("on")){
					exame.setHidratacaoHidratada(true);
				}else {
					exame.setHidratacaoHidratada(false);
				}
				if(hidraxerodermia != null && !hidraxerodermia.equals("") && hidraxerodermia.equals("on")){
					exame.setHidratacaoXerodermia(true);
				}else {
					exame.setHidratacaoXerodermia(false);
				}
				if(hidrahiperdrose != null && !hidrahiperdrose.equals("") && hidrahiperdrose.equals("on")){
					exame.setHidratacaoHiperidrose(true);
				}else {
					exame.setHidratacaoHiperidrose(false);
				}
				if(lesoespapula != null && !lesoespapula.equals("") && lesoespapula.equals("on")){
					exame.setLesoesPapula(true);
				}else {
					exame.setLesoesPapula(false);
				}
				if(lesoesnodulo != null && !lesoesnodulo.equals("") && lesoesnodulo.equals("on")){
					exame.setLesoesNodulo(true);
				}else {
					exame.setLesoesNodulo(false);
				}
				if(lesoestumor != null && !lesoestumor.equals("") && lesoestumor.equals("on")){
					exame.setLesoesTumor(true);
				}else {
					exame.setLesoesTumor(false);
				}
				if(lesoesurticaria != null && !lesoesurticaria.equals("") && lesoesurticaria.equals("on")){
					exame.setLesoesUrticaria(true);
				}else {
					exame.setLesoesUrticaria(false);
				}
				if(lesoesvesicula != null && !lesoesvesicula.equals("") && lesoesvesicula.equals("on")){
					exame.setLesoesVesicula(true);
				}else {
					exame.setLesoesVesicula(false);
				}
				if(lesoesbolha != null && !lesoesbolha.equals("") && lesoesbolha.equals("on")){
					exame.setLesoesBolha(true);
				}else {
					exame.setLesoesBolha(false);
				}
				if(lesoespustula != null && !lesoespustula.equals("") && lesoespustula.equals("on")){
					exame.setLesoesPustula(true);
				}else {
					exame.setLesoesPustula(false);
				}
				if(lesoesabscesso != null && !lesoesabscesso.equals("") && lesoesabscesso.equals("on")){
					exame.setLesoesAbscesso(true);
				}else {
					exame.setLesoesAbscesso(false);
				}
				if(lesoeshematoma != null && !lesoeshematoma.equals("") && lesoeshematoma.equals("on")){
					exame.setLesoesHematoma(true);
				}else {
					exame.setLesoesHematoma(false);
				}
				if(lesoescicatriz != null && !lesoescicatriz.equals("") && lesoescicatriz.equals("on")){
					exame.setLesoesCicatriz(true);
				}else {
					exame.setLesoesCicatriz(false);
				}
				if(lesoesescara != null && !lesoesescara.equals("") && lesoesescara.equals("on")){
					exame.setLesoesEscara(true);
				}else {
					exame.setLesoesEscara(false);
				}
				if(lesoeserosao != null && !lesoeserosao.equals("") && lesoeserosao.equals("on")){
					exame.setLesoesErosao(true);
				}else {
					exame.setLesoesErosao(false);
				}
				if(lesoesfissura != null && !lesoesfissura.equals("") && lesoesfissura.equals("on")){
					exame.setLesoesFissura(true);
				}else {
					exame.setLesoesFissura(false);
				}
				if(lesoesfistula != null && !lesoesfistula.equals("") && lesoesfistula.equals("on")){
					exame.setLesoesFistula(true);
				}else {
					exame.setLesoesFistula(false);
				}
				if(feridascronicas != null && !feridascronicas.equals("") && feridascronicas.equals("on")){
					exame.setFeridasCronica(true);
				}else {
					exame.setFeridasCronica(false);
				}
				if(feridascirurgicas != null && !feridascirurgicas.equals("") && feridascirurgicas.equals("on")){
					exame.setFeridasCirurgica(true);
				}else {
					exame.setFeridasCirurgica(false);
				}
				if(feridastraumaticas != null && !feridastraumaticas.equals("") && feridastraumaticas.equals("on")){
					exame.setFeridasTraumatica(true);
				}else {
					exame.setFeridasTraumatica(false);
				}
				if(feridasinfectadas != null && !feridasinfectadas.equals("") && feridasinfectadas.equals("on")){
					exame.setFeridasInfectada(true);
				}else {
					exame.setFeridasInfectada(false);
				}
				if(feridastecido != null && !feridastecido.equals("") && feridastecido.equals("on")){
					exame.setFeridasTecidoDesvitalizado(true);
				}else {
					exame.setFeridasTecidoDesvitalizado(false);
				}
				if(feridaseptelizadas != null && !feridaseptelizadas.equals("") && feridaseptelizadas.equals("on")){
					exame.setFeridasEpitelizada(true);
				}else {
					exame.setFeridasEpitelizada(false);
				}
				if(feridasgranuladas != null && !feridasgranuladas.equals("") && feridasgranuladas.equals("on")){
					exame.setFeridasGranulada(true);
				}else {
					exame.setFeridasGranulada(false);
				}
				if(unhaspalidez != null && !unhaspalidez.equals("") && unhaspalidez.equals("on")){
					exame.setUnhasPalidez(true);
				}else {
					exame.setUnhasPalidez(false);
				}
				if(unhascianose != null && !unhascianose.equals("") && unhascianose.equals("on")){
					exame.setUnhasCianose(true);
				}else {
					exame.setUnhasCianose(false);
				}
				if(unhasonicofagia != null && !unhasonicofagia.equals("") && unhasonicofagia.equals("on")){
					exame.setUnhasOnicofagia(true);
				}else {
					exame.setUnhasOnicofagia(false);
				}
				if(unhassujidade != null && !unhassujidade.equals("") && unhassujidade.equals("on")){
					exame.setUnhasSujidade(true);
				}else {
					exame.setUnhasSujidade(false);
				}
				if(unhashipercromia != null && !unhashipercromia.equals("") && unhashipercromia.equals("on")){
					exame.setUnhasHipercromia(true);
				}else {
					exame.setUnhasHipercromia(false);
				}
				if(peloshipertricose != null && !peloshipertricose.equals("") && peloshipertricose.equals("on")){
					exame.setPelosHipertricose(true);
				}else {
					exame.setPelosHipertricose(false);
				}
				if(peloshipotricose != null && !peloshipotricose.equals("") && peloshipotricose.equals("on")){
					exame.setPelosHipotricose(true);
				}else {
					exame.setPelosHipotricose(false);
				}
				if(pelosalopecia != null && !pelosalopecia.equals("") && pelosalopecia.equals("on")){
					exame.setPelosAlopecia(true);
				}else {
					exame.setPelosAlopecia(false);
				}
				
			}
			
			fisico.setExameSistPelesAnexos(exame);
			admissao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistPelesAnexos(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirAdmissao(admissao);
				request.setAttribute("mensagem", "Exame Peles e Anexos salvo com sucesso!");
				request.setAttribute("exame", exame);
			}catch (Exception e) {
				e.printStackTrace();
				ActionMessages errors = new ActionMessages();
				errors.add("AuthenticationException", new ActionMessage("erro.sistema"));
				this.saveErrors(request, errors);
			}
		}else if(atendimento instanceof Evolucao){
			Evolucao evolucao = (Evolucao) atendimento;
			
			ExameFisico fisico = evolucao.getExameFisico();
			if(fisico == null){
				fisico = new ExameFisico();
			}
			ExameSistPelesAnexos exame = fisico.getExameSistPelesAnexos();
			if(exame == null){
				exame = new ExameSistPelesAnexos();
			}
			
			if(semqueixa != null && semqueixa.equals("")){
				exame.setSemQueixas(false);
			}
			if(semqueixa != null && semqueixa.equals("on")){
				exame.setSemQueixas(true);
			}else{
				exame.setColoracaoOutros(coloracaooutros);
				exame.setHidratacaoOutros(hidrataoutros);
				exame.setTugorOutros(turgoroutros);
				exame.setLesoesEdema(edema);
				
				exame.setFeridasOutros(feridasoutros);
				exame.setLesoesOutros(lesoesoutros);
				exame.setUnhasOutros(unhasoutros);
				exame.setPelosOutros(pelosoutros);
				if(turgor != null && !turgor.equals("") && turgor.equals("turgorpreservado")){
					exame.setTugorPreservado(true);
				}else if(turgor != null && !turgor.equals("") && turgor.equals("turgornaopreservado")){
					exame.setTugorNaoPreservado(true);
				}
				if(coloracaopalidez != null && !coloracaopalidez.equals("") && coloracaopalidez.equals("on")){
					exame.setColoracaoPalidez(true);
				}else {
					exame.setColoracaoPalidez(false);
				}
				if(coloracaocianose != null && !coloracaocianose.equals("") && coloracaocianose.equals("on")){
					exame.setColoracaoCianose(true);
				}else {
					exame.setColoracaoCianose(false);
				}
				if(coloracaoictericia != null && !coloracaoictericia.equals("") && coloracaoictericia.equals("on")){
					exame.setColoracaoIctericia(true);
				}else {
					exame.setColoracaoIctericia(false);
				}
				if(coloracaoeritema != null && !coloracaoeritema.equals("") && coloracaoeritema.equals("on")){
					exame.setColoracaoEritema(true);
				}else {
					exame.setColoracaoEritema(false);
				}
				if(coloracaopetequias != null && !coloracaopetequias.equals("") && coloracaopetequias.equals("on")){
					exame.setColoracaoPetequias(true);
				}else {
					exame.setColoracaoPetequias(false);
				}
				if(coloracaoequimoses != null && !coloracaoequimoses.equals("") && coloracaoequimoses.equals("on")){
					exame.setColoracaoEquimoses(true);
				}else {
					exame.setColoracaoEquimoses(false);
				}
				if(coloracaohipocromia != null && !coloracaohipocromia.equals("") && coloracaohipocromia.equals("on")){
					exame.setColoracaoHipocromia(true);
				}else {
					exame.setColoracaoHipocromia(false);
				}
				if(coloracaohipercromia != null && !coloracaohipercromia.equals("") && coloracaohipercromia.equals("on")){
					exame.setColoracaoHipercromia(true);
				}else {
					exame.setColoracaoHipercromia(false);
				}
				if(hidrahidratada != null && !hidrahidratada.equals("") && hidrahidratada.equals("on")){
					exame.setHidratacaoHidratada(true);
				}else {
					exame.setHidratacaoHidratada(false);
				}
				if(hidraxerodermia != null && !hidraxerodermia.equals("") && hidraxerodermia.equals("on")){
					exame.setHidratacaoXerodermia(true);
				}else {
					exame.setHidratacaoXerodermia(false);
				}
				if(hidrahiperdrose != null && !hidrahiperdrose.equals("") && hidrahiperdrose.equals("on")){
					exame.setHidratacaoHiperidrose(true);
				}else {
					exame.setHidratacaoHiperidrose(false);
				}
				if(lesoespapula != null && !lesoespapula.equals("") && lesoespapula.equals("on")){
					exame.setLesoesPapula(true);
				}else {
					exame.setLesoesPapula(false);
				}
				if(lesoesnodulo != null && !lesoesnodulo.equals("") && lesoesnodulo.equals("on")){
					exame.setLesoesNodulo(true);
				}else {
					exame.setLesoesNodulo(false);
				}
				if(lesoestumor != null && !lesoestumor.equals("") && lesoestumor.equals("on")){
					exame.setLesoesTumor(true);
				}else {
					exame.setLesoesTumor(false);
				}
				if(lesoesurticaria != null && !lesoesurticaria.equals("") && lesoesurticaria.equals("on")){
					exame.setLesoesUrticaria(true);
				}else {
					exame.setLesoesUrticaria(false);
				}
				if(lesoesvesicula != null && !lesoesvesicula.equals("") && lesoesvesicula.equals("on")){
					exame.setLesoesVesicula(true);
				}else {
					exame.setLesoesVesicula(false);
				}
				if(lesoesbolha != null && !lesoesbolha.equals("") && lesoesbolha.equals("on")){
					exame.setLesoesBolha(true);
				}else {
					exame.setLesoesBolha(false);
				}
				if(lesoespustula != null && !lesoespustula.equals("") && lesoespustula.equals("on")){
					exame.setLesoesPustula(true);
				}else {
					exame.setLesoesPustula(false);
				}
				if(lesoesabscesso != null && !lesoesabscesso.equals("") && lesoesabscesso.equals("on")){
					exame.setLesoesAbscesso(true);
				}else {
					exame.setLesoesAbscesso(false);
				}
				if(lesoeshematoma != null && !lesoeshematoma.equals("") && lesoeshematoma.equals("on")){
					exame.setLesoesHematoma(true);
				}else {
					exame.setLesoesHematoma(false);
				}
				if(lesoescicatriz != null && !lesoescicatriz.equals("") && lesoescicatriz.equals("on")){
					exame.setLesoesCicatriz(true);
				}else {
					exame.setLesoesCicatriz(false);
				}
				if(lesoesescara != null && !lesoesescara.equals("") && lesoesescara.equals("on")){
					exame.setLesoesEscara(true);
				}else {
					exame.setLesoesEscara(false);
				}
				if(lesoeserosao != null && !lesoeserosao.equals("") && lesoeserosao.equals("on")){
					exame.setLesoesErosao(true);
				}else {
					exame.setLesoesErosao(false);
				}
				if(lesoesfissura != null && !lesoesfissura.equals("") && lesoesfissura.equals("on")){
					exame.setLesoesFissura(true);
				}else {
					exame.setLesoesFissura(false);
				}
				if(lesoesfistula != null && !lesoesfistula.equals("") && lesoesfistula.equals("on")){
					exame.setLesoesFistula(true);
				}else {
					exame.setLesoesFistula(false);
				}
				if(feridascronicas != null && !feridascronicas.equals("") && feridascronicas.equals("on")){
					exame.setFeridasCronica(true);
				}else {
					exame.setFeridasCronica(false);
				}
				if(feridascirurgicas != null && !feridascirurgicas.equals("") && feridascirurgicas.equals("on")){
					exame.setFeridasCirurgica(true);
				}else {
					exame.setFeridasCirurgica(false);
				}
				if(feridastraumaticas != null && !feridastraumaticas.equals("") && feridastraumaticas.equals("on")){
					exame.setFeridasTraumatica(true);
				}else {
					exame.setFeridasTraumatica(false);
				}
				if(feridasinfectadas != null && !feridasinfectadas.equals("") && feridasinfectadas.equals("on")){
					exame.setFeridasInfectada(true);
				}else {
					exame.setFeridasInfectada(false);
				}
				if(feridastecido != null && !feridastecido.equals("") && feridastecido.equals("on")){
					exame.setFeridasTecidoDesvitalizado(true);
				}else {
					exame.setFeridasTecidoDesvitalizado(false);
				}
				if(feridaseptelizadas != null && !feridaseptelizadas.equals("") && feridaseptelizadas.equals("on")){
					exame.setFeridasEpitelizada(true);
				}else {
					exame.setFeridasEpitelizada(false);
				}
				if(feridasgranuladas != null && !feridasgranuladas.equals("") && feridasgranuladas.equals("on")){
					exame.setFeridasGranulada(true);
				}else {
					exame.setFeridasGranulada(false);
				}
				if(unhaspalidez != null && !unhaspalidez.equals("") && unhaspalidez.equals("on")){
					exame.setUnhasPalidez(true);
				}else {
					exame.setUnhasPalidez(false);
				}
				if(unhascianose != null && !unhascianose.equals("") && unhascianose.equals("on")){
					exame.setUnhasCianose(true);
				}else {
					exame.setUnhasCianose(false);
				}
				if(unhasonicofagia != null && !unhasonicofagia.equals("") && unhasonicofagia.equals("on")){
					exame.setUnhasOnicofagia(true);
				}else {
					exame.setUnhasOnicofagia(false);
				}
				if(unhassujidade != null && !unhassujidade.equals("") && unhassujidade.equals("on")){
					exame.setUnhasSujidade(true);
				}else {
					exame.setUnhasSujidade(false);
				}
				if(unhashipercromia != null && !unhashipercromia.equals("") && unhashipercromia.equals("on")){
					exame.setUnhasHipercromia(true);
				}else {
					exame.setUnhasHipercromia(false);
				}
				if(peloshipertricose != null && !peloshipertricose.equals("") && peloshipertricose.equals("on")){
					exame.setPelosHipertricose(true);
				}else {
					exame.setPelosHipertricose(false);
				}
				if(peloshipotricose != null && !peloshipotricose.equals("") && peloshipotricose.equals("on")){
					exame.setPelosHipotricose(true);
				}else {
					exame.setPelosHipotricose(false);
				}
				if(pelosalopecia != null && !pelosalopecia.equals("") && pelosalopecia.equals("on")){
					exame.setPelosAlopecia(true);
				}else {
					exame.setPelosAlopecia(false);
				}
				
			}
			
			fisico.setExameSistPelesAnexos(exame);
			evolucao.setExameFisico(fisico);
			try{
				fachada.inserirExameSistPelesAnexos(exame);
				fachada.inserirExameFisico(fisico);
				fachada.inserirEvolucao(evolucao);
				request.setAttribute("mensagem", "Exame Peles e Anexos salvo com sucesso!");
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
	
}
