/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.handler;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lika.model.Usuario;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 
 * @author Marcio
 */
@Component("sessionHandler")
@Scope("session")
public class SessionHandler {

	private Usuario usuario = new Usuario();

	private boolean logado;
	private NavigationHandler navigation = new NavigationHandler();

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public boolean isLogado() {
		return logado;
	}

	public void setLogado(boolean logado) {
		this.logado = logado;
	}

	public String logout() {
		FacesContext fc = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) fc.getExternalContext().getSession(
				false);
		session.invalidate();
		// HttpServletRequest request = (HttpServletRequest) fc
		// .getExternalContext().getRequest();
		//
		// HttpSession session = request.getSession();
		// session.setAttribute("usuario", null);
		this.logado = false;

		return "logout";
	}

	public String login() {
		FacesContext fc = FacesContext.getCurrentInstance();
		Usuario usr = DaoHandler.getInstance().getUsuarioDao()
				.autenticarUsuario(usuario);
		if (usr != null && usr.getIdUsuario() != null) {
			this.setUsuario(usr);
			this.logado = true;

			this.navigation.setAdmin(true);

			HttpServletRequest request = (HttpServletRequest) fc
					.getExternalContext().getRequest();

			HttpSession session = request.getSession();
			session.setAttribute("usuario", this.usuario);

			return "sucesso";
		} else {

			fc.addMessage(null, new FacesMessage("Não foi possível Logar."));
			fc.addMessage(null, new FacesMessage("Senha ou Login inválidos"));
			return "falha";

		}
	}
}
