package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.Equipamento;
import lika.model.Laboratorio;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Usuario;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("laboratorioHandler")
@Scope("session")
public class LaboratorioHandler {

	private String parametroPesquisa = "";

	private List<Laboratorio> laboratorios = new ArrayList<Laboratorio>();

	private Usuario user;

	private NavigationHandler navigation;

	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;

	private Laboratorio laboratorioAtual;
	private List<Pessoa> desativados = new ArrayList<>();
	private List<Pessoa> ativos =  new ArrayList<>();

	private boolean resp = true;

	public boolean isResp() {
		return resp;
	}

	public void setResp(boolean resp) {
		this.resp = resp;
	}

	public void setLaboratorios(List<Laboratorio> laboratorios) {
		this.laboratorios = laboratorios;
	}

	public List<Laboratorio> getLaboratorios() {
		return this.laboratorios;
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

	public Laboratorio getLaboratorioAtual() {
		return laboratorioAtual;
	}

	public void setLaboratorioAtual(Laboratorio laboratorioAtual) {
		this.laboratorioAtual = laboratorioAtual;
	}

	private SelectItem[] tiposDePesquisas = { new SelectItem(TipoPesquisa.NOME,
			"Nome") };

	public SelectItem[] getTiposDePesquisas() {
		return tiposDePesquisas;
	}

	public void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		this.tiposDePesquisas = tiposDePesquisas;
	}

	public void consultar() {
		try {
			this.laboratorios.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarPorNome();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar os Laboratórios " + e.getMessage(),
					""));
		}
	}

	public void listarPorNome() {
		this.laboratorios.clear();
		this.laboratorios = DaoHandler.getInstance().getLaboratorioDao()
				.listar(this.parametroPesquisa, "");
	}

	public String getParametroPesquisa() {
		return parametroPesquisa;
	}

	public void setParametroPesquisa(String parametroPesquisa) {
		this.parametroPesquisa = parametroPesquisa;
	}

	public void novoLaboratorio(ActionEvent event) {
		this.laboratorioAtual = new Laboratorio();

	}

	public String refresh() {
		if (this.laboratorioAtual.getIdLaboratorio() != null) {
			DaoHandler.getInstance().getLaboratorioDao().refresh(
					this.laboratorioAtual);
			return this.navigation.visualizarLab();
		} else {
			return this.navigation.inicioLab();
		}
	}

	public void limparConsulta() {
		this.parametroPesquisa = "";
	}

	public String salvarLaboratorio() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			this.laboratorioAtual.setUsuarioAtualizou(this.user);
			this.laboratorioAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getLaboratorioDao().salvar(
					this.laboratorioAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Laboratório " + this.laboratorioAtual.getNome()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Laboratório " + e.getMessage(),
					""));

			return this.navigation.editarLab();
		}

		return this.navigation.visualizarLab();
	}

	public String cancelar() {
		if (this.laboratorioAtual.getIdLaboratorio() == null) {
			return "pesquisarLaboratorio";
		} else {
			return null;
		}
	}

	public void carregarLaboratorio(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idLaboratorio");

		Laboratorio p = new Laboratorio();
		p.setIdLaboratorio(id);

		this.laboratorioAtual = DaoHandler.getInstance().getLaboratorioDao()
				.carregar(p);
		
		for(Pessoa pessoa :  this.laboratorioAtual.getIntegrantes()){
			if(pessoa.getTahDesligado()){
				desativados.add(pessoa);
				System.out.println("ENTROU DESATIVADO");
			}else{
				ativos.add(pessoa);
				System.out.println("ENTROU ATIVO");
			}
		}
		
		

	}

	public List<Pessoa> getDesativados() {
		return desativados;
	}

	public void setDesativados(List<Pessoa> desativados) {
		this.desativados = desativados;
	}

	public List<Pessoa> getAtivos() {
		return ativos;
	}

	public void setAtivos(List<Pessoa> ativos) {
		this.ativos = ativos;
	}

	public void removerResponsavel(ActionEvent event) {
		String tipo = (String) event.getComponent().getAttributes().get("resp");

		if (tipo.equals("vice")) {
			this.laboratorioAtual.setViceAdministrador(null);
		} else {
			this.laboratorioAtual.setAdministrador(null);
		}

	}

	public String ehVice() {
		this.resp = false;

		return null;
	}

	public String ehResp() {
		this.resp = true;

		return null;
	}

	public void adicionarResponsavel(ActionEvent event) {
		Pesquisador resp = (Pesquisador) event.getComponent().getAttributes()
				.get("resp");
		if (!this.resp) {
			this.laboratorioAtual.setViceAdministrador(resp);
		} else {
			this.laboratorioAtual.setAdministrador(resp);
		}
	}

	public void removerEquipamento(ActionEvent event) {
		Equipamento equipamento = (Equipamento) event.getComponent()
				.getAttributes().get("equipamento");
		this.laboratorioAtual.getEquipamentos().remove(equipamento);
	}

	public void adicionarEquipamento(ActionEvent event) {
		Equipamento equipamento = (Equipamento) event.getComponent()
				.getAttributes().get("equipamento");
		boolean contains = false;
		for (Equipamento p : this.laboratorioAtual.getEquipamentos()) {
			Integer pId = p.getIdEquipamento();
			Integer labId = equipamento.getIdEquipamento();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.laboratorioAtual.getEquipamentos().add(equipamento);
		}
	}

	public void removerIntegrante(ActionEvent event) {
		Pessoa pessoa = (Pessoa) event.getComponent().getAttributes().get(
				"pessoa");
		this.laboratorioAtual.getIntegrantes().remove(pessoa);
	}

	public void adicionarIntegrante(ActionEvent event) {
		Pessoa pessoa = (Pessoa) event.getComponent().getAttributes().get(
				"pessoa");
		boolean contains = false;
		for (Pessoa p : this.laboratorioAtual.getIntegrantes()) {
			Integer pId = p.getIdPessoa();
			Integer labId = pessoa.getIdPessoa();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.laboratorioAtual.getIntegrantes().add(pessoa);
		}
	}

	public void editarEquipamento(ActionEvent event) {
		Equipamento equipamento = (Equipamento) event.getComponent()
				.getAttributes().get("equipamento");

		for (Equipamento e : this.laboratorioAtual.getEquipamentos()) {

			Integer pId = e.getIdEquipamento();
			Integer labId = equipamento.getIdEquipamento();
			if (pId.equals(labId)) {
				// this.laboratorioAtual.getEquipamentos().remove(e);
				if (e.getStatus().equalsIgnoreCase("em Funcionamento")) {
					e.setStatus("Desativado");
				} else {
					e.setStatus("em Funcionamento");
				}
				break;
				// this.laboratorioAtual.getEquipamentos().add(equipamento);
			}
		}

	}
}
