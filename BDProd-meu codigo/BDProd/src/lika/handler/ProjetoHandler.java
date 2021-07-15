package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.AreaDePesquisa;
import lika.model.Autor;
import lika.model.Equipamento;
import lika.model.GrupoDePesquisa;
import lika.model.Laboratorio;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.model.SubAreaDePesquisa;
import lika.model.Usuario;
import lika.util.TipoPublicacao;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("projetoHandler")
@Scope("session")
public class ProjetoHandler {

	private List<Projeto> projetos = new ArrayList<Projeto>();

	private String parametroPesquisa = "";

	private NavigationHandler navigation;

	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;

	private Projeto projetoAtual;

	private Usuario usr;

	private boolean resp = true;

	private String nomeSubProjeto;

	private String tipoPublicacao;

	private Publicacao novaPublicacao;

	private Equipamento novoEquipamento;

	private HashMap<Integer, Pessoa> integrantesAdicionados = new HashMap<Integer, Pessoa>();
	private HashMap<Integer, Pessoa> integrantesRemovidos = new HashMap<Integer, Pessoa>();

	private List<Publicacao> publicacoesAdicionadas = new ArrayList<Publicacao>();

	private Pessoa pessoaAdicionada = new Pessoa();

	private boolean editando = true;

	private Autor autorExterno = new Autor();

	private String tipoAutor = TipoPublicacao.AUTOR_LIKA;

	public Autor getAutorExterno() {
		return autorExterno;
	}

	public void setAutorExterno(Autor autorExterno) {
		this.autorExterno = autorExterno;
	}

	public String getTipoAutor() {
		return tipoAutor;
	}

	public void setTipoAutor(String tipoAutor) {
		this.tipoAutor = tipoAutor;
	}

	public boolean isEditando() {
		return editando;
	}

	public void setEditando(boolean editando) {
		this.editando = editando;
	}

	public Equipamento getNovoEquipamento() {
		return novoEquipamento;
	}

	public void setNovoEquipamento(Equipamento novoEquipamento) {
		this.novoEquipamento = novoEquipamento;
	}

	public Publicacao getNovaPublicacao() {
		return novaPublicacao;
	}

	public void setNovaPublicacao(Publicacao novaPublicacao) {
		this.novaPublicacao = novaPublicacao;
	}

	public String getTipoPublicacao() {
		return tipoPublicacao;
	}

