package managedBeans;

import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ComponentSystemEvent;

import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="logon")
@SessionScoped
public class LogonBean {

	private static Fachada fachada;
	private boolean estaLogado;
	private String login;
	private String password;

	private Usuario usuarioLogado;

	public LogonBean() {

		fachada = Fachada.getInstance();
	}

	public String getLogin() {
		return login;
	}

	public String getPassword() {
		return password;
	}

	/**
	 * @return the usuarioLogado
	 */
	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	public String logon(){
		String outcome = "";

		Usuario usuario;

		try {
			usuario = fachada.logon(this.login, this.password);

			if(usuario != null){

				//Esse codigo comentado abaixo eh para testes, enquanto ainda não estamos em producao
				//Os usuarios que se cadastrarem podem acessar o sistema
				//if(usuario.isCadastroLiberado()){

				usuarioLogado = usuario;
				estaLogado=true;

				if(usuarioLogado.getPerfil() == Define.PERFIL_ALUNO){
					outcome = Define.OUTCOME_LOGON_SUCESSO_ALUNO;
					
				}else if(usuarioLogado.getPerfil() == Define.PERFIL_PROFESSOR){
					
					outcome = Define.OUTCOME_LOGON_SUCESSO_PROFESSOR;
					
				}else if(usuarioLogado.getPerfil() == Define.PERFIL_ADMINISTRADOR){
					
					outcome = Define.OUTCOME_LOGON_SUCESSO_ADMIN;
				}

				//}else{

				//	FacesContext.getCurrentInstance().addMessage("form_Logon", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.logon_mensagem_erro_logon_liberacao)); 
				//	outcome = Define.outcome_logon_info_falha;
				//}

			}else{

				FacesContext.getCurrentInstance().addMessage("form_Logon", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.LOGON_MENSAGEM_ERRO_LOGON_ERRADO)); 
				outcome = Define.OUTCOME_LOGON_INFO_FALHA;

			}

		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage("form_Logon", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.MENSAGEM_ERRO_FALHA_BD)); 
			outcome = Define.OUTCOME_LOGON_INFO_FALHA;
		}



		return outcome;
	}

	public String logOut(){
		String outcome = "";

		this.usuarioLogado = null;
		this.estaLogado = false;
		outcome = Define.OUTCOME_LOGOUT;

		return outcome;
	}

	/** 
	 * Method for redirecting a request 
	 * @param url 
	 */  
	private void redirecionar(String url){  
		try {  
			FacesContext context=FacesContext.getCurrentInstance();  
			context.getExternalContext().redirect(url);  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  
	}

	public void setLogin(java.lang.String login) {
		this.login = login;
	}

	public void setPassword(java.lang.String password) {
		this.password = password;
	}

	/**
	 * @param usuarioLogado the usuarioLogado to set
	 */
	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

	/** 
	 * An event listener for redirecting the user to login page if he/she is not currently logged in 
	 * @param event 
	 */  
	public void verificaLogon(ComponentSystemEvent event){  
		if(!estaLogado){  
			redirecionar(Define.LOGON_FAIL_REDIRECT_PAGE);  
		}  
	}
}
