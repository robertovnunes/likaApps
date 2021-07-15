package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.GrupoDePesquisa;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.SubAreaDePesquisa;
import lika.model.Usuario;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("grupoHandler")
@Scope("session")
public class GrupoHandler {

	private String parametroPesquisa = "";

	private List<GrupoDePesquisa> grupos = new ArrayList<GrupoDePesquisa>();

	private Usuario user;

	private NavigationHandler navigation;

	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;

	private GrupoDePesquisa grupoAtual;

	private SelectItem[] tiposDePesquisas = { new SelectItem(TipoPesquisa.NOME,
			"Nome") };

	public SelectItem[] getTiposDePesquisas() {
		return tiposDePesquisas;
	}

	public void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		this.tiposDePesquisas = tiposDePesquisas;
	}

	public String getParametroPesquisa() {
		return parametroPesquisa;
	}

	public void setParametroPesquisa(String parametroPesquisa) {
		this.parametroPesquisa = parametroPesquisa;
	}

	public List<GrupoDePesquisa> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<GrupoDePesquisa> grupos) {
		this.grupos = grupos;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public TipoPesquisa getTipoSelecionado() {
		return tipoSelecionado;
	}

	public void setTipoSelecionado(TipoPesquisa tipoSelecionado) {
		this.tipoSelecionado = tipoSelecionado;
	}

	public GrupoDePesquisa getGrupoAtual() {
		return grupoAtual;
	}

	public void setGrupoAtual(GrupoDePesquisa grupoAtual) {
		this.grupoAtual = grupoAtual;
	}

	public void consultar() {
		try {
			this.grupos.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarPorNome();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar os Grupos de Pesquisa "
							+ e.getMessage(), ""));
		}
	}

	public void listarPorNome() {
		this.grupos.clear();
		this.grupos = DaoHandler.getInstance().getGrupoDao().listar(
				this.parametroPesquisa, "");
	}

	public void novoGrupo(ActionEvent event) {
		this.grupoAtual = new GrupoDePesquisa();
		this.grupoAtual.setGrupoCnpq(false);

	}

	public String refresh() {
		if (this.grupoAtual.getIdGrupoDePesquisa() != null) {
			DaoHandler.getInstance().getGrupoDao().refresh(this.grupoAtual);
			return this.navigation.visualizarGrupo();
		} else {
			return this.navigation.inicioGrupo();
		}
	}

	public void limparConsulta() {
		this.parametroPesquisa = "";
	}

	public String salvarGrupo() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			this.grupoAtual.setUsuarioAtualizou(this.user);
			this.grupoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getGrupoDao().salvar(this.grupoAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Grupo de Pesquisa " + this.grupoAtual.getNome()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Grupo de Pesquisa "
							+ e.getMessage(), ""));

			return this.navigation.editarGrupo();
		}

		return this.navigation.visualizarGrupo();
	}

	public String cancelar() {
		if (this.grupoAtual.getIdGrupoDePesquisa() == null) {
			return "pesquisarGrupo";
		} else {
			return null;
		}
	}

	public void carregarGrupo(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idGrupo");

		GrupoDePesquisa p = new GrupoDePesquisa();
		p.setIdGrupoDePesquisa(id);

		this.grupoAtual = DaoHandler.getInstance().getGrupoDao().carregar(p);

	}

	public void removerIntegrante(ActionEvent event) {
		Pessoa pessoa = (Pessoa) event.getComponent().getAttributes().get(
				"integrante");
		this.grupoAtual.getIntegrantes().remove(pessoa);
	}

	public void adicionarIntegrante(ActionEvent event) {
		Pessoa pessoa = (Pessoa) event.getComponent().getAttributes().get(
				"integrante");
		boolean contains = false;
		for (Pessoa p : this.grupoAtual.getIntegrantes()) {
			Integer pId = p.getIdPessoa();
			Integer labId = pessoa.getIdPessoa();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.grupoAtual.getIntegrantes().add(pessoa);
		}
	}

	public void removerProjeto(ActionEvent event) {
		Projeto projeto = (Projeto) event.getComponent().getAttributes().get(
				"projeto");
		this.grupoAtual.getProjetos().remove(projeto);
	}

	public void adicionarProjeto(ActionEvent event) {
		Projeto projeto = (Projeto) event.getComponent().getAttributes().get(
				"projeto");
		boolean contains = false;
		for (Projeto p : this.grupoAtual.getProjetos()) {
			Integer pId = p.getIdProjeto();
			Integer labId = projeto.getIdProjeto();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.grupoAtual.getProjetos().add(projeto);
		}
	}

	public void removerArea(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		this.grupoAtual.getAreasPesquisa().remove(area);
	}

	public void adicionarArea(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		boolean contains = false;
		for (SubAreaDePesquisa p : this.grupoAtual.getAreasPesquisa()) {
			Integer pId = p.getIdSubAreaDePesquisa();
			Integer labId = area.getIdSubAreaDePesquisa();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.grupoAtual.getAreasPesquisa().add(area);
		}
	}

	public void adicionarResponsavel(ActionEvent event) {
		Pesquisador resp = (Pesquisador) event.getComponent().getAttributes()
				.get("resp");
		this.grupoAtual.setResponsavel(resp);
	}

	public String removerResponsavel() {
		this.grupoAtual.setResponsavel(null);
		return null;

	}

}
