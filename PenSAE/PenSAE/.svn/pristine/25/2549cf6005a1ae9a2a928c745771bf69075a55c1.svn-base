/**
 * 
 */
package managedBeans.professor.curso;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Curso;
import model.Professor;
import fachada.Fachada;

/**
 * @author Jesus, Tiago
 *
 */
@ManagedBean(name="listaCursos")
@ViewScoped
public class ListaCursosBean {
	
	private static Fachada fachada;
	
	private List<Curso> cursos;
	private Professor professorLogado;

	public ListaCursosBean(){

		fachada = Fachada.getInstance();
	}

	public void carregarCursos(){
		
		if(this.professorLogado != null){
			this.cursos = fachada.listarCursosPorProfessor(this.professorLogado);
		}
		
	}

	public void carregarCursos(Professor p){
		
		this.setProfessorLogado(p);
		
		this.carregarCursos();
	}

	public void excluirCurso(int cursoId){
		fachada.excluirCurso(cursoId);
	}

	/**
	 * @return the usuarioLogado
	 */
	public List<Curso> getCursos() {
		return cursos;
	}
	
	/**
	 * @return the professorLogado
	 */
	public Professor getProfessorLogado() {
		return professorLogado;
	}
	
	public String mensagemConfirmacao(int cursoId){
		int quantidadeCasos = 0;
		quantidadeCasos = fachada.getQuantidadeCasosPorCurso(cursoId);
		String msg = "Existem " + quantidadeCasos + " casos associados a este curso."
				+ " Delete os estudos de caso desse curso antes de exclui-lo.";		
		return msg;
	}
	
	public boolean confirmacaoDelecao(int cursoId){
		int quantidadeCasos = 0;
		quantidadeCasos = fachada.getQuantidadeCasosPorCurso(cursoId);		
		return (quantidadeCasos > 0);
	}
	
	/**
	 * @param cursos the usuarioLogado to set
	 */
	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}
	
	/**
	 * @param professorLogado the usuarioLogado to set
	 */
	public void setProfessorLogado(Professor professorLogado) {
		this.professorLogado = professorLogado;
	}
}
