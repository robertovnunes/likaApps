package br.com.lika.hpv.logic;

import br.com.lika.hpv.dao.DAO;
import br.com.lika.hpv.dao.DAOFactory;
import br.com.lika.hpv.dao.FormularioDAO;
import br.com.lika.hpv.interceptor.DAOInterceptor;
import br.com.lika.hpv.interceptor.PdfLaudoInterceptor;
import br.com.lika.hpv.interceptor.PerfilViralHpvInterceptor;
import br.com.lika.hpv.model.formulario.Formulario;
import br.com.lika.hpv.model.formulario.InformacoesPessoais;
import br.com.lika.hpv.model.laudo.LaudoHpv;
import br.com.lika.hpv.model.laudo.TemplateTextosLaudo;
import br.com.lika.hpv.model.usuario.Usuario;
import br.com.lika.hpv.util.ClientInput;
import br.com.lika.hpv.util.ClientOutput;
import br.com.lika.hpv.util.Html2Pdf;
import com.lowagie.text.DocumentException;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletOutputStream;
import org.vraptor.annotations.Component;
import org.vraptor.annotations.In;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.annotations.Out;
import org.vraptor.annotations.Viewless;
import org.vraptor.i18n.FixedMessage;
import org.vraptor.interceptor.MultipartRequestInterceptor;
import org.vraptor.plugin.hibernate.Validate;
import org.vraptor.scope.ScopeType;
import org.vraptor.validator.ValidationErrors;

@Component("viralHpv")
@InterceptedBy({DAOInterceptor.class, PerfilViralHpvInterceptor.class, MultipartRequestInterceptor.class, PdfLaudoInterceptor.class})
public class LaudoHpvLogic
{

	@In(scope=ScopeType.SESSION, required=true)
	private Usuario usuarioDaSessao;
	private final DAOFactory daoFactory;
	private LaudoHpv laudoHpv;

	@In(scope=ScopeType.REQUEST, required=false)
	@Out(scope=ScopeType.REQUEST)
	private Formulario formulario;
	private List<LaudoHpv> laudosHpv;
	private List<Formulario> formularios;
	private List<TemplateTextosLaudo> templateTextosLaudos;
	private TemplateTextosLaudo templateTextosLaudo;
	private final ClientOutput clientOutput;
	private final ClientInput clientInput;

	public void index()
	{
		this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
	}

	public LaudoHpvLogic(DAOFactory f, ClientInput ci, ClientOutput co) {
		this.daoFactory = f;
		this.clientInput = ci;
		this.clientOutput = co;
	}

	public void formularioTemplateTextoLaudo(TemplateTextosLaudo template) {
		if (template.getId() != null)
			this.templateTextosLaudo = ((TemplateTextosLaudo)this.daoFactory.getTemplateTextosLaudoDAO().procura(template.getId())); 
	}

	@Validate(params={"templateTextosLaudo"})
	public void addTemplateTextoLaudo(TemplateTextosLaudo templateTextosLaudo) {
		this.daoFactory.beginTransaction();
		this.daoFactory.getTemplateTextosLaudoDAO().adiciona(templateTextosLaudo);
		this.daoFactory.commit();
	}

	public void validateAddTemplateTextoLaudo(ValidationErrors erros, TemplateTextosLaudo templateTextosLaudo) {
		if ((templateTextosLaudo.getTexto() == null) || (templateTextosLaudo.getTexto().length() == 0))
			erros.add(new FixedMessage("templateTextosLaudo.texto", "NÃ£o pode ser cadastrado um template com valor nulo.", "null"));
	}

	public void removerTemplateTextoLaudo(TemplateTextosLaudo template)
	{
		this.daoFactory.beginTransaction();
		this.daoFactory.getTemplateTextosLaudoDAO().remover(template.getId());
		this.daoFactory.commit();
	}

	public void listarTemplateTextosLaudo() {
		this.templateTextosLaudos = this.daoFactory.getTemplateTextosLaudoDAO().listaTudo();
	}

