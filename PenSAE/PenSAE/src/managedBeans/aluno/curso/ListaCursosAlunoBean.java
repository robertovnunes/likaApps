package managedBeans.aluno.curso;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;

import model.Arquivo;
import model.Curso;
import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="listaCursosAluno")
@SessionScoped
public class ListaCursosAlunoBean {

	private static Fachada fachada;

	private List<Curso> cursosMatriculados;

	private List<Curso> cursosNaoMatriculados;
	private boolean mostrarMatricula = false;
	
	private Arquivo programacaoCurso;
	
	private Usuario usuarioLogado;
	
	public ListaCursosAlunoBean(){
		
		fachada = Fachada.getInstance();
	}

	public void carregarProgramacaoCurso(int idCurso){

		this.programacaoCurso = fachada.getArquivoCurso(idCurso, Define.ARQUIVO_TIPO_PROGRAMACAO_CURSO);
	}

	public void downloadArquivo(){

		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();

		response.reset();

		String nomeArquivo = this.programacaoCurso.getNomeArquivo();

		if(nomeArquivo.endsWith(".pdf")){
			response.setContentType("application/pdf");
		}else if(nomeArquivo.endsWith(".docx")){
			response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		}else{
			response.setContentType("application/msword");
		}

		response.setHeader("Content-disposition", "attachment; filename=" + this.programacaoCurso.getNomeArquivo());

		try {
			OutputStream output = response.getOutputStream();
			output.write(this.programacaoCurso.getArquivo());
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		context.responseComplete();
	}
	
	/**
	 * @return the curso
	 */
	public List<Curso> getCursosMatriculados() {
		return cursosMatriculados;
	}
	
	public List<Curso> getCursosNaoMatriculados() {
		return cursosNaoMatriculados;
	}
	
	public Arquivo getProgramacaoCurso() {
		return programacaoCurso;
	}
	
	public boolean isButtonSelecionarDisabled(Curso cursoSelecionado, Curso curso){
		return (cursoSelecionado != null && curso.getId() == cursoSelecionado.getId());
	}
	
	public boolean isMostrarMatricula() {
		return mostrarMatricula;
	}
	
	public void listarCursosPorAluno(Usuario usuario){

		this.usuarioLogado = usuario;
		
		if(this.usuarioLogado != null){
			this.cursosMatriculados = fachada.listarCursosPorAluno(this.usuarioLogado);
			this.cursosNaoMatriculados = fachada.listarCursosNaoMatriculadosPorAluno(this.usuarioLogado);
		}

	}
	
	public void matricularCurso(Curso aMatricular){
		this.cursosNaoMatriculados.remove(aMatricular);
		this.cursosMatriculados.add(aMatricular);
		if(this.cursosMatriculados.contains(aMatricular)){
		}
	}

	/**
	 * @param cursos the usuarioLogado to set
	 */
	public void setCursosMatriculados(List<Curso> cursosMatriculados) {
		this.cursosMatriculados = cursosMatriculados;
	}

	public void setCursosNaoMatriculados(List<Curso> cursosNaoMatriculados) {
		this.cursosNaoMatriculados = cursosNaoMatriculados;
	}

	public void setMostrarMatricula(boolean mostrarMatricula) {
		this.mostrarMatricula = mostrarMatricula;
	}

	public void setProgramacaoCurso(Arquivo programacaoCurso) {
		this.programacaoCurso = programacaoCurso;
	}
}
