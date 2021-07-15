package fachada;

import java.util.List;

import model.paciente.Paciente;
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
import model.sistema.Erro;
import model.usuario.Aluno;
import model.usuario.Enfermeiro;
import model.usuario.Professor;
import model.usuario.Usuario;
import negocios.AlunoNeg;
import negocios.AtendimentoNeg;
import negocios.EnfermeiroNeg;
import negocios.ErroNeg;
import negocios.PacienteNeg;
import negocios.ProfessorNeg;
import negocios.UsuarioNeg;
import dados.hibernate.HibernateUtil;


public class Fachada {
	
	private static Fachada instancia;
	private final UsuarioNeg usuarioNeg;
	private final AlunoNeg alunoNeg;
	private final ProfessorNeg professorNeg;
	private final EnfermeiroNeg enfermeiroNeg;
	private final PacienteNeg pacienteNeg;
	private final AtendimentoNeg atendimentoNeg;
	private final ErroNeg erroNeg;
	
	public Fachada() {
		usuarioNeg = UsuarioNeg.getInstancia();
		alunoNeg = AlunoNeg.getInstancia();
		professorNeg = ProfessorNeg.getInstancia();
		pacienteNeg = PacienteNeg.getInstancia();
		enfermeiroNeg = EnfermeiroNeg.getInstancia();
		atendimentoNeg = AtendimentoNeg.getInstancia();
		erroNeg = ErroNeg.getInstancia();
	}
	
	public static Fachada getInstancia(){
 		if(Fachada.instancia == null){
 			Fachada.instancia = new Fachada();
		}
		return Fachada.instancia;
	}
	
	public void atualizar(){
		HibernateUtil.getFabricaDeSessao().getCurrentSession().flush();
	}
	
	/** Métodos ErroNeg	 */
	public void reportarBug(Erro erro){
		this.erroNeg.reportarBug(erro);
	}
	
	/** Métodos UsuarioNeg	 */
	public Object autenticar(String login){
		return this.usuarioNeg.getUsuario(login);
	}
	
	public List<Usuario> getTodosUsuarios(){
		return this.usuarioNeg.getTodos();
	}
	
	public List<Usuario> getUsuariosPorConsulta(String tipo, String valor){
		return this.usuarioNeg.getPorConsulta(tipo, valor);
	}
	
	public Usuario getPorId(int id){
		return this.usuarioNeg.getPorId(id);
	}
	
	public void saveOrUpdateUsuario(Usuario usuario){
		this.usuarioNeg.saveOrUpdateUsuario(usuario);
	}
	
	/** Métodos AlunosNeg	 */
	public Aluno criarUsuarioAluno(Aluno aluno) {
		return this.alunoNeg.criarUsuarioAluno(aluno);
	}
	
	public void removerAluno(Aluno aluno) {
		this.alunoNeg.removerAluno(aluno);
	}
	
	public Aluno buscarAlunoPorId(int id, boolean lock){
		return this.alunoNeg.buscarPorId(id, lock);
	}
	
	public List<Aluno> getTodosAlunos(){
		return this.alunoNeg.getTodos();
	}
	
	/** Métodos EnfermeiroNeg	 */
	public Enfermeiro criarUsuarioEnfermeiro(Enfermeiro enfer) {
		return this.enfermeiroNeg.criarUsuarioEnfermeiro(enfer);
	}
	
	public void removerEnfermeiro(Enfermeiro enfermeiro) {
		this.enfermeiroNeg.removerEnfermeiro(enfermeiro);
	}
	
	public Enfermeiro buscarEnfermeiroPorId(int id, boolean lock){
		return this.enfermeiroNeg.buscarPorId(id, lock);
	}
	
	public List<Enfermeiro> getTodosEnfermeiros(){
		return this.enfermeiroNeg.getTodos();
	}
	
	/** Métodos ProfessorNeg	 */
	public Professor criarUsuarioProfessor(Professor professor) {
		return this.professorNeg.criarUsuarioProfessor(professor);
	}
	
