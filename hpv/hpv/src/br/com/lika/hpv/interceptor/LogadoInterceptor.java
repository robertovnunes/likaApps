package br.com.lika.hpv.interceptor;

import br.com.lika.hpv.model.usuario.Usuario;
import java.io.IOException;

import org.vraptor.Interceptor;
import org.vraptor.LogicException;
import org.vraptor.LogicFlow;
import org.vraptor.annotations.In;
import org.vraptor.scope.ScopeType;
import org.vraptor.scope.SessionContext;
import org.vraptor.view.ViewException;

public class LogadoInterceptor implements Interceptor {

	@In(scope = ScopeType.SESSION, required = false)
	protected Usuario usuarioDaSessao;

	public void intercept(LogicFlow flow) throws LogicException, ViewException {

			
		
		if ((this.usuarioDaSessao != null) && (this.usuarioDaSessao.temAcessoAoSistema()))
			flow.execute();
		else
			try {
				/*Auditoria auditoria = new Auditoria();
				Object a = flow.getLogicRequest().getSessionContext().getAttribute("usuarioDaSessao");
				String ip=	flow.getLogicRequest().getRequest().getRemoteAddr();
				auditoria.setIp(flow.getLogicRequest().getRequest().getRemoteAddr());
				auditoria.setData(new Date());
				auditoria.setOperacao(Auditoria.OPERACAO_SESSAO_EXPIRADA);*/
				flow.getLogicRequest().getResponse().sendRedirect("login.jsp?expirou=true&semAcesso=true");
			} catch (IOException e) {
				throw new LogicException(e);
			}
	}
}

/*
 * Location: D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name: br.com.lika.hpv.interceptor.LogadoInterceptor JD-Core
 * Version: 0.6.0
 */