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

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.Aluno;
import lika.model.Cracha;
import lika.model.Departamento;
import lika.model.Laboratorio;
import lika.model.Pesquisador;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.model.ProjetoSimples;
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
@Controller("alunoHandler")
@Scope("session")
public class AlunoHandler {

	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();

	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}

	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	public enum TipoPesquisa {

		NOME, SEXO, CPF, LOGIN
	};

	private Cracha novoCracha = new Cracha();

	public Cracha getNovoCracha() {
		return novoCracha;
	}

	public void setNovoCracha(Cracha novoCracha) {
		this.novoCracha = novoCracha;
	}

	private SelectItem[] tipoAlunos = { new SelectItem("IC", "IC"),
			new SelectItem("Estagi�rio", "Estagi�rio"),
			new SelectItem("Mestrado", "Mestrado"),
			new SelectItem("Mest-Lika", "Mest-Lika"),
			new SelectItem("Doutorado", "Doutorado"),
			new SelectItem("Dout-Lika", "Dout-Lika"),
			new SelectItem("P�s-Doc", "P�s-Doc"),
			new SelectItem("Especializa��o", "Especializa��o"),
			new SelectItem("Outros", "Outros") };

	private boolean projetoAluno;

	public boolean isProjetoAluno() {
		return projetoAluno;
	}

	public void setProjetoAluno(boolean projetoAluno) {
		this.projetoAluno = projetoAluno;
	}

	public SelectItem[] getTipoAlunos() {
		return tipoAlunos;
	}

	public void setTipoAlunos(SelectItem[] tipoAlunos) {
		this.tipoAlunos = tipoAlunos;
	}

	public static void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		AlunoHandler.tiposDePesquisas = tiposDePesquisas;
	}

	private NavigationHandler navigation;

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	private Titulacao titulacaoAdicionada = new Titulacao();

	private Projeto projetoAdicionado = new Projeto();

	private ProjetoSimples projetoSimples = new ProjetoSimples();

	private String nomeSubProjeto;

	private String parametroConsulta;
	private Usuario usr;
	private Aluno alunoAtual = new Aluno();

	private HashMap<Integer, Projeto> projetosAdicionados = new HashMap<Integer, Projeto>();
	private HashMap<Integer, Projeto> projetosRemovidos = new HashMap<Integer, Projeto>();

	private List<Aluno> alunosListados = new ArrayList<Aluno>();
	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;
	private static SelectItem[] tiposDePesquisas = {
			new SelectItem(TipoPesquisa.NOME, "Nome"),
			new SelectItem(TipoPesquisa.CPF, "CPF"),
			new SelectItem(TipoPesquisa.SEXO, "Sexo") };

	public void carregarAluno(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idAluno");

		Aluno p = new Aluno();
		p.setIdPessoa(id);
		System.err.println("LOAD");
		this.alunoAtual = DaoHandler.getInstance().getAlunoDao().carregar(p);
		System.err.println("LISTANDO PROJETOS");
		List<Projeto> projetos = DaoHandler.getInstance().getAlunoDao()
				.listarProjetosESubProjetos(this.alunoAtual);

		for (Projeto proj : projetos) {
			this.projetosAdicionados.put(proj.getIdProjeto(), proj);
		}

		this.publicacoes.clear();

		this.publicacoes = DaoHandler.getInstance().getPublicacaoDao()
				.listarPublicacoesDaPessoa(this.alunoAtual);
		
		String cep = this.alunoAtual.getCEP();
		if (cep != null && !cep.isEmpty()){
			int index = cep.length() - 3;
			cep = cep.substring(0, index) + '-' + cep.substring(index);
			this.alunoAtual.setCEP(cep);
		}		
	}

	public ProjetoSimples getProjetoSimples() {
		return projetoSimples;
	}

	public void setProjetoSimples(ProjetoSimples projetoSimples) {
		this.projetoSimples = projetoSimples;
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

	public Aluno getAlunoAtual() {
		return alunoAtual;
	}

	public void setAlunoAtual(Aluno alunoAtual) {
		this.alunoAtual = alunoAtual;
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
		this.alunosListados = DaoHandler.getInstance().getAlunoDao().listar(
				parametroConsulta, "Nome");
	}

	public void listarPorCPF() {
		this.alunosListados = DaoHandler.getInstance().getAlunoDao().listar(
				parametroConsulta, "CPF");
	}

	public void listarPorSexo() {
		this.alunosListados = DaoHandler.getInstance().getAlunoDao().listar(
				parametroConsulta, "Sexo");
	}

	public void consultar() {
		try {
			this.alunosListados.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarPorNome();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.CPF)) {
				this.listarPorCPF();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.SEXO)) {
				this.listarPorSexo();
			}

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar os Alunos " + e.getMessage(), ""));
		}
	}

	public List<Aluno> getAlunosListados() {
		return alunosListados;
	}

	public void setAlunosListados(List<Aluno> alunosListados) {
		this.alunosListados = alunosListados;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public String adicionarProjeto() {
		this.nomeSubProjeto = null;
		this.projetoSimples = new ProjetoSimples();
		return null;
	}

	public String novaTitulacao() {
		this.titulacaoAdicionada = new Titulacao();
		return null;
	}

	public void adicionarOrientador(ActionEvent event) {
		Pesquisador o = (Pesquisador) event.getComponent().getAttributes().get(
				"orientador");
		this.alunoAtual.setOrientador(o);

	}

	public void adicionarLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");
		boolean contains = false;
		for (Laboratorio p : this.alunoAtual.getLaboratorios()) {
			Integer pId = p.getIdLaboratorio();
			Integer labId = lab.getIdLaboratorio();
			if (pId.equals(labId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			this.alunoAtual.getLaboratorios().add(lab);
		}
	}

	public void removerLaboratorio(ActionEvent event) {
		Laboratorio lab = (Laboratorio) event.getComponent().getAttributes()
				.get("lab");
		this.alunoAtual.getLaboratorios().remove(lab);
	}

	public void adicionarAreaDePesquisa(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		boolean contains = false;
		for (SubAreaDePesquisa p : this.alunoAtual.getAreasPesquisa()) {
			Integer pId = p.getIdSubAreaDePesquisa();
			Integer areaId = area.getIdSubAreaDePesquisa();
			if (pId.equals(areaId)) {
				contains = true;
				break;
			}
		}
		if (!contains) {
			System.out.println("AREEAAA ADICIONAADAAAAA");
			this.alunoAtual.getAreasPesquisa().add(area);
		}
	}

	public void removerAreaDePesquisa(ActionEvent event) {
		SubAreaDePesquisa area = (SubAreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		this.alunoAtual.getAreasPesquisa().remove(area);
	}

	public String adicionarTitulacao() {
		if (!this.titulacaoAdicionada.isEditando()) {
			this.alunoAtual.getTitulacao().add(this.titulacaoAdicionada);
			this.titulacaoAdicionada = new Titulacao();
		}
		return null;
	}

	public String adicionarProjetoSimples() {
		this.projetoSimples.setDataInicio(new Date(System.currentTimeMillis()));
		this.alunoAtual.getProjetosSimples().add(this.projetoSimples);
		this.projetoSimples = new ProjetoSimples();

		return null;
	}

	public void removerProjetoSimples(ActionEvent event) {
		ProjetoSimples p = (ProjetoSimples) event.getComponent()
				.getAttributes().get("projeto");

		this.alunoAtual.getProjetosSimples().remove(p);
		this.projetoSimples = new ProjetoSimples();

	}

	public void removerTitulacao(ActionEvent event) {
		Titulacao t = (Titulacao) event.getComponent().getAttributes().get(
				"titulacao");

		this.alunoAtual.getTitulacao().remove(t);
		this.titulacaoAdicionada = new Titulacao();

	}

	public String adicionarProjetosCompleto() {
		this.projetoAdicionado.setNomeSubprojeto(this.nomeSubProjeto);

		this.projetosAdicionados.put(this.projetoAdicionado.getIdProjeto(),
				this.projetoAdicionado);

		this.projetosRemovidos.remove(this.projetoAdicionado.getIdProjeto());

		return null;
	}

	public void novoAluno(ActionEvent event) {
		this.alunoAtual = new Aluno();
		this.alunoAtual.setTipoAluno("IC");
		this.projetosAdicionados = new HashMap<Integer, Projeto>();
		this.publicacoes = new ArrayList<Publicacao>();
		this.projetoSimples = new ProjetoSimples();
	}

	public void removerProjetoCompleto(ActionEvent event) {
		Projeto p = (Projeto) event.getComponent().getAttributes().get(
				"projeto");

		this.projetosAdicionados.remove(p.getIdProjeto());
		this.projetosRemovidos.put(p.getIdProjeto(), p);
	}

	public String salvarAluno() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			this.alunoAtual.setUsuarioAtualizou(this.usr);
			
			// manipulate cep to remove '-'
			String cep = this.alunoAtual.getCEP();
			if (cep != null && !cep.isEmpty()){
				int index = cep.lastIndexOf('-');
				String cep_aluno = cep.substring(0, index) + cep.substring(index+1); 
				this.alunoAtual.setCEP(cep_aluno);
			}			
			
			this.alunoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));

			if (this.alunoAtual.getInstituicaoOrigem() != null
					&& this.alunoAtual.getInstituicaoOrigem().equals("Outra")) {
				this.alunoAtual.setDepartamento(null);
			}

			DaoHandler.getInstance().getAlunoDao().salvar(this.alunoAtual);

			for (Projeto p : this.projetosAdicionados.values()) {
				PessoaProjeto pp = new PessoaProjeto();
				pp.setNomeSubProjeto(p.getNomeSubprojeto());
				PessoaProjetoID id = new PessoaProjetoID();
				id.setPessoa(this.alunoAtual);
				id.setProjeto(p);
				pp.setId(id);
				DaoHandler.getInstance().getPessoaProjetoDao().salvar(pp);
			}

			for (Projeto p : this.projetosRemovidos.values()) {
				DaoHandler.getInstance().getAlunoDao().removerProjeto(
						this.alunoAtual, p);
			}

			this.projetosRemovidos.clear();

			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO,
							"Auno " + this.alunoAtual.getNome()
									+ " salvo com sucesso!", ""));
			
			this.alunoAtual.setCEP(cep);
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Auno " + e.getMessage() + ""
							+ e.getCause().getCause().getMessage(), ""));

			return this.navigation.editarAluno();
		}

		return this.navigation.visualizarAluno();
	}
	
	public String tornarPesquisador(){
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			
			Pesquisador pesquisadorAluno = new Pesquisador(this.alunoAtual.getIdPessoa(), this.alunoAtual.getNome(), this.alunoAtual.getCpf());
			
			DaoHandler.getInstance().getPesquisadorDao().tornarAlunoPesquisador(pesquisadorAluno);

			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO,
							"Auno " + this.alunoAtual.getNome()
									+ " virou pesquisador!", ""));
			
		}catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar tornar o Auno em Pesquisador", ""));

			return this.navigation.editarAluno();
		}
		
		return this.navigation.visualizarPesquisador();
	}

	public String cancelar() {
		if (this.alunoAtual.getIdPessoa() == null) {
			return "pesquisarAluno";
		} else {
			return null;
		}
	}

	public String refresh() {

		if (this.alunoAtual.getIdPessoa() != null) {
			DaoHandler.getInstance().getAlunoDao().refresh(this.alunoAtual);

			System.err.println("LISTANDO PROJETOS");

			this.projetosAdicionados.clear();
			this.projetosRemovidos.clear();

			List<Projeto> projetos = DaoHandler.getInstance().getAlunoDao()
					.listarProjetosESubProjetos(this.alunoAtual);

			for (Projeto proj : projetos) {
				this.projetosAdicionados.put(proj.getIdProjeto(), proj);
			}

			return this.navigation.visualizarAluno();
		} else {
			return this.navigation.inicioAluno();
		}

	}

	public List<SelectItem> getDepartamentos() {
		List<SelectItem> temp = new ArrayList<SelectItem>();

		List<Departamento> dep = DaoHandler.getInstance().getDepartamentoDao()
				.listarDepartamentos();

		if (this.alunoAtual.getDepartamento() == null) {
			this.alunoAtual.setDepartamento(dep.get(0));
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

		this.alunoAtual.setDepartamento(dep);

	}

	public String mudarInstituicaoOrigem() {

		if (!this.alunoAtual.getInstituicaoOrigem().equals(
				"Universidade Federal de Pernambuco")) {
			Departamento d = new Departamento();
			d.setIdDepartamento(1);
			this.alunoAtual.setDepartamento(d);

		}

		System.out.println("PASSOSUUU AQUIII "
				+ this.alunoAtual.getInstituicaoOrigem());

		return "editarAluno";

	}

	public boolean isMostrarCentro() {
		if (this.alunoAtual.getInstituicaoOrigem() == null) {
			return true;
		}

		System.out.println("Mostrarr Centroo "
				+ this.alunoAtual.getInstituicaoOrigem().equals(
						"Universidade Federal de Pernambuco"));

		return this.alunoAtual.getInstituicaoOrigem().equals(
				"Universidade Federal de Pernambuco");
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

	public String cancelarCracha() {
		this.alunoAtual.setCracha(null);
		return null;
	}

	public String editarCracha() {
		this.novoCracha = this.alunoAtual.getCracha();
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
		this.alunoAtual.setCracha(this.novoCracha);
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

		this.alunoAtual.setFoto(PrepararImagem
				.bufferToBytes(thumbImage, "jpeg"));
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		// if (pesquisadorAluno.getFoto() != null) {
		stream.write(this.alunoAtual.getFoto());
		// }
	}

	public void deletar(ActionEvent event) {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			Aluno p = (Aluno) event.getComponent().getAttributes().get("aluno");

			Aluno aluno = new Aluno();
			aluno.setIdPessoa(p.getIdPessoa());

			aluno = DaoHandler.getInstance().getAlunoDao().carregar(aluno);

			DaoHandler.getInstance().getAlunoDao().excluir(aluno);

			this.alunosListados.remove(p);

			DaoHandler.getInstance().getPublicacaoDao().atualizarAutor(p);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Aluno " + p.getNome() + " removido com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar remover o Aluno " + e.getMessage(), ""));
		}

	}

	public void editarTitulacao(ActionEvent event) {
		Titulacao t = (Titulacao) event.getComponent().getAttributes().get(
				"titulacao");

		this.titulacaoAdicionada = t;

		this.titulacaoAdicionada.setEditando(true);
	}

}
