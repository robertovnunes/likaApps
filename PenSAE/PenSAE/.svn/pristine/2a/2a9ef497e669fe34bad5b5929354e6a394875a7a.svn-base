package fachada;

import java.util.List;

import javax.persistence.OneToOne;

import model.Aluno;
import model.AlunoEstudoCaso;
import model.Ambulatorio;
import model.Arquivo;
import model.Cipe;
import model.CompetenciaHabilidadeEspecifica;
import model.CompetenciaHabilidadeGeral;
import model.Curso;
import model.Descritor;
import model.DiagnosticoAluno;
import model.EstudoCaso;
import model.Feedback;
import model.Glossario;
import model.Idioma;
import model.IntervencaoAluno;
import model.MetaAluno;
import model.PontoChaveAluno;
import model.PontoChaveProfessor;
import model.Professor;
import model.Usuario;
import model.UsuarioHasIdioma;
import negocios.AlunoEstudoCasoNegocios;
import negocios.AlunoNegocios;
import negocios.AmbulatorioNegocios;
import negocios.ArquivoNegocios;
import negocios.CipeNegocios;
import negocios.CompetenciaHabilidadeEspecificaNegocios;
import negocios.CompetenciaHabilidadeGeralNegocios;
import negocios.CursoNegocios;
import negocios.DescritorNegocios;
import negocios.DiagnosticoAlunoNegocios;
import negocios.EstudoCasoNegocios;
import negocios.FeedbackNegocios;
import negocios.GlossarioNegocios;
import negocios.IdiomaNegocios;
import negocios.IntervencaoAlunoNegocios;
import negocios.MetaAlunoNegocios;
import negocios.PontoChaveAlunoNegocios;
import negocios.PontoChaveProfessorNegocios;
import negocios.ProfessorNegocios;
import negocios.UsuarioNegocios;

/**
 * @author Jesus, Onire, Tiago
 *
 */

public class Fachada {

	@OneToOne(mappedBy = "instance")
	private static Fachada instance;
	public static Fachada getInstance(){

		if(Fachada.instance == null){

			instance = new Fachada();

		}

		return instance;

	}
	private final AlunoEstudoCasoNegocios alunoEstudoCasoNegocios;
	private final AlunoNegocios alunoNegocios;
	private final AmbulatorioNegocios ambulatorioNegocios;
	private final ArquivoNegocios arquivoNegocios;
	private final CipeNegocios cipeNegocios;
	private final CompetenciaHabilidadeEspecificaNegocios competenciasHabilidadesEspecificasNegocios;
	private final CompetenciaHabilidadeGeralNegocios competenciasHabilidadesGeraisNegocios;
	private final CursoNegocios cursoNegocios;
	private final DescritorNegocios descritorNegocios;
	private final DiagnosticoAlunoNegocios diagnosticoAlunoNegocios;
	private final EstudoCasoNegocios estudoCasoNegocios;
	private final FeedbackNegocios feedbackNegocios; 
	private final GlossarioNegocios glossarioNegocios;
	private final IdiomaNegocios idiomaNegocios;
	private final IntervencaoAlunoNegocios intervencaoAlunoNegocios;
	private final MetaAlunoNegocios metaAlunoNegocios;
	private final PontoChaveAlunoNegocios pontoChaveAlunoNegocios;
	private final PontoChaveProfessorNegocios pontoChaveProfessorNegocios;
	private final ProfessorNegocios professorNegocios;
	private final UsuarioNegocios usuarioNegocios;  
	
	private Fachada(){

		alunoNegocios = AlunoNegocios.getInstancia();
		alunoEstudoCasoNegocios = AlunoEstudoCasoNegocios.getInstancia();
		ambulatorioNegocios = AmbulatorioNegocios.getInstancia();
		arquivoNegocios = ArquivoNegocios.getInstancia();
		competenciasHabilidadesEspecificasNegocios = CompetenciaHabilidadeEspecificaNegocios.getInstancia();
		competenciasHabilidadesGeraisNegocios = CompetenciaHabilidadeGeralNegocios.getInstancia();
		cipeNegocios = CipeNegocios.getInstancia();
		cursoNegocios = CursoNegocios.getInstancia();
		descritorNegocios = DescritorNegocios.getInstancia();
		diagnosticoAlunoNegocios = DiagnosticoAlunoNegocios.getInstancia();
		estudoCasoNegocios = EstudoCasoNegocios.getInstancia();
		feedbackNegocios = FeedbackNegocios.getInstancia();
		glossarioNegocios = GlossarioNegocios.getInstancia();
		idiomaNegocios = IdiomaNegocios.getInstancia();
		intervencaoAlunoNegocios = IntervencaoAlunoNegocios.getInstancia();
		metaAlunoNegocios = MetaAlunoNegocios.getInstancia();
		usuarioNegocios = UsuarioNegocios.getInstancia();
		professorNegocios = ProfessorNegocios.getInstancia();
		pontoChaveAlunoNegocios = PontoChaveAlunoNegocios.getInstancia();
		pontoChaveProfessorNegocios = PontoChaveProfessorNegocios.getInstancia();
	}

