package fachada;

import java.util.List;

import dados.hibernate.HibernateUtil;
import model.Nanda;
import model.Nic;
import model.Noc;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.curso.matricula.AvaliacaoProfessor;
import model.curso.matricula.MatriculaCursoAluno;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;
import model.curso.matricula.arcomaguerez.Avaliacao;
import model.curso.matricula.arcomaguerez.DiagnosticosImplementacoes;
import model.curso.matricula.arcomaguerez.DiagnosticosResultados;
import model.curso.matricula.arcomaguerez.HyperLink;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.curso.matricula.arcomaguerez.Planejamento;
import model.curso.matricula.arcomaguerez.ResultadosEsperados;
import model.sistema.Arquivo;
import model.sistema.Erro;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;
import model.usuario.Usuario;
import negocios.AdministradorNeg;
import negocios.AlunoNeg;
import negocios.ArcoMaguerezEstudoDeCasoNeg;
import negocios.ArquivoNeg;
import negocios.AvaliacaoNeg;
import negocios.AvaliacaoProfessorNeg;
import negocios.CursoNeg;
import negocios.DiagnosticosImplementacoesNeg;
import negocios.DiagnosticosResultadosNeg;
import negocios.ErroNeg;
import negocios.EstudoDeCasoNeg;
import negocios.HyperLinkNeg;
import negocios.ImplementacaoNeg;
import negocios.MatriculaNeg;
import negocios.NandaNeg;
import negocios.NicNeg;
import negocios.NocNeg;
import negocios.PlanejamentoNeg;
import negocios.ProfessorNeg;
import negocios.ResultadosEsperadosNeg;
import negocios.UsuarioNeg;


public class Fachada {
	
	private static Fachada instancia;
	private final UsuarioNeg usuarioNeg;
	private final AlunoNeg alunoNeg;
	private final ProfessorNeg professorNeg;
	private final AdministradorNeg adminNeg;
	private final ErroNeg erroNeg;
	private final CursoNeg cursoNeg;
	private final MatriculaNeg matriculaNeg;
	private final ArcoMaguerezEstudoDeCasoNeg arcoMaguerezNeg;
	private final EstudoDeCasoNeg estudoDeCasoNeg;
	private final ArquivoNeg arquivoNeg;
	private final HyperLinkNeg hyperlinkNeg;
	private final AvaliacaoNeg avaliacaoNeg;
	private final AvaliacaoProfessorNeg avaliacaoProfessorNeg;
	private final DiagnosticosImplementacoesNeg diagnosticosImplementacoesNeg;
	private final DiagnosticosResultadosNeg diagnosticosResultadosNeg;
	private final ImplementacaoNeg implementacaoNeg;
	private final NandaNeg nandaNeg;
	private final NocNeg nocNeg;
	private final NicNeg nicNeg;
	private final PlanejamentoNeg planejamentoNeg;
	private final ResultadosEsperadosNeg resultadosEsperadosNeg;
	
