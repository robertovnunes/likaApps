package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import lika.model.AreaDePesquisa;
import lika.model.BolsistaProjeto;
import lika.model.Projeto;
import lika.model.SubAreaDePesquisa;
import lika.model.Usuario;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("areaHandler")
@Scope("session")
public class AreaHandler {

	private String parametroConsulta = "";

	private AreaDePesquisa areaDePesquisaAtual = new AreaDePesquisa();

	private SubAreaDePesquisa subAreaDePesusquisaAtual = new SubAreaDePesquisa();

	private List<SubAreaDePesquisa> subAreas = new ArrayList<SubAreaDePesquisa>();

	private List<AreaDePesquisa> areas = new ArrayList<AreaDePesquisa>();

	private NavigationHandler navigation;

	private Usuario user;

	public void adicionarGrandeArea(ActionEvent event) {
		

		AreaDePesquisa area = (AreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		boolean contains = false;
		for (AreaDePesquisa p : this.subAreaDePesusquisaAtual
				.getGrandesAreasDePesquisas()) {
			Integer pId = p.getIdAreaDePesquisa();
			Integer areaId = area.getIdAreaDePesquisa();
			if (pId.equals(areaId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.subAreaDePesusquisaAtual.getGrandesAreasDePesquisas()
					.add(area);
		}
	}

	public void removerGrandeArea(ActionEvent event) {
		AreaDePesquisa p = (AreaDePesquisa) event.getComponent()
				.getAttributes().get("area");

		this.subAreaDePesusquisaAtual.getGrandesAreasDePesquisas().remove(p);

	}

	public SubAreaDePesquisa getSubAreaDePesusquisaAtual() {
		return subAreaDePesusquisaAtual;
	}

	public void setSubAreaDePesusquisaAtual(
			SubAreaDePesquisa subAreaDePesusquisaAtual) {
		this.subAreaDePesusquisaAtual = subAreaDePesusquisaAtual;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public void novaArea(ActionEvent event) {
		this.areaDePesquisaAtual = new AreaDePesquisa();

	}

	public void novaSubArea(ActionEvent event) {
		this.subAreaDePesusquisaAtual = new SubAreaDePesquisa();

	}

	public void carregarSubArea(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idSubArea");

		SubAreaDePesquisa p = new SubAreaDePesquisa();
		p.setIdSubAreaDePesquisa(id);
		this.subAreaDePesusquisaAtual = DaoHandler.getInstance()
				.getSubAreaDao().carregar(p);
	}

	public void carregarArea(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idArea");

		AreaDePesquisa p = new AreaDePesquisa();
		p.setIdAreaDePesquisa(id);
		this.areaDePesquisaAtual = DaoHandler.getInstance().getAreaDao()
				.carregar(p);

	}

	public String salvarArea() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			this.areaDePesquisaAtual.setUsuarioAtualizou(this.user);
			this.areaDePesquisaAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getAreaDao().salvar(
					this.areaDePesquisaAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Área de Pesquisa " + this.areaDePesquisaAtual.getNome()
							+ " salva com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar a área de Pesquisa "
							+ e.getMessage(), ""));

			return this.navigation.editarArea();
		}

		return this.navigation.visualizarArea();
	}

	public String salvarSubArea() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			this.subAreaDePesusquisaAtual.setUsuarioAtualizou(this.user);
			this.subAreaDePesusquisaAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getSubAreaDao().salvar(
					this.subAreaDePesusquisaAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Sub área de Pesquisa "
							+ this.subAreaDePesusquisaAtual.getNome()
							+ " salva com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar a Sub área de Pesquisa "
							+ e.getMessage(), ""));

			return this.navigation.editarSubArea();
		}

		return this.navigation.visualizarSubArea();
	}

	public String cancelarSubArea() {
		if (this.subAreaDePesusquisaAtual.getIdSubAreaDePesquisa() == null) {
			return "pesquisarSubArea";
		} else {
			return null;
		}
	}

	public String cancelar() {
		if (this.areaDePesquisaAtual.getIdAreaDePesquisa() == null) {
			return "pesquisarArea";
		} else {
			return null;
		}
	}

	public String refreshArea() {

		if (this.areaDePesquisaAtual.getIdAreaDePesquisa() != null) {

			DaoHandler.getInstance().getAreaDao().refresh(
					this.areaDePesquisaAtual);

			return this.navigation.visualizarArea();
		} else {
			return this.navigation.inicioArea();
		}

	}

	public String refreshSubArea() {

		if (this.subAreaDePesusquisaAtual.getIdSubAreaDePesquisa() != null) {

			DaoHandler.getInstance().getSubAreaDao().refresh(
					this.subAreaDePesusquisaAtual);

			return this.navigation.visualizarSubArea();
		} else {
			return this.navigation.inicioSubArea();
		}

	}

	public AreaDePesquisa getAreaDePesquisaAtual() {
		return areaDePesquisaAtual;
	}

	public void setAreaDePesquisaAtual(AreaDePesquisa areaDePesquisaAtual) {
		this.areaDePesquisaAtual = areaDePesquisaAtual;
	}

	public List<AreaDePesquisa> getAreas() {
		return areas;
	}

	public void setAreas(List<AreaDePesquisa> areas) {
		this.areas = areas;
	}

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public List<SubAreaDePesquisa> getSubAreas() {
		return subAreas;
	}

	public void setSubAreas(List<SubAreaDePesquisa> subAreas) {
		this.subAreas = subAreas;
	}

	public void listarSubAreaPorNome() {
		this.subAreas.clear();
		this.subAreas = DaoHandler.getInstance().getSubAreaDao().listar(
				this.parametroConsulta, "");
	}

	public void listarAreaPorNome() {
		this.areas.clear();
		this.areas = DaoHandler.getInstance().getAreaDao().listar(
				this.parametroConsulta, "");
	}

}
