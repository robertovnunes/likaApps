package lika.handler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import lika.model.Aluno;
import lika.model.Pesquisador;
import lika.model.Projeto;
import lika.model.ProjetoSimples;
import lika.relatorio.RelatorioAlunosDS;
import lika.relatorio.RelatorioAlunosProjetosDS;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("relatorioAlunoHandler")
@Scope("session")
public class RelatorioAlunoHandler {

	private Date dInicio;
	private Date dFim;
	private Object bean;
	private Pesquisador pesquisador;
	private String tipo;
	private String tipoFiltro;
	private String dataInicio;
	private String dataFim;
	private String situacao;

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Pesquisador getPesquisador() {
		return pesquisador;
	}

	public void setPesquisador(Pesquisador pesquisador) {
		this.pesquisador = pesquisador;
	}

	public List<Aluno> listarAlunoRelatorioFiltro(String anoInicial,
			String anoFinal, Object bean, String tipo) {

		if (bean instanceof Pesquisador) {
			return DaoHandler.getInstance().getAlunoDao()
					.listarAlunosRelatorio(this.dInicio, this.dFim,
							(Pesquisador) bean, tipo, this.situacao);
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

			Calendar c = new GregorianCalendar(anoIn, 0, 1);
			Calendar c2 = new GregorianCalendar(anoFim, 11, 31);

			this.dInicio = c.getTime();
			this.dFim = c2.getTime();
		} catch (Exception ex) {
			throw new Exception(
					"Não foi possível gerar o relatório, selecione um Período válido");
		}
	}

