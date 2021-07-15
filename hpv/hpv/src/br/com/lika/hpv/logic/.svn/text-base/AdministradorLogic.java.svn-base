 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PerfilAdministradorInterceptor;
 import br.com.lika.hpv.model.usuario.Usuario;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.scope.ScopeType;
 
 @Component("admin")
 @InterceptedBy({DAOInterceptor.class, PerfilAdministradorInterceptor.class})
 public class AdministradorLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
 
   public AdministradorLogic(DAOFactory factory)
   {
     this.daoFactory = factory;
   }
 
   public void index()
   {
   }
 
   public Usuario getUsuarioDaSessao() {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.AdministradorLogic
 * JD-Core Version:    0.6.0
 */