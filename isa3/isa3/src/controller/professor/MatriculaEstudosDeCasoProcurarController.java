package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import fachada.Fachada;
import model.curso.matricula.MatriculaCursoAluno;

@ManagedBean(name = "matriculaEstudosDeCasoProcurarController")
@SessionScoped
public class MatriculaEstudosDeCasoProcurarController {

    private MatriculaCursoAluno matriculaCursoAluno;
    private DataModel<MatriculaCursoAluno> listaMatriculaCursoAlunos;

    public DataModel<MatriculaCursoAluno> getListarMatriculaCursoAluno() {
        List<MatriculaCursoAluno> lista = Fachada.getInstancia().getTodosMatriculaCursoAlunos();
        listaMatriculaCursoAlunos = new ListDataModel<MatriculaCursoAluno>(lista);
        return listaMatriculaCursoAlunos;
    }

	public MatriculaCursoAluno getMatriculaCursoAluno() {
		return matriculaCursoAluno;
	}

	public void setMatriculaCursoAluno(MatriculaCursoAluno MatriculaCursoAluno) {
		this.matriculaCursoAluno = MatriculaCursoAluno;
	}

	public String visualizarPerguntas(MatriculaCursoAluno matriculaCursoAluno){
	
		try{
			setMatriculaCursoAluno(matriculaCursoAluno);
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "matriculaEstudosDeCasoProcurar";
	}
	
}
