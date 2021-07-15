package controller.aluno;


import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import model.curso.matricula.MatriculaCursoAluno;

@ManagedBean(name = "cursoDetalhesAlunoController")
@SessionScoped
public class CursoDetalhesAlunoController {

    private MatriculaCursoAluno matricula;
    
    public String preparaTelaDetalhesCurso(){
    	try {
    		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    		sessao.setAttribute("matricula", matricula);
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/curso_detalhes.xhtml");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "matriculaEstudosDeCasoAlunoController";
    }
  
	public MatriculaCursoAluno getMatricula() {
		return matricula;
	}

	public void setMatricula(MatriculaCursoAluno matricula) {
		this.matricula = matricula;
	}

	
}
