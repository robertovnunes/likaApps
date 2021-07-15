package lika.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.Autor;
import lika.model.Laboratorio;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.model.Usuario;
import lika.util.TipoPublicacao;

public class PublicacaoHandler {

	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();

	private String parametroPesquisa = "";

	private NavigationHandler navigation;

	private TipoPesquisa tipoSelecionado = TipoPesquisa.TITULO;

	private Publicacao publicacaoAtual;

	private Usuario usr;

	private String tipoPublicacao;

	private Autor autorExterno;

	private String tipoAutor = TipoPublicacao.AUTOR_LIKA;

	public String getTipoAutor() {
		return tipoAutor;
	}

	public void setTipoAutor(String tipoAutor) {
		this.tipoAutor = tipoAutor;
	}

	public Autor getAutorExterno() {
		return autorExterno;
	}

	public void setAutorExterno(Autor autorExterno) {
		this.autorExterno = autorExterno;
	}

	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}

	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	public String getParametroPesquisa() {
		return parametroPesquisa;
	}

	public void setParametroPesquisa(String parametroPesquisa) {
		this.parametroPesquisa = parametroPesquisa;
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

	public Publicacao getPublicacaoAtual() {
		return publicacaoAtual;
	}

	public void setPublicacaoAtual(Publicacao publicacaoAtual) {
		this.publicacaoAtual = publicacaoAtual;
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

	public String getTipoPublicacao() {
		return tipoPublicacao;
	}

	public void setTipoPublicacao(String tipoPublicacao) {
		this.tipoPublicacao = tipoPublicacao;
	}

	private SelectItem[] tiposDePesquisas = { new SelectItem(
			TipoPesquisa.TITULO, "Título") };

	public SelectItem[] getTiposDePesquisas() {
		return tiposDePesquisas;
	}

	public void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		this.tiposDePesquisas = tiposDePesquisas;
	}

	public void listarPorNome() {
		this.publicacoes.clear();
		this.publicacoes = DaoHandler.getInstance().getPublicacaoDao().listar(
				this.parametroPesquisa, this.tipoPublicacao);
		System.out.println("TAMANHOOO  " + this.publicacoes.size());
		System.out.println("TIPO PUBLICACAOOO " + this.tipoPublicacao);

	}

	public void consultar() {
		try {
			this.publicacoes.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.TITULO)) {
				this.listarPorNome();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar as Publicações " + e.getMessage(),
					""));
		}
	}

	public void tipoDaPublicacao(ActionEvent event) {
		this.tipoPublicacao = (String) event.getComponent().getAttributes()
				.get("tipoPublicacao");
		this.publicacoes.clear();
	}

	public void novaPublicacao(ActionEvent event) {
		this.publicacaoAtual = new Publicacao();
		this.tipoPublicacao = (String) event.getComponent().getAttributes()
				.get("tipoPublicacao");
		this.publicacaoAtual.setTipoPublicacao(tipoPublicacao);

	}

	public String refresh() {
		if (this.publicacaoAtual.getIdPublicacao() != null) {
			DaoHandler.getInstance().getPublicacaoDao().refresh(
					this.publicacaoAtual);

			return this.navigation.visualizarPublicacao(this.tipoPublicacao);
		} else {
			return this.navigation.inicioPublicacao(this.tipoPublicacao);
		}
	}

	public void limparConsulta() {
		this.parametroPesquisa = "";
	}

	public String salvarPublicacao() {
		FacesContext fc = FacesContext.getCurrentInstance();

		// Necessário por causa do bug do hibernate oneToMany
		List<Autor> autores = new ArrayList<Autor>();
		if (this.publicacaoAtual.getIdPublicacao() != null) {
			for (Autor a : this.publicacaoAtual.getAutores()) {
				if (a.getIdAutor() == null) {
					Autor novo = new Autor();
					novo.setAutorDoLika(a.getAutorDoLika());
					novo.setNome(a.getNome());
					novo.setNomePublicacao(a.getNomePublicacao());
					novo.setPosicao(a.getPosicao());
					autores.add(novo);
				} else {
					autores.add(a);
				}
			}
		}

		try {
			this.publicacaoAtual.setUsuarioAtualizou(this.usr);
			this.publicacaoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));

			for (int i = 0; i < this.publicacaoAtual.getAutores().size(); i++) {
				this.publicacaoAtual.getAutores().get(i).setPosicao(i);
			}

			if (this.publicacaoAtual.getIdPublicacao() == null) {
				DaoHandler.getInstance().getPublicacaoDao().salvar(
						this.publicacaoAtual);
			} else {
				DaoHandler.getInstance().getPublicacaoDao().atualizar(
						this.publicacaoAtual);
			}

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Publicação " + this.publicacaoAtual.getTitulo()
							+ " salvo com sucesso!", ""));

		} catch (Exception e) {
			for (Autor a : this.publicacaoAtual.getAutores()) {
				System.out.println("IDD " + a.getIdAutor());
			}

			this.publicacaoAtual.getAutores().clear();
			this.publicacaoAtual.getAutores().addAll(autores);
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar a Publicação " + e.getMessage()
							+ "" + e.getCause().getCause().getMessage(), ""));

			return this.navigation.editarPublicacao(this.tipoPublicacao);
		}

		return this.navigation.visualizarPublicacao(this.tipoPublicacao);
	}

	public String cancelar() {
		if (this.publicacaoAtual.getIdPublicacao() == null) {
			return "pesquisarPeriodico";
		} else {
			return null;
		}
	}

	public void carregarPublicacao(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idPublicacao");

		Publicacao p = new Publicacao();
		p.setIdPublicacao(id);

		this.publicacaoAtual = DaoHandler.getInstance().getPublicacaoDao()
				.carregar(p);

		System.out.println("AUTORESSSS  "
				+ this.publicacaoAtual.getAutores().size());

	}

	public String adicionarAutorExternoPublicacao() {
		this.publicacaoAtual.getAutores().add(this.autorExterno);
		return null;
	}

	public void adicionarAutorDoLIKAPublicacao(ActionEvent event) {
		Pessoa autor = (Pessoa) event.getComponent().getAttributes().get(
				"autor");

		boolean contains = false;
		for (Autor p : this.publicacaoAtual.getAutores()) {
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
			this.publicacaoAtual.getAutores().add(a);
		}
	}

	public void removerAutorPublicacao(ActionEvent event) {
		Autor autor = (Autor) event.getComponent().getAttributes().get("autor");
		this.publicacaoAtual.getAutores().remove(autor);
	}

	public String novoAutorExterno() {
		this.autorExterno = new Autor();
		return null;
	}

	public String removerProjeto() {
		this.publicacaoAtual.setProjeto(null);
		return null;
	}

	public void adicionarProjeto(ActionEvent event) {
		Projeto projeto = (Projeto) event.getComponent().getAttributes().get(
				"proj");

		this.publicacaoAtual.setProjeto(projeto);
	}

}
