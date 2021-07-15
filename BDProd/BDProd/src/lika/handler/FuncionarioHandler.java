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
import javax.faces.model.SelectItem;
import javax.imageio.ImageIO;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.Cracha;
import lika.model.Funcao;
import lika.model.Funcionario;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Usuario;
import lika.util.ImageFile;
import lika.util.PrepararImagem;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("funcionarioHandler")
@Scope("session")
public class FuncionarioHandler {

	private Funcionario funcionarioAtual;

	private List<Funcionario> funcionarios = new ArrayList<Funcionario>();

	private Usuario user;

	private NavigationHandler navigation;

	private String parametroConsulta = "";

	private TipoPesquisa tipoSelecionado = TipoPesquisa.NOME;

	private Cracha novoCracha = new Cracha();

	public Cracha getNovoCracha() {
		return novoCracha;
	}

	public void setNovoCracha(Cracha novoCracha) {
		this.novoCracha = novoCracha;
	}

	private static SelectItem[] tiposDePesquisas = {
			new SelectItem(TipoPesquisa.NOME, "Nome"),
			new SelectItem(TipoPesquisa.CPF, "CPF"),
			new SelectItem(TipoPesquisa.SEXO, "Sexo") };

	public static void setTiposDePesquisas(SelectItem[] tiposDePesquisas) {
		FuncionarioHandler.tiposDePesquisas = tiposDePesquisas;
	}

	public TipoPesquisa getTipoSelecionado() {
		return tipoSelecionado;
	}

	public void setTipoSelecionado(TipoPesquisa tipoSelecionado) {
		this.tipoSelecionado = tipoSelecionado;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public Pessoa getFuncionarioAtual() {
		return funcionarioAtual;
	}

	public void setFuncionarioAtual(Funcionario funcionarioAtual) {
		this.funcionarioAtual = funcionarioAtual;
	}

	public List<Funcionario> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;

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

	public void listarPorCPF() {
		this.funcionarios = DaoHandler.getInstance().getFuncionarioDao()
				.listar(parametroConsulta, "CPF");
	}

	public void listarPorSexo() {
		this.funcionarios = DaoHandler.getInstance().getFuncionarioDao()
				.listar(parametroConsulta, "Sexo");
	}

	public void consultar() {
		try {
			this.funcionarios.clear();
			if (this.tipoSelecionado.equals(TipoPesquisa.NOME)) {
				this.listarFuncionarioPorNome();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.CPF)) {
				this.listarPorCPF();
			} else if (this.tipoSelecionado.equals(TipoPesquisa.SEXO)) {
				this.listarPorSexo();
			}

		} catch (Exception e) {
			e.printStackTrace();
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar os Funcionários " + e.getMessage(),
					""));
		}
	}

	public void listarFuncionarioPorNome() {
		this.funcionarios.clear();
		this.funcionarios = DaoHandler.getInstance().getFuncionarioDao()
				.listar(this.parametroConsulta, "Nome");
	}

	public void novoFuncionario(ActionEvent event) {
		this.funcionarioAtual = new Funcionario();

	}

	public void adicionarFuncao(ActionEvent event) {
		Funcao o = (Funcao) event.getComponent().getAttributes().get("funcao");
		this.funcionarioAtual.setFuncao(o);

	}

	public void carregarFuncionario(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idFuncionario");

		Funcionario p = new Funcionario();
		p.setIdPessoa(id);
		System.err.println("LOAD");
		this.funcionarioAtual = DaoHandler.getInstance().getFuncionarioDao()
				.carregar(p);
		
		String cep = this.funcionarioAtual.getCEP();
		if (cep != null && !cep.isEmpty()){
			int index = cep.length() - 3;
			cep = cep.substring(0, index) + '-' + cep.substring(index);
			this.funcionarioAtual.setCEP(cep);
		}

	}

	public String salvarFuncionario() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			this.funcionarioAtual.setUsuarioAtualizou(this.user);
			
			String cep = this.funcionarioAtual.getCEP();
			if (cep != null && !cep.isEmpty()){
				int index = cep.lastIndexOf('-');
				String cep_funcionario = cep.substring(0, index) + cep.substring(index+1); 
				this.funcionarioAtual.setCEP(cep_funcionario);
			}
			
			this.funcionarioAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getFuncionarioDao().salvar(
					this.funcionarioAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Funcionário " + this.funcionarioAtual.getNome()
							+ " salvo com sucesso!", ""));
			
			this.funcionarioAtual.setCEP(cep);
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Funcionário " + e.getMessage(),
					""));

			return this.navigation.editarFuncionario();
		}

		return this.navigation.visualizarFuncionario();
	}

	public String cancelar() {
		if (this.funcionarioAtual.getIdPessoa() == null) {
			return "pesquisarFuncionario";
		} else {
			return null;
		}
	}

	public String refresh() {

		if (this.funcionarioAtual.getIdPessoa() != null) {

			DaoHandler.getInstance().getFuncionarioDao().refresh(
					this.funcionarioAtual);
			//
			// System.err.println("LISTANDO PROJETOS");

			return this.navigation.visualizarFuncionario();
		} else {
			return this.navigation.inicioFuncionario();
		}

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
					+ novoCracha.getSituacao());
		} else {
			System.out.println("PASSOSUUU AQUIII " + novoCracha.getSituacao());
		}
		return null;
	}

	public String cancelarCracha() {
		this.funcionarioAtual.setCracha(null);
		return null;
	}

	public String editarCracha() {
		this.novoCracha = this.funcionarioAtual.getCracha();
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
		this.funcionarioAtual.setCracha(this.novoCracha);
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

		this.funcionarioAtual.setFoto(PrepararImagem.bufferToBytes(thumbImage,
				"jpeg"));
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		// if (this.pesquisadorAtual.getFoto() != null) {
		stream.write(this.funcionarioAtual.getFoto());
		// }
	}

}
