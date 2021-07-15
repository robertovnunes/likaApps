 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAO;
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.dao.FormularioDAO;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PdfLaudoInterceptor;
 import br.com.lika.hpv.interceptor.PerfilViralHcvInterceptor;
 import br.com.lika.hpv.model.formulario.Formulario;
 import br.com.lika.hpv.model.formulario.InformacoesPessoais;
 import br.com.lika.hpv.model.laudo.LaudoHcv;
 import br.com.lika.hpv.model.usuario.Usuario;
 import br.com.lika.hpv.util.ClientInput;
 import br.com.lika.hpv.util.ClientOutput;
 import br.com.lika.hpv.util.Html2Pdf;
 import com.lowagie.text.DocumentException;
 import java.io.IOException;
 import java.util.Date;
 import java.util.List;
 import javax.servlet.ServletOutputStream;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.annotations.Out;
 import org.vraptor.annotations.Viewless;
 import org.vraptor.interceptor.MultipartRequestInterceptor;
 import org.vraptor.plugin.hibernate.Validate;
 import org.vraptor.scope.ScopeType;
 
 @Component("viralHcv")
 @InterceptedBy({DAOInterceptor.class, PerfilViralHcvInterceptor.class, MultipartRequestInterceptor.class, PdfLaudoInterceptor.class})
 public class LaudoHcvLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   private Usuario usuarioDaSessao;
   private final DAOFactory daoFactory;
   private LaudoHcv laudoHcv;
 
   @In(scope=ScopeType.REQUEST, required=false)
   @Out(scope=ScopeType.REQUEST)
   private Formulario formulario;
   private List<LaudoHcv> laudosHcv;
   private List<Formulario> formularios;
   private final ClientOutput clientOutput;
   private final ClientInput clientInput;
 
   public void index()
   {
     this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
   }
 
   public LaudoHcvLogic(DAOFactory factory, ClientInput ci, ClientOutput co) {
     this.daoFactory = factory;
     this.clientInput = ci;
     this.clientOutput = co;
   }
 
   public void formulario(Formulario formulario) {
     this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
     this.laudoHcv = this.formulario.getLaudoHcv();
   }
   @Validate(params={"laudoHcv"})
   public void add(LaudoHcv laudoHcv) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getLaudoHcvDAO().atualiza(laudoHcv);
     this.daoFactory.commit();
   }
 
   public void edit(LaudoHcv laudoHcv) {
     this.laudoHcv = ((LaudoHcv)this.daoFactory.getLaudoHcvDAO().procura(laudoHcv.getId()));
     this.formulario = this.laudoHcv.getFormulario();
   }
 
   public void remove(LaudoHcv laudoHcv) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getLaudoHcvDAO().remover(laudoHcv.getId());
     this.daoFactory.commit();
   }
 
   public void list() {
     this.laudosHcv = this.daoFactory.getLaudoHcvDAO().listaTudo();
   }
 
   @Viewless
   public void gerarPdfLaudo(Formulario formulario) {
     this.laudoHcv = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId())).getLaudoHcv();
     if (this.laudoHcv != null) {
       ServletOutputStream os = null;
       try
       {
         os = this.clientOutput.getOutputStream();
       }
       catch (IOException e) {
         e.printStackTrace();
       }
 
       StringBuffer htmlPdf = new StringBuffer();
       htmlPdf.append("<html xmlns='http://www.w3.org/1999/xhtml'  lang='PT-br'>");
       htmlPdf.append("<head>");
       htmlPdf.append("<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1' />");
       htmlPdf.append("<style type='text/css'><!--.style4 {font-size: 9px}.style7 {font-size: 12px;font-family: Arial, Helvetica, sans-serif;}--></style>");
       htmlPdf.append("<link rel='shortcut icon' href='http://infomed.lika.ufpe.br:8180/hpv/images/nurse.png'/>");
       htmlPdf.append("</head>");
       htmlPdf.append("<body style='width: 500px; font-size:9pt;'>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<img src='http://infomed.lika.ufpe.br:8180/hpv/images/laudoTop.png' alt='logos_do_laudo' align='absmiddle' /></td>");
       htmlPdf.append("\t</div>");
       htmlPdf.append("<br>");
 
       htmlPdf.append("\t<div>");
       String nomePaciente = "";
       try {
         nomePaciente = this.laudoHcv.getFormulario().getInformacoesPessoais().getNome();
         if ((nomePaciente == null) || (nomePaciente.length() < 1)) nomePaciente = "[PACIENTE ESTÁ SEM NOME NO SEU FORMUL&Aacute;RIO]"; 
       }
       catch (Exception e) {
         nomePaciente = "[PACIENTE EST&Aacute; SEM NOME NO SEU FORMUL&Aacute;RIO]";
       }
       htmlPdf.append("\t\t<strong>NOME: </strong>" + nomePaciente);
       htmlPdf.append("<br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Nº PRONTURÁRIO: </strong>" + this.laudoHcv.getFormulario().getNumeroProntuario());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>IDADE: </strong>" + this.laudoHcv.getFormulario().getInformacoesPessoais().getIdade());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Unidade de Sa&uacute;de: </strong>" + this.laudoHcv.getUnidadeSaudeFamilia());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>C&oacute;digo: </strong>" + this.laudoHcv.getCodigo() + "<br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       Date dataColeta = this.laudoHcv.getDataColeta();
       String dataColetaString = dataColeta.getDay() + "/" + dataColeta.getMonth() + "/" + dataColeta.getYear();
       htmlPdf.append("\t\t<strong>Data Coleta: </strong>" + dataColetaString);
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       Date dataLiberacao = this.laudoHcv.getDataEntrega();
       String dataEntrega = dataLiberacao.getDay() + "/" + dataLiberacao.getMonth() + "/" + dataLiberacao.getYear();
       htmlPdf.append("\t\t<strong>Data Libera&ccedil;&atilde;o Resultado: </strong>" + dataEntrega);
       htmlPdf.append("\t</div>");
       htmlPdf.append("<br>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<p>RESULTADO DO EXAME DE HCV</p>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Resultado: </strong>" + this.laudoHcv.getResultado() + "<br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Observa&ccedil;&otilde;es: </strong>" + this.laudoHcv.getObservacoes() + "<br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<br><br><br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t_________________________________________________________ <br>");
       htmlPdf.append("\t\tResponsável");
       htmlPdf.append("\t</div>");
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<br><br>");
       htmlPdf.append("\t</div>");
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<p style='font-size: 8pt;'>Estes resultados est&atilde;o");
       htmlPdf.append("\t\tVinculados ao Projeto PRONEX financiado pela FACEPE e realizado pelo");
       htmlPdf.append("\t\tLIKA/UFPE. Consulte seu m&eacute;dico para a");
       htmlPdf.append("\t\tinterpreta&ccedil;&atilde;o correta dos resultados.</p>");
       htmlPdf.append("\t</div>");
       htmlPdf.append("\t<div>");
 
       htmlPdf.append("\t</div>");
       htmlPdf.append("\t<div>");
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
       try {
         os.close();
       }
       catch (IOException e) {
         e.printStackTrace();
       }
     }
   }
 
   public Usuario getUsuarioDaSessao()
   {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public LaudoHcv getLaudoHcv() {
     return this.laudoHcv;
   }
 
   public void setLaudoHcv(LaudoHcv laudoHcv) {
     this.laudoHcv = laudoHcv;
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
 
   public List<LaudoHcv> getLaudosHcv() {
     return this.laudosHcv;
   }
 
   public void setLaudosHcv(List<LaudoHcv> laudosHcv) {
     this.laudosHcv = laudosHcv;
   }
 
   public List<Formulario> getFormularios() {
     return this.formularios;
   }
 
   public void setFormularios(List<Formulario> formularios) {
     this.formularios = formularios;
   }
 
   public ClientOutput getClientOutput() {
     return this.clientOutput;
   }
 
   public ClientInput getClientInput() {
     return this.clientInput;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.LaudoHcvLogic
 * JD-Core Version:    0.6.0
 */