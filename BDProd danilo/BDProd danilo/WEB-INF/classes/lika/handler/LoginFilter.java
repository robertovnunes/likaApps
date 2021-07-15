/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.handler;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	private final static String FILTER_APPLIED = "_security_filter_applied";
	public static String context;
	private FilterConfig config;
	private ServletContext servletContext;

	public LoginFilter() {
	}

	public void init(FilterConfig arg0) throws ServletException {
		config = arg0;
		servletContext = arg0.getServletContext();
		context = config.getServletContext().getContextPath();
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hreq = (HttpServletRequest) request;
		HttpServletResponse hresp = (HttpServletResponse) response;
		HttpSession session = hreq.getSession();

		hreq.getPathInfo();
		String paginaAtual = new String(hreq.getRequestURL());

		// dont filter login.jsp because otherwise an endless loop.
		// & only filter .jsp otherwise it will filter all images etc as well.
		if ((request.getAttribute(FILTER_APPLIED) == null)
				&& paginaAtual != null && (!paginaAtual.endsWith("login.jsp"))
				&& (!paginaAtual.endsWith("acessoNegado.jsp"))
				&& (!paginaAtual.endsWith("erro.jsp"))
				&& (!paginaAtual.endsWith("logout.jsp"))
				&& (!paginaAtual.endsWith("sessaoExpirada.jsp"))
				&& (paginaAtual.endsWith(".jsp"))) {
			request.setAttribute(FILTER_APPLIED, Boolean.TRUE);
			// If the session bean is not null get the session bean property
			// username.
			boolean logado = false;
			if (((SessionHandler) session.getAttribute("sessionHandler")) != null) {
				logado = ((SessionHandler) session
						.getAttribute("sessionHandler")).isLogado();
			}

			if (!logado && session != null) {
				// hresp.sendRedirect("/faces/acessoNegado.jsp");
				String context = config.getServletContext().getContextPath();
				hresp.sendRedirect(context + "/faces/acessoNegado.jsp");
				return;
			} else if (!logado && session == null) {
				String context = config.getServletContext().getContextPath();
				hresp.sendRedirect(context + "/faces/sessaoExpirada.jsp");
				return;
			}
		}
		try {
			// deliver request to next filter
			chain.doFilter(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			String context = config.getServletContext().getContextPath();
			hresp.sendRedirect(context + "/faces/erro.jsp");
		}
	}
}
