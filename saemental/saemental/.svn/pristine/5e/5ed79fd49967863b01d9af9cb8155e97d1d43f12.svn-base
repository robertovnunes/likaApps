package negocios;

import java.util.List;

import model.paciente.prontuario.atendimento.Adendo;
import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Alta;
import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.AvaliacaoProfessor;
import model.paciente.prontuario.atendimento.Evolucao;
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
import model.paciente.prontuario.atendimento.examemental.ExameMental;
import model.paciente.prontuario.atendimento.examemental.ExameMentalGeral;
import model.paciente.prontuario.atendimento.examemental.ExameMentalMiniMental;
import model.paciente.prontuario.atendimento.necessidades.NecessidadesBasicas;
import model.paciente.prontuario.atendimento.queixa.Cid;
import model.paciente.prontuario.atendimento.queixa.Queixa;
import dados.FabricaDAO;
import dados.basicas.AtendimentoDAO;
import dados.basicas.atendimento.AdendoDAO;
import dados.basicas.atendimento.AdmissaoDAO;
import dados.basicas.atendimento.AltaDAO;
import dados.basicas.atendimento.AvaliacaoProfessorDAO;
import dados.basicas.atendimento.EvolucaoDAO;
import dados.basicas.atendimento.antecedentes.AntecedenteFamiliarDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesFamiliaresDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesPessoaisDAO;
import dados.basicas.atendimento.diagnosticointervencoes.CipeDAO;
import dados.basicas.atendimento.diagnosticointervencoes.DiagnosticoDAO;
import dados.basicas.atendimento.diagnosticointervencoes.IntervencoesDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NicDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NocDAO;
import dados.basicas.atendimento.diagnosticointervencoes.ResultadosDAO;
import dados.basicas.atendimento.examefisico.ExameAuditivoDAO;
import dados.basicas.atendimento.examefisico.ExameBocaDAO;
import dados.basicas.atendimento.examefisico.ExameCouroDAO;
import dados.basicas.atendimento.examefisico.ExameFisicoDAO;
import dados.basicas.atendimento.examefisico.ExameMamasDAO;
import dados.basicas.atendimento.examefisico.ExameNarizDAO;
import dados.basicas.atendimento.examefisico.ExameOlhosDAO;
import dados.basicas.atendimento.examefisico.ExamePadraoDAO;
import dados.basicas.atendimento.examefisico.ExamePelesAnexosDAO;
import dados.basicas.atendimento.examefisico.ExamePescocoDAO;
import dados.basicas.atendimento.examefisico.ExameSistCardiovascularDAO;
import dados.basicas.atendimento.examefisico.ExameSistGastroIntestinalDAO;
import dados.basicas.atendimento.examefisico.ExameSistGenitoUrinarioDAO;
import dados.basicas.atendimento.examefisico.ExameSistRespiratorioDAO;
import dados.basicas.atendimento.examemental.ExameMentalDAO;
import dados.basicas.atendimento.examemental.ExameMentalGeralDAO;
import dados.basicas.atendimento.examemental.ExameMentalMiniMentalDAO;
import dados.basicas.atendimento.necessidades.NecessidadesBasicasDAO;
import dados.basicas.atendimento.queixa.QueixaDAO;
import dados.hibernate.FabricaHibernateDAO;

public class AtendimentoNeg {

	private FabricaDAO fabrica;
	public static AtendimentoNeg instancia;
	
