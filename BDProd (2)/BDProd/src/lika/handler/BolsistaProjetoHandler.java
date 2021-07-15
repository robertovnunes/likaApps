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
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.component.html.HtmlInputText;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.imageio.ImageIO;

import lika.handler.PesquisadorHandler.TipoPesquisa;
import lika.model.BolsistaProjeto;
import lika.model.Cracha;
import lika.model.Usuario;
import lika.util.ImageFile;
import lika.util.PrepararImagem;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("bolsistaProjetoHandler")
@Scope("session")
public class BolsistaProjetoHandler {

	private BolsistaProjeto bolsistaProjetoAtual;

	private List<BolsistaProjeto> bolsistas = new ArrayList<BolsistaProjeto>();

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
		BolsistaProjetoHandler.tiposDePesquisas = tiposDePesquisas;
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

	public BolsistaProjeto getBolsistaProjetoAtual() {
		return bolsistaProjetoAtual;
	}

	public void setBolsistaProjetoAtual(BolsistaProjeto bolsistaProjetoAtual) {
		this.bolsistaProjetoAtual = bolsistaProjetoAtual;
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

	public List<BolsistaProjeto> getBolsistas() {
		return bolsistas;
	}

	public void setBolsistas(List<BolsistaProjeto> bolsistas) {
		this.bolsistas = bolsistas;
	}

	public void listarPorCPF() {
		this.bolsistas = DaoHandler.getInstance().getBolsistaProjetoDao()
				.listar(parametroConsulta, "CPF");
	}

	public void listarPorSexo() {
		this.bolsistas = DaoHandler.getInstance().getBolsistaProjetoDao()
				.listar(parametroConsulta, "Sexo");
	}

	public void consultar() {
		try {
			this.bolsistas.clear();
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
			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"ERRO: ao tentar listar os Bolsistas "
									+ e.getMessage(), ""));
		}
	}

	public void listarFuncionarioPorNome() {
		this.bolsistas.clear();
		this.bolsistas = DaoHandler.getInstance().getBolsistaProjetoDao()
				.listar(this.parametroConsulta, "Nome");
	}

	public void novoBolsistaProjeto(ActionEvent event) {
		this.bolsistaProjetoAtual = new BolsistaProjeto();

	}

	public void carregarBolsistaProjeto(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idBolsista");

		BolsistaProjeto p = new BolsistaProjeto();
		p.setIdPessoa(id);
		this.bolsistaProjetoAtual = DaoHandler.getInstance()
				.getBolsistaProjetoDao().carregar(p);
		
		
		String cep = this.bolsistaProjetoAtual.getCEP();
		if (cep != null && !cep.isEmpty()){
			int index = cep.length() - 3;
			cep = cep.substring(0, index) + '-' + cep.substring(index);
			this.bolsistaProjetoAtual.setCEP(cep);
		}
	}

	public String salvarBolsistaProjeto() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {
			this.bolsistaProjetoAtual.setUsuarioAtualizou(this.user);
			
			String cep = this.bolsistaProjetoAtual.getCEP();
			if (cep != null && !cep.isEmpty()){
				int index = cep.lastIndexOf('-');
				String cep_bolsista = cep.substring(0, index) + cep.substring(index+1); 
				this.bolsistaProjetoAtual.setCEP(cep_bolsista);
			}
			
			this.bolsistaProjetoAtual.setDataAtualizacao(new Date(System
					.currentTimeMillis()));
			DaoHandler.getInstance().getBolsistaProjetoDao().salvar(
					this.bolsistaProjetoAtual);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Bolsista " + this.bolsistaProjetoAtual.getNome()
							+ " salvo com sucesso!", ""));
			
			this.bolsistaProjetoAtual.setCEP(cep);
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Bolsista " + e.getMessage(), ""));

			return this.navigation.editarBolsista();
		}

		return this.navigation.visualizarBolsista();
	}

	public String cancelar() {
		if (this.bolsistaProjetoAtual.getIdPessoa() == null) {
			return "pesquisarBolsista";
		} else {
			return null;
		}
	}

	public String refresh() {

		if (this.bolsistaProjetoAtual.getIdPessoa() != null) {

			DaoHandler.getInstance().getBolsistaProjetoDao().refresh(
					this.bolsistaProjetoAtual);

			return this.navigation.visualizarBolsista();
		} else {
			return this.navigation.inicioBolsista();
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
					+ this.novoCracha.getSituacao());
		} else {
			System.out.println("PASSOSUUU AQUIII "
					+ this.novoCracha.getSituacao());
		}
		return null;
	}

	public String cancelarCracha() {
		this.bolsistaProjetoAtual.setCracha(null);
		return null;
	}

	public String editarCracha() {
		this.novoCracha = this.bolsistaProjetoAtual.getCracha();
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
		this.bolsistaProjetoAtual.setCracha(this.novoCracha);
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

		this.bolsistaProjetoAtual.setFoto(PrepararImagem.bufferToBytes(
				thumbImage, "jpeg"));
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		// if (this.pesquisadorAtual.getFoto() != null) {
		stream.write(this.bolsistaProjetoAtual.getFoto());
		// }
	}

}
