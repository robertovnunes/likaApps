 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.amostra.Amostra;
 import br.com.lika.hpv.model.anexo.Anexo;
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.HistoricoFamiliar;
import br.com.lika.hpv.model.formulario.HistoricoModificacoes;
 import br.com.lika.hpv.model.formulario.HistoricoSexual;
 import br.com.lika.hpv.model.formulario.InformacoesPessoais;
 import br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica;
 import br.com.lika.hpv.model.formulario.Tabagismo;
 import br.com.lika.hpv.model.formulario.util.CarneVermelha;
 import br.com.lika.hpv.model.formulario.util.ConsumoBebidaAlcoolica;
 import br.com.lika.hpv.model.formulario.util.ConsumoBrotoSamambaia;
 import br.com.lika.hpv.model.formulario.util.Fogao;
 import br.com.lika.hpv.model.formulario.util.Frango;
 import br.com.lika.hpv.model.formulario.util.Fumo;
 import br.com.lika.hpv.model.formulario.util.MedicacaoMenorPausa;
 import br.com.lika.hpv.model.formulario.util.MedicacaoUsoContinuo;
 import br.com.lika.hpv.model.laudo.LaudoCitopatologico;
 import br.com.lika.hpv.model.laudo.LaudoClamidia;
 import br.com.lika.hpv.model.laudo.LaudoHbv;
 import br.com.lika.hpv.model.laudo.LaudoHcv;
 import br.com.lika.hpv.model.laudo.LaudoHiv;
 import br.com.lika.hpv.model.laudo.LaudoHpv;
 import br.com.lika.hpv.model.laudo.LaudoSifilis;
 import br.com.lika.hpv.model.laudo.LaudoViral;
 import br.com.lika.hpv.model.laudo.TemplateTextosLaudo;
 import br.com.lika.hpv.model.laudo.laudoHIV.ReagenteHIV;
 import br.com.lika.hpv.util.HibernateUtil;
 import org.hibernate.Session;
