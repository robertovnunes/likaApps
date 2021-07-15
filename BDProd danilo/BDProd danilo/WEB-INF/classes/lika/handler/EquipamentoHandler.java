package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.Equipamento;
import lika.model.Laboratorio;
import lika.model.Usuario;

@Controller("equipamentoHandler")
@Scope("session")
public class EquipamentoHandler {
	private Equipamento equipamentoAtual;

	private List<Equipamento> equipamentos = new ArrayList<Equipamento>();

	private Usuario user;

	private NavigationHandler navigation;

	private String parametroConsulta = "";

	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;

	public Equipamento getEquipamentoAtual() {
		return equipamentoAtual;
	}

	public void setEquipamentoAtual(Equipamento equipamentoAtual) {
		this.equipamentoAtual = equipamentoAtual;
	}

	public List<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(List<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
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

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	private SelectItem[] tiposDePesquisas = { new SelectItem(TipoPesquisa.NOME,
			"Nome") };

	public void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		this.tiposDePesquisas = tiposDePesquisas;
	}

	public SelectItem[] getTiposDePesquisas() {
		return tiposDePesquisas;
	}

	public TipoPesquisa getTipoSelecionado() {
		return tipoSelecionado;
	}

	public void setTipoSelecionado(TipoPesquisa tipoSelecionado) {
		this.tipoSelecionado = tipoSelecionado;
	}

	public void consultar() {
		try {
			this.equipamentos.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarEquipamentoPorNome();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar os Equipamentos " + e.getMessage(),
					""));
		}
	}

	public void listarEquipamentoPorNome() {
		this.equipamentos.clear();
		this.equipamentos = DaoHandler.getInstance().getEquipamentoDao()
				.listar(this.parametroConsulta, "");
	}

	public void novoEquipamento(ActionEvent event) {
		this.equipamentoAtual = new Equipamento();

	}

	public String refresh() {
		if (this.equipamentoAtual.getIdEquipamento() != null) {
			DaoHandler.getInstance().getEquipamentoDao().refresh(
					this.equipamentoAtual);
			return this.navigation.visualizarEquipamento();
		} else {
			return this.navigation.inicioEquipamento();
		}
	}

	public void limparConsulta() {
		this.parametroConsulta = "";
	}

	public String salvarEquipamento() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			this.equipamentoAtual.setUsuarioAtualizou(this.user);
			this.equipamentoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getEquipamentoDao().salvar(
					this.equipamentoAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Equipamento " + this.equipamentoAtual.getNome()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Equipamento " + e.getMessage(),
					""));

			return this.navigation.editarEquipamento();
		}

		return this.navigation.visualizarEquipamento();
	}

	public String cancelar() {
		if (this.equipamentoAtual.getIdEquipamento() == null) {
			return "pesquisarEquipamento";
		} else {
			return null;
		}
	}

	public void adicionarLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");

		this.equipamentoAtual.setLaboratorio(lab);
	}

	public String removerLab() {
		this.equipamentoAtual.setLaboratorio(null);
		return null;
	}

	public void carregarEquipamento(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idEquipamento");

		Equipamento p = new Equipamento();
		p.setIdEquipamento(id);

		this.equipamentoAtual = DaoHandler.getInstance().getEquipamentoDao()
				.carregar(p);

	}

}
