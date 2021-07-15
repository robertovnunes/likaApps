package managedBeans.professor.acompanhamento;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;

import model.AlunoEstudoCaso;
import model.Arquivo;
import model.Avaliacao;
import model.DiagnosticoAluno;
import model.EstudoCaso;
import model.PontoChaveAluno;
import model.PontoChaveProfessor;
import model.Professor;
import model.Usuario;
import define.Define;
import fachada.Fachada;

@ManagedBean(name="acompanhamentoEstudoCaso")
@ViewScoped
public class AcompanhamentoEstudoCasoBean {

	private static Fachada fachada;

	private int abaAtual;
	private String activeTab;
	private AlunoEstudoCaso alunoEstudoCasoAtual = new AlunoEstudoCaso();
	private Arquivo arquivo;
	private Avaliacao avaliacaoaInserir = new Avaliacao();
	private String comentario;
	private int controlePopup;
	private EstudoCaso estudoSelecionado;
	private int faseAtual;
	private String justificativaPontoChave;
	private List<AlunoEstudoCaso> listaAlunoEstudoCaso = new ArrayList<AlunoEstudoCaso>();
	private List<DiagnosticoAluno> listaDiagnosticoAtual;
	private List<EstudoCaso> listaEstudoCaso = new ArrayList<EstudoCaso>();
	private List<PontoChaveAluno> listaPontosChaveAluno;
	private List<PontoChaveProfessor> listaPontosChaveProfessor;
	private List<PontoChaveAluno> listaPontosChaveSelecionados;
	private String nomePontoChave;
	private Integer nota;
	private PontoChaveProfessor pontoChaveSelecionado;
	private Professor professorLogado = new Professor();
	private List<String> tabs = new ArrayList<String>();
	private Usuario usuarioLogado = new Usuario();

	public AcompanhamentoEstudoCasoBean(){
		fachada = Fachada.getInstance();

		tabs.add("selecao");
		tabs.add("edicao");
		abaAtual = 0;
		activeTab = tabs.get(abaAtual);
		
		listaPontosChaveProfessor = new ArrayList<>();
		listaPontosChaveSelecionados = new ArrayList<>();
	}

	public void atualizarAvaliacao(){

		Set<Avaliacao> avaliacoes = this.alunoEstudoCasoAtual.getAvaliacaos();

		avaliacoes.clear();

		avaliacaoaInserir.setAlunoestudocaso(this.alunoEstudoCasoAtual);

		avaliacoes.add(avaliacaoaInserir);

		this.alunoEstudoCasoAtual.setAvaliacaos(avaliacoes);

		salvarAlunoEstudoCasoAtual();

		this.listaAlunoEstudoCaso.set(this.listaAlunoEstudoCaso.lastIndexOf(this.alunoEstudoCasoAtual), this.alunoEstudoCasoAtual);

		limparCampos();
	}

	public void atualizarListaAlunoEstudoCaso(){
		this.listaAlunoEstudoCaso.set(listaAlunoEstudoCaso.lastIndexOf(this.alunoEstudoCasoAtual),this.alunoEstudoCasoAtual );
	}

	//Controle das abas
	public void avancarTab(){
		if(this.abaAtual < 1){
			this.abaAtual += 1;			
		}
		setActiveTab(tabs.get(this.abaAtual));
	}

	public void carregarAvaliacao(){
		if(this.controlePopup == Define.FASE_ARCO_OBSERVACAO){
			this.nota = this.avaliacaoaInserir.getNotaObservacao();
			this.comentario = this.avaliacaoaInserir.getComentarioObservacao();

		}else if(this.controlePopup == Define.FASE_ARCO_TEORIZACAO){

			this.nota = this.avaliacaoaInserir.getNotaTeorizacao();
			this.comentario = this.avaliacaoaInserir.getComentarioTeorizacao();

		}else if(this.controlePopup == Define.FASE_ARCO_PLANO){

			this.nota = this.avaliacaoaInserir.getNotaPlanoCuidados();
			this.comentario = this.avaliacaoaInserir.getComentarioPlanoCuidados();
		}
	}