	public void removerProfessor(Professor professor) {
		this.professorNeg.removerProfessor(professor);
	}
	
	public Professor buscarProfessorPorId(int id, boolean lock){
		return this.professorNeg.buscarPorId(id, lock);
	}
	
	public List<Professor> getTodosProfessores(){
		return this.professorNeg.getTodos();
	}
	
	public List<Paciente> getPacientesPorConsulta(String tipo, String valor) {
		return this.pacienteNeg.getPacientesPorConsulta(tipo, valor);
	}
	
	public List<Paciente> getPacientesDoUsuarioPorConsulta(String tipo, String valor, Usuario usuario) {
		return this.pacienteNeg.getPacientesDoUsuarioPorConsulta(tipo, valor, usuario);
	}
	
	/** Métodos PacienteNeg	 */
	public Paciente inserirPaciente(Paciente paciente){
 		return this.pacienteNeg.inserirPaciente(paciente);
	}
	
	public void removerPaciente(Paciente paciente) {
		this.pacienteNeg.removerPaciente(paciente);
	}
	
	public Paciente buscarPacientePorId(int id, boolean lock){
		return this.pacienteNeg.buscarPorId(id, lock);
	}
	
	public List<Paciente> getTodosPacientes(){
		return this.pacienteNeg.getTodos();
	}
	
	public List<Paciente> getPacientesDoUsuario(Usuario usuario) {
		return this.pacienteNeg.getPacientesDoUsuario(usuario);
	}
	
	/** Métodos AtendimentoNeg	 */
	public List<Atendimento> getTodosAtendimentos(int idProntuario){
		return this.atendimentoNeg.getTodosAtendimentos(idProntuario);
	}
	
	public Atendimento getAtendimentoPorId(int id) {
		return this.atendimentoNeg.getPorId(id);
	}
	
	public Atendimento inserirAtendimento(Atendimento atendimento){
		return this.atendimentoNeg.inserirAtendimento(atendimento);
	}
	
	public List<Atendimento> getAtendimentosPacientePorConsulta(String tipo, String valor, int idPront)  {
		return this.atendimentoNeg.getAtendimentosPacientePorConsulta(tipo, valor, idPront);
	}
	
	public Alta inserirAlta(Alta alta){
		return this.atendimentoNeg.inserirAlta(alta);
	}
	
	public Atendimento getUltimoAtendimento(int idProntuario) {
		return this.atendimentoNeg.getUltimoAtendimento(idProntuario);
	}
	
	public Admissao getultimoAtendimentoAdmissao(int idProntuario) {
		return this.atendimentoNeg.getultimoAtendimentoAdmissao(idProntuario);
	}
	
	
	/**Métodos Queixa*/
	public Queixa inserirQueixa(Queixa queixa){
		return this.atendimentoNeg.inserirQueixa(queixa);
	}
	
	public void removerQueixa(Queixa queixa){
		this.atendimentoNeg.removerQueixa(queixa);
	}
	
	public List<Cid> getCidsQueixa(int idQueixa) {
		return this.atendimentoNeg.getCids(idQueixa);
	}
	
	public Cid getCidPorId(int idCid){
		return this.atendimentoNeg.getCidPorId(idCid);
	}
	
	public List<Cid> pesquisarCid(String valor){
		return this.atendimentoNeg.pesquisarCid(valor);
	}
	
	public Cid getCidPorIdentificador(String cid) {
		return this.atendimentoNeg.getCidPorIdentificador(cid);
	}
	
	/**Métodos Antecedentes*/
	public Antecedentes inserirAntecedentes(Antecedentes antecedentes){
		return this.atendimentoNeg.inserirAntecedentes(antecedentes);
	}
	
	public void removerAntecedentes(Antecedentes antecedentes){
		this.atendimentoNeg.removerAntecedentes(antecedentes);
	}
	
	public AntecedentesPessoais inserirAntecedentesPessoais(AntecedentesPessoais antecedentes){
		return this.atendimentoNeg.inserirAntecedentesPessoais(antecedentes);
	}
	
