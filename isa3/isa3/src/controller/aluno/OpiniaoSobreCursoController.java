package controller.aluno;


import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import fachada.Fachada;
import model.curso.matricula.MatriculaCursoAluno;

@ManagedBean(name = "opiniaoSobreCursoController")
@SessionScoped
public class OpiniaoSobreCursoController {

    private MatriculaCursoAluno matricula;
    
    public String prepararVisualizarOpiniaoCurso(){
    	try{
    		if(matricula == null){
    			HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    			matricula = (MatriculaCursoAluno)sessao.getAttribute("matricula");
    		}
    		FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/opiniao_curso.xhtml");
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
		
    	return "opiniaoSobreCursoController";
    }
    
    public String salvarOpiniao(){
    	try{
    		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    		matricula = (MatriculaCursoAluno)sessao.getAttribute("matricula");
    		Fachada.getInstancia().atualizarMatriculaCursoAluno(matricula);
    		sessao.setAttribute("matricula", matricula);
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Opinião salva com sucesso"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
		
    	return "opiniaoSobreCursoController";
    }

	public MatriculaCursoAluno getMatricula() {
		return matricula;
	}

	public void setMatricula(MatriculaCursoAluno matricula) {
		this.matricula = matricula;
	}



}
