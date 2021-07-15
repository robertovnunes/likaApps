 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PerfilAdministradorInterceptor;
 import br.com.lika.hpv.model.usuario.Usuario;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.scope.ScopeType;
 
 @Component("cod")
 @InterceptedBy({PerfilAdministradorInterceptor.class, DAOInterceptor.class})
 public class CodBarraLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
 
   public CodBarraLogic(DAOFactory dao)
   {
     this.daoFactory = dao;
   }
 
   public void gerarCodigosBarra()
   {
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.CodBarraLogic
 * JD-Core Version:    0.6.0
 */