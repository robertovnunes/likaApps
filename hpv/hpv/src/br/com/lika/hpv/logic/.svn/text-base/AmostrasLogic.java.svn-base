 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAO;
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.dao.FormularioDAO;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PerfilAmostrasInterceptor;
 import br.com.lika.hpv.model.amostra.Amostra;
 import br.com.lika.hpv.model.formulario.Formulario;
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.util.List;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.plugin.hibernate.Validate;
 import org.vraptor.scope.ScopeType;
 
 @Component("amostras")
 @InterceptedBy({PerfilAmostrasInterceptor.class, DAOInterceptor.class})
 public class AmostrasLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
   private Formulario formulario;
   private List<Amostra> amostras;
   private Amostra amostra;
   private List<Formulario> formularios;
 
   public void index()
   {
     this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
   }
 
   public AmostrasLogic(DAOFactory factory) {
     this.daoFactory = factory;
   }
 
   public void formulario(Formulario formulario) {
     this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
     this.amostra = this.formulario.getAmostra();
   }
   @Validate(params={"amostra"})
   public void add(Amostra amostra) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getAmostraDAO().atualiza(amostra);
     this.daoFactory.commit();
   }
 
   public void edit(Amostra amostra) {
     this.amostra = ((Amostra)this.daoFactory.getAmostraDAO().procura(amostra.getId()));
   }
 
   public void remove(Amostra amostra) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getAmostraDAO().remover(amostra.getId());
     this.daoFactory.commit();
   }
 
   public void list() {
     this.amostras = this.daoFactory.getAmostraDAO().listaTudo();
   }
 
   public Usuario getUsuarioDaSessao()
   {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 
   public Formulario getFormulario() {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 
   public List<Amostra> getAmostras() {
     return this.amostras;
   }
 
   public void setAmostras(List<Amostra> amostras) {
     this.amostras = amostras;
   }
 
   public Amostra getAmostra() {
     return this.amostra;
   }
 
   public void setAmostra(Amostra amostra) {
     this.amostra = amostra;
   }
 
   public List<Formulario> getFormularios() {
     return this.formularios;
   }
 
   public void setFormularios(List<Formulario> formularios) {
     this.formularios = formularios;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.AmostrasLogic
 * JD-Core Version:    0.6.0
 */