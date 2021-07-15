package lika.handler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import lika.model.AreaDePesquisa;
import lika.model.GrupoDePesquisa;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.relatorio.RelatorioPublicacaoDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("relatorioPublicacaoHandler")
@Scope("session")
public class relatorioPublicacaoHandler {

	public List<Publicacao> listarPublicacaoRelatorioFiltro(String anoInicial,
			String anoFinal, Object bean, String tipo) {

		if (bean instanceof Pessoa) {
			return DaoHandler.getInstance().getPublicacaoDao()
					.publicacoesDaPessoaRelatorio(anoInicial, anoFinal,
							(Pessoa) bean, tipo);
		} else if (bean instanceof Projeto) {
			return DaoHandler.getInstance().getPublicacaoDao()
					.listarPublicacaoProjetoRelatorio(anoInicial, anoFinal,
							(Projeto) bean, tipo);
		} else if (bean instanceof GrupoDePesquisa) {
			return DaoHandler.getInstance().getPublicacaoDao()
					.listarPublicacaoGrupoRelatorio(anoInicial, anoFinal,
							(GrupoDePesquisa) bean, tipo);
		} else if (bean instanceof AreaDePesquisa) {
			return DaoHandler.getInstance().getPublicacaoDao()
					.listarPublicacaoAreaDePequisaRelatorio(anoInicial,
							anoFinal, (AreaDePesquisa) bean, tipo);
		}
		return null;
	}