	public AtendimentoNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}
	
	public static AtendimentoNeg getInstancia(){
		if(AtendimentoNeg.instancia == null){
			AtendimentoNeg.instancia = new AtendimentoNeg();
		}
		return AtendimentoNeg.instancia;
	}

	/**Atendimento Metodos*/
	public Atendimento inserirAtendimento(Atendimento atendimento) {
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		atendimento = dao.persistir(atendimento);
		return atendimento;
	}
	
	public List<Atendimento> getTodosAtendimentos(int idProntuario){
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		return dao.getTodosAtendimentos(idProntuario);
	}
	
	public Atendimento getPorId(int id) {
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		Atendimento atendimento = dao.getPorId(id, true);
		return atendimento;
	}
	
	public List<Atendimento> getAtendimentosPacientePorConsulta(String tipo, String valor, int idPront) {
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		return dao.getAtendimentosPacientePorConsulta(tipo, valor, idPront);
	}
	
	public Alta inserirAlta(Alta alta){
		AltaDAO dao = this.fabrica.getAltaDAO();
		return dao.persistir(alta);
	}
	
	public Atendimento getUltimoAtendimento(int idProntuario) {
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		return dao.getUltimoAtendimento(idProntuario);
	}
	
	public Admissao getultimoAtendimentoAdmissao(int idProntuario) {
		AtendimentoDAO dao = this.fabrica.getAtendimentoDAO();
		return dao.getultimoAtendimentoAdmissao(idProntuario);
	}
	
	/**Queixa Metodos**/
	public Queixa inserirQueixa(Queixa queixa) {
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		queixa = dao.persistir(queixa);
		return queixa;
	}
	
	public void removerQueixa(Queixa queixa) {
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		dao.remover(queixa);
	}
	
	public List<Cid> getCids(int idQueixa) {
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		return dao.getCids(idQueixa);
	}
	
	public Cid getCidPorId(int idCid){
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		return dao.getCidPorId(idCid);
	}
	
	public List<Cid> pesquisarCid(String valor){
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		return dao.pesquisarCid(valor);
	}
	
	public Cid getCidPorIdentificador(String cid) {
		QueixaDAO dao = this.fabrica.getQueixaDAO();
		return dao.getCidPorIdentificador(cid);
	}
	
	/**Antecedentes Metodos**/
	public Antecedentes inserirAntecedentes(Antecedentes antecedentes) {
		AntecedentesDAO dao = this.fabrica.getAntecedentesDAO();
		antecedentes = dao.persistir(antecedentes);
		return antecedentes;
	}
	
	public void removerAntecedentes(Antecedentes antecedentes) {
		AntecedentesDAO dao = this.fabrica.getAntecedentesDAO();
		dao.remover(antecedentes);
	}
	
	public AntecedentesPessoais inserirAntecedentesPessoais(AntecedentesPessoais antecedentes) {
		AntecedentesPessoaisDAO dao = this.fabrica.getAntecedentesPessoaisDAO();
		antecedentes = dao.persistir(antecedentes);
		return antecedentes;
	}
	
	public void removerAntecedentesPessoais(AntecedentesPessoais antecedentes) {
		AntecedentesPessoaisDAO dao = this.fabrica.getAntecedentesPessoaisDAO();
		dao.remover(antecedentes);
	}
	
	public AntecedentesFamiliares inserirAntecedentesFamiliares(AntecedentesFamiliares antecedentes) {
		AntecedentesFamiliaresDAO dao = this.fabrica.getAntecedentesFamiliaresDAO();
		antecedentes = dao.persistir(antecedentes);
		return antecedentes;
	}
	
	public void removerAntecedentesFamiliares(AntecedentesFamiliares antecedentes) {
		AntecedentesFamiliaresDAO dao = this.fabrica.getAntecedentesFamiliaresDAO();
		dao.remover(antecedentes);
	}
	
	public List<AntecedenteFamiliar> getAntecedentesFamiliarPorIdAntFamiliarPaciente(int idAntFamiliar) {
		AntecedenteFamiliarDAO dao = this.fabrica.getAntecedenteFamiliarDAO();
		List<AntecedenteFamiliar> antecedentes = dao.getAntecedentesFamiliarPorIdAntFamiliarPaciente(idAntFamiliar);
		return antecedentes;
	}
	
	public AntecedenteFamiliar inserirAntecedenteFamiliar(AntecedenteFamiliar antecedente) {
		AntecedenteFamiliarDAO dao = this.fabrica.getAntecedenteFamiliarDAO();
		antecedente = dao.persistir(antecedente);
		return antecedente;
	}
	
	public void removerAntecedenteFamiliar(AntecedenteFamiliar antecedente) {
		AntecedenteFamiliarDAO dao = this.fabrica.getAntecedenteFamiliarDAO();
		dao.remover(antecedente);
	}
	
	public void removerAntecedenteFamiliarPorIdAntFamiliarPaciente(
			int idAntFamiliar) {
		AntecedenteFamiliarDAO dao = this.fabrica.getAntecedenteFamiliarDAO();
		dao.removerAntecedenteFamiliarPorIdAntFamiliarPaciente(idAntFamiliar);
	}
	
	/**Necessidades Básicas Metodos**/
	public NecessidadesBasicas inserirNecessidadesBasicas(NecessidadesBasicas necessidades) {
		NecessidadesBasicasDAO dao = this.fabrica.getNecessidadesBasicasDAO();
		necessidades = dao.persistir(necessidades);
		return necessidades;
	}
	
	public void removerNecessidadesBasicas(NecessidadesBasicas necessidades) {
		NecessidadesBasicasDAO dao = this.fabrica.getNecessidadesBasicasDAO();
		dao.remover(necessidades);
	}
	
	/**Exame Físico Metodos**/
	public ExameFisico inserirExameFisico(ExameFisico exame) {
		ExameFisicoDAO dao = this.fabrica.getExameFisicoDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameFisico(ExameFisico exame) {
		ExameFisicoDAO dao = this.fabrica.getExameFisicoDAO();
		dao.remover(exame);
	}
	
	public ExameAuditivo inserirExameAuditivo(ExameAuditivo exame) {
		ExameAuditivoDAO dao = this.fabrica.getExameAuditivoDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameAuditivo(ExameAuditivo exame) {
		ExameAuditivoDAO dao = this.fabrica.getExameAuditivoDAO();
		dao.remover(exame);
	}
	
	public ExameBoca inserirExameBoca(ExameBoca exame) {
		ExameBocaDAO dao = this.fabrica.getExameBocaDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameBoca(ExameBoca exame) {
		ExameBocaDAO dao = this.fabrica.getExameBocaDAO();
		dao.remover(exame);
	}
	
	public ExameCouroCabeludo inserirExameCouroCabeludo(ExameCouroCabeludo exame) {
		ExameCouroDAO dao = this.fabrica.getExameCouroDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameCouroCabeludo(ExameCouroCabeludo exame) {
		ExameCouroDAO dao = this.fabrica.getExameCouroDAO();
		dao.remover(exame);
	}
	
	public ExameMamas inserirExameMamas(ExameMamas exame) {
		ExameMamasDAO dao = this.fabrica.getExameMamasDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameMamas(ExameMamas exame) {
		ExameMamasDAO dao = this.fabrica.getExameMamasDAO();
		dao.remover(exame);
	}
	
	public ExameNariz inserirExameNariz(ExameNariz exame) {
		ExameNarizDAO dao = this.fabrica.getExameNarizDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameNariz(ExameNariz exame) {
		ExameNarizDAO dao = this.fabrica.getExameNarizDAO();
		dao.remover(exame);
	}
	
	public ExameOlhos inserirExameOlhos(ExameOlhos exame) {
		ExameOlhosDAO dao = this.fabrica.getExameOlhosDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameOlhos(ExameOlhos exame) {
		ExameOlhosDAO dao = this.fabrica.getExameOlhosDAO();
		dao.remover(exame);
	}
	
	public ExamePadrao inserirExamePadrao(ExamePadrao exame) {
		ExamePadraoDAO dao = this.fabrica.getExamePadraoDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExamePadrao(ExamePadrao exame) {
		ExamePadraoDAO dao = this.fabrica.getExamePadraoDAO();
		dao.remover(exame);
	}
	
	public ExamePescoco inserirExamePescoco(ExamePescoco exame) {
		ExamePescocoDAO dao = this.fabrica.getExamePescocoDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExamePescoco(ExamePescoco exame) {
		ExamePescocoDAO dao = this.fabrica.getExamePescocoDAO();
		dao.remover(exame);
	}
	
	public ExameSistCardiovascular inserirExameSistCardiovascular(ExameSistCardiovascular exame) {
		ExameSistCardiovascularDAO dao = this.fabrica.getExameSistCardiovascularDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameSistCardiovascular(ExameSistCardiovascular exame) {
		ExameSistCardiovascularDAO dao = this.fabrica.getExameSistCardiovascularDAO();
		dao.remover(exame);
	}
	
	public ExameSistGastroIntestinal inserirExameSistGrastroIntestinal(ExameSistGastroIntestinal exame) {
		ExameSistGastroIntestinalDAO dao = this.fabrica.getExameSistGastroIntestinalDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameSistGastroIntestinal(ExameSistGastroIntestinal exame) {
		ExameSistGastroIntestinalDAO dao = this.fabrica.getExameSistGastroIntestinalDAO();
		dao.remover(exame);
	}
	
	public ExameSistGenitoUrinario inserirExameSistGenitoUrinario(ExameSistGenitoUrinario exame) {
		ExameSistGenitoUrinarioDAO dao = this.fabrica.getExameSistGenitoUrinarioDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameSistGenitoUrinario(ExameSistGenitoUrinario exame) {
		ExameSistGenitoUrinarioDAO dao = this.fabrica.getExameSistGenitoUrinarioDAO();
		dao.remover(exame);
	}
	
	public ExameSistRespiratorio inserirExameSistRespiratorio(ExameSistRespiratorio exame) {
		ExameSistRespiratorioDAO dao = this.fabrica.getExameSistRespiratorioDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameSistRespiratorio(ExameSistRespiratorio exame) {
		ExameSistRespiratorioDAO dao = this.fabrica.getExameSistRespiratorioDAO();
		dao.remover(exame);
	}
	
	public ExameSistPelesAnexos inserirExameSistPelesAnexos(ExameSistPelesAnexos exame) {
		ExamePelesAnexosDAO dao = this.fabrica.getExamePelesAnexosDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameSistPelesAnexos(ExameSistPelesAnexos exame) {
		ExamePelesAnexosDAO dao = this.fabrica.getExamePelesAnexosDAO();
		dao.remover(exame);
	}
	
	/**Exame Mental Metodos**/
	public ExameMental inserirExameMental(ExameMental exame) {
		ExameMentalDAO dao = this.fabrica.getExameMentalDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameMental(ExameMental exame) {
		ExameMentalDAO dao = this.fabrica.getExameMentalDAO();
		dao.remover(exame);
	}
	
	public ExameMentalGeral inserirExameMentalGeral(ExameMentalGeral exame) {
		ExameMentalGeralDAO dao = this.fabrica.getExameMentalGeralDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameMentalGeral(ExameMentalGeral exame) {
		ExameMentalGeralDAO dao = this.fabrica.getExameMentalGeralDAO();
		dao.remover(exame);
	}
	
	public ExameMentalMiniMental inserirExameMentalMiniMental(ExameMentalMiniMental exame) {
		ExameMentalMiniMentalDAO dao = this.fabrica.getExameMentalMiniMentalDAO();
		exame = dao.persistir(exame);
		return exame;
	}
	
	public void removerExameMentalMiniMental(ExameMentalMiniMental exame) {
		ExameMentalMiniMentalDAO dao = this.fabrica.getExameMentalMiniMentalDAO();
		dao.remover(exame);
	}
	
	/**Admissao Metodos**/
	public Admissao inserirAdmissao(Admissao admissao) {
		AdmissaoDAO dao = this.fabrica.getAdmissaoDAO();
		admissao = dao.persistir(admissao);
		return admissao;
	}
	
	public Admissao getAdmissaoPorId(int id) {
		AdmissaoDAO dao = this.fabrica.getAdmissaoDAO();
		Admissao atendimento = dao.getPorId(id, true);
		return atendimento;
	}
	
	public Admissao atualizarAdmissa(Admissao admissao) {
		AdmissaoDAO dao = this.fabrica.getAdmissaoDAO();
		dao.persistir(admissao);
		return admissao;
	}
	
	/**Evolucao Metodos**/
	public Evolucao inserirEvolucao(Evolucao evolucao) {
		EvolucaoDAO dao = this.fabrica.getEvolucaoDAO();
		evolucao = dao.persistir(evolucao);
		return evolucao;
	}
	
	public Evolucao getEvolucaoPorId(int id) {
		EvolucaoDAO dao = this.fabrica.getEvolucaoDAO();
		Evolucao atendimento = dao.getPorId(id, true);
		return atendimento;
	}
	
	/**Métodos Diagnósticos Intervenções*/
	public List<Cipe> listarCipe(String valor){
		CipeDAO dao = this.fabrica.getCipeDAO();
		return dao.listarCipe(valor);
	}
	
	public Cipe getCipePorId(int id){
		CipeDAO dao = this.fabrica.getCipeDAO();
		return dao.getPorId(id, true);
	}
	
	public List<Nic> listarNic(String valor){
		NicDAO dao = this.fabrica.getNicDAO();
		return dao.listarNic(valor);
	}
	
	public List<Noc> listarNoc(String valor){
		NocDAO dao = this.fabrica.getNocDAO();
		return dao.listarNoc(valor);
	}
	
	public Nic getNicPorId(int id){
		NicDAO dao = this.fabrica.getNicDAO();
		return dao.getPorId(id, true);
	}
	
	public Noc getNocPorId(int id){
		NocDAO dao = this.fabrica.getNocDAO();
		return dao.getPorId(id, true);
	}
	
	public Diagnostico inserirDiagnostico(Diagnostico diagnostico){
		DiagnosticoDAO dao = this.fabrica.getDiagnosticoDAO();
		return dao.persistir(diagnostico);
	}
	
	public Intervencoes inserirIntervencao(Intervencoes intervencoes){
		IntervencoesDAO dao = this.fabrica.getIntervencoesDAO();
		return dao.persistir(intervencoes);
	}
	
	public Resultados inserirResultados(Resultados resultados){
		ResultadosDAO dao = this.fabrica.getResultadosDAO();
		return dao.persistir(resultados);
	}
	
	public List<Diagnostico> listarDiagnosticosAtendimento(Atendimento atendimento){
		DiagnosticoDAO dao = this.fabrica.getDiagnosticoDAO();
		return dao.listarDiagnosticosAtendimento(atendimento);
	}
	
	public List<Intervencoes> listarIntervencoesDiagnostico(Diagnostico diagnostico){
		IntervencoesDAO dao = this.fabrica.getIntervencoesDAO();
		return dao.listarIntervencoesDiagnostico(diagnostico);
	}
	
	public List<Resultados> listarResultadosDiagnostico(Diagnostico diagnostico){
		ResultadosDAO dao = this.fabrica.getResultadosDAO();
		return dao.listarResultadosDiagnostico(diagnostico);
	}
	
	public Diagnostico getDiagnosticoPorId(int id){
		DiagnosticoDAO dao = this.fabrica.getDiagnosticoDAO();
		return dao.getPorId(id, true);
	}
	
	public void removerIntervencao(Intervencoes intervencoes){
		IntervencoesDAO dao = this.fabrica.getIntervencoesDAO();
		dao.remover(intervencoes);
	}
	
	public void removerResultados(Resultados resultados){
		ResultadosDAO dao = this.fabrica.getResultadosDAO();
		dao.remover(resultados);
	}
	
	/**Métodos Adendo*/
	public void inserirAdendo(Adendo adendo){
		AdendoDAO dao = this.fabrica.getAdendoDAO();
		dao.persistir(adendo);
	}
	
	public List<Adendo> getAdendosAtendimento(Atendimento atendimento){
		AdendoDAO dao = this.fabrica.getAdendoDAO();
		return dao.getAdendosAtendimento(atendimento);
	}
	
	public List<Adendo> getAdendosPorConsulta(String tipo, String valor, Atendimento atendimento){
		AdendoDAO dao = this.fabrica.getAdendoDAO();
		return dao.getAdendosPorConsulta(tipo, valor, atendimento);
	}
	
	public Adendo getAdendoPorId(String id) {
		AdendoDAO dao = this.fabrica.getAdendoDAO();
		return dao.getAdendoPorId(id);
	}
	
	/**Métodos Avaliacoes Professor*/
	public void inserirAvaliacaoProfessor(AvaliacaoProfessor avaliacao){
		AvaliacaoProfessorDAO dao = this.fabrica.getAvaliacaoProfessorDAO();
		dao.persistir(avaliacao);
	}
	
	public List<AvaliacaoProfessor> getAvaliacaoProfessorAtendimento(Atendimento atendimento){
		AvaliacaoProfessorDAO dao = this.fabrica.getAvaliacaoProfessorDAO();
		return dao.getAvaliacaoProfessorAtendimento(atendimento);
	}
	
	public List<AvaliacaoProfessor> getAvaliacaoProfessorPorConsulta(String tipo, String valor, Atendimento atendimento){
		AvaliacaoProfessorDAO dao = this.fabrica.getAvaliacaoProfessorDAO();
		return dao.getAvaliacaoProfessorPorConsulta(tipo, valor, atendimento);
	}
	
	public AvaliacaoProfessor getAvaliacaoProfessorPorId(String id) {
		AvaliacaoProfessorDAO dao = this.fabrica.getAvaliacaoProfessorDAO();
		return dao.getAvaliacaoProfessorPorId(id);
	}
	
}
