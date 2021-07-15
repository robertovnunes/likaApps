 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAO;
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.dao.FormularioDAO;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PdfLaudoInterceptor;
 import br.com.lika.hpv.interceptor.PerfilCitopatoInterceptor;
 import br.com.lika.hpv.model.formulario.Formulario;
 import br.com.lika.hpv.model.formulario.InformacoesPessoais;
 import br.com.lika.hpv.model.formulario.util.Data;
 import br.com.lika.hpv.model.laudo.LaudoCitopatologico;
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
 
 @Component("citopato")
 @InterceptedBy({DAOInterceptor.class, PerfilCitopatoInterceptor.class, MultipartRequestInterceptor.class, PdfLaudoInterceptor.class})
 public class CitopatoLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
 
   @In(scope=ScopeType.REQUEST, required=false)
   @Out(scope=ScopeType.REQUEST)
   protected Formulario formulario;
   private final ClientOutput clientOutput;
   private final ClientInput clientInput;
   private InformacoesPessoais informacoesPessoais;
   private LaudoCitopatologico laudoCitopatologico;
   private List<LaudoCitopatologico> laudosCitopatologicos;
   private List<Formulario> formularios;
 
   public void index()
   {
     this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
   }
 
   public CitopatoLogic(DAOFactory d, ClientInput ci, ClientOutput co) {
     this.daoFactory = d;
     this.clientInput = ci;
     this.clientOutput = co;
   }
 
   public void formulario(Formulario formulario) {
     this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
 
     this.laudoCitopatologico = this.formulario.getLaudoCitopatologico();
   }
   @Validate(params={"laudoCitopatologico"})
   public void add(LaudoCitopatologico laudoCitopatologico) {
     this.daoFactory.beginTransaction();
     laudoCitopatologico.setDataAtualizacaoLaudo(new Date());
     this.daoFactory.getLaudoCitopatologicoDAO().atualiza(laudoCitopatologico);
     this.daoFactory.commit();
   }
 
   public void edit(LaudoCitopatologico laudoCitopatologico) {
     this.laudoCitopatologico = ((LaudoCitopatologico)this.daoFactory.getLaudoCitopatologicoDAO().procura(laudoCitopatologico.getId()));
   }
 
   public void list() {
     this.laudosCitopatologicos = this.daoFactory.getLaudoCitopatologicoDAO().listaTudo();
   }
 
   public void remove(LaudoCitopatologico laudo) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getLaudoCitopatologicoDAO().remover(laudo.getId());
     this.daoFactory.commit();
   }
 
   @Viewless
   public void gerarPdfLaudo(Formulario formulario)
   {
     this.laudoCitopatologico = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId())).getLaudoCitopatologico();
 
     if (this.laudoCitopatologico != null) {
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
       htmlPdf.append("</head>");
       htmlPdf.append("<body style='width: 500px; font-size:9pt;'>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<img src='http://infomed.lika.ufpe.br:8180/hpv/images/laudoTop.png' alt='logos_do_laudo' align='absmiddle' /></td>");
       htmlPdf.append("\t</div>");
       htmlPdf.append("<br>");
 
       htmlPdf.append("\t<div>");
       String nomePaciente = "";
       try {
         nomePaciente = this.laudoCitopatologico.getFormulario().getInformacoesPessoais().getNome();
         if ((nomePaciente == null) || (nomePaciente.length() < 1)) nomePaciente = "[PACIENTE ESTÀ SEM NOME NO SEU FORMUL&Aacute;RIO]"; 
       }
       catch (Exception e) {
         nomePaciente = "[PACIENTE ESTÀ SEM NOME NO SEU FORMUL&Aacute;RIO]";
       }
       htmlPdf.append("\t\t<strong>NOME: </strong>" + nomePaciente);
       htmlPdf.append("<br>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Nº REGISTRO: </strong>" + this.laudoCitopatologico.getFormulario().getNumeroProntuario());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>IDADE: </strong>" + this.laudoCitopatologico.getFormulario().getInformacoesPessoais().getIdade());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Unidade de Sa&uacute;de: </strong>" + this.laudoCitopatologico.getFormulario().getLocalColeta());
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       String dataRealizacao = this.laudoCitopatologico.getDataRealizacaoExame().getDay() + "/" + this.laudoCitopatologico.getDataRealizacaoExame().getMonth() + "/" + this.laudoCitopatologico.getDataRealizacaoExame().getYear();
       htmlPdf.append("\t\t<strong>Data Coleta </strong>" + dataRealizacao);
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       String dataLiberacao = this.laudoCitopatologico.getDataLiberacaoResultado().getDay() + "/" + this.laudoCitopatologico.getDataLiberacaoResultado().getMonth() + "/" + this.laudoCitopatologico.getDataLiberacaoResultado().getYear();
       htmlPdf.append("\t\t<strong>Data Libera&ccedil;&atilde;o Resultado: </strong>" + dataLiberacao);
       htmlPdf.append("\t</div>");
       htmlPdf.append("<br>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<p>RESULTADO DO EXAME CITOPATOL&Oacute;GICO DO COLO DO &Uacute;TERO</p>");
       htmlPdf.append("\t</div>");
 
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Tipo da amostra: </strong>" + this.laudoCitopatologico.getTipoAmostra() + "<br>");
       htmlPdf.append("\t</div>");
 
       String material = "";
       if ((this.laudoCitopatologico.getMaterialCupulaVaginal() != null) && (this.laudoCitopatologico.getMaterialCupulaVaginal().charValue() == 'Y')) {
         material = material + "C&uacute;pula vaginal; ";
       }
       if ((this.laudoCitopatologico.getMaterialEctocervice() != null) && (this.laudoCitopatologico.getMaterialEctocervice().charValue() == 'Y')) {
         material = material + "Ectoc&eacute;rvice; ";
       }
       if ((this.laudoCitopatologico.getMaterialEctocerviceEndocervice() != null) && (this.laudoCitopatologico.getMaterialEctocerviceEndocervice().charValue() == 'Y')) {
         material = material + "Ectoc&eacute;rvice/Endoc&eacute;rvice; ";
       }
       if ((this.laudoCitopatologico.getMaterialVaginal() != null) && (this.laudoCitopatologico.getMaterialVaginal().charValue() == 'Y')) {
         material = material + "Vaginal; ";
       }
       htmlPdf.append("\t<div>");
       htmlPdf.append("\t\t<strong>Material: </strong>" + material + "<br>");
       htmlPdf.append("\t</div>");
 
       StringBuffer amostraNaoProcessadaPor = new StringBuffer();
       if ((this.laudoCitopatologico.getAmostraNaoProcessadaPorAusenciaErro() != null) && (this.laudoCitopatologico.getAmostraNaoProcessadaPorAusenciaErro().charValue() == 'Y')) {
         amostraNaoProcessadaPor.append("Ausência ou erro na identificação da lâmina, frasco ou formul&aacute;rio; ");
       }
       if ((this.laudoCitopatologico.getAmostraNaoProcessadaPorCausasAlheias() != null) && (this.laudoCitopatologico.getAmostraNaoProcessadaPorCausasAlheias().charValue() == 'Y')) {
         amostraNaoProcessadaPor.append("Causas alheias ao laboratório; ");
       }
       if ((this.laudoCitopatologico.getAmostraNaoProcessadaPorLaminaDanificada() != null) && (this.laudoCitopatologico.getAmostraNaoProcessadaPorLaminaDanificada().charValue() == 'Y')) {
         amostraNaoProcessadaPor.append("Lâmina danificada ou ausente; ");
       }
       if ((this.laudoCitopatologico.getAmostraNaoProcessadaPorOutrasCausas() != null) && (this.laudoCitopatologico.getAmostraNaoProcessadaPorOutrasCausas().charValue() == 'Y')) {
         amostraNaoProcessadaPor.append(this.laudoCitopatologico.getAmostraNaoProcessadaPorTextoOutrasCausas());
       }
 
       if (amostraNaoProcessadaPor.toString().length() > 0) {
         htmlPdf.append("\t<div style='width: 350px;'>");
         htmlPdf.append("\t\t<strong>Avaliação pré-analítica</strong><p>Amostra não processada por:</strong> " + amostraNaoProcessadaPor.toString() + "<br>");
         htmlPdf.append("\t</div>");
       }
       else
       {
         StringBuffer adeqAmostra = new StringBuffer();
 
         if ((this.laudoCitopatologico.getAdequabilidadeAmostra() != null) && (this.laudoCitopatologico.getAdequabilidadeAmostra().equalsIgnoreCase("Satisfatória"))) {
           adeqAmostra.append("Satisfatória; ");
           adeqAmostra.append(this.laudoCitopatologico.getAdeqAmostraTextoOutros());
         }
         else if ((this.laudoCitopatologico.getAdequabilidadeAmostra() != null) && (this.laudoCitopatologico.getAdequabilidadeAmostra().equalsIgnoreCase("Insatisfatória"))) {
           adeqAmostra.append("Insatisfatória, ");
           adeqAmostra.append("devido a: ");
           if ((this.laudoCitopatologico.getAdeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Artefatos de dessecamento em mais de 75% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraContaminantesExternosMais75porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraContaminantesExternosMais75porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Contaminantes externos em mais de 75% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Intensa superposição celular em mais de 75% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Leucócitos obscurecendo mais de 75% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Material acelular ou hipocelular em menos de 10% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraSangueMais75porcentoEsfregaco() != null) && (this.laudoCitopatologico.getAdeqAmostraSangueMais75porcentoEsfregaco().charValue() == 'Y')) {
             adeqAmostra.append("Sangue em mais de 75% do esfregaço; ");
           }
           if ((this.laudoCitopatologico.getAdeqAmostraOutros() != null) || ((this.laudoCitopatologico.getAdeqAmostraTextoOutros() != null) && (this.laudoCitopatologico.getAdeqAmostraTextoOutros().length() > 0))) {
             adeqAmostra.append(this.laudoCitopatologico.getAdeqAmostraTextoOutros());
           }
         }
         htmlPdf.append("\t<div>");
         htmlPdf.append("\t\t<strong>Adequabilidade da amostra: </strong>" + adeqAmostra.toString() + "<br>");
         htmlPdf.append("\t</div>");
 
         StringBuffer epitelios = new StringBuffer();
         if ((this.laudoCitopatologico.getEpiteliosRepresentativosAmostraEscamoso() != null) && (this.laudoCitopatologico.getEpiteliosRepresentativosAmostraEscamoso().charValue() == 'Y')) {
           epitelios.append("Escamoso; ");
         }
         if ((this.laudoCitopatologico.getEpiteliosRepresentativosAmostraGlandular() != null) && (this.laudoCitopatologico.getEpiteliosRepresentativosAmostraGlandular().charValue() == 'Y')) {
           epitelios.append("Glandular; ");
         }
         if ((this.laudoCitopatologico.getEpiteliosRepresentativosAmostraMetaplasico() != null) && (this.laudoCitopatologico.getEpiteliosRepresentativosAmostraMetaplasico().charValue() == 'Y')) {
           epitelios.append("Metapl&aacute;sico; ");
         }
         if (epitelios.length() > 0) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Epitélios representados na amostra: </strong>" + epitelios.toString() + "<br>");
           htmlPdf.append("\t</div>");
         }
 
         StringBuffer micro = new StringBuffer();
         if ((this.laudoCitopatologico.getMicrobiologiaActinomycesSpp() != null) && (this.laudoCitopatologico.getMicrobiologiaActinomycesSpp().charValue() == 'Y')) {
           micro.append("Actinomyces spp; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaBacilos() != null) && (this.laudoCitopatologico.getMicrobiologiaBacilos().charValue() == 'Y')) {
           micro.append("Bacilos; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaBacilosSupracitoplasmaticos() != null) && (this.laudoCitopatologico.getMicrobiologiaBacilosSupracitoplasmaticos().charValue() == 'Y')) {
           micro.append("Bacilos Supracitoplasmáticos (sugestivo de Gardnerella vaginalis/Mobiluncus sp); ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaCandidaSpp() != null) && (this.laudoCitopatologico.getMicrobiologiaCandidaSpp().charValue() == 'Y')) {
           micro.append("Candida spp; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaCocos() != null) && (this.laudoCitopatologico.getMicrobiologiaCocos().charValue() == 'Y')) {
           micro.append("Cocos; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaEfeitoCitopaticoCompativelHerpes() != null) && (this.laudoCitopatologico.getMicrobiologiaEfeitoCitopaticoCompativelHerpes().charValue() == 'Y')) {
           micro.append("Efeito citopático compatível com vírus do grupo Herpes; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaLactobacillusSpp() != null) && (this.laudoCitopatologico.getMicrobiologiaLactobacillusSpp().charValue() == 'Y')) {
           micro.append("Lactobacillus spp; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaLeptothrixSpp() != null) && (this.laudoCitopatologico.getMicrobiologiaLeptothrixSpp().charValue() == 'Y')) {
           micro.append("Leptothrix spp; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaSugestivoChlamydiaSpp() != null) && (this.laudoCitopatologico.getMicrobiologiaSugestivoChlamydiaSpp().charValue() == 'Y')) {
           micro.append("Sugestivo de Chlamydia spp; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaTrichomonasVaginalis() != null) && (this.laudoCitopatologico.getMicrobiologiaTrichomonasVaginalis().charValue() == 'Y')) {
           micro.append("Trichomonas vaginalis; ");
         }
         if ((this.laudoCitopatologico.getMicrobiologiaOutros() != null) && (this.laudoCitopatologico.getMicrobiologiaTextoOutros().length() > 0)) {
           micro.append(this.laudoCitopatologico.getMicrobiologiaTextoOutros());
         }
         if (micro.length() > 0) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Microbiologia: </strong>" + micro.toString() + "<br>");
           htmlPdf.append("\t</div>");
         }
 
         StringBuffer desc = new StringBuffer();
         if ((this.laudoCitopatologico.getDiagnosticoDescritivo() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivo().equalsIgnoreCase("Dentro dos Limites da Normalidade"))) {
           desc.append("dentro dos Limites da Normalidade;<br>");
         }
         else if ((this.laudoCitopatologico.getDiagnosticoDescritivo() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivo().equalsIgnoreCase("Alterações Celulares Benignas"))) {
           desc.append("Alterações Celulares Benignas: ");
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoInflamacao() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoInflamacao().charValue() == 'Y')) {
             desc.append("Inflamação, ");
           }
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoReparacao() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoReparacao().charValue() == 'Y')) {
             desc.append("Reparação, ");
           }
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoMetaplasiaEscamosaImatura() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoMetaplasiaEscamosaImatura().charValue() == 'Y')) {
             desc.append("Metaplasia Escamosa Imatura, ");
           }
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoArtrofiaComInflamacao() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoArtrofiaComInflamacao().charValue() == 'Y')) {
             desc.append("Atrofia com Inflamação, ");
           }
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoRadiacao() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoRadiacao().charValue() == 'Y')) {
             desc.append("Radiação, ");
           }
           if ((this.laudoCitopatologico.getDiagnosticoDescritivoOutros() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivoTextoOutros().length() > 0)) {
             desc.append(this.laudoCitopatologico.getDiagnosticoDescritivoTextoOutros() + ";");
           }
           if ((desc.toString().length() > 2) && (desc.toString().charAt(desc.toString().length() - 2) == ',')) {
             desc = desc.replace(desc.toString().length() - 2, desc.toString().length() - 1, ";");
           }
 
         }
         else if ((this.laudoCitopatologico.getDiagnosticoDescritivo() != null) && (this.laudoCitopatologico.getDiagnosticoDescritivo().equalsIgnoreCase("Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado"))) {
           desc.append("Negativo para Lesão Intra-Epitelial ou Malignidade, no Material Examinado");
         }
         if (desc.length() > 0) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Diagnóstico descritivo: </strong>" + desc.toString() + "<br>");
           htmlPdf.append("\t</div>");
         }
 
         StringBuffer anorm = new StringBuffer();
         if ((this.laudoCitopatologico.getAtipiasCelulasEscamosas() != null) && (this.laudoCitopatologico.getAtipiasCelulasEscamosas().equalsIgnoreCase("de Significado Indeterminado (ASC-US)")))
           anorm.append("Anormalidades em Células Epiteliais Escamosas: atipias em células escamosas de significado indeterminado (ASC-US); ");
         else if ((this.laudoCitopatologico.getAtipiasCelulasEscamosas() != null) && (this.laudoCitopatologico.getAtipiasCelulasEscamosas().equalsIgnoreCase(""))) {
           anorm.append("Anormalidades em Células Epiteliais Escamosas: atipias em células escamosas não excluindo lesão de alto grau (ASC-H); ");
         }
 
         if ((this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaBaixoGrau() != null) && (this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaBaixoGrau().equalsIgnoreCase("Compreendendo Efeito Citopático do HPV"))) {
           anorm.append("Lesão Intra-Epitelial Escamosa de Baixo Grau: compreendendo efeito citopático do HPV; ");
         }
         else if ((this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaBaixoGrau() != null) && (this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaBaixoGrau().equalsIgnoreCase("Compreendendo Neoplasia Intra-Epitelial Cervical de Grau I"))) {
           anorm.append("Lesão Intra-Epitelial Escamosa de Baixo Grau: compreendendo neoplasia intra-epitelial cervical de grau I; ");
         }
 
         if ((this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau() != null) && (this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau().equalsIgnoreCase("Compreendendo Neoplasia Intra-Epitelial Cervical de Grau II"))) {
           anorm.append("Lesão Intra-Epitelial Escamosa de Alto Grau: compreendendo neoplasia intra-epitelial cervical de grau II; ");
         }
         else if ((this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau() != null) && (this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau().equalsIgnoreCase("Compreendendo Neoplasia Intra-Epitelial Cervical de Grau III"))) {
           anorm.append("Lesão Intra-Epitelial Escamosa de Alto Grau: compreendendo neoplasia intra-epitelial cervical de grau III; ");
         }
         else if ((this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau() != null) && (this.laudoCitopatologico.getLesaoIntraEpitelialEscamosaAltoGrau().equalsIgnoreCase("Não Excluindo micro-invasão"))) {
           anorm.append("Lesão Intra-Epitelial Escamosa de Alto Grau: não excluindo micro-invasão; ");
         }
         if (anorm.length() > 0) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Anormalidades em Células Epiteliais Escamosas: </strong>" + anorm.toString() + "<br>");
           htmlPdf.append("\t</div>");
         }
 
         StringBuffer celEpGlan = new StringBuffer();
         if ((this.laudoCitopatologico.getCelulasGlandulares() != null) && (this.laudoCitopatologico.getCelulasGlandulares().equalsIgnoreCase("Endocervicais Atípicas"))) {
           celEpGlan.append("Células Glandulares: endocervicais atípicas; <br>");
         }
         else if ((this.laudoCitopatologico.getCelulasGlandulares() != null) && (this.laudoCitopatologico.getCelulasGlandulares().equalsIgnoreCase("Endometriais Atípicas"))) {
           celEpGlan.append("Células Glandulares: endometriais atípicas; <br>");
         }
         else if ((this.laudoCitopatologico.getCelulasGlandulares() != null) && (this.laudoCitopatologico.getCelulasGlandulares().equalsIgnoreCase("atípicas de origem indefinida"))) {
           celEpGlan.append("Células Glandulares: atípicas de origem indefinida; <br>");
         }
         if ((this.laudoCitopatologico.getAdenocarcinomaInSitu() != null) && (this.laudoCitopatologico.getAdenocarcinomaInSitu().charValue() == 'Y')) {
           celEpGlan.append("adenocarcinoma 'in situ'; <br>");
         }
 
         if ((this.laudoCitopatologico.getAdenocarcinoma() != null) && (this.laudoCitopatologico.getAdenocarcinoma().equalsIgnoreCase("Endocervical")))
           celEpGlan.append("Adenocarcinoma: endocervical;");
         else if ((this.laudoCitopatologico.getAdenocarcinoma() != null) && (this.laudoCitopatologico.getAdenocarcinoma().equalsIgnoreCase("Endometrial"))) {
           celEpGlan.append("Adenocarcinoma: endometrial;");
         }
         else if ((this.laudoCitopatologico.getAdenocarcinoma() != null) && (this.laudoCitopatologico.getAdenocarcinoma().equalsIgnoreCase("Sem outras especificações"))) {
           celEpGlan.append("Adenocarcinoma: sem outras especificações;");
         }
         if (celEpGlan.length() > 0) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Anormalidades em Células Epiteliais Glandulares:</strong>" + celEpGlan.toString() + "<br>");
           htmlPdf.append("\t</div>");
         }
 
         if ((this.laudoCitopatologico.getPresencaCelulasEndometriais() != null) && (this.laudoCitopatologico.getPresencaCelulasEndometriais().charValue() == 'Y')) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Presença de células endometriais: </strong>sim;<br>");
           htmlPdf.append("\t</div>");
         }
 
         if ((this.laudoCitopatologico.getPresencaCelulasEndometriais() != null) && (this.laudoCitopatologico.getPresencaCelulasEndometriais().charValue() == 'Y')) {
           htmlPdf.append("\t<div>");
           htmlPdf.append("\t\t<strong>Observações: </strong>" + this.laudoCitopatologico.getObservacoesFinais() + ";<br>");
           htmlPdf.append("\t</div>");
         }
       }
 
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
       htmlPdf.append("\t\t<p style='font-size: 8pt;'>Obs: Laudo Citopatol&oacute;gico Baseado em Padroniza&ccedil;&atilde;o do Sistema Bethesda 2001 <br>");
       htmlPdf.append("\t\te Nomenclatura Brasileira para Laudos Citopatol&oacute;gicos Cervicais 2006.</p>");
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
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 
   public InformacoesPessoais getInformacoesPessoais() {
     return this.informacoesPessoais;
   }
 
   public void setInformacoesPessoais(InformacoesPessoais informacoesPessoais) {
     this.informacoesPessoais = informacoesPessoais;
   }
 
   public LaudoCitopatologico getLaudoCitopatologico() {
     return this.laudoCitopatologico;
   }
 
   public void setLaudoCitopatologico(LaudoCitopatologico laudoCitopatologico) {
     this.laudoCitopatologico = laudoCitopatologico;
   }
 
   public List<LaudoCitopatologico> getLaudosCitopatologicos() {
     return this.laudosCitopatologicos;
   }
 
   public void setLaudosCitopatologicos(List<LaudoCitopatologico> laudosCitopatologicos)
   {
     this.laudosCitopatologicos = laudosCitopatologicos;
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
 * Qualified Name:     br.com.lika.hpv.logic.CitopatoLogic
 * JD-Core Version:    0.6.0
 */