	public void removerAntecedentesPessoais(AntecedentesPessoais antecedentes){
		this.atendimentoNeg.removerAntecedentesPessoais(antecedentes);
	}
	
	public AntecedentesFamiliares inserirAntecedentesFamiliares(AntecedentesFamiliares antecedentes) {
		return this.atendimentoNeg.inserirAntecedentesFamiliares(antecedentes);
	}
	
	public void removerAntecedentesFamiliares(AntecedentesFamiliares antecedentes) {
		this.atendimentoNeg.removerAntecedentesFamiliares(antecedentes);
	}
	
	public AntecedenteFamiliar inserirAntecedenteFamiliar(AntecedenteFamiliar antecedente) {
		return this.atendimentoNeg.inserirAntecedenteFamiliar(antecedente);
	}
	
	public void removerAntecedenteFamiliar(AntecedenteFamiliar antecedente) {
		this.atendimentoNeg.removerAntecedenteFamiliar(antecedente);
	}
	
	public List<AntecedenteFamiliar> pesquisarAntecedentesFamiliarPorIdAntFamiliarPaciente(int idAntFamiliar) {
		return this.atendimentoNeg.getAntecedentesFamiliarPorIdAntFamiliarPaciente(idAntFamiliar);
	}
	
	public void removerAntecedenteFamiliarPorIdAntFamiliarPaciente(int idAntFamiliar) {
		this.atendimentoNeg.removerAntecedenteFamiliarPorIdAntFamiliarPaciente(idAntFamiliar);
	}
	
	/**Necessidades Básicas Metodos**/
	public NecessidadesBasicas inserirNecessidadesBasicas(NecessidadesBasicas necessidades) {
		return this.atendimentoNeg.inserirNecessidadesBasicas(necessidades);
	}
	
	public void removerNecessidadesBasicas(NecessidadesBasicas necessidades) {
		this.atendimentoNeg.removerNecessidadesBasicas(necessidades);
	}
	
	/**Exame Físico Metodos**/
	public ExameFisico inserirExameFisico(ExameFisico exame) {
		return this.atendimentoNeg.inserirExameFisico(exame);
	}
	
	public void removerExameFisico(ExameFisico exame) {
		this.atendimentoNeg.removerExameFisico(exame);
	}
	
	public ExameAuditivo inserirExameAuditivo(ExameAuditivo exame) {
		return this.atendimentoNeg.inserirExameAuditivo(exame);
	}
	
	public void removerExameAuditivo(ExameAuditivo exame) {
		this.atendimentoNeg.removerExameAuditivo(exame);
	}
	
	public ExameBoca inserirExameBoca(ExameBoca exame) {
		return this.atendimentoNeg.inserirExameBoca(exame);
	}
	
	public void removerExameBoca(ExameBoca exame) {
		this.atendimentoNeg.removerExameBoca(exame);
	}
	
	public ExameCouroCabeludo inserirExameCouroCabeludo(ExameCouroCabeludo exame) {
		return this.atendimentoNeg.inserirExameCouroCabeludo(exame);
	}
	
	public void removerExameCouroCabeludo(ExameCouroCabeludo exame) {
		this.atendimentoNeg.removerExameCouroCabeludo(exame);
	}
	
	public ExameMamas inserirExameMamas(ExameMamas exame) {
		return this.atendimentoNeg.inserirExameMamas(exame);
	}
	
	public void removerExameMamas(ExameMamas exame) {
		this.atendimentoNeg.removerExameMamas(exame);
	}
	
	public ExameNariz inserirExameNariz(ExameNariz exame) {
		return this.atendimentoNeg.inserirExameNariz(exame);
	}
	
	public void removerExameNariz(ExameNariz exame) {
		this.atendimentoNeg.removerExameNariz(exame);
	}
	
	public ExameOlhos inserirExameOlhos(ExameOlhos exame) {
		return this.atendimentoNeg.inserirExameOlhos(exame);
	}
	
