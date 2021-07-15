package controller.aluno;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.servlet.http.HttpSession;

import fachada.Fachada;
import model.curso.matricula.MatriculaCursoAluno;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;

@ManagedBean(name = "feedbackEstudosDeCasoAlunoController")
@SessionScoped
public class FeedbackEstudosDeCasoAlunoController {

    private MatriculaCursoAluno matricula;
    private DataModel<ArcoMaguerezEstudoDeCaso> listaArcoMagueres;
    private ArcoMaguerezEstudoDeCaso arcoDetalhes;
    
    public String preparaVisualizarFeedback(){
    	try {
    		if(matricula == null || matricula.getId() == 0){
    			HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    			matricula = (MatriculaCursoAluno) sessao.getAttribute("matricula");
    		}
    		FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/feedback_estudosdecaso_listar.xhtml");
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "feedbackEstudosDeCasoAlunoController";
    }

    public DataModel<ArcoMaguerezEstudoDeCaso> getListarArcoMaguerezEstudoDeCaso() {
		try {
			List<ArcoMaguerezEstudoDeCaso> listaArcos = Fachada.getInstancia().buscarArcosMaguerezPorCursoEAluno(matricula, matricula.getCurso());
			listaArcoMagueres = new ListDataModel<ArcoMaguerezEstudoDeCaso>(listaArcos);
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
		}
        return listaArcoMagueres;
    }
    
    public String visualizarNotas(){
    	try{
    		
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "feedbackEstudosDeCasoAlunoController";
    }
  
	public MatriculaCursoAluno getMatricula() {
		return matricula;
	}

	public void setMatricula(MatriculaCursoAluno matricula) {
		this.matricula = matricula;
	}

	public ArcoMaguerezEstudoDeCaso getArcoDetalhes() {
		return arcoDetalhes;
	}

	public void setArcoDetalhes(ArcoMaguerezEstudoDeCaso arcoDetalhes) {
		this.arcoDetalhes = arcoDetalhes;
	}

	
}
