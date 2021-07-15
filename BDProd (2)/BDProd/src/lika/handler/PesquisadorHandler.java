/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.handler;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.component.html.HtmlInputText;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.imageio.ImageIO;

import lika.model.Cracha;
import lika.model.Departamento;
import lika.model.Laboratorio;
import lika.model.Pesquisador;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.model.SubAreaDePesquisa;
import lika.model.Titulacao;
import lika.model.Usuario;
import lika.util.ImageFile;
import lika.util.PrepararImagem;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 
 * @author Marcio
 */
@Controller("pesquisadorHandler")
@Scope("session")
public class PesquisadorHandler {

	private Cracha novoCracha = new Cracha();

	public Cracha getNovoCracha() {
		return novoCracha;
	}

	public void setNovoCracha(Cracha novoCracha) {
		this.novoCracha = novoCracha;
	}

	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();

	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}

	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	public enum TipoPesquisa {

		TITULO, NOME, SEXO, CPF, LOGIN
	};

	private NavigationHandler navigation;

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	private Titulacao titulacaoAdicionada = new Titulacao();

	private Projeto projetoAdicionado = new Projeto();

	private String nomeSubProjeto;

	private String parametroConsulta;
	private Usuario usr;
	private Pesquisador pesquisadorAtual = new Pesquisador();

	private HashMap<Integer, Projeto> projetosAdicionados = new HashMap<Integer, Projeto>();
	private HashMap<Integer, Projeto> projetosRemovidos = new HashMap<Integer, Projeto>();

	private List<Pesquisador> pesquisadoresListados = new ArrayList<Pesquisador>();
	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;
	private static SelectItem[] tiposDePesquisas = {
			new SelectItem(TipoPesquisa.NOME, "Nome"),
			new SelectItem(TipoPesquisa.CPF, "CPF"),
			new SelectItem(TipoPesquisa.SEXO, "Sexo") };

	public void carregarPesquisador(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idPesquisador");

		Pesquisador p = new Pesquisador();
		p.setIdPessoa(id);

		this.pesquisadorAtual = DaoHandler.getInstance().getPesquisadorDao()
				.carregar(p);

		this.projetosAdicionados.clear();
		this.projetosRemovidos.clear();

		List<Projeto> projetos = DaoHandler.getInstance().getPesquisadorDao()
				.listarProjetosESubProjetos(this.pesquisadorAtual);

		for (Projeto proj : projetos) {
			this.projetosAdicionados.put(proj.getIdProjeto(), proj);
		}

		this.publicacoes.clear();

		this.publicacoes = DaoHandler.getInstance().getPublicacaoDao()
				.listarPublicacoesDaPessoa(this.pesquisadorAtual);
		
		String cep = this.pesquisadorAtual.getCEP();
		if (cep != null && !cep.isEmpty()){
			int index = cep.length() - 3;
			cep = cep.substring(0, index) + '-' + cep.substring(index);
			this.pesquisadorAtual.setCEP(cep);
		}

	}

	public Titulacao getTitulacaoAdicionada() {
		return titulacaoAdicionada;
	}

	public void setTitulacaoAdicionada(Titulacao titulacaoAdicionada) {
		this.titulacaoAdicionada = titulacaoAdicionada;
	}

	public Projeto getProjetoAdicionado() {
		return projetoAdicionado;
	}

	public void setProjetoAdicionado(Projeto projetoAdicionado) {
		this.projetoAdicionado = projetoAdicionado;
	}

	public String getNomeSubProjeto() {
		return nomeSubProjeto;
	}

	public void setNomeSubProjeto(String nomeSubProjeto) {
		this.nomeSubProjeto = nomeSubProjeto;
	}

	public List<Projeto> getProjetosAdicionados() {
		return new ArrayList<Projeto>(projetosAdicionados.values());
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

	public Pesquisador getPesquisadorAtual() {
		return pesquisadorAtual;
	}

	public void setPesquisadorAtual(Pesquisador pesquisadorAtual) {
		this.pesquisadorAtual = pesquisadorAtual;
	}

	public TipoPesquisa getTipoSelecionado() {
		return tipoSelecionado;
	}

	public void setTipoSelecionado(TipoPesquisa tipoSelecionado) {
		this.tipoSelecionado = tipoSelecionado;
	}

	public SelectItem[] getTiposDePesquisas() {
		return tiposDePesquisas;
	}

	public void limparConsulta() {
		this.parametroConsulta = "";
	}

	public boolean getMostrarPesquisaNome() {
		return this.tipoSelecionado.equals(TipoPesquisa.NOME);
	}

	public boolean getMostrarPesquisaCPF() {
		return this.tipoSelecionado.equals(TipoPesquisa.CPF);
	}

	public boolean getMostrarPesquisaSexo() {
		return this.tipoSelecionado.equals(TipoPesquisa.SEXO);
	}

	public void listarPorNome() {
		this.pesquisadoresListados = DaoHandler.getInstance()
				.getPesquisadorDao().listar(parametroConsulta, "Nome");
	}

	public void listarPorCPF() {
		this.pesquisadoresListados = DaoHandler.getInstance()
				.getPesquisadorDao().listar(parametroConsulta, "CPF");
	}

	public void listarPorSexo() {
		this.pesquisadoresListados = DaoHandler.getInstance()
				.getPesquisadorDao().listar(parametroConsulta, "Sexo");
	}

	public void consultar() {
		try {
			this.pesquisadoresListados.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarPorNome();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.CPF)) {
				this.listarPorCPF();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.SEXO)) {
				this.listarPorSexo();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"ERRO: ao tentar listar os Pesquisadores "
									+ e.getMessage(), ""));
		}
	}

	public List<Pesquisador> getPesquisadoresListados() {
		return pesquisadoresListados;
	}

	public void setPesquisadoresListados(List<Pesquisador> pesquisadoresListados) {
		this.pesquisadoresListados = pesquisadoresListados;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public String adicionarProjeto() {
		this.nomeSubProjeto = null;
		return null;
	}

	public String novaTitulacao() {
		this.titulacaoAdicionada = new Titulacao();
		return null;
	}

	public void adicionarLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");
		boolean contains = false;
		for (Laboratorio p : this.pesquisadorAtual.getLaboratorios()) {
			Integer pId = p.getIdLaboratorio();
			Integer labId = lab.getIdLaboratorio();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.pesquisadorAtual.getLaboratorios().add(lab);
		}
	}

	public void removerLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");
		this.pesquisadorAtual.getLaboratorios().remove(lab);
	}

	public void adicionarAreaDePesquisa(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		boolean contains = false;
		for (SubAreaDePesquisa p : this.pesquisadorAtual.getAreasPesquisa()) {
			Integer pId = p.getIdSubAreaDePesquisa();
			Integer areaId = area.getIdSubAreaDePesquisa();
			if (pId.equals(areaId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			System.out.println("AREEAAA ADICIONAADAAAAA");
			this.pesquisadorAtual.getAreasPesquisa().add(area);
		}
	}

	public void removerAreaDePesquisa(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		this.pesquisadorAtual.getAreasPesquisa().remove(area);
	}

	public String adicionarTitulacao() {
		if (!this.titulacaoAdicionada.isEditando()) {

			this.pesquisadorAtual.getTitulacao().add(this.titulacaoAdicionada);
			this.titulacaoAdicionada = new Titulacao();
		}

		return null;
	}

	public void removerTitulacao(ActionEvent event) {
		Titulacao t = (Titulacao) event.getComponent().getAttributes().get(
				"titulacao");

		this.pesquisadorAtual.getTitulacao().remove(t);
		this.titulacaoAdicionada = new Titulacao();

	}

	public String adicionarProjetos() {
		this.projetoAdicionado.setNomeSubprojeto(this.nomeSubProjeto);

		this.projetosAdicionados.put(this.projetoAdicionado.getIdProjeto(),
				this.projetoAdicionado);

		this.projetosRemovidos.remove(this.projetoAdicionado.getIdProjeto());

		return null;
	}

	public void novoPesquisador(ActionEvent event) {
		this.pesquisadorAtual = new Pesquisador();
		this.projetosAdicionados = new HashMap<Integer, Projeto>();
		this.publicacoes = new ArrayList<Publicacao>();
	}

	public void removerProjeto(ActionEvent event) {
		Projeto p = (Projeto) event.getComponent().getAttributes().get(
				"projeto");

		this.projetosAdicionados.remove(p.getIdProjeto());
		this.projetosRemovidos.put(p.getIdProjeto(), p);
	}

	public String salvarPesquisador() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			this.pesquisadorAtual.setUsuarioAtualizou(this.usr);
			
			String cep = this.pesquisadorAtual.getCEP();
			int index = cep.lastIndexOf('-');
			if (cep != null && !cep.isEmpty() && index != -1){
				String cep_aluno = cep.substring(0, index) + cep.substring(index+1); 
				this.pesquisadorAtual.setCEP(cep_aluno);
			}
			
			this.pesquisadorAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));

			if (this.pesquisadorAtual.getInstituicaoOrigem() != null
					&& this.pesquisadorAtual.getInstituicaoOrigem().equals(
							"Outra")) {
				this.pesquisadorAtual.setDepartamento(null);
			}

			DaoHandler.getInstance().getPesquisadorDao().salvar(
					this.pesquisadorAtual);

			for (Projeto p : this.projetosAdicionados.values()) {
				PessoaProjeto pp = new PessoaProjeto();
				pp.setNomeSubProjeto(p.getNomeSubprojeto());
				PessoaProjetoID id = new PessoaProjetoID();
				id.setPessoa(this.pesquisadorAtual);
				id.setProjeto(p);
				pp.setId(id);
				DaoHandler.getInstance().getPessoaProjetoDao().salvar(pp);
			}

			for (Projeto p : this.projetosRemovidos.values()) {
				DaoHandler.getInstance().getPesquisadorDao().removerProjeto(
						this.pesquisadorAtual, p);
			}

			this.projetosRemovidos.clear();

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Pesquisador " + this.pesquisadorAtual.getNome()
							+ " salvo com sucesso!", ""));
			
			this.pesquisadorAtual.setCEP(cep);
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Pesquisador " + e.getMessage()
							+ "" + e.getCause().getCause().getMessage(), ""));

			return this.navigation.editarPesquisador();
		}

		return this.navigation.visualizarPesquisador();
	}

	public String cancelar() {
		if (this.pesquisadorAtual.getIdPessoa() == null) {
			return "pesquisarPesquisador";
		} else {
			return null;
		}
	}

	public String refresh() {

		if (this.pesquisadorAtual.getIdPessoa() != null) {
			DaoHandler.getInstance().getPesquisadorDao().refresh(
					this.pesquisadorAtual);

			this.projetosAdicionados.clear();
			this.projetosRemovidos.clear();

			List<Projeto> projetos = DaoHandler.getInstance()
					.getPesquisadorDao().listarProjetosESubProjetos(
							this.pesquisadorAtual);

			for (Projeto proj : projetos) {
				this.projetosAdicionados.put(proj.getIdProjeto(), proj);
			}

			return this.navigation.visualizarPesquisador();
		} else {
			return this.navigation.inicioPesquisador();
		}

	}

	public List<SelectItem> getDepartamentos() {
		List<SelectItem> temp = new ArrayList<SelectItem>();

		List<Departamento> dep = DaoHandler.getInstance().getDepartamentoDao()
				.listarDepartamentos();

		if (this.pesquisadorAtual.getDepartamento() == null) {
			this.pesquisadorAtual.setDepartamento(dep.get(0));
		}

		for (Departamento d : dep) {
			temp.add(new SelectItem(d.getIdDepartamento(), d.getNome()));
		}
		return temp;
	}

	public void mudarDepartamento(ValueChangeEvent event) {
		Integer idDepartamento = (Integer) event.getNewValue();
		Departamento d = new Departamento();
		d.setIdDepartamento(idDepartamento);

		Departamento dep = DaoHandler.getInstance().getDepartamentoDao()
				.carregar(d);

		this.pesquisadorAtual.setDepartamento(dep);

	}

	public String mudarInstituicaoOrigem() {

		if (!this.pesquisadorAtual.getInstituicaoOrigem().equals(
				"Universidade Federal de Pernambuco")) {
			Departamento d = new Departamento();
			d.setIdDepartamento(1);
			this.pesquisadorAtual.setDepartamento(d);

		}

		System.out.println("PASSOSUUU AQUIII "
				+ this.pesquisadorAtual.getInstituicaoOrigem());

		return "editarPesquisador";

	}

	public boolean isMostrarCentro() {
		if (this.pesquisadorAtual.getInstituicaoOrigem() == null) {
			return true;
		}

		System.out.println("Mostrarr Centroo "
				+ this.pesquisadorAtual.getInstituicaoOrigem().equals(
						"Universidade Federal de Pernambuco"));

		return this.pesquisadorAtual.getInstituicaoOrigem().equals(
				"Universidade Federal de Pernambuco");
	}

	public String cancelarCracha() {
		this.pesquisadorAtual.setCracha(null);
		return null;
	}

	public String editarCracha() {
		this.novoCracha = this.pesquisadorAtual.getCracha();
		return null;
	}

	public String novoCracha() {
		this.novoCracha = new Cracha();
		novoCracha.setSituacao("em Atividade");
		novoCracha.setDataEmissao(new Date(System.currentTimeMillis()));
		return null;
	}

	public String salvarCracha() {
		System.out.println("PASSSEII AQUII SALVARRR");
		this.pesquisadorAtual.setCracha(this.novoCracha);
		return null;
	}

	private HtmlInputText dataDesligamento;

	public HtmlInputText getDataDesligamento() {
		return dataDesligamento;
	}

	public void setDataDesligamento(HtmlInputText dataDesligamento) {
		this.dataDesligamento = dataDesligamento;
	}

	public String mudarSituacaoCracha() {

		if (this.novoCracha.getSituacao().equals("Desligado")) {
			this.novoCracha.setDataDesligamento(null);
			this.dataDesligamento.setValue(null);
			System.out.println("PASSOSUUU AQUIII Dentro do IF"
					+ this.novoCracha.getSituacao());
		} else {
			System.out.println("PASSOSUUU AQUIII "
					+ this.novoCracha.getSituacao());
		}
		return null;
	}

	public void listener(UploadEvent event) throws Exception {
		UploadItem item = event.getUploadItem();
		ImageFile file = new ImageFile();
		file.setLength(item.getData().length);
		file.setName(item.getFileName());
		file.setData(item.getData());

		InputStream in = new ByteArrayInputStream(item.getData());
		BufferedImage image = ImageIO.read(in);

		BufferedImage thumbImage = new BufferedImage(120, 150,
				BufferedImage.TYPE_INT_RGB);

		Graphics2D graphics2D = thumbImage.createGraphics();
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
				RenderingHints.VALUE_INTERPOLATION_BILINEAR);

		graphics2D.drawImage(image, 0, 0, 120, 150, null);

		this.pesquisadorAtual.setFoto(PrepararImagem.bufferToBytes(thumbImage,
				"jpeg"));
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		// if (this.pesquisadorAtual.getFoto() != null) {
		stream.write(this.pesquisadorAtual.getFoto());
		// }
	}

	public void deletar(ActionEvent event) {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			Pesquisador p = (Pesquisador) event.getComponent().getAttributes()
					.get("pesq");

			Pesquisador pesq = new Pesquisador();
			pesq.setIdPessoa(p.getIdPessoa());

			pesq = DaoHandler.getInstance().getPesquisadorDao().carregar(pesq);

			DaoHandler.getInstance().getPesquisadorDao().excluir(pesq);

			this.pesquisadoresListados.remove(p);

			DaoHandler.getInstance().getPublicacaoDao().atualizarAutor(p);

			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Pesquisador "
							+ p.getNome() + " removido com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar remover o Pesquisador " + e.getMessage(),
					""));
		}

	}

	public void editarTitulacao(ActionEvent event) {
		Titulacao t = (Titulacao) event.getComponent().getAttributes().get(
				"titulacao");

		this.titulacaoAdicionada = t;

		this.titulacaoAdicionada.setEditando(true);
	}
}
