package lika.handler;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import lika.model.Departamento;
import lika.model.Funcao;
import lika.model.Usuario;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("adminHandler")
@Scope("session")
public class AdminHandler {

	private NavigationHandler navigation;

	private Departamento novoDepartamento = new Departamento();

	private Funcao novaFuncao = new Funcao();

	private List<Departamento> departamentos = new ArrayList<Departamento>();
	private String nomeDepartamento = "";

	private List<Funcao> funcoes = new ArrayList<Funcao>();
	private String nomeFuncao = "";

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public Departamento getNovoDepartamento() {
		return novoDepartamento;
	}

	public void setNovoDepartamento(Departamento novoDepartamento) {
		this.novoDepartamento = novoDepartamento;
	}

	public Funcao getNovaFuncao() {
		return novaFuncao;
	}

	public void setNovaFuncao(Funcao novaFuncao) {
		this.novaFuncao = novaFuncao;
	}

	public List<Funcao> getFuncoes() {
		return funcoes;
	}

	public void setFuncoes(List<Funcao> funcoes) {
		this.funcoes = funcoes;
	}

	public String getNomeFuncao() {
		return nomeFuncao;
	}

	public void setNomeFuncao(String nomeFuncao) {
		this.nomeFuncao = nomeFuncao;
	}

	public void listarDepartamentos() {
		this.departamentos = DaoHandler.getInstance().getDepartamentoDao()
				.listar(this.nomeDepartamento, "");

	}

	public void listarFuncoes() {
		this.funcoes = DaoHandler.getInstance().getFuncaoDao().listar(
				this.nomeFuncao, "");

	}

	public List<Departamento> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(List<Departamento> departamentos) {
		this.departamentos = departamentos;
	}

	public String getNomeDepartamento() {
		return nomeDepartamento;
	}

	public void setNomeDepartamento(String nomeDepartamento) {
		this.nomeDepartamento = nomeDepartamento;
	}

	public void carregarFuncao(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idFuncao");

		Funcao p = new Funcao();
		p.setIdFuncao(id);

		this.novaFuncao = DaoHandler.getInstance().getFuncaoDao().carregar(p);

	}

	public void novoFuncao(ActionEvent event) {
		this.novaFuncao = new Funcao();

	}

	public String salvarFuncao() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			DaoHandler.getInstance().getFuncaoDao().salvar(this.novaFuncao);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Função " + this.novaFuncao.getNome()
							+ " salva com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar a Função " + e.getMessage(), ""));

			return this.navigation.editarFuncao();
		}

		return this.navigation.visualizarFuncao();
	}

	public String cancelarFuncao() {
		if (this.novaFuncao.getIdFuncao() == null) {
			return "pesquisarFuncao";
		} else {
			return null;
		}
	}

	public String refreshFuncao() {
		if (this.novaFuncao.getIdFuncao() != null) {
			DaoHandler.getInstance().getFuncaoDao().refresh(this.novaFuncao);

			return this.navigation.visualizarFuncao();
		} else {
			return this.navigation.inicioFuncao();
		}

	}

	public void carregarDepartamento(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idDepartamento");

		Departamento p = new Departamento();
		p.setIdDepartamento(id);

		this.novoDepartamento = DaoHandler.getInstance().getDepartamentoDao()
				.carregar(p);

	}

	public void novoDepartamento(ActionEvent event) {
		this.novoDepartamento = new Departamento();

	}

	public String salvarDepartamento() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			DaoHandler.getInstance().getDepartamentoDao().salvar(
					this.novoDepartamento);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Departamento " + this.novoDepartamento.getNome()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Departamento " + e.getMessage(),
					""));

			return this.navigation.editarDepartamento();
		}

		return this.navigation.visualizarDepartamento();
	}

	public String cancelarDepartamento() {
		if (this.novoDepartamento.getIdDepartamento() == null) {
			return "pesquisarDepartamento";
		} else {
			return null;
		}
	}

	public String refreshDepartamento() {
		if (this.novoDepartamento.getIdDepartamento() != null) {
			DaoHandler.getInstance().getDepartamentoDao().refresh(
					this.novoDepartamento);

			return this.navigation.visualizarDepartamento();
		} else {
			return this.navigation.inicioDepartamento();
		}

	}

}
