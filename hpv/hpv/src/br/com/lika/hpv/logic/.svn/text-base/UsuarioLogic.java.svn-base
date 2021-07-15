 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.dao.UsuarioDAO;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.PerfilAdministradorInterceptor;
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.util.List;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.plugin.hibernate.Validate;
 import org.vraptor.scope.ScopeType;
 import org.vraptor.validator.ValidationErrors;
 
 @Component("usuario")
 @InterceptedBy({DAOInterceptor.class, PerfilAdministradorInterceptor.class})
 public class UsuarioLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
   private List<Usuario> usuarios;
   private Usuario usuario;
 
   public UsuarioLogic(DAOFactory factory)
   {
     this.daoFactory = factory;
   }
 
   public void formularioUsuario(Usuario us) {
     if ((us != null) && (us.getId() != null))
       this.usuario = ((Usuario)this.daoFactory.getUsuarioDAO().procura(us.getId())); 
   }
 
   @Validate(params={"usuario"})
   public void addUsuario(Usuario u) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getUsuarioDAO().adiciona(u);
     this.daoFactory.commit();
   }
 
   public void validateAddUsuario(ValidationErrors errors, Usuario u)
   {
   }
 
   public void removerUsuario(Usuario u) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getUsuarioDAO().remover(u.getId());
     this.daoFactory.commit();
   }
 
   public void listarUsuarios(Usuario u) {
     this.usuarios = this.daoFactory.getUsuarioDAO().listaTudo();
   }
 
   public Usuario getUsuarioDaSessao()
   {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public List<Usuario> getUsuarios() {
     return this.usuarios;
   }
 
   public void setUsuarios(List<Usuario> usuarios) {
     this.usuarios = usuarios;
   }
 
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 
   public Usuario getUsuario() {
     return this.usuario;
   }
 
   public void setUsuario(Usuario usuario) {
     this.usuario = usuario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.UsuarioLogic
 * JD-Core Version:    0.6.0
 */