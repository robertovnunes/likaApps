package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import fachada.Fachada;
import model.curso.matricula.arcomaguerez.HyperLink;

@ManagedBean(name = "hyperLinkProcurarController")
@SessionScoped
public class HyperLinkProcurarController {

    private HyperLink HyperLink;
    private DataModel<HyperLink> listaHyperLinks;

    public DataModel<HyperLink> getListarHyperLink() {
        List<HyperLink> lista = Fachada.getInstancia().getTodosHyperLinks();
        listaHyperLinks = new ListDataModel<HyperLink>(lista);
        return listaHyperLinks;
    }

	public HyperLink getHyperLink() {
		return HyperLink;
	}

	public void setHyperLink(HyperLink HyperLink) {
		this.HyperLink = HyperLink;
	}

	 public void excluirHyperLink(){
        try{
        	HyperLink HyperLinkTemp = (HyperLink)(listaHyperLinks.getRowData());
        	Fachada.getInstancia().removerHyperLink(HyperLinkTemp);
        	Fachada.getInstancia().atualizar();
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "HyperLink Excluído com sucesso!"));
		}catch(Exception exception){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, null, "O HyperLink selecionado não pode ser removido, pois está sendo utilizado por outra entidade!"));
		}
    }
	 
	
}