	public void carregarListaAlunoEstudoCaso(){
		listaAlunoEstudoCaso = fachada.listarAlunoEstudoCasoPorEstudoCaso(estudoSelecionado);
		
		this.carregarListaPontoChaveProfessor();
	}

	public void carregarListaEstudo(){
		setListaEstudoCaso(fachada.listarEstudosCasoPorUsuarioCurso(usuarioLogado, null));
	}

	private void carregarListaPontoChaveProfessor() {
		
		this.listaPontosChaveProfessor = fachada.listaPontoChaveProfessorPorEstudoCaso(estudoSelecionado);
		
	}

	public void criarPontosChaveDefinitivos()
	{
		if(listaPontosChaveProfessor == null){
			listaPontosChaveProfessor = new ArrayList<PontoChaveProfessor>();
		}

		for (Iterator<PontoChaveAluno> iterator = this.listaPontosChaveSelecionados.iterator(); iterator.hasNext();) {
			PontoChaveAluno pca = (PontoChaveAluno) iterator.next();
			PontoChaveProfessor aInserir = new PontoChaveProfessor();
			aInserir.setEstudocaso(estudoSelecionado);
			aInserir.setNome(pca.getNome());
			aInserir.setJustificativa(pca.getJustificativa());
			listaPontosChaveProfessor.add(aInserir);
		}
	}

	public boolean desabilitarFuncionalidadePontoChaveAluno(){

		return (listaPontosChaveProfessor != null && listaPontosChaveProfessor.size() > 0);
	}

