package managedBeans.professor.estudo;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ComponentSystemEvent;
import javax.faces.event.ValueChangeEvent;
import javax.servlet.http.HttpServletResponse;

import model.Arquivo;
import model.Cipe;
import model.CompetenciaHabilidadeEspecifica;
import model.CompetenciaHabilidadeGeral;
import model.Curso;
import model.Descritor;
import model.DiagnosticoProfessor;
import model.EstudoCaso;
import model.IntervencaoProfessor;
import model.MetaProfessor;
import model.Professor;

import org.richfaces.event.FileUploadEvent;
import org.richfaces.model.UploadedFile;

import define.Define;
import fachada.Fachada;


@ManagedBean(name="criarEditarEstudo")
@ViewScoped
public class CriarEditarEstudoBean {

	private static Fachada fachada;

	private Arquivo arquivo;
	private String cipeDiagnostico;
	private String cipeIntervencao;
	private List<CompetenciaHabilidadeEspecifica> competenciasHabilidadeEspecificasDisponiveis;
	private List<CompetenciaHabilidadeEspecifica> competenciasHabilidadesEspecificasSelecionadas;
	private List<CompetenciaHabilidadeGeral> competenciasHabilidadesGeraisDisponiveis;
	private List<CompetenciaHabilidadeGeral> competenciasHabilidadesGeraisSelecionadas;
	
	private List<Descritor> descritoresDisponiveis;
	private List<Descritor> descritoresSelecionados;
	
	private Curso curso;
	private List<Curso> cursos;
	//Esta variavel foi criada porque jsf estava descartando a string de dentro do diagnostico
	private String descricaoDiagnostico;
	//Campos para definição de diagnosticos
	private DiagnosticoProfessor diagnostico = new DiagnosticoProfessor();
	private List<Cipe> diagnosticosDisponiveis;
	private DiagnosticoProfessor diagnosticoSelecionadoMeta;
	private List<DiagnosticoProfessor> diagnosticosSelecionados;
	private boolean edicao = false;
	private boolean edicaoDiagnostico = false;
	private boolean edicaoMeta = false;
	private EstudoCaso estudo;
	//Campos para definição de intervencoes
	private IntervencaoProfessor intervencao = new IntervencaoProfessor();
	private List<Cipe> intervencoesDisponiveis;
	private List<IntervencaoProfessor> intervencoesSelecionadas;
	private MetaProfessor meta;

	private MetaProfessor metaSelecionadaIntervencao;
	//Campos para definição de metas
	private List<MetaProfessor> metasSelecionadas;
	private String metaString;
	private Professor professorLogado;

	public CriarEditarEstudoBean(){
		fachada = Fachada.getInstance();
	}

	public void adicionarDiagnostico(){

		if(this.diagnosticosDisponiveis != null){

			Iterator<Cipe> iterator = this.diagnosticosDisponiveis.iterator();
			boolean achou = false;

			while(iterator.hasNext() && !achou) {

				Cipe cipe = (Cipe) iterator.next();

				if(cipe.getTermo().equalsIgnoreCase(cipeDiagnostico)){

					this.diagnostico.setCipe(cipe);
					achou = true;
				}
			}

			if(this.diagnosticosSelecionados == null){

				this.diagnosticosSelecionados = new ArrayList<>();
			}

			this.diagnosticosSelecionados.add(diagnostico);
			this.diagnostico = null;
			this.cipeDiagnostico = "";
			this.edicaoDiagnostico = false;
		}
	}	

