package lika.handler;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;
import lika.model.Aluno;
import lika.model.AreaDePesquisa;
import lika.model.BolsistaProjeto;
import lika.model.GrupoDePesquisa;
import lika.model.Laboratorio;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.relatorio.ImpressaoProjetoDS;
import lika.relatorio.RelatorioAnaisDS;
import lika.relatorio.RelatorioCadastro;
import lika.relatorio.RelatorioLaboratorioDataSource;
import lika.relatorio.RelatorioLivroDS;
import lika.relatorio.RelatorioPeriodicoDS;

@Controller("relatorioHandler")
@Scope("session")
public class RelatorioHandler {

	public void gerarCadastroAluno(ActionEvent event) {

		Aluno aluno = (Aluno) event.getComponent().getAttributes().get("aluno");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));

			DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
					new Locale("pt", "BR"));

			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());
			parametros.put("nome", aluno.getNome());
			if (aluno.getNascimento() != null) {
				parametros.put("nascimento", df.format(aluno.getNascimento()));
			} else {
				parametros.put("nascimento", " - ");
			}
			parametros.put("rg", aluno.getRG());
			parametros.put("cpf", aluno.getCPF());
			parametros.put("uf", aluno.getUf());
			parametros.put("orgao", aluno.getOrgaoExpedidor());
			parametros.put("filiacaoPai", aluno.getFiliacaoPai());
			parametros.put("filiacaoMae", aluno.getFiliacaoMae());
			parametros.put("foneRes", aluno.getDddResidencial() + " "
					+ aluno.getTelefone());
			parametros.put("celular", aluno.getDddCelular() + " "
					+ aluno.getCelular());
			parametros.put("foneCom", aluno.getDddComercial() + " "
					+ aluno.getFoneComercial());
			parametros.put("endereco", aluno.getEndereco());
			parametros.put("cep", aluno.getCEP());
			parametros.put("tipoBolsa", aluno.getTipoOrigemBolsa());
			parametros.put("origem", aluno.getOrigemBolsa());
			parametros.put("tipoAluno", aluno.getTipoAluno());
			if (aluno.isPossuiBolsa()) {
				parametros.put("bolsista", "Sim");
			} else {
				parametros.put("bolsista", "Não");
			}

			if (aluno.getDataDesligamento() != null) {
				parametros.put("dataConclusao", df.format(aluno
						.getDataAdmissao()));
			} else {
				parametros.put("dataConclusao", "-");
			}
			parametros.put("assinaturaPublicacao", aluno.getNomePublicacao());
			parametros.put("email", aluno.getEmail());
			parametros.put("instituicaoOrigem", aluno.getInstituicaoOrigem());
			parametros.put("funcao", "aluno");

			if (aluno.getDataAdmissao() != null) {
				parametros.put("dataAdmissao", df.format(aluno
						.getDataAdmissao()));
			} else {
				parametros.put("dataAdmissao", " - ");
			}

			if (aluno.getFoto() != null) {
				InputStream in = new ByteArrayInputStream(aluno.getFoto());
				BufferedImage image = ImageIO.read(in);

				parametros.put("foto", image);
			}
			if (aluno.getCracha() != null) {
				parametros.put("numeroCracha", aluno.getCracha()
						.getNumeroCracha());
			} else {
				parametros.put("numeroCracha", "Sem Crachá");
			}
			parametros.put("situacao", aluno.getSituacao());
			if (aluno.getDepartamento() != null) {
				parametros.put("centro", aluno.getDepartamento().getNome());
			} else {
				parametros.put("centro", " - ");
			}

			parametros.put("temTitulacao", new Boolean(aluno.getTitulacao()
					.size() > 0));

			ArrayList<Pessoa> dados = new ArrayList<Pessoa>();
			dados.add(aluno);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream("/relatorios/CadastroAluno.jasper");

			parametros.put("caminhoTitulacao", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioTitulacao.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroAluno.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros, new RelatorioCadastro(
							dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void gerarCadastroBolsista(ActionEvent event) {
		BolsistaProjeto bolsista = (BolsistaProjeto) event.getComponent()
				.getAttributes().get("bolsista");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));

			DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
					new Locale("pt", "BR"));

			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());
			parametros.put("nome", bolsista.getNome());
			if (bolsista.getNascimento() != null) {
				parametros.put("nascimento", df
						.format(bolsista.getNascimento()));
			} else {
				parametros.put("nascimento", " - ");
			}
			parametros.put("rg", bolsista.getRG());
			parametros.put("cpf", bolsista.getCPF());
			parametros.put("uf", bolsista.getUf());
			parametros.put("orgao", bolsista.getOrgaoExpedidor());
			parametros.put("filiacaoPai", bolsista.getFiliacaoPai());
			parametros.put("filiacaoMae", bolsista.getFiliacaoMae());
			parametros.put("foneRes", bolsista.getDddResidencial() + " "
					+ bolsista.getTelefone());
			parametros.put("celular", bolsista.getDddCelular() + " "
					+ bolsista.getCelular());
			parametros.put("foneCom", bolsista.getDddComercial() + " "
					+ bolsista.getFoneComercial());
			parametros.put("endereco", bolsista.getEndereco());
			parametros.put("cep", bolsista.getCEP());
			if (bolsista.getDataDesligamento() != null) {
				parametros.put("dataConclusao", df.format(bolsista
						.getDataAdmissao()));
			} else {
				parametros.put("dataConclusao", "-");
			}

			parametros.put("email", bolsista.getEmail());
			parametros.put("funcao", "Bolsista");

			if (bolsista.getDataAdmissao() != null) {
				parametros.put("dataAdmissao", df.format(bolsista
						.getDataAdmissao()));
			} else {
				parametros.put("dataAdmissao", " - ");
			}

			if (bolsista.getFoto() != null) {
				InputStream in = new ByteArrayInputStream(bolsista.getFoto());
				BufferedImage image = ImageIO.read(in);

				parametros.put("foto", image);
			}
			if (bolsista.getCracha() != null) {
				parametros.put("numeroCracha", bolsista.getCracha()
						.getNumeroCracha());
			} else {
				parametros.put("numeroCracha", "Sem Crachá");
			}
			parametros.put("situacao", bolsista.getSituacao());
			parametros.put("tipoBolsa", bolsista.getTipoBolsa());
			parametros.put("origem", bolsista.getOrigemBolsa());
			parametros.put("valor", bolsista.getValorBolsa());

			ArrayList<BolsistaProjeto> dados = new ArrayList<BolsistaProjeto>();
			dados.add(bolsista);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream("/relatorios/CadastroBolsista.jasper");

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroBolsista.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros,
					new JRBeanCollectionDataSource(dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void gerarCadastroPesquisador(ActionEvent event) {

		Pesquisador pesquisador = (Pesquisador) event.getComponent()
				.getAttributes().get("pesquisador");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));

			DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
					new Locale("pt", "BR"));

			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());
			parametros.put("nome", pesquisador.getNome());
			if (pesquisador.getNascimento() != null) {
				parametros.put("nascimento", df.format(pesquisador
						.getNascimento()));
			} else {
				parametros.put("nascimento", " - ");
			}
			parametros.put("rg", pesquisador.getRG());
			parametros.put("cpf", pesquisador.getCPF());
			parametros.put("uf", pesquisador.getUf());
			parametros.put("orgao", pesquisador.getOrgaoExpedidor());
			parametros.put("filiacaoPai", pesquisador.getFiliacaoPai());
			parametros.put("filiacaoMae", pesquisador.getFiliacaoMae());
			parametros.put("foneRes", pesquisador.getDddResidencial() + " "
					+ pesquisador.getTelefone());
			parametros.put("celular", pesquisador.getDddCelular() + " "
					+ pesquisador.getCelular());
			parametros.put("foneCom", pesquisador.getDddComercial() + " "
					+ pesquisador.getFoneComercial());
			parametros.put("endereco", pesquisador.getEndereco());
			parametros.put("cep", pesquisador.getCEP());
			parametros.put("tipo", pesquisador.getTipo());
			if (pesquisador.getDataDesligamento() != null) {
				parametros.put("dataConclusao", df.format(pesquisador
						.getDataAdmissao()));
			} else {
				parametros.put("dataConclusao", "-");
			}
			parametros.put("assinaturaPublicacao", pesquisador
					.getNomePublicacao());
			parametros.put("email", pesquisador.getEmail());
			parametros.put("siape", pesquisador.getSIAPE());
			parametros.put("instituicaoOrigem", pesquisador
					.getInstituicaoOrigem());
			parametros.put("funcao", "Pesquisador");

			if (pesquisador.getDataAdmissao() != null) {
				parametros.put("dataAdmissao", df.format(pesquisador
						.getDataAdmissao()));
			} else {
				parametros.put("dataAdmissao", " - ");
			}

			if (pesquisador.getFoto() != null) {
				InputStream in = new ByteArrayInputStream(pesquisador.getFoto());
				BufferedImage image = ImageIO.read(in);

				parametros.put("foto", image);
			}
			if (pesquisador.getCracha() != null) {
				parametros.put("numeroCracha", pesquisador.getCracha()
						.getNumeroCracha());
			} else {
				parametros.put("numeroCracha", "Sem Crachá");
			}
			parametros.put("situacao", pesquisador.getSituacao());
			if (pesquisador.getDepartamento() != null) {
				parametros.put("centro", pesquisador.getDepartamento()
						.getNome());
			} else {
				parametros.put("centro", " - ");
			}

			parametros.put("temTitulacao", new Boolean(pesquisador
					.getTitulacao().size() > 0));
			System.out.println("BOOOLEANN "
					+ (pesquisador.getTitulacao().size() > 0));
			ArrayList<Pessoa> dados = new ArrayList<Pessoa>();
			dados.add(pesquisador);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/CadastroPesquisador.jasper");

			parametros.put("caminhoTitulacao", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioTitulacao.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroPesquisador.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros, new RelatorioCadastro(
							dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void gerarCadastroFuncionario(ActionEvent event) {

		Pessoa funcionario = (Pessoa) event.getComponent().getAttributes().get(
				"funcionario");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));

			DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
					new Locale("pt", "BR"));

			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());
			parametros.put("nome", funcionario.getNome());
			if (funcionario.getNascimento() != null) {
				parametros.put("nascimento", df.format(funcionario
						.getNascimento()));
			} else {
				parametros.put("nascimento", " - ");
			}
			parametros.put("rg", funcionario.getRG());
			parametros.put("cpf", funcionario.getCPF());
			parametros.put("uf", funcionario.getUf());
			parametros.put("orgao", funcionario.getOrgaoExpedidor());
			parametros.put("filiacaoPai", funcionario.getFiliacaoPai());
			parametros.put("filiacaoMae", funcionario.getFiliacaoMae());
			parametros.put("foneRes", funcionario.getDddResidencial() + " "
					+ funcionario.getTelefone());
			parametros.put("celular", funcionario.getDddCelular() + " "
					+ funcionario.getCelular());
			parametros.put("foneCom", funcionario.getDddComercial() + " "
					+ funcionario.getFoneComercial());
			parametros.put("endereco", funcionario.getEndereco());
			parametros.put("cep", funcionario.getCEP());
			if (funcionario.getDataDesligamento() != null) {
				parametros.put("dataConclusao", df.format(funcionario
						.getDataAdmissao()));
			} else {
				parametros.put("dataConclusao", "-");
			}
			parametros.put("email", funcionario.getEmail());
			if (funcionario.getFuncao() != null) {
				parametros.put("funcao", funcionario.getFuncao().getNome());
			} else {
				parametros.put("funcao", "Não informado");
			}

			if (funcionario.getDataAdmissao() != null) {
				parametros.put("dataAdmissao", df.format(funcionario
						.getDataAdmissao()));
			} else {
				parametros.put("dataAdmissao", " - ");
			}

			if (funcionario.getFoto() != null) {
				InputStream in = new ByteArrayInputStream(funcionario.getFoto());
				BufferedImage image = ImageIO.read(in);

				parametros.put("foto", image);
			}
			if (funcionario.getCracha() != null) {
				parametros.put("numeroCracha", funcionario.getCracha()
						.getNumeroCracha());
			} else {
				parametros.put("numeroCracha", "Sem Crachá");
			}
			parametros.put("situacao", funcionario.getSituacao());

			ArrayList<Pessoa> dados = new ArrayList<Pessoa>();
			dados.add(funcionario);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/CadastroFuncionario.jasper");

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroFuncionario.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros,
					new JRBeanCollectionDataSource(dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void gerarCadastroLaboratorio(ActionEvent event) {

		Laboratorio laboratorio = (Laboratorio) event.getComponent()
				.getAttributes().get("laboratorio");

		DaoHandler.getInstance().getLaboratorioDao().refresh(laboratorio);

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));
			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());
			parametros
					.put(
							"caminhoSubMaterial",
							servletContext
									.getResourceAsStream("/relatorios/SubRelatorioMaterial.jasper"));
			parametros
					.put(
							"pathSubRel",
							servletContext
									.getResourceAsStream("/relatorios/SubRelatorioIntegrantes.jasper"));

			ArrayList<Laboratorio> dados = new ArrayList<Laboratorio>();
			dados.add(laboratorio);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/RelatorioLaboratorio.jasper");

			// Abre o relatorio em um viewer
			// JasperPrint impressao =
			// JasperFillManager.fillReport(reportStream,
			// parametros, new RelatorioLaboratorioDataSource(dados));
			//			
			// Locale lingua = new Locale("pt", "BR");
			// JasperViewer.viewReport(impressao, false, lingua);
			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroLaboratorio.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros,
					new RelatorioLaboratorioDataSource(dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void gerarCadastroProjeto(ActionEvent event) {

		Projeto projeto = (Projeto) event.getComponent().getAttributes().get(
				"projeto");

		DaoHandler.getInstance().getProjetoDao().refresh(projeto);

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));

			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());

			ArrayList<Projeto> dados = new ArrayList<Projeto>();
			dados.add(projeto);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/RelatorioImpressaoProjeto.jasper");

			parametros.put("caminhoMaterial", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioProjetoMaterial.jasper"));

			parametros
					.put(
							"caminhoPublicacoes",
							context
									.getExternalContext()
									.getResourceAsStream(
											"/relatorios/SubRelatorioProjetoPulicacoes.jasper"));

			parametros.put("caminhoIntegrantes", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioIntegrantes.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroProjeto.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros, new ImpressaoProjetoDS(
							dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_INFO, "Cadastro gerado com sucesso!",
					null));

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro!", null));

		} catch (IOException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro!", null));
		}

	}

	public void gerarCadastroPeriodico(ActionEvent event) {

		Publicacao publicacao = (Publicacao) event.getComponent()
				.getAttributes().get("publicacao");

		DaoHandler.getInstance().getPublicacaoDao().refresh(publicacao);

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));
			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());

			ArrayList<Publicacao> dados = new ArrayList<Publicacao>();
			dados.add(publicacao);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/RelatorioPublicacao.jasper");

			parametros.put("caminhoAutores", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioAutores.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroPeriódico.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros, new RelatorioPeriodicoDS(
							dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_INFO,
					"Cadastro Gerado com sucesso! ", ""));

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));

		} catch (IOException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));
		}

	}

	public void gerarCadastroAnais(ActionEvent event) {

		Publicacao publicacao = (Publicacao) event.getComponent()
				.getAttributes().get("publicacao");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));
			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());

			ArrayList<Publicacao> dados = new ArrayList<Publicacao>();
			dados.add(publicacao);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream("/relatorios/RelatorioAnais.jasper");

			parametros.put("caminhoAutores", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioAutores.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroAnais.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros,
					new RelatorioAnaisDS(dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_INFO,
					"Cadastro Gerado com sucesso! ", ""));

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));

		} catch (IOException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));
		}

	}

	public void gerarCadastroLivro(ActionEvent event) {

		Publicacao publicacao = (Publicacao) event.getComponent()
				.getAttributes().get("publicacao");

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context
				.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context
				.getExternalContext().getResponse();

		try {
			ServletOutputStream servletOutputStream = response
					.getOutputStream();

			Map<String, Object> parametros = new HashMap<String, Object>();

			ImageIcon img = new ImageIcon(servletContext
					.getRealPath("/images/lika_marca_qualidade.jpg"));
			ImageIcon img2 = new ImageIcon(servletContext
					.getRealPath("/images/ufpe.jpg"));
			parametros.put("lika", img.getImage());
			parametros.put("ufpe", img2.getImage());

			ArrayList<Publicacao> dados = new ArrayList<Publicacao>();
			dados.add(publicacao);

			InputStream reportStream = context.getExternalContext()
					.getResourceAsStream("/relatorios/RelatorioLivro.jasper");

			parametros.put("caminhoAutores", context.getExternalContext()
					.getResourceAsStream(
							"/relatorios/SubRelatorioAutores.jasper"));

			response.setContentType("application/pdf");
			response.setHeader("Content-disposition",
					"attachment;filename=CadastroLivro.pdf");

			JasperRunManager.runReportToPdfStream(reportStream,
					servletOutputStream, parametros,
					new RelatorioLivroDS(dados));

			context.responseComplete();
			servletOutputStream.flush();
			servletOutputStream.close();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_INFO,
					"Cadastro Gerado com sucesso! ", ""));

		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));

		} catch (IOException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Erro ao tentar gerar o cadastro! ", ""));
		}

	}

}