	public void downloadArquivo(){

		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();

		response.reset();

		String nomeArquivo = this.arquivo.getNomeArquivo();

		if(nomeArquivo.endsWith(".pdf")){
			response.setContentType("application/pdf");
		}else if(nomeArquivo.endsWith(".docx")){
			response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		}else{
			response.setContentType("application/msword");
		}

		response.setHeader("Content-disposition", "attachment; filename=" + this.arquivo.getNomeArquivo());

		try {
			OutputStream output = response.getOutputStream();
			output.write(this.arquivo.getArquivo());
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		context.responseComplete();
	}

	public void excluirPontoChave(PontoChaveProfessor ponto){
		
		fachada.excluirPontoChaveProfessor(ponto);
		if(listaPontosChaveProfessor.contains(ponto)){
			listaPontosChaveProfessor.remove(ponto);
		}
	}
	
	public void finalizarSelecao(){
		
		PontoChaveProfessor pontoChaveProfessor;
		
		if(this.listaPontosChaveProfessor == null){
			
			this.listaPontosChaveProfessor = new ArrayList<>();
		}
		
		for (Iterator<PontoChaveAluno> iterator = this.listaPontosChaveSelecionados.iterator(); iterator.hasNext();) {
			
			PontoChaveAluno pontoChaveAluno = (PontoChaveAluno) iterator.next();
			
			pontoChaveProfessor = new PontoChaveProfessor();
			
			pontoChaveProfessor.setEstudocaso(pontoChaveAluno.getAlunoestudocaso().getEstudocaso());
			pontoChaveProfessor.setJustificativa(pontoChaveAluno.getJustificativa());
			pontoChaveProfessor.setNome(pontoChaveAluno.getNome());
			
			fachada.salvarPontoChaveProfessor(pontoChaveProfessor);
			
			this.listaPontosChaveProfessor.add(pontoChaveProfessor);
		}
	}

	public int getAbaAtual() {
		return abaAtual;
	}

	public String getActiveTab() {
		return activeTab;
	}

	public AlunoEstudoCaso getAlunoEstudoCasoAtual() {
		return alunoEstudoCasoAtual;
	}

	public Arquivo getArquivo() {
		return arquivo;
	}

	public Avaliacao getAvaliacaoaInserir() {
		
		if(this.avaliacaoaInserir == null){
			this.avaliacaoaInserir = new Avaliacao();
		}
		
		return this.avaliacaoaInserir;
	}

	public String getComentario() {
		return comentario;
	}

	public EstudoCaso getEstudoSelecionado() {
		return estudoSelecionado;
	}

	public String getEtapadoArcoString(int etapaRecebida){

		String retorno = "";

		if(etapaRecebida == Define.FASE_ARCO_OBSERVACAO){

			retorno = Define.STRING_FASE_ARCO_OBSERVACAO;

		}else if(etapaRecebida == Define.FASE_ARCO_TEORIZACAO){

			retorno = Define.STRING_FASE_ARCO_TEORIZACAO;

		}else if(etapaRecebida == Define.FASE_ARCO_PLANO){

			retorno = Define.STRING_FASE_ARCO_HIPOTESES_SOLUCAO;
		}

		return retorno;
	}
	
	public int getFaseAtual() {
		return faseAtual;
	}

	public int getFaseObservacao(){
		return Define.FASE_ARCO_OBSERVACAO;
	}

	public int getFasePlano(){
		return Define.FASE_ARCO_PLANO;
	}

	public int getFaseTeorizacao(){
		return Define.FASE_ARCO_TEORIZACAO;
	}

	public String getJustificativaPontoChave() {
		return justificativaPontoChave;
	}

	public List<AlunoEstudoCaso> getListaAlunoEstudoCaso() {
		return listaAlunoEstudoCaso;
	}

	public List<DiagnosticoAluno> getListaDiagnosticoAtual() {
		return listaDiagnosticoAtual;
	}

	public List<EstudoCaso> getListaEstudoCaso() {
		return listaEstudoCaso;
	}

	public List<PontoChaveAluno> getListaPontosChaveAluno() {

		if((listaPontosChaveAluno == null || (listaPontosChaveAluno != null && listaPontosChaveAluno.size() > 0))
				&& this.estudoSelecionado != null){
			listaPontosChaveAluno = fachada.listaPontoChaveAlunoPorEstudoCaso(this.estudoSelecionado);
		}

		return listaPontosChaveAluno;
	}

	public List<PontoChaveProfessor> getListaPontosChaveProfessor() {
		return listaPontosChaveProfessor;
	}

	public List<PontoChaveAluno> getListaPontosChaveSelecionados() {
		return listaPontosChaveSelecionados;
	}

	public String getNomePontoChave() {
		return nomePontoChave;
	}

	public Integer getNota() {
		return nota;
	}

	public PontoChaveProfessor getPontoChaveSelecionado() {
		
		if(pontoChaveSelecionado == null){
			pontoChaveSelecionado = new PontoChaveProfessor();
		}
		
		return pontoChaveSelecionado;
	}

	public Professor getProfessorLogado() {
		return professorLogado;
	}

	public String getSituacaoEtapaDoArco(int etapaRecebida){

		String retorno = "";

		if(etapaRecebida <= Define.FASE_ARCO_PLANO){
			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_EM_ANDAMENTO;
		}else{
			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_FINALIZADO;
		}

		return retorno;
	}

	public String getStringFasePopup(){
		String retorno = "";

		if(controlePopup == Define.FASE_ARCO_OBSERVACAO){

			retorno = Define.STRING_FASE_ARCO_OBSERVACAO;

		}else if(controlePopup == Define.FASE_ARCO_TEORIZACAO){

			retorno = Define.STRING_FASE_ARCO_TEORIZACAO;

		}else if(controlePopup == Define.FASE_ARCO_PLANO){

			retorno = Define.STRING_FASE_ARCO_HIPOTESES_SOLUCAO;

		}

		return retorno;
	}

	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}


