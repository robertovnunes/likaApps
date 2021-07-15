package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import model.curso.EstudoDeCaso;
import fachada.Fachada;

@ManagedBean(name = "estudoDeCasoProcurarController")
@SessionScoped
public class EstudoDeCasoProcurarController {

    private EstudoDeCaso estudoDeCaso;
    private DataModel<EstudoDeCaso> listaEstudoDeCasos;

    public DataModel<EstudoDeCaso> getListarEstudoDeCaso() {
    	
		List<EstudoDeCaso> estudoDeCasos = Fachada.getInstancia().getTodosEstudoDeCaso();
        listaEstudoDeCasos = new ListDataModel<EstudoDeCaso>(estudoDeCasos);
        
        return listaEstudoDeCasos;
    }
    
    
    public void excluirEstudoDeCaso(){
        try{
        	EstudoDeCaso estudoDeCasoTemp = (EstudoDeCaso)(listaEstudoDeCasos.getRowData());
        	Fachada.getInstancia().removerEstudoDeCaso(estudoDeCasoTemp);
        	Fachada.getInstancia().atualizar();
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "EstudoDeCaso Excluído com sucesso!"));
		}catch(Exception exception){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "", "O estudoDeCaso selecionado não pode ser removido, pois está sendo utilizado por outra entidade!"));
		}
    }
    
    
	public EstudoDeCaso getEstudoDeCaso() {
		return estudoDeCaso;
	}

	public void setEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		this.estudoDeCaso = estudoDeCaso;
	}

}
