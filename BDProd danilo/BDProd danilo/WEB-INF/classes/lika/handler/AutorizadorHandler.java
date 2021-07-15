package lika.handler;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;

import com.sun.faces.el.FacesCompositeELResolver.ELResolverChainType;

import lika.model.Usuario;

public class AutorizadorHandler implements PhaseListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void afterPhase(PhaseEvent event) {

		FacesContext facesContext = event.getFacesContext();
		String currentPage = facesContext.getViewRoot().getViewId();

		boolean isLoginPage = (currentPage.lastIndexOf("/login.jsp") > -1);

		HttpSession session = (HttpSession) facesContext.getExternalContext()
				.getSession(true);
		Usuario usr = (Usuario) session.getAttribute("usuario");

		if (currentPage.contains("acessoNegado")) {
			facesContext.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_ERROR, "Faça o Login novamente", ""));
			return;
		}

		if (!isLoginPage && usr == null) {

			facesContext.getApplication().getNavigationHandler()
					.handleNavigation(facesContext, null, "acessoNegado");

			facesContext.renderResponse();

		}

		System.out.println("AQUIIII " + currentPage);
	}

	public void beforePhase(PhaseEvent event) {
	}

	public PhaseId getPhaseId() {
		return PhaseId.RESTORE_VIEW;
	}

}
