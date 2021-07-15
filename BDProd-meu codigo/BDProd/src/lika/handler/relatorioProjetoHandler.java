package lika.handler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
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
import lika.model.Pesquisador;
import lika.model.Projeto;
import lika.relatorio.RelatorioProjetoDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JRSaveContributor;
import net.sf.jasperreports.view.JasperViewer;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("relatorioProjetoHandler")
@Scope("session")
public class relatorioProjetoHandler {

	private final String PDF = "PDF (*.pdf)";
	private final String RTF = "RTF (*.rtf)";
	private final String HTML = "HTML (*.htm, *.html)";
	private final String XLS = "Single sheet XLS (*.xls)";
	private final String CSV = "CSV (*.csv)";

	private final List<String> PERMITTED_FILE_TYPES_LIST = Arrays.asList(PDF, RTF, HTML, XLS, CSV);

	private Date dInicio;
	private Date dFim;
	private Object bean;
	private Pesquisador pesquisador;
	private AreaDePesquisa areaDePesquisa;
	private GrupoDePesquisa grupo;
	private String tipo;
	private String tipoFiltro;

	public Pesquisador getPesquisador() {
		return pesquisador;
	}

	public void setPesquisador(Pesquisador pesquisador) {
		this.pesquisador = pesquisador;
	}

	private String dataInicio;
	private String dataFim;

	public List<Projeto> listarProjetoRelatorioFiltro(String anoInicial, String anoFinal, Object bean, String tipo, boolean financiamento) {

		if (bean instanceof Pesquisador) {
			return DaoHandler.getInstance().getProjetoDao().listarProjetoResponsavelRelatorio(this.dInicio, this.dFim, financiamento, tipo, (Pesquisador) bean);
		} else if (bean instanceof GrupoDePesquisa) {
			return DaoHandler.getInstance().getProjetoDao().listarProjetoGrupoRelatorio(this.dInicio, this.dFim, financiamento, tipo, (GrupoDePesquisa) bean);
		} else if (bean instanceof AreaDePesquisa) {
			return DaoHandler.getInstance().getProjetoDao().listarProjetoAreaRelatorio(this.dInicio, this.dFim, financiamento, tipo, (AreaDePesquisa) bean);
		}
		return null;
	}

	public void pegarDatas() throws Exception {

		int anoIn = 0;
		int anoFim = 0;
		if (this.dataInicio == "" && this.dataFim == "") {
			this.dInicio = null;
			this.dataFim = null;
			return;
		}

		try {
			anoIn = Integer.parseInt(this.dataInicio);
			anoFim = Integer.parseInt(this.dataFim);

			Calendar c = new GregorianCalendar(anoIn, 1, 1);
			Calendar c2 = new GregorianCalendar(anoFim, 12, 31);

			this.dInicio = c.getTime();
			this.dFim = c2.getTime();
		} catch (Exception ex) {
			throw new Exception("Não foi possível gerar o relatório, selecione um Periódo válido");
		}
	}