	public List<Feedback> carregarListaFeedback() {
		return feedbackNegocios.carregarListaFeedback();
	}

	public List<Glossario> carregarListaGlossario(EstudoCaso estudoSelecionado) {
		return glossarioNegocios.listaGlossario(estudoSelecionado);
	}

	public String editarCurso(Curso curso, Professor professorLogado, Arquivo programacao){

		return cursoNegocios.editarCurso(curso, professorLogado, programacao);
	}

	public void editarDiagnosticoAluno(DiagnosticoAluno diag){
		diagnosticoAlunoNegocios.editarDiagnosticoAluno(diag);
	}

	public void excluirCurso(int id){
		int quantidadeCasos = 0;
		quantidadeCasos = getQuantidadeCasosPorCurso(id);

		if(quantidadeCasos > 0){
			estudoCasoNegocios.excluirEstudosCasoPorCurso(id);
		}

		cursoNegocios.excluirCurso(id);
	}

	public void excluirDiagnosticoAluno(DiagnosticoAluno resposta){

		diagnosticoAlunoNegocios.excluirDiagnosticoAluno(resposta);
	}

	public void excluirEstudoCaso(EstudoCaso estudo){
		estudoCasoNegocios.excluirEstudoCaso(estudo);
	}

	public void excluirIntervencaoAluno(IntervencaoAluno i){

		intervencaoAlunoNegocios.excluirIntervencaoAluno(i);
	}
	
	public void excluirMetaAluno(MetaAluno meta){
		metaAlunoNegocios.excluirMetaAluno(meta);
	}

	public boolean excluirPontoChaveAluno(PontoChaveAluno pca){

		return pontoChaveAlunoNegocios.excluirPontoChaveAluno(pca);
	}

	public void excluirPontoChaveProfessor(PontoChaveProfessor ponto){

		pontoChaveProfessorNegocios.excluirPontoChaveProfessor(ponto);
	}

	public AlunoEstudoCaso getAlunoEstudoCasoPorUsuarioEstudoCaso(Usuario u, EstudoCaso ec){
		return alunoEstudoCasoNegocios.getAlunoEstudoCasoPorUsuarioEstudoCaso(u, ec);
	}

	public Aluno getAlunoPorUsuario(Usuario u){

		return alunoNegocios.getAlunoPorUsuario(u);
	}

	public Ambulatorio getAmbulatorioPorUsuarioCurso(Usuario usuarioLogado, Curso cursoAtual) {
		return ambulatorioNegocios.getAmbulatorioPorUsuarioCurso(usuarioLogado,cursoAtual);		
	}

	public Arquivo getArquivoAlunoEstudoCaso(AlunoEstudoCaso aec){
		return arquivoNegocios.getReferenciaAlunoEstudoCaso(aec);
	}
	
	public Arquivo getArquivoCurso(int idCurso, int tipoArquivo){

		return cursoNegocios.getArquivoCurso(idCurso, tipoArquivo);
	}
	
	public Arquivo getArquivoPorEstudoCaso(EstudoCaso ec){
		return arquivoNegocios.getArquivoPorEntidade(ec);
	}
	
	public Arquivo getArquivoUsuarioEstudoCaso(Usuario u, EstudoCaso ec){
		return arquivoNegocios.getReferenciaUsuarioEstudoCaso(u, ec);
	}

	public Curso getCursoPorId(int cursoId){

		return cursoNegocios.getCursoPorId(cursoId);
	}

	public Feedback getFeebackUsuarioCurso(Usuario u, Curso c){
		return feedbackNegocios.getFeebackUsuarioCurso(u, c);
	}

	public Idioma getIdiomaPorNome(String nome){
		return idiomaNegocios.getIdiomaPorNome(nome);
	}

	public List<UsuarioHasIdioma> getPessoaHasIdiomaPorPessoa(int idPessoa){
		return usuarioNegocios.getPessoaHasIdiomaPorUsuario(idPessoa);
	}

