package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import fachada.Fachada;
import model.curso.Curso;
import model.curso.EstudoDeCaso;

@ManagedBean(name = "cursoProfessorProcurarController")
@SessionScoped
public class CursoProfessorProcurarController {

    private Curso curso;
    private DataModel<Curso> listaCursos;
    private DataModel<EstudoDeCaso> listaEstudosDeCaso;
    private EstudoDeCaso estudoDeCaso;

    public DataModel<Curso> getListarCurso() {
    	
		List<Curso> cursos = Fachada.getInstancia().getTodosCursos();
        listaCursos = new ListDataModel<Curso>(cursos);
        
        return listaCursos;
    }
    
    public DataModel<EstudoDeCaso> getListarEstudosDeCaso() {
    	
    	if(curso != null && curso.getId() != 0){
    		List<EstudoDeCaso> estudosDeCaso = curso.getEstudosDeCaso();
    		listaEstudosDeCaso = new ListDataModel<EstudoDeCaso>(estudosDeCaso);
    	}else{
    		listaEstudosDeCaso = new ListDataModel<EstudoDeCaso>();
    	}
        
        return listaEstudosDeCaso;
    }
    
    public String preparaTelaVisualizarEstudosDeCaso(){
    	
    	try{
    		if(curso != null && curso.getId() != 0){
        		List<EstudoDeCaso> estudosDeCaso = curso.getEstudosDeCaso();
        		listaEstudosDeCaso = new ListDataModel<EstudoDeCaso>(estudosDeCaso);
        	}else{
        		listaEstudosDeCaso = new ListDataModel<EstudoDeCaso>();
        	}
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    	
    	return "cursoProfessorProcurarController";
    }
    
    public void excluirCurso(){
        try{
        	Curso cursoTemp = (Curso)(listaCursos.getRowData());
        	Fachada.getInstancia().removerCurso(cursoTemp);
        	Fachada.getInstancia().atualizar();
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Curso Excluído com sucesso!"));
		}catch(Exception exception){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, null, "O curso selecionado não pode ser removido, pois está sendo utilizado por outra entidade!"));
		}
    }
    
    
    public void excluirEstudoDeCaso(){
        try{
        	EstudoDeCaso estudoDeCasoTemp = (EstudoDeCaso)(listaEstudosDeCaso.getRowData());
        	Fachada.getInstancia().removerEstudoDeCaso(estudoDeCasoTemp);
        	Fachada.getInstancia().atualizar();
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Estudo De Caso Excluído com sucesso!"));
		}catch(Exception exception){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, null, "O Estudo D eCaso selecionado não pode ser removido, pois está sendo utilizado por outra entidade!"));
		}
    }

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public EstudoDeCaso getEstudoDeCaso() {
		return estudoDeCaso;
	}

	public void setEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		this.estudoDeCaso = estudoDeCaso;
	}

	
}