	public void setTipoPublicacao(String tipoPublicacao) {
		this.tipoPublicacao = tipoPublicacao;
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

	public Projeto getProjetoAtual() {
		return projetoAtual;
	}

	public void setProjetoAtual(Projeto projetoAtual) {
		this.projetoAtual = projetoAtual;
	}

	public String getNomeSubProjeto() {
		return nomeSubProjeto;
	}

	public void setNomeSubProjeto(String nomeSubProjeto) {
		this.nomeSubProjeto = nomeSubProjeto;
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

	public Pessoa getPessoaAdicionada() {
		return pessoaAdicionada;
	}

	public void setPessoaAdicionada(Pessoa pessoaAdicionada) {
		this.pessoaAdicionada = pessoaAdicionada;
	}

	public boolean isResp() {
		return resp;
	}

	public void setResp(boolean resp) {
		this.resp = resp;
	}

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

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	public void listarPorNome() {
		this.projetos.clear();
		this.projetos = DaoHandler.getInstance().getProjetoDao().listar(
				this.parametroPesquisa, "");

	}

	public void consultar() {
		try {
			this.projetos.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarPorNome();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc
					.addMessage(null, new FacesMessage(
							FacesMessage.SEVERITY_ERROR,
							"ERRO: ao tentar listar os Projetos "
									+ e.getMessage(), ""));
		}
	}

	public List<Projeto> getProjetos() {
		return this.projetos;
	}

	public void novoProjeto(ActionEvent event) {
		this.projetoAtual = new Projeto();
		this.integrantesAdicionados = new HashMap<Integer, Pessoa>();
		this.publicacoesAdicionadas = new ArrayList<Publicacao>();

	}

	public String refresh() {
		if (this.projetoAtual.getIdProjeto() != null) {
			DaoHandler.getInstance().getProjetoDao().refresh(this.projetoAtual);

			this.integrantesAdicionados.clear();
			this.integrantesRemovidos.clear();

			List<Pessoa> pessoas = DaoHandler.getInstance().getProjetoDao()
					.listarPessoasESubProjetos(this.projetoAtual);

			for (Pessoa pessoa : pessoas) {
				this.integrantesAdicionados.put(pessoa.getIdPessoa(), pessoa);
			}

			this.publicacoesAdicionadas.clear();

			for (Publicacao publicacao : this.projetoAtual.getPublicacoes()) {
				this.publicacoesAdicionadas.add(publicacao);
			}

			return this.navigation.visualizarProjeto();
		} else {
			return this.navigation.inicioProjeto();
		}
	}

	public void limparConsulta() {
		this.parametroPesquisa = "";
	}

	public String salvarProjeto() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			// this.pesquisadorAtual.setUsuarioAtualizou(this.usr);

			for (Publicacao pub : this.publicacoesAdicionadas) {

				if (pub.getIdPublicacao() == null) {

					for (int i = 0; i < pub.getAutores().size(); i++) {
						pub.getAutores().get(i).setPosicao(i);
					}

					// List<Autor> autores = pub.getAutores();
					// pub.setAutores(null);

					// DaoHandler.getInstance().getPublicacaoDao().salvar(pub);

					// for (Pessoa p : autores) {
					// PessoaPublicacao pp = new PessoaPublicacao();
					// pp.setOrdem(p.getPosicaoPublicacao());
					// PessoaPublicacaoID id = new PessoaPublicacaoID();
					// id.setPessoa(p);
					// id.setPublicacao(pub);
					// pp.setId(id);
					// DaoHandler.getInstance().getPessoaPublicacaoDao()
					// .salvar(pp);
					// }
				}
				this.projetoAtual.getPublicacoes().add(pub);

			}

			this.projetoAtual.setUsuarioAtualizou(this.usr);
			this.projetoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));

			DaoHandler.getInstance().getProjetoDao().salvar(this.projetoAtual);

			for (Pessoa p : this.integrantesAdicionados.values()) {
				PessoaProjeto pp = new PessoaProjeto();
				pp.setNomeSubProjeto(p.getNomeSubprojeto());
				PessoaProjetoID id = new PessoaProjetoID();
				id.setPessoa(p);
				id.setProjeto(this.projetoAtual);
				pp.setId(id);
				DaoHandler.getInstance().getPessoaProjetoDao().salvar(pp);
			}

			for (Pessoa p : this.integrantesRemovidos.values()) {
				DaoHandler.getInstance().getProjetoDao().removerPessoa(p,
						this.projetoAtual);
			}

