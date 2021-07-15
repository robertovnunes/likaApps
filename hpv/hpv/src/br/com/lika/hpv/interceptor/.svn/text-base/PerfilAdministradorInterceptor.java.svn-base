 package br.com.lika.hpv.interceptor;
 
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.io.IOException;
 import org.vraptor.Interceptor;
 import org.vraptor.LogicException;
 import org.vraptor.LogicFlow;
 import org.vraptor.LogicRequest;
 import org.vraptor.annotations.In;
 import org.vraptor.http.VRaptorServletResponse;
 import org.vraptor.scope.ScopeType;
 import org.vraptor.view.ViewException;
 
 public class PerfilAdministradorInterceptor
   implements Interceptor
 {
 
   @In(scope=ScopeType.SESSION, required=false)
   protected Usuario usuarioDaSessao;
 
   public void intercept(LogicFlow flow)
     throws LogicException, ViewException
   {
     if ((this.usuarioDaSessao == null) || (!isClasse()))
       try {
         flow.getLogicRequest().getResponse().sendRedirect("login.jsp?expirou=true");
       } catch (IOException e) {
         throw new LogicException(e);
       }
     else flow.execute(); 
   }
 
   protected boolean isClasse()
   {
     return this.usuarioDaSessao.getAcessoAdministrador().charValue() == 'Y';
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.interceptor.PerfilAdministradorInterceptor
 * JD-Core Version:    0.6.0
 */