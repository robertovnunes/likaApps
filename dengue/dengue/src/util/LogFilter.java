package util;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		Object user = request.getSession().getAttribute("usuario");
		if(user == null && !request.getRequestURI().endsWith("logon.do") && !request.getServletPath().endsWith("error.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/sistema.do?method=mostrarTelaLogon");
			rd.forward(request,response);
		}
		else{
			try{
				chain.doFilter(req, res);
			}catch(Exception ex){
				Writer writer = new StringWriter();
				PrintWriter printWriter = new PrintWriter(writer);
				ex.printStackTrace(printWriter);
				String s = writer.toString();
				
				System.out.println(s);
				request.getSession().setAttribute("erroMsg", s);
				RequestDispatcher rd = request.getRequestDispatcher("/error.do?method=error");
				rd.forward(request,response);
			}
		}
	}
	public void init(FilterConfig config) throws ServletException {

//		//Get init parameter
//		String testParam = config.getInitParameter("test-param");
//
//		//Print the init parameter
//		System.out.println("Test Param: " + testParam);
	}
	public void destroy() {
		//add code to release any resource
	}
}
