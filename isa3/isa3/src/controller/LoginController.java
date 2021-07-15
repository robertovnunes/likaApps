package controller;


import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import fachada.Fachada;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;

@ManagedBean(name = "loginController")
@SessionScoped
public class LoginController {

    private String login;
    private String senha;
    
    public LoginController(){
    }

	public String efetuarLogin(){
		String retorno = "index";
		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		
		if(login != null && !login.equals("")){
			Usuario usuario = (Usuario) Fachada.getInstancia().autenticar(login);
			boolean senhaCorreta = false;
			if(usuario != null && senha != null && usuario.getSenha() != null && usuario.getSenha().equals(senha)){
				senhaCorreta = true;
			}
			if(senhaCorreta){
				sessao.setAttribute("usuarioLogado", usuario);
				try {
					if(usuario instanceof Aluno){
						usuario.setTipoUsuario(TipoUsuario.ALUNO);
						FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/curso_procurar.xhtml");
						retorno = "home";
					}else if(usuario instanceof Professor){
						usuario.setTipoUsuario(TipoUsuario.PROFESSOR);
						FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/curso_procurar.xhtml");
						retorno = "usuarioProcurar";
					}else if(usuario instanceof Administrador){
						usuario.setTipoUsuario(TipoUsuario.ADMINISTRADOR);
					}
				} catch (Exception e) {
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo deu errado. Tente novamente mais tarde!"));	
				}
			}else{
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Senha ou login incorretos!"));	
			}
		}else{
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", "Informe os campos de login e senha!"));
		}
		
		return retorno;
	}
	
	public String efetuarLogOut(){
		HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		
		try {
			sessao.removeAttribute("usuarioLogado");
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/public/login.xhtml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "index";
	}
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
}