	public void gerarDadosProjeto(ActionEvent event) {
		List<Projeto> dados = new ArrayList<Projeto>();
		try {
			this.pegarDatas();

			if (this.tipoFiltro.equals("Geral do LIKA")) {
				if (this.tipo.equals("Todos os Tipos")) {

					dados = DaoHandler.getInstance().getProjetoDao().listarProjetoRelatorioData(this.dInicio, this.dFim);

				} else if (this.tipo.equals("Financiados")) {
					dados = DaoHandler.getInstance().getProjetoDao().listarProjetoRelatorio(this.dInicio, this.dFim, true, "");
				} else if (this.tipo.equals("Não Financiados")) {
					dados = DaoHandler.getInstance().getProjetoDao().listarProjetoRelatorio(this.dInicio, this.dFim, false, "");
				}
			} else {

				if (this.bean == null) {
					throw new Exception("Não foi possível gerar o relatório, selecione um " + this.tipoFiltro.substring(this.tipoFiltro.indexOf(" "), this.tipoFiltro.length()));
				}

				if (this.tipo.equals("Todos os Tipos")) {
					dados = this.listarProjetoRelatorioFiltro(this.dataInicio, this.dataFim, this.bean, tipo, false);
				} else if (this.tipo.equals("Financiados")) {
					dados = this.listarProjetoRelatorioFiltro(this.dataInicio, this.dataFim, this.bean, "", true);
				} else if (this.tipo.equals("Não Financiados")) {
					dados = this.listarProjetoRelatorioFiltro(this.dataInicio, this.dataFim, this.bean, "", false);
				}
			}
			System.out.println(" NUMERROO  " + dados.size());

			String periodo = this.dataInicio + " a " + this.dataFim;

			if (this.dInicio == null && this.dFim == null) {
				periodo = "Todo";
			}

			RelatorioProjetoDataSource dadosProjetos = new RelatorioProjetoDataSource(dados);

			FacesContext context = FacesContext.getCurrentInstance();

			ServletContext servletContext = (ServletContext) context.getExternalContext().getContext();

			HttpServletResponse response = (HttpServletResponse) context.getExternalContext().getResponse();

			try {

				byte[] arquivo = new byte[0];

				if (dados.size() == 0) {
					throw new Exception("Não foi possível gerar o relatório, Dados Inválidos!");
				}

				ServletOutputStream servletOutputStream = response.getOutputStream();

				Map<String, Object> parametros = new HashMap<String, Object>();

				parametros.put("por", this.tipoFiltro);
				parametros.put("periodo", periodo);
				parametros.put("tipo", this.tipo);
				ImageIcon img = new ImageIcon(servletContext.getRealPath("/images/lika_marca_qualidade.jpg"));
				ImageIcon img2 = new ImageIcon(servletContext.getRealPath("/images/ufpe.jpg"));
				parametros.put("lika", img.getImage());
				parametros.put("ufpe", img2.getImage());

				if (dados.size() == 1) {
					parametros.put("total", dados.size() + " Projeto");
				}
				
				else {
					parametros.put("total", dados.size() + " Projetos");
				}
				InputStream reportStream = context.getExternalContext().getResourceAsStream("/relatorios/RelatorioProjeto.jasper");

				// Abre o relatorio em um viewer
				JasperPrint impressao = JasperFillManager.fillReport(reportStream, parametros, dadosProjetos);

				arquivo = JasperExportManager.exportReportToPdf(impressao);

				response.setContentType("application/pdf");
				response.addHeader("Content-Disposition", "attachment;filename=Relatório.pdf");

				response.setContentLength(arquivo.length);

				OutputStream saida = response.getOutputStream();

				saida.write(arquivo, 0, arquivo.length);
				saida.flush();
				saida.close();

				context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Relatório Gerado com Sucesso! ", ""));

				FacesContext.getCurrentInstance().responseComplete();

				context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Relatório Gerado com Sucesso! ", ""));
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Não foi possível gerar o relatório, nenhum projeto encontrado com os filtros selecionados! " + e.getMessage(), ""));

			} catch (IOException e) {

				// TODO Auto-generated catch block
				e.printStackTrace();
				context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Não foi possível gerar o relatório, nenhum projeto encontrado com os filtros selecionados! " + e.getMessage(), ""));
			} catch (Exception e) {
				e.printStackTrace();
				context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Não foi possível gerar o relatório, nenhum projeto encontrado com os filtros selecionados! " + e.getMessage(), ""));
			}
		} catch (Exception e) {
			e.printStackTrace();
			FacesContext context = FacesContext.getCurrentInstance();
			context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), ""));
		}

	}

	public void selecionarResponsavel(ActionEvent event) {
		this.pesquisador = (Pesquisador) event.getComponent().getAttributes().get("resp");
		this.bean = pesquisador;
	}

	public void selecionarGrupo(ActionEvent event) {
		this.grupo = (GrupoDePesquisa) event.getComponent().getAttributes().get("grupo");
		this.bean = grupo;
	}

	public void selecionarArea(ActionEvent event) {
		this.areaDePesquisa = (AreaDePesquisa) event.getComponent().getAttributes().get("area");
		this.bean = areaDePesquisa;
	}

	public void tipoFiltroChanged(ValueChangeEvent event) {
		this.bean = null;
	}

	public AreaDePesquisa getAreaDePesquisa() {
		return areaDePesquisa;
	}

	public void setAreaDePesquisa(AreaDePesquisa areaDePesquisa) {
		this.areaDePesquisa = areaDePesquisa;
	}

	public GrupoDePesquisa getGrupo() {
		return grupo;
	}

	public void setGrupo(GrupoDePesquisa grupo) {
		this.grupo = grupo;
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
