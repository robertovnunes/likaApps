package managedBeans.professor.acompanhamento;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
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
import model.Curso;
import model.DiagnosticoAluno;
import model.EstudoCaso;
import model.PontoChaveAluno;
import model.PontoChaveProfessor;
import model.Professor;
import model.Usuario;
import define.Define;
import fachada.Fachada;

@ManagedBean(name="acompanhamentoEstudante")
@ViewScoped
public class AcompanhamentoEstudanteBean {

	private static Fachada fachada;

	private int abaAtual;
	private String activeTab;
	private Arquivo arquivo;
	private AlunoEstudoCaso atual = new AlunoEstudoCaso();
	private Avaliacao avaliacaoaInserir = new Avaliacao();
	private String comentario;
	private int controlePopup;
	private EstudoCaso estudoSelecionado;
	private String justificativaPontoChave;
	private List<AlunoEstudoCaso> listaAlunoEstudoCaso = new ArrayList<AlunoEstudoCaso>();
	private List<DiagnosticoAluno> listaDiagnosticoAlunoAtual;
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

	public AcompanhamentoEstudanteBean(){
		fachada = Fachada.getInstance();

		tabs.add("observacao");
		tabs.add("teorizacao");
		tabs.add("hipoteses");

		abaAtual = 0;

		activeTab = tabs.get(abaAtual);
	}

	public void atualizarAvaliacao(){

		Set<Avaliacao> avaliacoes = this.atual.getAvaliacaos();

		if(avaliacoes == null){

			avaliacoes = new HashSet<Avaliacao>();
		}

		avaliacoes.clear();

		avaliacaoaInserir.setAlunoestudocaso(this.atual);

		avaliacoes.add(avaliacaoaInserir);

		this.atual.setAvaliacaos(avaliacoes);

		salvarAlunoEstudoCasoAtual();

		this.listaAlunoEstudoCaso.set(this.listaAlunoEstudoCaso.lastIndexOf(this.atual), this.atual);

		limparCampos();
	}

	public void atualizarListaAlunoEstudoCaso(){
		this.listaAlunoEstudoCaso.set(listaAlunoEstudoCaso.lastIndexOf(this.atual),this.atual );
	}

	public void avancarTabAvaliacao(){
		if(this.abaAtual < 2){
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
	}

	public void carregarListaEstudantes(Curso curso){

		setListaAlunoEstudoCaso(fachada.listarAlunoEstudoCasoPorUsuarioCurso(usuarioLogado,curso));
	}

	public void carregarListaPontosChaveAluno(AlunoEstudoCaso atual){

		this.atual = atual;
		this.listaPontosChaveAluno = new ArrayList<PontoChaveAluno>(atual.getPontochavealunos());  
		this.listaDiagnosticoAlunoAtual = new ArrayList<DiagnosticoAluno>(atual.getDiagnosticoalunos());
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

		return (listaPontosChaveProfessor == null || (listaPontosChaveProfessor != null && listaPontosChaveProfessor.size() > 0));
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

	public Arquivo getArquivo() {

		if(atual != null){
			arquivo = fachada.getArquivoAlunoEstudoCaso(atual);
		}

		return arquivo;
	}

	public AlunoEstudoCaso getAtual() {
		return atual;
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

	public List<DiagnosticoAluno> getListaDiagnosticoAlunoAtual() {
		return listaDiagnosticoAlunoAtual;
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

	public List<String> getTabs() {
		return tabs;
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
		setAvaliacaoaInserir(null);
		setListaDiagnosticoAlunoAtual(null);
		setListaPontosChaveAluno(null);;
	}

	public void recuarTabAvaliacao(){
		if(this.abaAtual > 0){
			this.abaAtual -= 1;
		}
		setActiveTab(tabs.get(this.abaAtual));
	}

	public boolean renderAvancarAvaliacao(){
		boolean retorno;
		if(this.abaAtual < 2){
			retorno = true;
		}else{
			retorno = false;
		}
		return retorno;
	}

	public boolean renderVoltarAvaliacao(){
		boolean retorno;
		if(this.abaAtual > 0){
			retorno = true;
		}else{
			retorno = false;
		}
		return retorno;
	}

	public void salvarAlunoEstudoCasoAtual(){
		fachada.salvarAlunoEstudoCaso(this.atual);
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

	public void setAbaAtual(int abaAtualAvaliacao) {
		this.abaAtual = abaAtualAvaliacao;
		setActiveTab(tabs.get(this.abaAtual));
	}

	public void setActiveTab(String activeTabAvaliacao) {
		this.activeTab = activeTabAvaliacao;

		this.abaAtual = tabs.lastIndexOf(this.activeTab);
	}

	public void setArquivo(Arquivo arquivo) {
		this.arquivo = arquivo;
	}

	public void setAtual(AlunoEstudoCaso atual) {

		this.atual = atual;

		carregarListaPontosChaveAluno(this.atual);

		if(this.atual.getAvaliacaos().iterator().hasNext()){

			setAvaliacaoaInserir(this.atual.getAvaliacaos().iterator().next());

			carregarAvaliacao();

		}else{
			setAvaliacaoaInserir(null);
		}
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

	public void setJustificativaPontoChave(String justificativaPontoChave) {
		this.justificativaPontoChave = justificativaPontoChave;
	}

	public void setListaAlunoEstudoCaso(List<AlunoEstudoCaso> listaAlunoEstudoCaso) {
		this.listaAlunoEstudoCaso = listaAlunoEstudoCaso;
	}

	public void setListaDiagnosticoAlunoAtual(
			List<DiagnosticoAluno> listaDiagnosticoAlunoAtual) {
		this.listaDiagnosticoAlunoAtual = listaDiagnosticoAlunoAtual;
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

	public void setTabsAvaliacao(List<String> tabsAvaliacao) {
		this.tabs = tabsAvaliacao;
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