	public void gerarDadosPublicacao(ActionEvent event) {
		List<Publicacao> dados = new ArrayList<Publicacao>();
		try {

			if (this.tipoFiltro.equals("Geral do LIKA")) {
				if (this.tipo.equals("Todos os Tipos")) {
					dados = DaoHandler.getInstance().getPublicacaoDao()
							.listarPublicacaoRelatorio(this.dataInicio,
									this.dataFim);
				} else if (this.tipo.equals("Anais de Eventos")) {
					dados = DaoHandler.getInstance().getPublicacaoDao()
							.listarPublicacaoRelatorio(this.dataInicio,
									this.dataFim, this.tipo);
				} else if (this.tipo.equals("Periódico")) {
					dados = DaoHandler.getInstance().getPublicacaoDao()
							.listarPublicacaoRelatorio(this.dataInicio,
									this.dataFim, this.tipo);
				} else if (this.tipo.equals("Livro")) {
					dados = DaoHandler.getInstance().getPublicacaoDao()
							.listarPublicacaoRelatorio(this.dataInicio,
									this.dataFim, this.tipo);
				}
			} else {

				if (this.bean == null) {
					throw new Exception(this.tipoFiltro.substring(
							this.tipoFiltro.indexOf(" "), this.tipoFiltro
									.length()));
				}

				if (this.tipo.equals("Todos os Tipos")) {
					dados = this.listarPublicacaoRelatorioFiltro(
							this.dataInicio, this.dataFim, this.bean, "");
				} else if (this.tipo.equals("Anais de Eventos")) {
					dados = this
							.listarPublicacaoRelatorioFiltro(this.dataInicio,
									this.dataFim, this.bean, this.tipo);
				} else if (this.tipo.equals("Periódico")) {
					dados = this
							.listarPublicacaoRelatorioFiltro(this.dataInicio,
									this.dataFim, this.bean, this.tipo);
				} else if (this.tipo.equals("Livro")) {
					dados = this
							.listarPublicacaoRelatorioFiltro(this.dataInicio,
									this.dataFim, this.bean, this.tipo);
				}
			}
			System.out.println(" NUMERROOo  " + dados.size());

			String periodo = this.dataInicio + " a " + this.dataFim;

			if (dataInicio == "" && dataFim == "") {
				periodo = "Todo";
			}

			RelatorioPublicacaoDataSource dadosPublicacao = new RelatorioPublicacaoDataSource(
					dados, periodo, this.tipoFiltro, this.tipo);

			FacesContext context = FacesContext.getCurrentInstance();

			ServletContext servletContext = (ServletContext) context
					.getExternalContext().getContext();

			HttpServletResponse response = (HttpServletResponse) context
					.getExternalContext().getResponse();

			try {
				byte[] arquivo = new byte[0];

				if (dados.size() == 0) {
					throw new Exception("Dados Inválidos");
				}

				ServletOutputStream servletOutputStream = response
						.getOutputStream();

				Map<String, Object> parametros = new HashMap<String, Object>();

				ImageIcon img = new ImageIcon(servletContext
						.getRealPath("/images/lika_marca_qualidade.jpg"));
				ImageIcon img2 = new ImageIcon(servletContext
						.getRealPath("/images/ufpe.jpg"));
				parametros.put("lika", img.getImage());
				parametros.put("ufpe", img2.getImage());
				InputStream reportStream = context.getExternalContext()
						.getResourceAsStream(
								"/relatorios/RelatorioPublicacoes.jasper");

				JasperPrint impressao = JasperFillManager.fillReport(
						reportStream, parametros, dadosPublicacao);

				// VER ISSO AQUI
				arquivo = JasperExportManager.exportReportToPdf(impressao);

				response.setContentType("application/pdf");
				response.addHeader("Content-Disposition",
						"attachment;filename=Relatório.pdf");

				response.setContentLength(arquivo.length);

				OutputStream saida = response.getOutputStream();

				saida.write(arquivo, 0, arquivo.length);
				saida.flush();
				saida.close();

				context.addMessage(null, new FacesMessage(
						FacesMessage.SEVERITY_INFO,
						"Relatório Gerado com Sucesso! ", ""));

				FacesContext.getCurrentInstance().responseComplete();
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				context
						.addMessage(
								null,
								new FacesMessage(
										FacesMessage.SEVERITY_ERROR,
										"Não foi possível gerar o relatório, nenhuma publicação encontrada com os filtros selecionados! "
												+ e.getMessage(), ""));

			} catch (IOException e) {

				// TODO Auto-generated catch block
				e.printStackTrace();
				context
						.addMessage(
								null,
								new FacesMessage(
										FacesMessage.SEVERITY_ERROR,
										"Não foi possível gerar o relatório, nenhuma publicação encontrada com os filtros selecionados! "
												+ e.getMessage(), ""));
			} catch (Exception e) {
				context
						.addMessage(
								null,
								new FacesMessage(
										FacesMessage.SEVERITY_ERROR,
										"Não foi possível gerar o relatório, nenhuma publicação encontrada com os filtros selecionados! "
												+ e.getMessage(), ""));
			}
		} catch (Exception e) {

			FacesContext context = FacesContext.getCurrentInstance();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Não foi possível gerar o relatório, selecione um "
							+ e.getMessage() + "!", ""));
		}

	}

	public void selecionarAutor(ActionEvent event) {
		this.autor = (Pessoa) event.getComponent().getAttributes().get("autor");
		this.bean = autor;
	}

	public void selecionarProjeto(ActionEvent event) {
		this.projeto = (Projeto) event.getComponent().getAttributes().get(
				"projeto");
		this.bean = projeto;
	}

	public void selecionarGrupo(ActionEvent event) {
		this.grupo = (GrupoDePesquisa) event.getComponent().getAttributes()
				.get("grupo");
		this.bean = grupo;
	}

	public void selecionarArea(ActionEvent event) {
		this.areaDePesquisa = (AreaDePesquisa) event.getComponent()
				.getAttributes().get("area");
		this.bean = areaDePesquisa;
	}

	public void tipoFiltroChanged(ValueChangeEvent event) {
		this.bean = null;
	}

	private Object bean;

	private Pessoa autor;

	private Projeto projeto;

	private AreaDePesquisa areaDePesquisa;

	private GrupoDePesquisa grupo;

	public AreaDePesquisa getAreaDePesquisa() {
		return areaDePesquisa;
	}

	public void setAreaDePesquisa(AreaDePesquisa areaDePesquisa) {
		this.areaDePesquisa = areaDePesquisa;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public GrupoDePesquisa getGrupo() {
		return grupo;
	}

	public void setGrupo(GrupoDePesquisa grupo) {
		this.grupo = grupo;
	}

	private String tipo;
	private String tipoFiltro;

	private String dataInicio;
	private String dataFim;

	public Pessoa getAutor() {
		return autor;
	}

	public void setAutor(Pessoa autor) {
		this.autor = autor;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTipoFiltro() {
		return tipoFiltro;
	}

	public void setTipoFiltro(String tipoFiltro) {
		this.tipoFiltro = tipoFiltro;
	}

	public String getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDataFim() {
		return dataFim;
	}

	public void setDataFim(String dataFim) {
		this.dataFim = dataFim;
	}

}