	public Professor getProfessorPorUsuario(Usuario u){

		return professorNegocios.getProfessorPorUsuario(u);
	}

	public String getProfessorResponsavel(int cursoId){

		return cursoNegocios.getProfessorResponsavel(cursoId);
	}

	public int getQuantidadeCasosPorCurso(int cursoId){

		return cursoNegocios.getQuantidadeCasosPorCurso(cursoId);
	}

	public boolean getTodosTerminaramFasePontosChave(int idEstudoCaso) {
		return alunoEstudoCasoNegocios.getTodosTerminaramFasePontosChave(idEstudoCaso);
	}
	
	public void habilitarDesabilitarEstudoCaso(EstudoCaso estudo){
		estudoCasoNegocios.mudarHabilitar(estudo);
	}

	public void inicializacaoBanco(){
		this.usuarioNegocios.inicializacaoBanco();
	}

	public List<PontoChaveAluno> listaPontoChaveAlunoPorEstudoCaso(
			EstudoCaso estudoSelecionado) {
		
		return PontoChaveAlunoNegocios.listaPontoChaveAlunoPorEstudoCaso(estudoSelecionado);
	}
	
	public List<PontoChaveProfessor> listaPontoChaveProfessorPorEstudoCaso(
			EstudoCaso estudoSelecionado) {
		
		return PontoChaveProfessorNegocios.listaPontoChaveProfessorPorEstudoCaso(estudoSelecionado);
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCaso(Usuario u){

		return this.alunoEstudoCasoNegocios.listarAlunoEstudoCaso(u);
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorEstudoCaso(EstudoCaso ec){
		return alunoEstudoCasoNegocios.listarAlunoEstudoCasoPorEstudoCaso(ec);
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorProfessor(Professor p){
		return alunoEstudoCasoNegocios.listarAlunoEstudoCasoPorProfessor(p);
	}
	
	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorUsuarioCurso(Usuario usuarioLogado, Curso curso) {
		return alunoEstudoCasoNegocios.listarAlunoEstudoCasoPorUsuarioCurso(usuarioLogado,curso);
	}

	public List<Usuario> listarAlunoPorProfessor(Professor professor){
		return alunoNegocios.getAlunoPorProfessor(professor);
	}

	public List<Cipe> listarCipe(int pagina, int tamanho) {
		List<Cipe> retorno;
		
		retorno = cipeNegocios.listarTodaCipe(pagina, tamanho);
		
		return retorno;
		
	}

	public List<Cipe> listarCipeEixoDiagnosticoPorNome(String termo){

		return cipeNegocios.listarCipeEixoDiagnosticoPorTermo(termo);
	}

	public List<Cipe> listarCipeEixoIntervencaoPorNome(String termo){

		return cipeNegocios.listarCipeEixoIntervencaoPorTermo(termo);
	}

	public List<CompetenciaHabilidadeEspecifica> listarCompetenciaHabilidadeEspecifica(){
		return competenciasHabilidadesEspecificasNegocios.listarCompetenciaHabilidadeEspecifica();
	}
	
	public List<CompetenciaHabilidadeGeral> listarCompetenciaHabilidadeGeral(){	
		return competenciasHabilidadesGeraisNegocios.listarCompetenciaHabilidadeGeral();
	}

	public List<Curso> listarCursosNaoMatriculadosPorAluno(Usuario u){
		List<Curso> retorno = null;
		
		retorno = cursoNegocios.listarCursosNaoMatriculadosPorUsuario(u);
		
		return retorno;
	}

	public List<Curso> listarCursosPorAluno(Usuario u){
		List<Curso> retorno = null;

		retorno = cursoNegocios.listarCursosPorUsuario(u);

		return retorno;
	}
	public List<Curso> listarCursosPorProfessor(Professor p){
		List<Curso> retorno = null;

		retorno = cursoNegocios.listarCursosPorProfessor(p);

		return retorno;
	}

	public List<Descritor> listarDescritores() {
		
		return descritorNegocios.listarDescritores();
	}

	public List<DiagnosticoAluno> listarDiagnosticoAlunoEstudoCaso(AlunoEstudoCaso aec){

		return diagnosticoAlunoNegocios.listarDiagnosticoAlunoEstudoCaso(aec);
	}

	public List<DiagnosticoAluno> listarDiagnosticoUsuarioEstudoCaso(Usuario u, EstudoCaso ec){

		return diagnosticoAlunoNegocios.listarDiagnosticoUsuarioEstudoCaso(u, ec);
	}

	public List<EstudoCaso> listarEstudosCasoPorUsuarioCurso(Usuario u, Curso c){
		List<EstudoCaso> retorno = null;

		retorno = estudoCasoNegocios.listarEstudoCasoPorUsuariuCurso(u, c);

		return retorno;
	}

	public List<Idioma> listarIdiomas(){
		return idiomaNegocios.listarIdiomas();
	}

	public List<String> listarNomeIdiomas(){
		return idiomaNegocios.listarNomeIdiomas();
	}

	public List<PontoChaveAluno> listarPontoChaveAlunoPorAlunoEstudoCaso(AlunoEstudoCaso aec){

		return pontoChaveAlunoNegocios.listarPontoChaveAlunoAlunoEstudoCaso(aec);
	}

	public List<PontoChaveAluno> listarPontosChavesPorAluno(Usuario u, EstudoCaso ec){
		return pontoChaveAlunoNegocios.getPontoChaveAluno(u,ec);
	}
	public List<Cipe> listarTodaCipeEixoDiagnostico(){

		return cipeNegocios.listarTodaCipeEixoDiagnostico();
	}

	public String listarTodaCipeEixoDiagnosticoString(){

		return cipeNegocios.listarTodaCipeEixoDiagnosticoString();
	}

	public List<Cipe> listarTodaCipeEixoIntervencao(){

		return cipeNegocios.listarTodaCipeEixoIntervencao();
	}

	public String listarTodaCipeEixoIntervencaoString(){

		return cipeNegocios.listarTodaCipeEixoIntervencaoString();
	}

	public List<Curso> listarTodosCursos(){

		return cursoNegocios.listarTodosCursos();
	}
	
	public Usuario logon(String login, String senha) throws Exception{

		return usuarioNegocios.logon(login, senha);
	}

	public void salvarAluno(Aluno a, List<UsuarioHasIdioma> phi){
		alunoNegocios.editarAluno(a, phi);
	}

	public AlunoEstudoCaso salvarAlunoEstudoCaso(AlunoEstudoCaso aec){
		return alunoEstudoCasoNegocios.salvarAlunoEstudoCaso(aec);
	}

	public Ambulatorio salvarAmbulatorio(Ambulatorio ambulatorio){
		return ambulatorioNegocios.salvarAmbulatorio(ambulatorio);
	}

	public void salvarCipe(Cipe cipe) {
		cipeNegocios.salvarCipe(cipe);
	}
	
	public String salvarCurso(Curso curso, Professor professorLogado, Arquivo programacao){

		return cursoNegocios.salvarCurso(curso, professorLogado, programacao);
	}

	public void salvarDiagnosticoAluno(Cipe resposta, PontoChaveAluno problema, String nome, Usuario u, EstudoCaso ec){
		diagnosticoAlunoNegocios.salvarDiagnosticoAluno(resposta, problema, nome, u, ec);
	}
	
	public void salvarDiagnosticoAluno(DiagnosticoAluno diagnostico){
		diagnosticoAlunoNegocios.salvarDiagnosticoAluno(diagnostico);
	}

	public void salvarEstudoCaso(EstudoCaso estudo, Arquivo arquivo) {
		estudoCasoNegocios.salvarEstudoCaso(estudo, arquivo);		
	}

	public void salvarFeedback(Feedback feedback){
		feedbackNegocios.salvarFeedback(feedback);
	}

	public void salvarGlossario(Glossario glossario) {
		
		glossarioNegocios.salvarGlossario(glossario);
		
	}

	public boolean salvarPontoChaveAluno(List<PontoChaveAluno> determinantes, Usuario u, EstudoCaso ec){

		return pontoChaveAlunoNegocios.salvarPontoChaveAluno(determinantes, u, ec);
	}

	public void salvarPontoChaveProfessor(PontoChaveProfessor ponto){

		pontoChaveProfessorNegocios.salvarPontoChaveAluno(ponto);
	}

	public void salvarReferencias(Arquivo a, Usuario u, EstudoCaso ec){
		arquivoNegocios.salvarReferencia(a, u, ec);
	}

	public String salvarUsuario(Usuario usuario, List<Curso> cursos){

		return usuarioNegocios.salvarUsuario(usuario, cursos);
	}

	public boolean verificarSeLoginJaExiste(String login){

		return usuarioNegocios.verificarSeLoginJaExiste(login);
	}

	public void excluirGlossario(Glossario glossario) {

		glossarioNegocios.excluirGlossario(glossario);
		
	}
	
	public void editarGlossario(Glossario glossario) {

		glossarioNegocios.editarGlossario(glossario);
		
	}

}