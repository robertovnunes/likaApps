package managedBeans.professor.curso;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;

import model.Arquivo;
import model.Curso;
import model.Professor;

import org.richfaces.event.FileUploadEvent;
import org.richfaces.model.UploadedFile;

import define.Define;
import fachada.Fachada;

/**
 * @author Jesus, Tiago
 *
 */
@ManagedBean(name="criarEditarCurso")
@ViewScoped
public class CriarEditarCursoBean {

	private static Fachada fachada;

	private Arquivo arquivo;
	private boolean edicao;
	private String ementaCurso;

	private Date fimCurso;
	private int id;
	private Date inicioCurso;
	private String objetivoCurso;
	private Professor professorLogado;
	private String tituloCurso;

	public CriarEditarCursoBean(){

		fachada = Fachada.getInstance();
	}

	public void carregarArquivo(int idCurso, int tipoArquivo){
		this.arquivo = fachada.getArquivoCurso(idCurso, tipoArquivo);

	}

	public void carregarCurso(Curso curso){
		this.setTituloCurso(curso.getNome());
		this.setObjetivoCurso(curso.getObjetivo());
		this.setEmentaCurso(curso.getEmenta());
		this.setInicioCurso(curso.getDataInicio());
		this.setFimCurso(curso.getDataFim());
		this.setId(curso.getId());
		this.setEdicao(true);
		carregarArquivo(curso.getId(), Define.ARQUIVO_TIPO_PROGRAMACAO_CURSO);
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
			FacesContext.getCurrentInstance().addMessage("panel_Titulo", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.MENSAGEM_ERRO_ARQUIVO_FALHA_DOWNLOAD));
		}

		context.responseComplete();
	}

	public Arquivo getArquivo() {
		return arquivo;
	}

	public String getEmentaCurso() {
		return ementaCurso;
	}

	public Date getFimCurso() {
		return fimCurso;
	}

	public int getId() {
		return id;
	}

	public Date getInicioCurso() {
		return inicioCurso;
	}

	public String getObjetivoCurso() {
		return objetivoCurso;
	}

	public Professor getProfessorLogado() {
		return professorLogado;
	}

	public String getTituloCurso() {
		return tituloCurso;
	}

	public boolean isEdicao() {
		return edicao;
	}

	public boolean limparCampos(){
		this.setTituloCurso("");
		this.setObjetivoCurso("");
		this.setEmentaCurso("");
		this.setInicioCurso(null);
		this.setFimCurso(null);
		this.setArquivo(null);
		return true;
	}

	public boolean salvarCurso(){  

		String outcome = "";
		boolean sucesso = false;
		try{
			Curso curso = new Curso();

			curso.setDataInicio(this.inicioCurso);
			curso.setDataFim(this.fimCurso);
			curso.setNome(this.tituloCurso);
			curso.setObjetivo(this.objetivoCurso);
			curso.setEmenta(this.ementaCurso);

			if(!this.tituloCurso.equalsIgnoreCase("") && 
					!this.objetivoCurso.equalsIgnoreCase("") &&
					!this.ementaCurso.equalsIgnoreCase("") &&
					this.inicioCurso != null &&
					this.fimCurso != null &&
					!this.inicioCurso.after(this.fimCurso)){

				if(isEdicao()){
					curso.setId(this.getId());
					outcome = fachada.editarCurso(curso, this.professorLogado, this.arquivo);
					this.setEdicao(false);
				}else{
					outcome = fachada.salvarCurso(curso, this.professorLogado, this.arquivo);					
				}

				if(outcome.equalsIgnoreCase(Define.OUTCOME_CRIAR_CURSO_INFO_FALHA)){	//erro: curso já cadastrado
					FacesContext.getCurrentInstance().addMessage("panel_Titulo", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.CRIAR_CURSO_MENSAGEM_ERRO_CADASTRO_NOME));
				}else{
					sucesso = true;
					this.limparCampos();					
				}

			}else{	//erro: campos incompletos

				FacesContext.getCurrentInstance().addMessage("panel_Titulo", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.CRIAR_CURSO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO)); 
			}


		}catch(Exception e){

			e.printStackTrace();
		}

		return sucesso;
	}

	public void setArquivo(Arquivo arquivo) {
		this.arquivo = arquivo;
	}

	public void setEdicao(boolean edicao) {
		this.edicao = edicao;
	}

	public void setEmentaCurso(String ementaCurso) {
		this.ementaCurso = ementaCurso;
	}

	public void setFimCurso(Date fimCurso) {
		this.fimCurso = fimCurso;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setInicioCurso(Date inicioCurso) {
		this.inicioCurso = inicioCurso;
	}

	public void setObjetivoCurso(String objetivoCurso) {
		this.objetivoCurso = objetivoCurso;
	}

	public void setProfessorLogado(Professor professorLogado) {
		this.professorLogado = professorLogado;
	}

	public void setTituloCurso(String tituloCurso) {
		this.tituloCurso = tituloCurso;
	}

	public void uploadListener(FileUploadEvent evento){

		UploadedFile temp = evento.getUploadedFile();


		if(temp.getSize() > 15995584){
			FacesContext.getCurrentInstance().addMessage("panel_Titulo", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.MENSAGEM_ERRO_ARQUIVO_TAMANHO_EXCEDIDO));
		}else{
			if(this.arquivo == null){
				this.arquivo = new Arquivo();
			}

			this.arquivo.setArquivo(temp.getData());
			this.arquivo.setNomeArquivo(Arquivo.adaptaString(temp.getName()));
			this.arquivo.setTipoArquivo(Define.ARQUIVO_TIPO_PROGRAMACAO_CURSO);

		}
	}

}
