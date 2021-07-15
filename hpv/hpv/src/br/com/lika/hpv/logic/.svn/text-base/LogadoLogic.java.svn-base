 package br.com.lika.hpv.logic;
 
 import java.util.List;

import org.vraptor.annotations.Component;
import org.vraptor.annotations.In;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.annotations.Out;
import org.vraptor.plugin.hibernate.Validate;
import org.vraptor.scope.ScopeType;

import br.com.lika.hpv.dao.DAOFactory;
import br.com.lika.hpv.interceptor.DAOInterceptor;
import br.com.lika.hpv.interceptor.LogadoInterceptor;
import br.com.lika.hpv.model.formulario.Formulario;
import br.com.lika.hpv.model.usuario.Usuario;
 
 @Component("logado")
 @InterceptedBy({DAOInterceptor.class, LogadoInterceptor.class})
 public class LogadoLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;

	@In(scope=ScopeType.REQUEST, required=false)
	@Out(scope=ScopeType.REQUEST)
   protected List<Formulario> formulariosBuscados;
   
   protected final DAOFactory daoFactory;
   protected Usuario usuario;
 
   public LogadoLogic(DAOFactory d)
   {
     this.daoFactory = d;
   }
 
   public void index()
   {
   }
 
   public void procurarFormularioCodigoPronex(Formulario codigo){
	   
	   this.daoFactory.getSession().clear();
	   this.daoFactory.beginTransaction();
	   this.formulariosBuscados = this.daoFactory.getFormularioDAO().procuraPorcodigoPronex(codigo.getCodigoPronex());
	   this.daoFactory.commit();
   }
   
   public void formularioAlterarMeusDados(Usuario usuario) {
     this.usuario = ((Usuario)this.daoFactory.getUsuarioDAO().procura(usuario.getId()));
   }
   @Validate(params={"usuario"})
   public void alterarMeusDados(Usuario usuario) {
     this.daoFactory.getSession().clear();
     this.daoFactory.beginTransaction();
     this.daoFactory.getUsuarioDAO().atualizarMeusDados(usuario);
     this.daoFactory.commit();
   }
 
   public Usuario getUsuarioDaSessao() {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public Usuario getUsuario() {
     return this.usuario;
   }
 
   public void setUsuario(Usuario usuario) {
     this.usuario = usuario;
   }
 
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.LogadoLogic
 * JD-Core Version:    0.6.0
 */