	public void removerExameOlhos(ExameOlhos exame) {
		this.atendimentoNeg.removerExameOlhos(exame);
	}
	
	public ExamePadrao inserirExamePadrao(ExamePadrao exame) {
		return this.atendimentoNeg.inserirExamePadrao(exame);
	}
	
	public void removerExamePadrao(ExamePadrao exame) {
		this.atendimentoNeg.removerExamePadrao(exame);
	}
	
	public ExamePescoco inserirExamePescoco(ExamePescoco exame) {
		return this.atendimentoNeg.inserirExamePescoco(exame);
	}
	
	public void removerExamePescoco(ExamePescoco exame) {
		this.atendimentoNeg.removerExamePescoco(exame);
	}
	
	public ExameSistCardiovascular inserirExameSistCardiovascular(ExameSistCardiovascular exame) {
		return this.atendimentoNeg.inserirExameSistCardiovascular(exame);
	}
	
	public void removerExameSistCardiovascular(ExameSistCardiovascular exame) {
		this.atendimentoNeg.removerExameSistCardiovascular(exame);
	}
	
	public ExameSistGastroIntestinal inserirExameSistGrastroIntestinal(ExameSistGastroIntestinal exame) {
		return this.atendimentoNeg.inserirExameSistGrastroIntestinal(exame);
	}
	
	public void removerExameSistGastroIntestinal(ExameSistGastroIntestinal exame) {
		this.atendimentoNeg.removerExameSistGastroIntestinal(exame);
	}
	
	public ExameSistGenitoUrinario inserirExameSistGenitoUrinario(ExameSistGenitoUrinario exame) {
		return this.atendimentoNeg.inserirExameSistGenitoUrinario(exame);
	}
	
	public void removerExameSistGenitoUrinario(ExameSistGenitoUrinario exame) {
		this.atendimentoNeg.removerExameSistGenitoUrinario(exame);
	}
	
	public ExameSistRespiratorio inserirExameSistRespiratorio(ExameSistRespiratorio exame) {
		return this.atendimentoNeg.inserirExameSistRespiratorio(exame);
	}
	
	public void removerExameSistRespiratorio(ExameSistRespiratorio exame) {
		this.atendimentoNeg.removerExameSistRespiratorio(exame);
	}
	
	public ExameSistPelesAnexos inserirExameSistPelesAnexos(ExameSistPelesAnexos exame) {
		return this.atendimentoNeg.inserirExameSistPelesAnexos(exame);
	}
	
	public void removerExameSistPelesAnexos(ExameSistPelesAnexos exame) {
		this.atendimentoNeg.removerExameSistPelesAnexos(exame);
	}
	
	/**Exame Mental Metodos**/
	public ExameMental inserirExameMental(ExameMental exame) {
		return this.atendimentoNeg.inserirExameMental(exame);
	}
	
	public void removerExameMental(ExameMental exame) {
		this.atendimentoNeg.removerExameMental(exame);
	}
	
	public ExameMentalGeral inserirExameMentalGeral(ExameMentalGeral exame) {
		return this.atendimentoNeg.inserirExameMentalGeral(exame);
	}
	
	public void removerExameMentalGeral(ExameMentalGeral exame) {
		this.atendimentoNeg.removerExameMentalGeral(exame);
	}
	
	public ExameMentalMiniMental inserirExameMentalMiniMental(ExameMentalMiniMental exame) {
		return this.atendimentoNeg.inserirExameMentalMiniMental(exame);
	}
	
	public void removerExameMentalMiniMental(ExameMentalMiniMental exame) {
		this.atendimentoNeg.removerExameMentalMiniMental(exame);
	}
	
	
	/**Métodos Admissao*/
	public Admissao inserirAdmissao(Admissao admissao){
		return this.atendimentoNeg.inserirAdmissao(admissao);
	}
	
	public Admissao getAdmissaoPorId(int id) {
		return this.atendimentoNeg.getAdmissaoPorId(id);
	}
	