	public void formulario(Formulario formulario) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
		this.laudoHpv = this.formulario.getLaudoHpv();
		this.templateTextosLaudos = this.daoFactory.getTemplateTextosLaudoDAO().listaTudo();
	}
	@Validate(params={"laudoHpv"})
	public void add(LaudoHpv laudoHpv) {
		this.daoFactory.beginTransaction();
		this.daoFactory.getLaudoHpvDAO().atualiza(laudoHpv);
		this.daoFactory.commit();
	}

	public void edit(LaudoHpv laudoHpv) {
		this.laudoHpv = ((LaudoHpv)this.daoFactory.getLaudoHpvDAO().procura(laudoHpv.getId()));
		this.formulario = this.laudoHpv.getFormulario();
	}

	public void remove(LaudoHpv laudoHpv) {
		this.daoFactory.beginTransaction();
		this.daoFactory.getLaudoHpvDAO().remover(laudoHpv.getId());
		this.daoFactory.commit();
	}

	public void list() {
		this.laudosHpv = this.daoFactory.getLaudoHpvDAO().listaTudo();
	}

	public void gerarPdfLaudo(Formulario formulario) {
		this.laudoHpv = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId())).getLaudoHpv();

		if (this.laudoHpv != null) {
			ServletOutputStream os = null;
			try
			{
				os = this.clientOutput.getOutputStream();
			}
			catch (IOException e) {
				e.printStackTrace();
			}

			StringBuffer htmlPdf = new StringBuffer(5000);
			htmlPdf.append("<html xmlns='http://www.w3.org/1999/xhtml'  lang='PT-br'>");
			htmlPdf.append("<head>");
			htmlPdf.append("<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1' />");
			htmlPdf.append("<style type='text/css'><!--.style4 {font-size: 9px}.style7 {font-size: 12px;font-family: Arial, Helvetica, sans-serif;}--></style>");
			htmlPdf.append("</head>");
			htmlPdf.append("<body font-size:9pt;'>");

			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<img src='http://infomed.lika.ufpe.br:8180/hpv/images/laudoTop.png' alt='logos_do_laudo' align='absmiddle' /></td>");
			htmlPdf.append("\t</div>");
			htmlPdf.append("<br>");

			htmlPdf.append("\t<div>");
			String nomePaciente = "";
			try {
				nomePaciente = this.laudoHpv.getFormulario().getInformacoesPessoais().getNome();
				if ((nomePaciente == null) || (nomePaciente.length() < 1)) nomePaciente = "[PACIENTE ESTÁ SEM NOME NO SEU FORMULÁRIO]"; 
			}
			catch (Exception e) {
				nomePaciente = "[PACIENTE ESTÁ SEM NOME NO SEU FORMULÁRIO]";
			}
			htmlPdf.append("\t\t<strong>NOME: </strong>" + nomePaciente);
			htmlPdf.append("<br>");
			htmlPdf.append("\t</div>");

			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<strong>IDADE: </strong>" + this.laudoHpv.getFormulario().getInformacoesPessoais().getIdade());
			htmlPdf.append("\t</div>");

			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<strong>Nº PRONTUÁRIO: </strong>" + this.laudoHpv.getFormulario().getCodigoPronex());
			htmlPdf.append("\t</div>");

			htmlPdf.append("\t<div>");
			Date dataColeta = this.laudoHpv.getDataColeta();
			String dataColetaString = "";
			if (dataColeta != null) {
				dataColetaString = dataColeta.toString();
			}
			htmlPdf.append("\t\t<strong>Data Coleta: </strong>" + dataColetaString);
			htmlPdf.append("\t</div>");

			htmlPdf.append("\t<div>");
			Date dataLiberacao = this.laudoHpv.getDataEntrega();
			String dataEntrega = "";
			if (dataLiberacao == null) {
				daoFactory.beginTransaction();
				this.laudoHpv.setDataEntrega(new Date());
				daoFactory.getLaudoHpvDAO().somenteAtualizar(this.laudoHpv);
				daoFactory.commit();
				dataLiberacao = new Date();
			}
			dataEntrega = dataLiberacao.toString();
			
			htmlPdf.append("\t\t<strong>Data Liberação do Resultado: </strong>" + dataEntrega);
			htmlPdf.append("\t</div>");
			htmlPdf.append("<br>");

			htmlPdf.append("\t\t<h1 style='text: bold; text-align:center; font-size:15px;'>RESULTADO DO EXAME MOLECULAR PARA PAPILOMAVÍRUS HUMANO</h1>");

			String tipoAmostra = "";
			if (this.laudoHpv.getTipoAmostraBiopsiaEmblocadoParafina() != null) tipoAmostra = this.laudoHpv.getTipoAmostraBiopsiaEmblocadoParafina() + "; ";
			if (this.laudoHpv.getTipoAmostraBiopsiaFormalina() != null) tipoAmostra = tipoAmostra + this.laudoHpv.getTipoAmostraBiopsiaFormalina() + "; ";
			if (this.laudoHpv.getTipoAmostraRaspadoCervicoUterino() != null) tipoAmostra = tipoAmostra + this.laudoHpv.getTipoAmostraRaspadoCervicoUterino() + "; ";
			if (this.laudoHpv.getTipoAmostraSangueArterial() != null) tipoAmostra = tipoAmostra + this.laudoHpv.getTipoAmostraSangueArterial() + "; ";
			if (this.laudoHpv.getTipoAmostraSangueVenoso() != null) tipoAmostra = tipoAmostra + this.laudoHpv.getTipoAmostraSangueVenoso() + "; ";
			if (this.laudoHpv.getTipoAmostraOutros() != null) tipoAmostra = tipoAmostra + this.laudoHpv.getTipoAmostraOutros() + "; ";
			htmlPdf.append("\t<div><br>");
			htmlPdf.append("\t\t<strong>Tipo da amostra: </strong>" + tipoAmostra + "<br>");
			htmlPdf.append("\t</div>");

			String adeqAmostra = "";
			if (this.laudoHpv.getAdeqAmostSatisfatoriaAnaliseBiologiaMolecular() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostSatisfatoriaAnaliseBiologiaMolecular() + "; ";
			if (this.laudoHpv.getAdeqAmostAspectoPurulento() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostAspectoPurulento() + "; ";
			if (this.laudoHpv.getAdeqAmostAspectoSanguinolento() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostAspectoSanguinolento() + "; ";
			if (this.laudoHpv.getAdeqAmostAspectoSanguinolentoPurulento() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostAspectoSanguinolentoPurulento() + "; ";
			if (this.laudoHpv.getAdeqAmostInsatisfatoriaAnaliseBiologiaMolecular() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostInsatisfatoriaAnaliseBiologiaMolecular() + "; ";
			if (this.laudoHpv.getAdeqAmostOutros() != null) adeqAmostra = adeqAmostra + this.laudoHpv.getAdeqAmostOutros() + "; ";
			htmlPdf.append("\t<div><br>");
			htmlPdf.append("\t\t<strong>Adequabilidade da amostra: </strong>" + adeqAmostra + "<br>");
			htmlPdf.append("\t</div><br>");

			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<strong>Diagnóstico descritivo / resultado: </strong>" + this.laudoHpv.getResultado() + "<br>");
			htmlPdf.append("\t</div>");

			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<br><br><br>");
			htmlPdf.append("\t</div>");
			
			//TODO incluir a assinatura do responsável aqui
			htmlPdf.append("\t<div style='text-align:center;'>");
			htmlPdf.append("\t\t_________________________________________________________ <br>");
			htmlPdf.append("\t\tResponsável: Drª Danyelly B. G. Martins<br>");
			htmlPdf.append("\t\t             CRBio: 46.258/5-D");
			htmlPdf.append("\t</div>");
			htmlPdf.append("\t\t<br><br>");
			htmlPdf.append("\t<div>");
			htmlPdf.append("\t\t<p style='font-size: 8pt;'>Estes resultados estão");
			htmlPdf.append("\t\tVinculados ao Projeto PRONEX financiado pela FACEPE e realizado pelo LIKA/UFPE. Consulte seu médico para a interpretação correta dos resultados.");
			htmlPdf.append("\t</div><br><br><br>");
			htmlPdf.append("\t<div style='text-align:center;'>");
			htmlPdf.append("\t\t<img src='http://infomed.lika.ufpe.br:8180/hpv/images/laudoFooter.png' alt='logos_do_laudo' align='absmiddle' />");
			htmlPdf.append("\t</div>");
			htmlPdf.append("</body>");
			htmlPdf.append("</html>");
			try {
				Html2Pdf.convert(htmlPdf.toString(), os);
				os.flush();
				os.close();
			}	
			catch (DocumentException e) {
				e.printStackTrace();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public Usuario getUsuarioDaSessao() {
		return this.usuarioDaSessao;
	}

	public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
		this.usuarioDaSessao = usuarioDaSessao;
	}

	public LaudoHpv getLaudoHpv() {
		return this.laudoHpv;
	}

	public void setLaudoHpv(LaudoHpv laudoHpv) {
		this.laudoHpv = laudoHpv;
	}

	public Formulario getFormulario() {
		return this.formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public DAOFactory getDaoFactory() {
		return this.daoFactory;
	}

	public List<LaudoHpv> getLaudosHpv() {
		return this.laudosHpv;
	}

	public void setLaudosHpv(List<LaudoHpv> laudosHpv) {
		this.laudosHpv = laudosHpv;
	}

	public List<Formulario> getFormularios() {
		return this.formularios;
	}

	public void setFormularios(List<Formulario> formularios) {
		this.formularios = formularios;
	}

	public List<TemplateTextosLaudo> getTemplateTextosLaudos() {
		return this.templateTextosLaudos;
	}

	public void setTemplateTextosLaudos(List<TemplateTextosLaudo> templateTextosLaudos)
	{
		this.templateTextosLaudos = templateTextosLaudos;
	}

	public TemplateTextosLaudo getTemplateTextosLaudo() {
		return this.templateTextosLaudo;
	}

	public void setTemplateTextosLaudo(TemplateTextosLaudo templateTextosLaudo) {
		this.templateTextosLaudo = templateTextosLaudo;
	}

	public ClientOutput getClientOutput() {
		return this.clientOutput;
	}

	public ClientInput getClientInput() {
		return this.clientInput;
	}
}

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.LaudoHpvLogic
 * JD-Core Version:    0.6.0
 */