	public void gerarRelatorioAlunosPorProjeto() {
		List<Projeto> dadosProjeto = new ArrayList<Projeto>();
		List<ProjetoSimples> dadosProjetoSimples = new ArrayList<ProjetoSimples>();

		FacesContext context = FacesContext.getCurrentInstance();
		try {
			this.pegarDatas();

			String periodo;
			if (this.dInicio != null && this.dataFim != null) {
				periodo = this.dataInicio + " a " + this.dataFim;
			} else {
				periodo = " - ";
			}

			dadosProjeto = DaoHandler.getInstance().getProjetoDao()
					.listarProjetoRelatorioData(dInicio, dFim);

			dadosProjetoSimples = DaoHandler.getInstance()
					.getPessoaProjetoDao().listarProjetosSimples();

			List<Object> dados = new ArrayList<Object>();
			dados.addAll(dadosProjeto);
			dados.addAll(dadosProjetoSimples);

			if (dados.size() == 0) {
				throw new Exception(
						"Não foi possível gerar o relatório, Dados Inválidos!");
			}

			ServletContext servletContext = (ServletContext) context
					.getExternalContext().getContext();

			RelatorioAlunosProjetosDS dadosAlunos = new RelatorioAlunosProjetosDS(
					dados);

			Map<String, Object> parametros = new HashMap<String, Object>();

			parametros.put("por", this.tipoFiltro);
			parametros.put("periodo", periodo);
			parametros.put("tipo", this.tipo);
			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));
			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());

			parametros.put("total", " -");

			parametros
					.put(
							"caminhoSub",
							servletContext
									.getResourceAsStream("/relatorios/SubRelatorioAlunos.jasper"));

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/RelatorioAlunosProjetos.jasper");

			// Abre o relatorio em um viewer
			JasperPrint impressao = JasperFillManager.fillReport(reportStream,
					parametros, dadosAlunos);

			Locale lingua = new Locale("pt", "BR");
			JasperViewer viewer = new JasperViewer(impressao, false, lingua);
			viewer.setTitle("Relatório dos Alunos do LIKA");

			viewer.setVisible(true);

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_INFO,
					"Relatório Gerado com Sucesso! ", ""));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			context
					.addMessage(
							null,
							new FacesMessage(
									FacesMessage.SEVERITY_ERROR,
									"Não foi possível gerar o relatório, nenhuma publicao encontrada com os filtros selecionados! ",
									""));
		}
	}

	public void gerarDadosAluno(ActionEvent event) {
		List<Aluno> dados = new ArrayList<Aluno>();

		if (this.tipoFiltro.equals("Por Projetos")) {
			this.gerarRelatorioAlunosPorProjeto();
			return;
		}

		try {
			this.pegarDatas();

			if (this.tipoFiltro.equals("Geral do LIKA")) {
				if (this.tipo.equals("Todos os Tipos")) {

					dados = DaoHandler.getInstance().getAlunoDao()
							.listarAlunosRelatorio(this.dInicio, this.dFim,
									this.situacao);

				} else {
					dados = DaoHandler.getInstance().getAlunoDao()
							.listarAlunosRelatorio(this.dInicio, this.dFim,
									this.tipo, this.situacao);
				}

			} else {
				if (this.bean == null) {
					throw new Exception(
							"Não foi possível gerar o relatório, selecione um "
									+ this.tipoFiltro.substring(this.tipoFiltro
											.indexOf(" "), this.tipoFiltro
											.length()));
				}

				if (this.tipo.equals("Todos os Tipos")) {
					dados = this.listarAlunoRelatorioFiltro(this.dataInicio,
							this.dataFim, this.bean, "");
				} else {
					dados = this.listarAlunoRelatorioFiltro(this.dataInicio,
							this.dataFim, this.bean, this.tipo);
				}
			}
			System.out.println(" NUMERROO  " + dados.size());

			String periodo = this.dataInicio + " a " + this.dataFim;

			if (this.dInicio == null && this.dFim == null) {
				periodo = "Todo";
			}

			RelatorioAlunosDS dadosAlunos = new RelatorioAlunosDS(dados);

			FacesContext context = FacesContext.getCurrentInstance();

			ServletContext servletContext = (ServletContext) context
					.getExternalContext().getContext();

			HttpServletResponse response = (HttpServletResponse) context
					.getExternalContext().getResponse();

			try {
				byte[] arquivo = new byte[0];

				if (dados.size() == 0) {
					throw new Exception(
							"Não foi possível gerar o relatório, Dados Inválidos!");
				}

				Map<String, Object> parametros = new HashMap<String, Object>();

				parametros.put("por", this.tipoFiltro);
				parametros.put("periodo", periodo);
				parametros.put("tipo", this.tipo);
				ImageIcon img = new ImageIcon(servletContext
						.getRealPath("/images/lika_marca_qualidade.jpg"));
				ImageIcon img2 = new ImageIcon(servletContext
						.getRealPath("/images/ufpe.jpg"));
				parametros.put("lika", img.getImage());
				parametros.put("ufpe", img2.getImage());

				parametros.put("total", " " + dados.size());

				parametros
						.put(
								"caminhoSub",
								servletContext
										.getResourceAsStream("/relatorios/SubRelatorioAlunos.jasper"));

				InputStream reportStream = context.getExternalContext()
						.getResourceAsStream(
								"/relatorios/RelatorioAlunos.jasper");

				// Abre o relatorio em um viewer
				JasperPrint impressao = JasperFillManager.fillReport(
						reportStream, parametros, dadosAlunos);

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
										"Não foi possível gerar o relatório, nenhumo aluno encontrado com os filtros selecionados! "
												+ e.getMessage(), ""));

			} catch (IOException e) {

				// TODO Auto-generated catch block
				e.printStackTrace();
				context
						.addMessage(
								null,
								new FacesMessage(
										FacesMessage.SEVERITY_ERROR,
										"Não foi possível gerar o relatório, nenhumo aluno encontrado com os filtros selecionados! "
												+ e.getMessage(), ""));
			} catch (Exception e) {
				e.printStackTrace();
				context
						.addMessage(
								null,
								new FacesMessage(
										FacesMessage.SEVERITY_ERROR,
										"Não foi possível gerar o relatório, nenhum aluno encontrado com os filtros selecionados! "
												+ e.getMessage(), ""));
			}
		} catch (Exception e) {
			e.printStackTrace();
			FacesContext context = FacesContext.getCurrentInstance();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR, e.getMessage(), ""));
		}

	}

	public void selecionarOrientador(ActionEvent event) {
		this.pesquisador = (Pesquisador) event.getComponent().getAttributes()
				.get("resp");
		this.bean = pesquisador;
	}

	public String tipoFiltroChanged() {
		this.bean = null;
		if (this.tipoFiltro.equals("Por Projetos")) {
			this.tipo = "Todos os Tipos";
			this.situacao = "Todos";
			System.out.println("AQUIIII");
		}
		return null;
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
