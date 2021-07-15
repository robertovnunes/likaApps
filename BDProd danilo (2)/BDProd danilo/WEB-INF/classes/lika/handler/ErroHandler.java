package lika.handler;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import com.sun.faces.application.ActionListenerImpl;

public class ErroHandler extends ActionListenerImpl {
	public void processAction(ActionEvent event) {

		try {
			// Executa o método da classe Pai
			super.processAction(event);

		} catch (Exception e) {
			FacesContext context = FacesContext.getCurrentInstance();
			// Se ocorrer um erro inesperado, exibe a mensagem abaixo
			context.addMessage(null, new FacesMessage(
					FacesMessage.SEVERITY_FATAL, e.getMessage(), null));

			// Redireciona para a pagina com o mapeamento 'erro' no
			// faces-config.
			context.getApplication().getNavigationHandler().handleNavigation(
					context, null, "erro");
		}

	}

}