	public void adicionarIntervencao(DiagnosticoProfessor diagnostico, MetaProfessor meta){

		Set<MetaProfessor> metas = diagnostico.getMetaprofessors();

		Iterator<Cipe> iterator = this.intervencoesDisponiveis.iterator();

		boolean achou = false;

		while(iterator.hasNext() && !achou) {

			Cipe cipe = (Cipe) iterator.next();

			if(cipe.getTermo().equalsIgnoreCase(cipeIntervencao)){

				this.intervencao.setCipe(cipe);
				achou = true;
			}
		}

		if(meta != null){
			metas.remove(meta);
			this.meta = meta;
			Set<IntervencaoProfessor> intervencoes = this.meta.getIntervencaoprofessors();
			intervencoes.add(intervencao);
			metas.add(this.meta);
			this.diagnostico.setMetaprofessors(metas);

			meta.setIntervencaoprofessors(intervencoes);

		}else {
			Set<IntervencaoProfessor> intervencoes = this.meta.getIntervencaoprofessors();
			
			if(intervencoes == null){
				intervencoes = new HashSet<IntervencaoProfessor>();
			}
			intervencoes.add(intervencao);
			this.meta.setIntervencaoprofessors(intervencoes);
		}

		this.cipeIntervencao = "";
		this.intervencao = new IntervencaoProfessor();
		this.diagnostico = diagnostico;

	}	

	public void adicionarMeta(){

		int indice = this.diagnosticosSelecionados.lastIndexOf(this.diagnostico);

		Set<MetaProfessor> metas = this.diagnostico.getMetaprofessors();
		
		if(metas == null){
			metas = new HashSet<MetaProfessor>();
		}
		
		this.meta.setDescricao(this.metaString);
		metas.add(this.meta);
		this.diagnostico.setMetaprofessors(metas);
		if(this.descricaoDiagnostico != null && !this.descricaoDiagnostico.equalsIgnoreCase("")){		
			this.diagnostico.setDescricao(this.descricaoDiagnostico);
		}
		this.diagnosticosSelecionados.set(indice, diagnostico);

		this.diagnostico = null;
		this.metaString = "";
		this.meta = null;
		this.descricaoDiagnostico = "";
		this.edicaoMeta = false;
	}

	public void cancelarEditarDiagnostico(){

		if(this.diagnosticosSelecionados != null && edicaoDiagnostico){

			this.diagnosticosSelecionados.add(this.diagnostico);
			this.edicaoDiagnostico = false;
			this.cipeDiagnostico = "";
		}
		this.diagnostico = null;
	}

	public void cancelarEditarMeta(){

		if(edicaoMeta){
			Set<MetaProfessor> metas = diagnostico.getMetaprofessors();
			metas.add(this.meta);
			this.diagnostico.setMetaprofessors(metas);

			int index = this.diagnosticosSelecionados.lastIndexOf(this.diagnostico);
			this.diagnostico.setDescricao(this.descricaoDiagnostico);
			this.diagnosticosSelecionados.set(index, this.diagnostico);
		}
		this.diagnostico = null;
		this.meta = null;
		this.descricaoDiagnostico = "";
		this.edicaoMeta = false;
	}

