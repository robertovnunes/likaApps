package controller.aluno;


import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.servlet.http.HttpSession;

import fachada.Fachada;
import model.curso.EstudoDeCaso;
import model.curso.matricula.MatriculaCursoAluno;

@ManagedBean(name = "matriculaEstudosDeCasoAlunoController")
@SessionScoped
public class MatriculaEstudosDeCasoAlunoController {

    private MatriculaCursoAluno matricula;
    private DataModel<EstudoDeCaso> listaEstudoDeCaso;
    
    public String preparaListarEstudosDeCasoCurso(){
    	try {
    		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    		sessao.setAttribute("matricula", matricula);
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/estudosdecaso_listar.xhtml");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "matriculaEstudosDeCasoAlunoController";
    }

    public DataModel<EstudoDeCaso> getListarEstudoDeCaso() {
    	
		try {
			List<EstudoDeCaso> estudosCasos = matricula.getCurso().getEstudosDeCaso();
			listaEstudoDeCaso = new ListDataModel<EstudoDeCaso>(estudosCasos);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return listaEstudoDeCaso;
    }
  
	public MatriculaCursoAluno getMatricula() {
		return matricula;
	}

	public void setMatricula(MatriculaCursoAluno matricula) {
		this.matricula = matricula;
	}

	
}