	public Fachada() {
		usuarioNeg = UsuarioNeg.getInstancia();
		alunoNeg = AlunoNeg.getInstancia();
		professorNeg = ProfessorNeg.getInstancia();
		adminNeg = AdministradorNeg.getInstancia();
		erroNeg = ErroNeg.getInstancia();
		cursoNeg = CursoNeg.getInstancia();
		matriculaNeg = MatriculaNeg.getInstancia();
		arcoMaguerezNeg = ArcoMaguerezEstudoDeCasoNeg.getInstancia();
		arquivoNeg = ArquivoNeg.getInstancia();
		avaliacaoNeg = AvaliacaoNeg.getInstancia();
		avaliacaoProfessorNeg = AvaliacaoProfessorNeg.getInstancia();
		diagnosticosImplementacoesNeg = DiagnosticosImplementacoesNeg.getInstancia();
		diagnosticosResultadosNeg = DiagnosticosResultadosNeg.getInstancia();
		implementacaoNeg =ImplementacaoNeg.getInstancia();
		nandaNeg = NandaNeg.getInstancia();
		nicNeg = NicNeg.getInstancia();
		nocNeg = NocNeg.getInstancia();
		planejamentoNeg = PlanejamentoNeg.getInstancia();
		resultadosEsperadosNeg = ResultadosEsperadosNeg.getInstancia();
		estudoDeCasoNeg = EstudoDeCasoNeg.getInstancia();
		hyperlinkNeg = HyperLinkNeg.getInstancia();
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
	
	public void limparSessaoHibernate(){
		HibernateUtil.getFabricaDeSessao().getCurrentSession().clear();
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
	
	public Usuario getUsuarioPorId(int id){
		return this.usuarioNeg.getPorId(id);
	}
	
	public void saveOrUpdateUsuario(Usuario usuario){
		this.usuarioNeg.saveOrUpdateUsuario(usuario);
	}
	
	public Usuario updateUsuario(Usuario usuario){
		return this.usuarioNeg.updateEntidade(usuario);
	}
	
	public void removerUsuario(Usuario usuario){
		this.usuarioNeg.remover(usuario);
	}
	
	/** Métodos AlunosNeg	 */
	public Aluno criarUsuarioAluno(Aluno aluno) {
		return this.alunoNeg.criarUsuarioAluno(aluno);
	}
	
	public Aluno updateAluno(Aluno aluno) {
		return this.alunoNeg.updateEntidade(aluno);
	}
	
	public void removerAluno(Aluno aluno) {
		this.alunoNeg.remover(aluno);
	}
	
	public Aluno buscarAlunoPorId(int id, boolean lock){
		return this.alunoNeg.getPorId(id);
	}
	
	public List<Aluno> getTodosAlunos(){
		return this.alunoNeg.getTodos();
	}
	
	public void matricularAlunoCursos(Aluno aluno, List<Curso> cursos){
		this.alunoNeg.matricularAlunoCursos(aluno, cursos);
	}
	
	
	/** Métodos AdministradorNeg	 */
	public Administrador criarUsuarioAdministrador(Administrador admin) {
		return this.adminNeg.criarUsuarioAdministrador(admin);
	}
	
	public void removerAdministrador(Administrador admin) {
		this.adminNeg.remover(admin);
	}
	
	public Administrador buscarAdministradorPorId(int id, boolean lock){
		return this.adminNeg.getPorId(id);
	}
	
	public List<Administrador> getTodosAdministradores(){
		return this.adminNeg.getTodos();
	}
	
	public Nanda cadastrarNanda(Nanda nanda){
		return cursoNeg.cadastrarNanda(nanda);
	}
	
	public void removerNanda(Nanda nanda){
		cursoNeg.removerNanda(nanda);
	}
	
	public Nanda editarNanda(Nanda nanda){
		return cursoNeg.editarNanda(nanda);
	}
	
	/** Métodos ProfessorNeg	 */
	public Professor criarUsuarioProfessor(Professor professor) {
		return this.professorNeg.criarUsuarioProfessor(professor);
	}
	
	public void removerProfessor(Professor professor) {
		this.professorNeg.remover(professor);
	}
	
	public Professor buscarProfessorPorId(int id, boolean lock){
		return this.professorNeg.getPorId(id);
	}
	
	public List<Professor> getTodosProfessores(){
		return this.professorNeg.getTodos();
	}
	
	public List<Professor> getProfessoresPorConsula(String tipo, String valor){
		return this.professorNeg.getPorConsulta(tipo, valor);
	}
	
	/** Métodos CursoNeg	  */
	public List<Curso> getTodosCursos(){
		return this.cursoNeg.getTodosCursos();
	}
	
	public Curso getCursoPorId(int id){
		return this.cursoNeg.getPorId(id);
	}
	
	public List<Curso> getTodosCursosPorStatus(int ... status) {
		return this.cursoNeg.getTodosCursosPorStatus(status);
	}
	
	public void removerCurso(Curso curso) {
		 this.cursoNeg.remover(curso);
	}
	
	public Curso updateCurso(Curso curso){
		return this.cursoNeg.updateEntidade(curso);
	}
	public Curso saveOrupdateCurso(Curso curso){
		return this.cursoNeg.persistir(curso);
	}
	
	public Curso inserirEstudoDeCasoNoCurso(EstudoDeCaso estudoDeCaso, Curso curso) {
		return this.cursoNeg.inserirEstudoDeCasoNoCurso(estudoDeCaso, curso);
	}
	
	public Curso inserirCurso(Curso curso){
		 return this.cursoNeg.persistir(curso);
	}
	
	public List<Arquivo> inserirArquivosCurso(List<Arquivo> arquivos){
		return this.cursoNeg.inserirArquivosCurso(arquivos);
	}
	
//	public List<EstudoDeCaso> listarEstudosDeCasosPorCurso(Curso curso){
//		return this.cursoNeg.listarEstudosDeCasosPorCurso(curso);
//	}
	
	public EstudoDeCaso cadastrarEstudoDeCaso(EstudoDeCaso estudoDeCaso){
		return this.cursoNeg.cadastrarEstudoDeCaso(estudoDeCaso);
	}
	
	public Curso getCursoDoEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		return this.cursoNeg.getCursoDoEstudoDeCaso(estudoDeCaso);
	}
	
	public EstudoDeCaso updateEstudoDeCaso(EstudoDeCaso estudoDeCaso){
		return this.estudoDeCasoNeg.updateEntidade(estudoDeCaso);
	}
	
	public void removerEstudoDeCaso(EstudoDeCaso estudoDeCaso){
		this.estudoDeCasoNeg.remover(estudoDeCaso);
	}
	
	public List<EstudoDeCaso> getTodosEstudoDeCaso(){
		return this.estudoDeCasoNeg.getTodos();
	}
	
	public List<Nanda> pesquisarNanda(String query, String eixo) {
		return this.cursoNeg.pesquisarNanda(query, eixo);
	}

	/** Métodos MatriculaNeg	  */
	public List<MatriculaCursoAluno> getTodasMatriculasAluno(Aluno aluno) {
		 return this.matriculaNeg.getTodasMatriculasAluno(aluno);
	}
	
	public List<Curso> getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(List<MatriculaCursoAluno> matriculas){
		 return this.matriculaNeg.getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(matriculas);
	}
	
	public MatriculaCursoAluno getMatriculaAlunoCursoPorId(int id){
		return this.matriculaNeg.getPorId(id);
	}
	
	public void removerMatriculaCursoAluno(MatriculaCursoAluno matriculaCursoAluno) {
		this.matriculaNeg.remover(matriculaCursoAluno);
	}
	
	public List<MatriculaCursoAluno> getTodosMatriculaCursoAlunos(){
		return this.matriculaNeg.getTodosMatriculaCursoAluno();
	}
	
	public MatriculaCursoAluno getMatriculaCursoAlunoPorId(int id){
		return this.matriculaNeg.getPorId(id);
	}
	
	public MatriculaCursoAluno updateMatriculaCursoAluno(MatriculaCursoAluno curso){
		return this.matriculaNeg.updateEntidade(curso);
	}
	
	public ArcoMaguerezEstudoDeCaso getArcoMaguerezPorMatriculaCursoEstudoCaso(
			MatriculaCursoAluno matricula, EstudoDeCaso estudo){
		return this.arcoMaguerezNeg.getArcoMaguerezPorMatriculaCursoEstudoCaso(matricula, estudo);
	}
	
	public ArcoMaguerezEstudoDeCaso inserirArcoMaguerez(ArcoMaguerezEstudoDeCaso arcoMaguerez){
		return this.arcoMaguerezNeg.inserirArcoMaguerez(arcoMaguerez);
	}
	
	public ArcoMaguerezEstudoDeCaso atualizarArcoMaguerez(ArcoMaguerezEstudoDeCaso arcoMaguerez){
		return this.arcoMaguerezNeg.updateEntidade(arcoMaguerez);
	}
	
	public List<Arquivo> inserirArquivosImplementacao(List<Arquivo> arquivos, Implementacao implementacao){
		return this.arquivoNeg.inserirArquivosImplementacao(arquivos, implementacao);
	}
	
	public Implementacao atualizarImplementacao(Implementacao implementacao){
		return this.implementacaoNeg.updateEntidade(implementacao);
	}
	
	public DiagnosticosImplementacoes adicionarDiagnostico(DiagnosticosImplementacoes diagnostico){
		return this.diagnosticosImplementacoesNeg.persistir(diagnostico);
	}
	
	public DiagnosticosImplementacoes editarDiagnostico(DiagnosticosImplementacoes diagnostico){
		return this.diagnosticosImplementacoesNeg.updateEntidade(diagnostico);
	}
	
	public List<DiagnosticosImplementacoes> buscarDiagnosticosImplementacoesPorConsulta(String tipo, String valor){
		return this.diagnosticosImplementacoesNeg.getPorConsulta(tipo, valor);
	}
	
	public Avaliacao atualizarAplicacao(Avaliacao aplicacao){
		return this.avaliacaoNeg.updateEntidade(aplicacao);
	}
	
	public MatriculaCursoAluno atualizarMatriculaCursoAluno(MatriculaCursoAluno matriculaCursoAluno){
		return this.matriculaNeg.updateEntidade(matriculaCursoAluno);
	}
	
	public List<ArcoMaguerezEstudoDeCaso> buscarArcosMaguerezPorCursoEAluno(MatriculaCursoAluno matricula,Curso curso) {
		return this.arcoMaguerezNeg.buscarArcosMaguerezPorCursoEAluno(matricula, curso);
	}
	
	public Planejamento atualizarPlanejamento(Planejamento planejamento){
		return this.planejamentoNeg.updateEntidade(planejamento);
	}
		
	public ResultadosEsperados atualizarResultadosEsperados(ResultadosEsperados resultadosEsperados){
		return this.resultadosEsperadosNeg.updateEntidade(resultadosEsperados);
	}	
	
	public AvaliacaoProfessor inserirAvaliacaoProfessor(AvaliacaoProfessor avaliacao){
		return this.avaliacaoProfessorNeg.persistir(avaliacao);
	}
	
	public List<ArcoMaguerezEstudoDeCaso> getTodasArcoMaguerezEstudoDeCasoPorCurso(Curso curso) {
		return this.arcoMaguerezNeg.getTodasArcoMaguerezEstudoDeCasoPorCurso(curso);
	}
	
	public List<ArcoMaguerezEstudoDeCaso> getTodasArcoMaguerez() {
		return this.arcoMaguerezNeg.getTodos();
	}
	
	public ArcoMaguerezEstudoDeCaso getArcoMaguerezId(int idArco){
		return this.arcoMaguerezNeg.getPorId(idArco);
	}
	
	public List<Nanda> getTodasNanda(){
		return this.nandaNeg.getTodos();
	}
	
	public List<Nanda> getNandaPorTituloAutocomplete(String termo) {
		return this.nandaNeg.getNandaPorTituloAutocomplete(termo);
	}
	
	public List<Nanda> getNandaPorConsulta(String tipo, String valor) {
		return this.nandaNeg.getPorConsulta(tipo, valor);
	}
	
	public Avaliacao atualizarAvaliacao(Avaliacao avaliacao){
		return this.avaliacaoNeg.updateEntidade(avaliacao);
	}
	
	public List<Nic> getTodosNics(){
		return this.nicNeg.getTodos();
	}
	
	public List<Noc> getTodosNocs(){
		return this.nocNeg.getTodos();
	}
	
	public DiagnosticosImplementacoes atualizarDiagnosticosImplementacoes(DiagnosticosImplementacoes diagnosticosImplementacoes){
		return this.diagnosticosImplementacoesNeg.updateEntidade(diagnosticosImplementacoes);
	}
	
	public DiagnosticosImplementacoes persistirDiagnosticosImplementacoes(DiagnosticosImplementacoes diagnosticosImplementacoes){
		return this.diagnosticosImplementacoesNeg.persistir(diagnosticosImplementacoes);
	}
	
	public DiagnosticosResultados atualizarDiagnosticosResultados(DiagnosticosResultados diagnosticosResultados){
		return this.diagnosticosResultadosNeg.updateEntidade(diagnosticosResultados);
	}
	
	public DiagnosticosResultados persistirDiagnosticosResultados(DiagnosticosResultados diagnosticosResultados){
		return this.diagnosticosResultadosNeg.persistir(diagnosticosResultados);
	}
	
	/** Métodos ArquivoNeg	 */
	public Arquivo getArquivoPorId(int id) {
		return this.arquivoNeg.getPorId(id);
	}
	
	public Arquivo inserirArquivo(Arquivo arquivo) {
		return this.arquivoNeg.persistir(arquivo);
	}
	
	public Arquivo updateArquivo(Arquivo arquivo){
		return this.arquivoNeg.updateEntidade(arquivo);
	}
	
	public void removerArquivo(Arquivo arquivo){
		this.arquivoNeg.remover(arquivo);
	}

	/** Métodos HyperLinkNeg	 */
	public HyperLink getHyperLinkPorId(int id) {
		return this.hyperlinkNeg.getPorId(id);
	}
	
	public HyperLink inserirHyperLink(HyperLink hyperLink) {
		return this.hyperlinkNeg.persistir(hyperLink);
	}
	
	public HyperLink updateHyperLink(HyperLink hyperLink){
		return this.hyperlinkNeg.updateEntidade(hyperLink);
	}
	
	public void removerHyperLink(HyperLink hyperLink){
		this.hyperlinkNeg.remover(hyperLink);
	}
	
	public List<HyperLink> getTodosHyperLinks(){
		return this.hyperlinkNeg.getTodosHyperLinks();
	}
}