import org.hibernate.Transaction;
 
 public class DAOFactory
 {
   private final Session session;
   private Transaction transaction;
 
   public Session getSession()
   {
     return this.session;
   }
 
   public DAOFactory() {
     this.session = HibernateUtil.getSession();
   }
 
   public void beginTransaction() {
     this.transaction = this.session.beginTransaction();
   }
   
   public void commit() {
     this.transaction.commit();
     this.transaction = null;
   }
 
   public boolean hasTransaction() {
     return this.transaction != null;
   }
   public void rollback() {
     this.transaction.rollback();
     this.transaction = null;
   }
   public void close() {
     this.session.close();
   }
   public Transaction getTransaction() {
     return this.transaction;
   }
   public void setTransaction(Transaction transaction) {
     this.transaction = transaction;
   }
 
   public UsuarioDAO getUsuarioDAO() {
     return new UsuarioDAO(this.session);
   }
   public FormularioDAO getFormularioDAO() {
     return new FormularioDAO(this.session);
   }
   public DAO<InformacoesPessoais> getInformacoesPessoaisDAO() {
     return new DAO(this.session, InformacoesPessoais.class);
   }
   public DAO<SituacaoSocioEconomicaDemografica> getSituacaoSocioEconomicaDemograficaDAO() {
     return new DAO(this.session, SituacaoSocioEconomicaDemografica.class);
   }
   public ProdutosQuimicosDAO getProdutosQuimicosDAO() {
     return new ProdutosQuimicosDAO(this.session);
   }
   public MetaisPesadosDAO getMetaisPesadosDAO() {
     return new MetaisPesadosDAO(this.session);
   }
   public RadiacoesDAO getRadiacoesDAO() {
     return new RadiacoesDAO(this.session);
   }
   public CancerDAO getCancerDAO() {
     return new CancerDAO(this.session);
   }
 
   public DAO<HistoricoSexual> getHistoricoSexualDAO() {
     return new DAO(this.session, HistoricoSexual.class);
   }
 
   public DAO<HistoricoClinico> getHistoricoClinicoDAO() {
     return new DAO(this.session, HistoricoClinico.class);
   }
 
   public DAO<HistoricoFamiliar> getHistoricoFamiliarDAO() {
     return new DAO(this.session, HistoricoFamiliar.class);
   }
 
   public DAO<MedicacaoMenorPausa> getMedicacaoMenorPausaDAO() {
     return new DAO(this.session, MedicacaoMenorPausa.class);
   }
 
   public CirurgiasDAO getCirurgiasDAO() {
     return new CirurgiasDAO(this.session);
   }
 
   public DiabetesDAO getDiabetesDAO() {
     return new DiabetesDAO(this.session);
   }
 
   public ImunossupressorasDAO getImunossupressorasDAO() {
     return new ImunossupressorasDAO(this.session);
   }
 
   public MalEstarDAO getMalEstarDAO() {
     return new MalEstarDAO(this.session);
   }
 
   public DAO<MedicacaoUsoContinuo> getMedicacaoUsoContinuoDAO() {
     return new DAO(this.session, MedicacaoUsoContinuo.class);
   }
 
   public ParenteDoencaCronicaDAO getParenteDoencaCronicaDAO() {
     return new ParenteDoencaCronicaDAO(this.session);
   }
 
   public ParenteCancerDAO getParenteCancerDAO() {
     return new ParenteCancerDAO(this.session);
   }
 
   public DAO<HistoricoAlimentar> getHistoricoAlimentarDAO() {
     return new DAO(this.session, HistoricoAlimentar.class);
   }
 
   public DAO<ConsumoBebidaAlcoolica> getConsumoBebidaAlcoolicaDAO() {
     return new DAO(this.session, ConsumoBebidaAlcoolica.class);
   }
 
   public DAO<ConsumoBrotoSamambaia> getConsumoBrotoSamambaiaDAO() {
     return new DAO(this.session, ConsumoBrotoSamambaia.class);
   }
 
   public DAO<Fogao> getFogaoDAO() {
     return new DAO(this.session, Fogao.class);
   }
 
   public DAO<Frango> getFrangoDAO() {
     return new DAO(this.session, Frango.class);
   }
 
   public DAO<CarneVermelha> getCarneVermelhaDAO() {
     return new DAO(this.session, CarneVermelha.class);
   }
 
   public DAO<Tabagismo> getTabagismoDAO() {
     return new DAO(this.session, Tabagismo.class);
   }
 
   public DAO<Fumo> getFumoDAO() {
     return new DAO(this.session, Fumo.class);
   }
 
   public DAO<LaudoViral> getLaudoViralDAO()
   {
     return new DAO(this.session, LaudoViral.class);
   }
 
   public DAO<LaudoCitopatologico> getLaudoCitopatologicoDAO() {
     return new DAO(this.session, LaudoCitopatologico.class);
   }
 
   public DAO<LaudoClamidia> getLaudoClamidiaDAO() {
     return new DAO(this.session, LaudoClamidia.class);
   }
 
   public DAO<LaudoHpv> getLaudoHpvDAO() {
     return new DAO(this.session, LaudoHpv.class);
   }
 
   public DAO<LaudoSifilis> getLaudoSifilisDAO() {
     return new DAO(this.session, LaudoSifilis.class);
   }
 
   public DAO<LaudoHbv> getLaudoHbvDAO() {
     return new DAO(this.session, LaudoHbv.class);
   }
 
   public DAO<LaudoHcv> getLaudoHcvDAO() {
     return new DAO(this.session, LaudoHcv.class);
   }
 
   public DAO<LaudoHiv> getLaudoHivDAO() {
     return new DAO(this.session, LaudoHiv.class);
   }
 
   public DAO<Amostra> getAmostraDAO() {
     return new DAO(this.session, Amostra.class);
   }
 
   public DAO<Anexo> getAnexoDAO() {
     return new DAO(this.session, Anexo.class);
   }
 
   public DAO<TemplateTextosLaudo> getTemplateTextosLaudoDAO() {
     return new DAO(this.session, TemplateTextosLaudo.class);
   }
 
   public DAO<ReagenteHIV> getReagenteHivDAO() {
     return new DAO(this.session, ReagenteHIV.class);
   }
   
   
   public DAO<HistoricoModificacoes> getHistoricoModificacoesDAO(){
	   return new DAO<HistoricoModificacoes>(this.session, HistoricoModificacoes.class);
   }
   
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.DAOFactory
 * JD-Core Version:    0.6.0
 */