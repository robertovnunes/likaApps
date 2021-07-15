package struts.acoes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.usuario.TipoUsuario;
import model.usuario.Usuario;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import fachada.Fachada;

public class SistemaAcoes extends DispatchAction {

	
	private static final String fHOME = "fLogon";
	private static final String fINDEX = "fIndex";
	private static final String fERROR = "fError";

	private Fachada fachada;
	
	public SistemaAcoes(){
		fachada = Fachada.getInstancia();
	}
	
	public ActionForward logon(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		ActionForward retorno = null;
		
		String login = ((DynaActionForm)form).getString("loginUsuario");
		String senha = ((DynaActionForm)form).getString("senhaUsuario");
		
		try{
			Object objUsuario = fachada.autenticar(login);
			Usuario usuario = (Usuario) objUsuario;
			
			boolean valida = true;
			
			if(usuario!= null && usuario.getTipoUsuario().equals(TipoUsuario.INVESTIGADOR)){
				if(usuario.getSenha().equals(senha)){
					retorno = map.findForward(fINDEX);
					request.getSession().setAttribute("usuario", usuario);
				}else{
					valida = false;
				}
			}else if(usuario!= null && usuario.getTipoUsuario().equals(TipoUsuario.PESSOA_FISICA)){
				if(usuario.getSenha().equals(senha)){
					retorno = map.findForward(fINDEX);
//					Paciente patient = (Paciente) objUsuario;
//					request.getSession().setAttribute("usuario", patient);
				}else{
					
					valida = false;
				}
			}
			
			if(!valida || usuario == null){
				errors.add("AuthenticationException", new ActionMessage("erro.autenticacao"));
				this.saveErrors(request, errors);
				retorno = map.findForward(fHOME);
			}
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("AuthenticationException", new ActionMessage("erro.autenticacao"));
			this.saveErrors(request, errors);
			retorno = map.findForward(fHOME);
		}
		
		return retorno;
	}
	
	public ActionForward mostrarTelaLogon(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario") != null){
			return map.findForward(fINDEX);
		}else{
			return map.findForward(fHOME);
		}
	}
	
	public ActionForward logoff(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("usuario", null);
		return map.findForward(fHOME);
	}
	
	public ActionForward error(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("usuario", null);
		return map.findForward(fERROR);
	}
	
	
}