	public String imgFinalizado(int numero, int faseAtual){
		if(numero > faseAtual){
			return "/resources/icones/disable-icon.png";
		}else if(numero == faseAtual){
			return "/resources/icones/study-icon.png";
		}else{
			return "/resources/icones/enable-icon.png"; 
		}
	}

	public String imgIncluso(PontoChaveAluno ponto){
		if(listaPontosChaveSelecionados == null || (listaPontosChaveSelecionados!= null && !listaPontosChaveSelecionados.contains(ponto))){
			return "/resources/icones/disable-icon.png";
		}else{
			return "/resources/icones/enable-icon.png"; 
		}
	}

	public void incluirRemoverPontoChaveAluno(PontoChaveAluno ponto){

		if(listaPontosChaveSelecionados == null ){
			listaPontosChaveSelecionados = new ArrayList<>();
		}

		if(!listaPontosChaveSelecionados.contains(ponto)){

			listaPontosChaveSelecionados.add(ponto);

		}else{

			listaPontosChaveSelecionados.remove(ponto);
		}
	}

	public void limparCampos() {
		setNota(0);
		setComentario("");
		
		if(pontoChaveSelecionado != null){
			pontoChaveSelecionado = null;
		}
	}

	public void limparCamposHipotese(){
		listaDiagnosticoAtual.clear();
	}

	public void limparCamposMediacao(){
		if(pontoChaveSelecionado != null){
			pontoChaveSelecionado = null;
		}
	}

	public void recuarTab(){
		if(this.abaAtual > 0){
			this.abaAtual -= 1;
		}
		setActiveTab(tabs.get(this.abaAtual));
	}
	
	public boolean renderAvancar(){
		boolean retorno;
		if(this.abaAtual == 0){
			retorno = true;
		}else{
			retorno = false;
		}
		return retorno;
	}

	public boolean renderVoltar(){
		boolean retorno;
		if(this.abaAtual == 1){
			retorno = true;
		}else{
			retorno = false;
		}
		return retorno;
	}

	public void salvarAlunoEstudoCasoAtual(){
		fachada.salvarAlunoEstudoCaso(this.alunoEstudoCasoAtual);
	}
	
	public void salvarPontoChaveProfessor(){
		
		pontoChaveSelecionado.setEstudocaso(estudoSelecionado);
		
		fachada.salvarPontoChaveProfessor(pontoChaveSelecionado);
		
		if(listaPontosChaveProfessor.contains(pontoChaveSelecionado)){
			
			listaPontosChaveProfessor.set(listaPontosChaveProfessor.lastIndexOf(pontoChaveSelecionado), pontoChaveSelecionado);
			
		}else{
			listaPontosChaveProfessor.add(pontoChaveSelecionado);
		}
		
		pontoChaveSelecionado = null;
	}

	public void salvarReferenciaAluno(){

	}

	public void setAbaAtual(int abaAtual) {
		this.abaAtual = abaAtual;
	}

	public void setActiveTab(String activeTab) {
		this.activeTab = activeTab;

		this.abaAtual = tabs.lastIndexOf(this.activeTab);
	}

	public void setAlunoEstudoCasoAtual(AlunoEstudoCaso atual) {
		this.alunoEstudoCasoAtual = atual;

		if(this.alunoEstudoCasoAtual.getAvaliacaos().iterator().hasNext()){
			setAvaliacaoaInserir(this.alunoEstudoCasoAtual.getAvaliacaos().iterator().next());

			carregarAvaliacao();

		}else{
			setAvaliacaoaInserir(null);
		}
	}

	public void setArquivo(Arquivo arquivo) {
		this.arquivo = arquivo;			
	}

	public void setAtualFaseHipotese(AlunoEstudoCaso atual){
		setAlunoEstudoCasoAtual(atual);
		List<DiagnosticoAluno> aInserir = new ArrayList<DiagnosticoAluno>(this.alunoEstudoCasoAtual.getDiagnosticoalunos());
		setListaDiagnosticoAtual(aInserir);
	}

