package hpdd.web.util;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import hpdd.web.ContextoBean;

public class ContextoUtil {
	public static FacesContext context;
	public static ExternalContext external;
	
	public static ContextoBean getContextoBean() {
		context = FacesContext.getCurrentInstance();
		external = context.getExternalContext();
		HttpSession session = (HttpSession) external.getSession(true);
		ContextoBean contextoBean = (ContextoBean) session.getAttribute("contextoBean");
		return contextoBean;
	}
}
