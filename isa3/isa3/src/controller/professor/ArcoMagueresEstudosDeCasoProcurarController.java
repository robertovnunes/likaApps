package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import fachada.Fachada;
import model.curso.matricula.AvaliacaoProfessor;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;

@ManagedBean(name = "arcoMagueresEstudosDeCasoProcurarController")
@SessionScoped
public class ArcoMagueresEstudosDeCasoProcurarController {

    private ArcoMaguerezEstudoDeCaso arcoMaguerez;
    private DataModel<ArcoMaguerezEstudoDeCaso> listaArcoMaguerezEstudoDeCaso;

    public DataModel<ArcoMaguerezEstudoDeCaso> getListarArcoMaguerezEstudoDeCaso() {
        List<ArcoMaguerezEstudoDeCaso> lista = Fachada.getInstancia().getTodasArcoMaguerez();
        listaArcoMaguerezEstudoDeCaso = new ListDataModel<ArcoMaguerezEstudoDeCaso>(lista);
        return listaArcoMaguerezEstudoDeCaso;
    }

	public String darNotaEstudoDeCaso(ArcoMaguerezEstudoDeCaso arcoMaguerez){
		try{
			if(arcoMaguerez.getPlanejamento().getAvaliacaoProfessor() == null){
				arcoMaguerez.getPlanejamento().setAvaliacaoProfessor(new AvaliacaoProfessor());
				Fachada.getInstancia().atualizarPlanejamento(arcoMaguerez.getPlanejamento());
			}
			if(arcoMaguerez.getImplementacao().getAvaliacaoProfessor() == null){
				arcoMaguerez.getImplementacao().setAvaliacaoProfessor(new AvaliacaoProfessor());
				Fachada.getInstancia().atualizarImplementacao(arcoMaguerez.getImplementacao());
			}
			if(arcoMaguerez.getResultadosEsperados().getAvaliacaoProfessor() == null){
				arcoMaguerez.getResultadosEsperados().setAvaliacaoProfessor(new AvaliacaoProfessor());
				Fachada.getInstancia().atualizarResultadosEsperados(arcoMaguerez.getResultadosEsperados());
			}
			setArcoMaguerez(arcoMaguerez);
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "arcoMagueresEstudosDeCasoProcurar";
	}
	
	public String visualizarArcoEstudoCaso(ArcoMaguerezEstudoDeCaso arcoMaguerez){
		try{
			setArcoMaguerez(arcoMaguerez);
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "arcoMagueresEstudosDeCasoProcurar";
	}
	
	public String salvarNotas(){
		try{
			Fachada.getInstancia().atualizarArcoMaguerez(arcoMaguerez);
			setArcoMaguerez(new ArcoMaguerezEstudoDeCaso());
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Notas Salvas com sucesso!"));
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "arcoMagueresEstudosDeCasoProcurar";
	}

	public ArcoMaguerezEstudoDeCaso getArcoMaguerez() {
		return arcoMaguerez;
	}

	public void setArcoMaguerez(ArcoMaguerezEstudoDeCaso arcoMaguerez) {
		this.arcoMaguerez = arcoMaguerez;
	}
	
}
