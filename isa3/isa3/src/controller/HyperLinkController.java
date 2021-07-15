package controller;


import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import fachada.Fachada;

import model.curso.matricula.arcomaguerez.HyperLink;

@ManagedBean(name = "hyperLinkController")
@SessionScoped
public class HyperLinkController {
	
	public HyperLink hyperlink;

	public HyperLinkController(){
		
	}
	
	
	@PostConstruct
	public void init(){
		String idHyperlink = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("idHyperlink");
		if(idHyperlink != null && !idHyperlink.equals("")){
			hyperlink = Fachada.getInstancia().getHyperLinkPorId(Integer.parseInt(idHyperlink));
		}
	}

	public HyperLink getHyperlink() {
		return hyperlink;
	}


	public void setHyperlink(HyperLink hyperlink) {
		this.hyperlink = hyperlink;
	}
}