			this.integrantesRemovidos.clear();

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Projeto " + this.projetoAtual.getNome()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Projeto " + e.getMessage() + ""
							+ e.getCause().getCause().getMessage(), ""));

			return this.navigation.editarProjeto();
		}

		return this.navigation.visualizarProjeto();
	}

	public String cancelar() {
		if (this.projetoAtual.getIdProjeto() == null) {
			return "pesquisarProjeto";
		} else {
			return null;
		}
	}

	public void carregarProjeto(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idProjeto");

		Projeto p = new Projeto();
		p.setIdProjeto(id);

		this.projetoAtual = DaoHandler.getInstance().getProjetoDao()
				.carregar(p);

		List<Pessoa> pessoas = DaoHandler.getInstance().getProjetoDao()
				.listarPessoasESubProjetos(this.projetoAtual);

		this.integrantesAdicionados.clear();

		for (Pessoa pessoa : pessoas) {
			this.integrantesAdicionados.put(pessoa.getIdPessoa(), pessoa);
		}

		this.publicacoesAdicionadas.clear();

		for (Publicacao publicacao : this.projetoAtual.getPublicacoes()) {
			this.publicacoesAdicionadas.add(publicacao);
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

	public String removerGrupo() {
		this.projetoAtual.setGrupo(null);
		return null;
	}

	public void adicionarGrupo(ActionEvent event) {
		GrupoDePesquisa grupo = (GrupoDePesquisa) event.getComponent()
				.getAttributes().get("grupo");
		this.projetoAtual.setGrupo(grupo);
	}

	public void removerResponsavel(ActionEvent event) {
		String tipo = (String) event.getComponent().getAttributes().get("resp");

		if (tipo.equals("vice")) {
			this.projetoAtual.setViceGerente(null);
		} else {
			this.projetoAtual.setGerente(null);
		}

	}

	public void adicionarResponsavel(ActionEvent event) {
		Pesquisador resp = (Pesquisador) event.getComponent().getAttributes()
				.get("resp");
		if (!this.resp) {
			this.projetoAtual.setViceGerente(resp);
		} else {
			this.projetoAtual.setGerente(resp);
		}
	}

	public String adicionarIntegrante() {
		this.nomeSubProjeto = null;
		return null;
	}

	public String adicionarIntegrantes() {
		this.pessoaAdicionada.setNomeSubprojeto(this.nomeSubProjeto);

		this.integrantesAdicionados.put(this.pessoaAdicionada.getIdPessoa(),
				this.pessoaAdicionada);

		this.integrantesRemovidos.remove(this.pessoaAdicionada.getIdPessoa());

		return null;
	}

	public void removerIntegrante(ActionEvent event) {
		Pessoa p = (Pessoa) event.getComponent().getAttributes().get("pessoa");

		this.integrantesAdicionados.remove(p.getIdPessoa());
		this.integrantesRemovidos.put(p.getIdPessoa(), p);
	}

	public List<Pessoa> getIntegrantesAdicionados() {
		return new ArrayList<Pessoa>(integrantesAdicionados.values());
	}

	public List<Publicacao> getPublicacoesAdicionadas() {
		return this.publicacoesAdicionadas;
	}

	public String projetoExterno() {
		if (this.projetoAtual.getTipo().equalsIgnoreCase("Interno")) {
			this.projetoAtual.setValorTotal(null);
		}

		return null;
	}

	public String projetoFinanciamento() {
		if (!this.projetoAtual.isFinanciamento()) {
			this.projetoAtual.setOrgaoFinanciador(null);
		}

		return null;
	}

	public void removerGrandeArea(ActionEvent event) {

		this.projetoAtual.setGrandeArea(null);
	}

	public void adicionarGrandeArea(ActionEvent event) {
		AreaDePesquisa area = (AreaDePesquisa) event.getComponent()
				.getAttributes().get("area");

		this.projetoAtual.setGrandeArea(area);

		List<SubAreaDePesquisa> subAreas = DaoHandler.getInstance()
				.getAreaDao().listarSubAreas(area);

		for (SubAreaDePesquisa sub : subAreas) {
			boolean contains = false;
			for (SubAreaDePesquisa sub2 : this.projetoAtual
					.getSubAreasDePesquisas()) {
				Integer pId = sub2.getIdSubAreaDePesquisa();
				Integer subId = sub.getIdSubAreaDePesquisa();
				if (pId.equals(subId)) {
					contains = true;
					break;
				}
			}

			if (!contains) {
				this.projetoAtual.getSubAreasDePesquisas().add(sub);
			}
		}
	}

	public void removerSubArea(ActionEvent event) {
		SubAreaDePesquisa sub = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("subArea");
		this.projetoAtual.getSubAreasDePesquisas().remove(sub);
	}

	public void adicionarSubArea(ActionEvent event) {
		SubAreaDePesquisa sub = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("subArea");
		System.out.println(sub.getNome());
		boolean contains = false;
		for (SubAreaDePesquisa p : this.projetoAtual.getSubAreasDePesquisas()) {
			Integer pId = p.getIdSubAreaDePesquisa();
			Integer labId = sub.getIdSubAreaDePesquisa();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.projetoAtual.getSubAreasDePesquisas().add(sub);
		}
	}

	public String novaPublicacao() {
		this.novaPublicacao = new Publicacao();
		this.novaPublicacao.setDataAtualizacao(new Date(System
				.currentTimeMillis()));
		this.novaPublicacao.setUsuarioAtualizou(this.usr);
		this.novaPublicacao.setProjeto(this.projetoAtual);

		if (this.tipoPublicacao.equals(TipoPublicacao.PERIODICO)) {
			this.novaPublicacao.setTipoPublicacao(TipoPublicacao.PERIODICO);
		} else if (this.tipoPublicacao.equals(TipoPublicacao.ANAIS)) {
			this.novaPublicacao.setTipoPublicacao(TipoPublicacao.ANAIS);
		} else if (this.tipoPublicacao.equals(TipoPublicacao.LIVRO)) {
			this.novaPublicacao.setTipoPublicacao(TipoPublicacao.LIVRO);
		}

		return null;
	}

	public String novoAutorExterno() {
		this.autorExterno = new Autor();
		return null;
	}

	public String adicionarAutorExternoPublicacao() {
		this.novaPublicacao.getAutores().add(this.autorExterno);
		return null;
	}

	public void adicionarAutorDoLIKAPublicacao(ActionEvent event) {
		Pessoa autor = (Pessoa) event.getComponent().getAttributes().get(
				"autor");

		boolean contains = false;
		for (Autor p : this.novaPublicacao.getAutores()) {
			if (p.getAutorDoLika() != null) {
				Integer pId = p.getAutorDoLika().getIdPessoa();
				Integer labId = autor.getIdPessoa();
				if (pId.equals(labId)) {
					contains = true;
					break;
				}
			}
		}
		if (!contains) {
			Autor a = new Autor();
			a.setNome(autor.getNome());
			a.setNomePublicacao(autor.getNomePublicacao());
			a.setAutorDoLika(autor);
			this.novaPublicacao.getAutores().add(a);
		}
	}

	public void removerAutorDoLIKAPublicacao(ActionEvent event) {
		Autor autor = (Autor) event.getComponent().getAttributes().get("autor");
		this.novaPublicacao.getAutores().remove(autor);
	}

	public void removerPublicacao(ActionEvent event) {
		Publicacao p = (Publicacao) event.getComponent().getAttributes().get(
				"publicacao");
		this.publicacoesAdicionadas.remove(p);

		if (p.getIdPublicacao() != null) {
			this.projetoAtual.getPublicacoes().remove(p);
		}

	}

	public void removerEquipamento(ActionEvent event) {
		Equipamento e = (Equipamento) event.getComponent().getAttributes().get(
				"equipamento");
		this.projetoAtual.getEquipamentosAdiquiridos().remove(e);

	}

	public void editarPublicacao(ActionEvent event) {
		Publicacao p = (Publicacao) event.getComponent().getAttributes().get(
				"publicacao");
		this.novaPublicacao = p;
		this.novaPublicacao.setEditando(true);
	}

	public void editarEquipamento(ActionEvent event) {
		Equipamento e = (Equipamento) event.getComponent().getAttributes().get(
				"equipamento");
		this.novoEquipamento = e;
		this.novoEquipamento.setEditando(true);
		this.novoEquipamento.setDataAtualizacao(new Date(System
				.currentTimeMillis()));
		this.novoEquipamento.setUsuarioAtualizou(this.usr);
		System.out.println(this.novoEquipamento.getNome());
		System.out.println(this.novoEquipamento.getLaboratorio());
	}

	public String adicionarPublicacao() {
		if (!this.novaPublicacao.isEditando()) {
			this.publicacoesAdicionadas.add(this.novaPublicacao);
		} else {
			this.novaPublicacao.setEditando(false);
		}
		return null;
	}

	public String novoEquipamento() {
		this.novoEquipamento = new Equipamento();
		this.novoEquipamento.setDataAtualizacao(new Date(System
				.currentTimeMillis()));
		this.novoEquipamento.setUsuarioAtualizou(this.usr);
		return null;
	}

	public String adicionarEquipamento() {
		if (!this.novoEquipamento.isEditando()) {
			this.projetoAtual.getEquipamentosAdiquiridos().add(
					this.novoEquipamento);
		} else {
			this.novoEquipamento.setEditando(false);
		}
		return null;
	}

	public void adicionarLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");

		this.novoEquipamento.setLaboratorio(lab);
		System.out.println("Passei Aqui");
	}

	public String removerLab() {
		this.novoEquipamento.setLaboratorio(null);
		return null;
	}

}