	/**Métodos Evolucao*/
	public Evolucao inserirEvolucao(Evolucao evolucao){
		return this.atendimentoNeg.inserirEvolucao(evolucao);
	}
	
	public Evolucao getEvolucaoPorId(int id) {
		return this.atendimentoNeg.getEvolucaoPorId(id);
	}
	
	/**Métodos Diagnósticos Intervenções*/
	public List<Cipe> listarCipe(String valor){
		return this.atendimentoNeg.listarCipe(valor);
	}

	public Cipe getCipePorId(int id){
		return this.atendimentoNeg.getCipePorId(id);
	}
	
	public List<Nic> listarNic(String valor){
		return this.atendimentoNeg.listarNic(valor);
	}
	
	public List<Noc> listarNoc(String valor){
		return this.atendimentoNeg.listarNoc(valor);
	}
	
	public Nic getNicPorId(int id){
		return this.atendimentoNeg.getNicPorId(id);
	}
	
	public Noc getNocPorId(int id){
		return this.atendimentoNeg.getNocPorId(id);
	}
	
	public Diagnostico inserirDiagnostico(Diagnostico diagnostico){
		return this.atendimentoNeg.inserirDiagnostico(diagnostico);
	}
	
	public Intervencoes inserirIntervencao(Intervencoes intervencoes){
		return this.atendimentoNeg.inserirIntervencao(intervencoes);
	}
	
	public Resultados inserirResultados(Resultados resultados){
		return this.atendimentoNeg.inserirResultados(resultados);
	}
	
	public List<Diagnostico> listarDiagnosticosAtendimento(Atendimento atendimento){
		return this.atendimentoNeg.listarDiagnosticosAtendimento(atendimento);
	}
	
	public List<Intervencoes> listarIntervencoesDiagnostico(Diagnostico diagnostico){
		return this.atendimentoNeg.listarIntervencoesDiagnostico(diagnostico);
	}
	
	public List<Resultados> listarResultadosDiagnostico(Diagnostico diagnostico){
		return this.atendimentoNeg.listarResultadosDiagnostico(diagnostico);
	}
	
	public Diagnostico getDiagnosticoPorId(int id){
		return this.atendimentoNeg.getDiagnosticoPorId(id);
	}
	
	public void removerIntervencao(Intervencoes intervencoes){
		this.atendimentoNeg.removerIntervencao(intervencoes);
	}
	
	public void removerResultados(Resultados resultados){
		this.atendimentoNeg.removerResultados(resultados);
	}
	
	public void inserirAdendo(Adendo adendo){
		this.atendimentoNeg.inserirAdendo(adendo);
	}
	
	public List<Adendo> getAdendosAtendimento(Atendimento atendimento){
		return this.atendimentoNeg.getAdendosAtendimento(atendimento);
	}
	
	public List<Adendo> getAdendosPorConsulta(String tipo, String valor, Atendimento atendimento){
		return this.atendimentoNeg.getAdendosPorConsulta(tipo, valor, atendimento);
	}
	
	public AvaliacaoProfessor getAvaliacaoProfessorPorId(String id) {
		return this.atendimentoNeg.getAvaliacaoProfessorPorId(id);
	}
	
	public Adendo getAdendoPorId(String id) {
		return this.atendimentoNeg.getAdendoPorId(id);
	}
	
	public void inserirAvaliacaoProfessor(AvaliacaoProfessor avaliacao){
		this.atendimentoNeg.inserirAvaliacaoProfessor(avaliacao);
	}
	
	public List<AvaliacaoProfessor> getAvaliacaoProfessorAtendimento(Atendimento atendimento){
		return this.atendimentoNeg.getAvaliacaoProfessorAtendimento(atendimento);
	}
	
	public List<AvaliacaoProfessor> getAvaliacaoProfessorPorConsulta(String tipo, String valor, Atendimento atendimento){
		return this.atendimentoNeg.getAvaliacaoProfessorPorConsulta(tipo, valor, atendimento);
	}
	
}