	public void carregarCursos(ComponentSystemEvent event){
		try{
			this.setCursos(fachada.listarCursosPorProfessor(professorLogado));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void carregarCursos(Professor p){

		this.setProfessorLogado(p);		
		try{
			this.setCursos(fachada.listarCursosPorProfessor(professorLogado));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void carregarEstudo(EstudoCaso estudo){

		this.estudo = estudo;
		this.arquivo = fachada.getArquivoPorEstudoCaso(estudo);
		this.competenciasHabilidadesEspecificasSelecionadas = new ArrayList<>(this.estudo.getCompetenciashabilidadesespecificas());
		this.competenciasHabilidadesGeraisSelecionadas = new ArrayList<>(this.estudo.getCompetenciashabilidadesgerais());
		this.diagnosticosSelecionados = new ArrayList<>(this.estudo.getDiagnosticoprofessors());
		this.descritoresSelecionados = new ArrayList<>(this.estudo.getDescritors());
	}

	public void downloadArquivo(){

		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();

		response.reset();

		String nomeArquivo = this.arquivo.getNomeArquivo();

		if(nomeArquivo.endsWith(".png")){
			response.setContentType("application/png");
		}else if(nomeArquivo.endsWith(".jpeg")){
			response.setContentType("application/jpeg");
		}else if(nomeArquivo.endsWith(".jpg")){
			response.setContentType("application/jpg");
		}else if(nomeArquivo.endsWith(".bmp")){
			response.setContentType("application/bmp");
		}else if(nomeArquivo.endsWith(".gif")){
			response.setContentType("application/gif");
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

	public void editarDiagnostico(DiagnosticoProfessor diagnostico){

		this.diagnostico = diagnostico;
		this.cipeDiagnostico = this.diagnostico.getCipe().getTermo();

		if(this.diagnosticosSelecionados == null){

			this.diagnosticosSelecionados = new ArrayList<>();
		}

		this.diagnosticosSelecionados.remove(diagnostico);
		this.edicaoDiagnostico = true;
		this.diagnosticosDisponiveis = new ArrayList<Cipe>();
		this.diagnosticosDisponiveis.add(this.diagnostico.getCipe());
	}

	public void editarIntervencao(DiagnosticoProfessor diagnostico, MetaProfessor meta, IntervencaoProfessor intervencao){

		this.intervencao = intervencao;
		this.cipeIntervencao = this.intervencao.getCipe().getTermo();

		if(this.intervencoesSelecionadas != null){

			this.intervencoesSelecionadas.remove(intervencao);
		}
	}

	public void editarMeta(DiagnosticoProfessor diagnostico, MetaProfessor meta){

		if(diagnostico.getMetaprofessors().contains(meta)){

			Set<MetaProfessor> metas = diagnostico.getMetaprofessors();
			metas.remove(meta);
			this.metaString = meta.getDescricao();
			diagnostico.setMetaprofessors(metas);
			this.diagnostico = diagnostico;
			this.descricaoDiagnostico = this.diagnostico.getDescricao();
			this.meta = meta;
			this.edicaoMeta = true;
		}
	}

	public void excluirDiagnostico(DiagnosticoProfessor diagnostico){

		if(this.diagnosticosSelecionados != null){

			this.diagnosticosSelecionados.remove(diagnostico);
		}
	}

	public void excluirIntervencao(DiagnosticoProfessor diagnostico, MetaProfessor meta, IntervencaoProfessor intervencao){

		int indiceDiagnostico = this.diagnosticosSelecionados.lastIndexOf(diagnostico);
		Set<MetaProfessor> metas = diagnostico.getMetaprofessors();
		Set<IntervencaoProfessor> intervencoes;
		if(meta != null){
			metas.remove(meta);
			intervencoes = meta.getIntervencaoprofessors();
			if(intervencoes != null){

				intervencoes.remove(intervencao);
			}
			meta.setIntervencaoprofessors(intervencoes);
			metas.add(meta);

		}else{
			metas.remove(this.meta);
			intervencoes = this.meta.getIntervencaoprofessors();
			if(intervencoes != null){

				intervencoes.remove(intervencao);
			}
			this.meta.setIntervencaoprofessors(intervencoes);
			metas.add(this.meta);
		}

		diagnostico.setMetaprofessors(metas);
		this.diagnosticosSelecionados.set(indiceDiagnostico, diagnostico);
	}

	public void excluirMeta(DiagnosticoProfessor diagnostico, MetaProfessor meta){

		if(diagnostico.getMetaprofessors().contains(meta)){

			Set<MetaProfessor> metas = diagnostico.getMetaprofessors();
			metas.remove(meta);
			diagnostico.setMetaprofessors(metas);

		}
	}

	/**
	 * @return the arquivo
	 */
	public Arquivo getArquivo() {
		return arquivo;
	}

	public String getCipeDiagnostico() {
		return cipeDiagnostico;
	}

	public String getCipeIntervencao() {

		if(cipeIntervencao == null){
			cipeIntervencao = "";
		}

		return cipeIntervencao;
	}

	public List<CompetenciaHabilidadeEspecifica> getCompetenciaHabilidadeEspecificaSelecionadas() {
		return competenciasHabilidadesEspecificasSelecionadas;
	}


	public List<CompetenciaHabilidadeGeral> getCompetenciaHabilidadeGeralDisponiveis() {
		if(this.competenciasHabilidadesGeraisDisponiveis == null){
			this.competenciasHabilidadesGeraisDisponiveis = fachada.listarCompetenciaHabilidadeGeral();
		}
		return competenciasHabilidadesGeraisDisponiveis;
	}

	public List<CompetenciaHabilidadeGeral> getCompetenciaHabilidadeGeralSelecionadas() {
		return competenciasHabilidadesGeraisSelecionadas;
	}

	public List<CompetenciaHabilidadeEspecifica> getCompetenciasHabilidadeEspecificasDisponiveis() {

		if(this.competenciasHabilidadeEspecificasDisponiveis == null){
			this.competenciasHabilidadeEspecificasDisponiveis = fachada.listarCompetenciaHabilidadeEspecifica();
		}
		return competenciasHabilidadeEspecificasDisponiveis;
	}

	public Curso getCurso() {
		return curso;
	}

	public List<Curso> getCursos() {
		return cursos;
	}

	public Curso getCursoSelecionado(){
		Curso temp = null;

		return temp;
	}

	/**
	 * @return the descritoresDisponiveis
	 */
	public List<Descritor> getDescritoresDisponiveis() {
		
		if(this.descritoresDisponiveis == null 
				|| (this.descritoresDisponiveis != null && this.descritoresDisponiveis.size()<1)){
			this.descritoresDisponiveis = fachada.listarDescritores();
		}
		
		return descritoresDisponiveis;
	}

	/**
	 * @return the descritoresSelecionados
	 */
	public List<Descritor> getDescritoresSelecionados() {
		return descritoresSelecionados;
	}

	/*
	 * Codigo abaixo e para manipulacao dos diagnosticos do estudo de caso
	 */

	public DiagnosticoProfessor getDiagnostico() {

		if(this.diagnostico == null){

			this.diagnostico = new DiagnosticoProfessor();
		}

		return diagnostico;
	}

	public List<Cipe> getDiagnosticosDisponiveis() {

		this.diagnosticosDisponiveis = fachada.listarTodaCipeEixoDiagnostico();

		return diagnosticosDisponiveis;
	}

	public List<Cipe> getDiagnosticosDisponiveis(String entrada) {

		this.diagnosticosDisponiveis = fachada.listarCipeEixoDiagnosticoPorNome(entrada);

		return diagnosticosDisponiveis;
	}

	public DiagnosticoProfessor getDiagnosticoSelecionadoMeta() {
		return diagnosticoSelecionadoMeta;
	}

	public List<DiagnosticoProfessor> getDiagnosticosSelecionados() {
		return diagnosticosSelecionados;
	}

	public EstudoCaso getEstudo() {

		if(this.estudo == null){
			this.estudo = new EstudoCaso();
		}

		return estudo;
	}

	public IntervencaoProfessor getIntervencao() {

		if(this.intervencao == null){

			this.intervencao = new IntervencaoProfessor();
		}

		return intervencao;
	}

	public List<Cipe> getIntervencoesDisponiveis() {

		return intervencoesDisponiveis;
	}

	public List<Cipe> getIntervencoesDisponiveis(String parametro) {

		this.intervencoesDisponiveis = fachada.listarCipeEixoIntervencaoPorNome(parametro);

		return intervencoesDisponiveis;
	}

	public List<IntervencaoProfessor> getIntervencoesSelecionadas() {

		return intervencoesSelecionadas;
	}

	public MetaProfessor getMeta() {

		if(this.meta == null){

			this.meta = new MetaProfessor();
		}

		return meta;
	}

	public MetaProfessor getMetaSelecionadaIntervencao() {
		return metaSelecionadaIntervencao;
	}

	public List<MetaProfessor> getMetasSelecionadas() {
		return metasSelecionadas;
	}

	/*
	 * Codigo abaixo e para manipulacao das metas do estudo de caso
	 */

	public String getMetaString() {
		return metaString;
	}

	public Professor getProfessorLogado() {
		return professorLogado;
	}

	public boolean isEdicao() {
		return edicao;
	}

	public void limparCampos(){

		setCompetenciasHabilidadeEspecificasDisponiveis(null);
		setCompetenciaHabilidadeEspecificaSelecionadas(null);
		setCompetenciaHabilidadeGeralDisponiveis(null);
		setCompetenciaHabilidadeGeralSelecionadas(null);

		setDiagnosticosSelecionados(new ArrayList<DiagnosticoProfessor>());

		setDiagnostico(new DiagnosticoProfessor());
		setMeta(new MetaProfessor());
		setIntervencao(new IntervencaoProfessor());

		this.arquivo = null;
		this.estudo = null;
	}

	public void prepararAdicionarMeta(DiagnosticoProfessor diagnostico){

		this.descricaoDiagnostico = diagnostico.getDescricao();
		this.diagnostico = diagnostico;
	}

	@SuppressWarnings("static-access")
	public boolean salvarEstudo(){

		boolean retorno = false;

		try{
			if(!this.estudo.getNome().equalsIgnoreCase("")&&
					!this.estudo.getDescricao().equalsIgnoreCase("")	&&
					!this.estudo.getObjetivosEspecificos().equalsIgnoreCase("")&&
					!this.estudo.getObjetivosGerais().equalsIgnoreCase("")&&
					(this.competenciasHabilidadesEspecificasSelecionadas != null && this.competenciasHabilidadesEspecificasSelecionadas.size() > 0) &&
					(this.competenciasHabilidadesGeraisSelecionadas != null && this.competenciasHabilidadesGeraisSelecionadas.size() > 0)) 
			{
				this.estudo.setCompetenciashabilidadesespecificas
				(new HashSet<>(this.competenciasHabilidadesEspecificasSelecionadas));
				this.estudo.setCompetenciashabilidadesgerais
				(new HashSet<>(this.competenciasHabilidadesGeraisSelecionadas));
				this.estudo.setCurso(this.curso);
				this.estudo.setResponsavel(this.professorLogado.getUsuario().getNome());
				this.estudo.setDiagnosticoprofessors(new HashSet<>(this.diagnosticosSelecionados));
				
				this.estudo.setDescritors(new HashSet<>(descritoresSelecionados));
				this.fachada.salvarEstudoCaso(this.estudo, this.arquivo);

				limparCampos();
				retorno = true;
			}
			else{
				FacesContext.getCurrentInstance().addMessage("form_Principal", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.CRIAR_CASO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO)); 
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}

		return retorno;
	}

	/**
	 * @param arquivo the arquivo to set
	 */
	public void setArquivo(Arquivo arquivo) {
		this.arquivo = arquivo;
	}

	public void setCipeDiagnostico(String cipeDiagnostico) {
		this.cipeDiagnostico = cipeDiagnostico;
	}

	public void setCipeIntervencao(String cipeIntervencao) {
		this.cipeIntervencao = cipeIntervencao;
	}

	public void setCompetenciaHabilidadeEspecificaSelecionadas(List<CompetenciaHabilidadeEspecifica> compEspecSelecionadas) {
		this.competenciasHabilidadesEspecificasSelecionadas = compEspecSelecionadas;
	}

	public void setCompetenciaHabilidadeGeralDisponiveis(List<CompetenciaHabilidadeGeral> compGeraisDisponiveis) {
		this.competenciasHabilidadesGeraisDisponiveis = compGeraisDisponiveis;
	}

	public void setCompetenciaHabilidadeGeralSelecionadas(List<CompetenciaHabilidadeGeral> compGeraisSelecionadas) {
		this.competenciasHabilidadesGeraisSelecionadas = compGeraisSelecionadas;
	}

	public void setCompetenciasHabilidadeEspecificasDisponiveis(List<CompetenciaHabilidadeEspecifica> competenciasHabilidadesEspecificasDisponiveis) {
		this.competenciasHabilidadeEspecificasDisponiveis = competenciasHabilidadesEspecificasDisponiveis;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	/*
	 * Codigo abaixo e para manipulacao das intervencoes do estudo de caso
	 */

	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}

	/**
	 * @param e indicates the value change
	 */
	public void setCursoSelecionado(ValueChangeEvent e) {

		Iterator<Curso> iterador = this.cursos.iterator();
		boolean achou = false;

		Curso temp = null;
		int id = Integer.parseInt((String)e.getNewValue());

		while(iterador.hasNext() && !achou){

			temp = iterador.next();
			if(temp.getId()== id){
				achou = true;
			}
		}
		setCurso(temp);
	}

	/**
	 * @param descritoresDisponiveis the descritoresDisponiveis to set
	 */
	public void setDescritoresDisponiveis(List<Descritor> descritoresDisponiveis) {
		this.descritoresDisponiveis = descritoresDisponiveis;
	}

	/**
	 * @param descritoresSelecionados the descritoresSelecionados to set
	 */
	public void setDescritoresSelecionados(List<Descritor> descritoresSelecionados) {
		this.descritoresSelecionados = descritoresSelecionados;
	}

	public void setDiagnostico(DiagnosticoProfessor diagnostico) {
		this.diagnostico = diagnostico;
	}

	public void setDiagnosticosDisponiveis(List<Cipe> diagnosticosDisponiveis) {
		this.diagnosticosDisponiveis = diagnosticosDisponiveis;
	}

	public void setDiagnosticoSelecionadoMeta(DiagnosticoProfessor diagnosticoSelecionadoMeta) {
		this.diagnosticoSelecionadoMeta = diagnosticoSelecionadoMeta;
	}

	public void setDiagnosticoSelecionadoMeta(ValueChangeEvent e) {

		boolean achou = false;

		String descricao = (String)e.getNewValue();

		for (Iterator<DiagnosticoProfessor> iterator = this.diagnosticosSelecionados.iterator(); (iterator.hasNext()&& !achou);) {

			DiagnosticoProfessor diagnostico = (DiagnosticoProfessor) iterator.next();

			if(diagnostico.getDescricao().equalsIgnoreCase(descricao)){

				this.diagnosticoSelecionadoMeta = diagnostico;
			}
		}
	}

	public void setDiagnosticosSelecionados(List<DiagnosticoProfessor> diagnosticosSelecionados) {
		this.diagnosticosSelecionados = diagnosticosSelecionados;
	}

	public void setEdicao(boolean edicao) {
		this.edicao = edicao;
	}

	public void setEstudo(EstudoCaso estudo) {
		this.estudo = estudo;
	}

	public void setIntervencao(IntervencaoProfessor intervencao) {
		this.intervencao = intervencao;
	}

	public void setIntervencoesDisponiveis(List<Cipe> intervencoesDisponiveis) {
		this.intervencoesDisponiveis = intervencoesDisponiveis;
	}

	public void setIntervencoesSelecionadas(List<IntervencaoProfessor> intervencoesSelecionadas) {
		this.intervencoesSelecionadas = intervencoesSelecionadas;
	}

	public void setMeta(MetaProfessor metas) {
		this.meta = metas;
	}

	public void setMetaSelecionadaIntervencao(MetaProfessor metaSelecionadaIntervencao) {
		this.metaSelecionadaIntervencao = metaSelecionadaIntervencao;
	}

	public void setMetasSelecionadas(List<MetaProfessor> metasSelecionadas) {
		this.metasSelecionadas = metasSelecionadas;
	}

	public void setMetaString(String metaString) {
		this.metaString = metaString;
	}

	public void setProfessorLogado(Professor professorLogado) {
		this.professorLogado = professorLogado;
	}

	public void uploadListener(FileUploadEvent evento) throws Exception{

		UploadedFile temp = evento.getUploadedFile();

		if(this.arquivo == null){
			this.arquivo = new Arquivo();
		}
		this.arquivo.setArquivo(temp.getData());

		this.arquivo.setNomeArquivo(Arquivo.adaptaString(temp.getName()));
		this.arquivo.setTipoArquivo(Define.ARQUIVO_TIPO_IMAGEM_ESTUDO_CASO);
	}
}