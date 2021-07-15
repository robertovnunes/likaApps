package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.endereco.Cidade;
import fachada.Fachada;

public class CidadeServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String valor = req.getParameter("q");
		String type = req.getParameter("type");
	     HttpSession session = req.getSession(true);

	     if(type == null || type.equals("")){
	    	 if(valor != null && !valor.equals("")){
	 			
	 			List<Cidade> cidades = fachada.getCidadesPorUF(valor);
	 			PrintWriter print = resp.getWriter();
	 			
	 			for (Cidade cidade : cidades) {
	 				
	 				print.println("<option value='"+ cidade.getCodigo_cidade()+"'>"+cidade.getDescricao()+"</option>");
	 			}
	 			
	 			if(cidades == null || cidades.isEmpty()){
	 				print.println("<option value=''>SELECIONE</option>");
	 			}else{
	 				session.setAttribute("cidades", cidades);
	 			}
	 		}
	     }else if(type != null && type.equals("porCodigoBairro")){
	    	 if(valor != null && !valor.equals("")){
	 			
	 			List<Object[]> cidades = fachada.getTodasCidadesDoBairroSelecionado(valor);
	 			PrintWriter print = resp.getWriter();
	 			
	 			for (Object[] cidade : cidades) {
	 				
	 				print.println("<option value='"+ cidade[0]+"'>"+cidade[2]+"</option>");
	 			}
	 			
	 			if(cidades == null || cidades.isEmpty()){
	 				print.println("<option value=''>SELECIONE</option>");
	 			}else{
	 				session.setAttribute("cidades", cidades);
	 			}
	 		}
	     }
		
		
	}
}