	public void setAtualFaseObservacao(AlunoEstudoCaso atual){
		setAlunoEstudoCasoAtual(atual);
		List<PontoChaveAluno> aInserir = new ArrayList<PontoChaveAluno>(this.alunoEstudoCasoAtual.getPontochavealunos());
		setListaPontosChaveAluno(aInserir);
	}

	public void setAtualFaseTeorizacao(AlunoEstudoCaso aec){
		setAlunoEstudoCasoAtual(aec);
		setArquivo(fachada.getArquivoUsuarioEstudoCaso(this.alunoEstudoCasoAtual.getAluno().getUsuario(), this.alunoEstudoCasoAtual.getEstudocaso()));
	}

	public void setAvaliacaoaInserir( Avaliacao avaliacaoaInserir) {
		this.avaliacaoaInserir = avaliacaoaInserir;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public void setEstudoSelecionado(EstudoCaso estudoSelecionado) {
		this.estudoSelecionado = estudoSelecionado;
	}

	public void setFaseAtual(int faseAtual) {
		this.faseAtual = faseAtual;
	}

	public void setJustificativaPontoChave(String justificativaPontoChave) {
		this.justificativaPontoChave = justificativaPontoChave;
	}

	public void setListaAlunoEstudoCaso(List<AlunoEstudoCaso> listaAlunoEstudoCaso) {
		this.listaAlunoEstudoCaso = listaAlunoEstudoCaso;
	}

	public void setListaAlunoEstudoCAso(List<AlunoEstudoCaso> listaAlunoEstudoCAso) {
		this.setListaAlunoEstudoCaso(listaAlunoEstudoCAso);
	}

	public void setListaDiagnosticoAtual(List<DiagnosticoAluno> diagnosticoAtual) {
		this.listaDiagnosticoAtual = diagnosticoAtual;
	}

	public void setListaEstudoCaso(List<EstudoCaso> listaEstudoCaso) {
		this.listaEstudoCaso = listaEstudoCaso;
	}

	public void setListaPontosChaveAluno(List<PontoChaveAluno> listaPontosChaveAluno) {
		this.listaPontosChaveAluno = listaPontosChaveAluno;
	}

	public void setListaPontosChaveProfessor(
			List<PontoChaveProfessor> listaPontosChaveProfessor) {
		this.listaPontosChaveProfessor = listaPontosChaveProfessor;
	}

	public void setListaPontosChaveSelecionados(
			List<PontoChaveAluno> listaPontosChaveSelecionados) {
		this.listaPontosChaveSelecionados = listaPontosChaveSelecionados;
	}

	public void setNomePontoChave(String nomePontoChave) {
		this.nomePontoChave = nomePontoChave;
	}

	public void setNota(Integer nota) {
		this.nota = nota;
	}

	public void setPontoChaveSelecionado(PontoChaveProfessor pontoChaveSelecionado) {
		this.pontoChaveSelecionado = pontoChaveSelecionado;
	}

	public void setPopupPanelHipoteses(){
		this.controlePopup = Define.FASE_ARCO_PLANO;
	}

	public void setPopupPanelObservacao(){
		this.controlePopup = Define.FASE_ARCO_OBSERVACAO;
	}

	public void setPopupPanelTeorizacao(){
		this.controlePopup = Define.FASE_ARCO_TEORIZACAO;
	}

	public void setProfessorLogado(Professor professor) {
		this.professorLogado = professor;
	}
	
	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}
	
	public String StatusFase(int numero, int faseAtual){
		String retorno = "";

		if(numero < faseAtual){

			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_FINALIZADO;

		}else if(numero == faseAtual){

			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_EM_ANDAMENTO;

		}else if(numero > faseAtual){

			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_NAO_INICIADO;

		}

		return retorno;
	}
}