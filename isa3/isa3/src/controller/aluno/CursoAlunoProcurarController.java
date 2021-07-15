package controller.aluno;


import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.servlet.http.HttpSession;

import fachada.Fachada;
import model.curso.Curso;
import model.curso.matricula.MatriculaCursoAluno;
import model.usuario.Aluno;

@ManagedBean(name = "cursoAlunoProcurarController")
@SessionScoped
public class CursoAlunoProcurarController {

    private Curso curso;
    private DataModel<MatriculaCursoAluno> listaMatriculaCursoAluno;
    private DataModel<Curso> listaCursosDisponiveis;

    public DataModel<Curso> getListarCursoDisponiveis() {
    	
		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    	Aluno aluno = (Aluno)sessao.getAttribute("usuarioLogado");
    	List<MatriculaCursoAluno> matriculas = Fachada.getInstancia().getTodasMatriculasAluno(aluno);
    	
		List<Curso> cursos = Fachada.getInstancia().getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(matriculas);
		
        listaCursosDisponiveis = new ListDataModel<Curso>(cursos);
        
        return listaCursosDisponiveis;
    }
    
    public DataModel<MatriculaCursoAluno> getListarMatriculaCursoAluno() {
    	
    	HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);

    	Aluno aluno = (Aluno)sessao.getAttribute("usuarioLogado");
		List<MatriculaCursoAluno> matriculas = Fachada.getInstancia().getTodasMatriculasAluno(aluno);
		
		listaMatriculaCursoAluno = new ListDataModel<MatriculaCursoAluno>(matriculas);
        
        return listaMatriculaCursoAluno;
    }
    
	public String fazerMatricula(){
		
		try{
			HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);

			Aluno aluno = (Aluno)sessao.getAttribute("usuarioLogado");
			
			Curso cursoSelecionado = (Curso)(listaCursosDisponiveis.getRowData());

			List<Curso> cursosList = new ArrayList<Curso>();
			cursosList.add(cursoSelecionado);
			Fachada.getInstancia().matricularAlunoCursos(aluno, cursosList);
			
			List<MatriculaCursoAluno> matriculas = Fachada.getInstancia().getTodasMatriculasAluno(aluno);
			listaMatriculaCursoAluno = new ListDataModel<MatriculaCursoAluno>(matriculas);
			
			List<Curso> cursos = Fachada.getInstancia().getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(matriculas);
	        listaCursosDisponiveis = new ListDataModel<Curso>(cursos);
			
	        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info:", "Curso Matriculado com Sucesso!"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "cursoAlunoProcurar";
	}


	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	
}
