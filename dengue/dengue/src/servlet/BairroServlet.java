package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.endereco.Bairro;
import fachada.Fachada;

public class BairroServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
String valor = req.getParameter("q");
String type = req.getParameter("type");
HttpSession session = req.getSession(true);

		if(type == null || type.equals("")){
			if(valor != null && !valor.equals("")){
				
				List<Bairro> bairros = fachada.getBairroPorCidade(valor);
				PrintWriter print = resp.getWriter();
				
				for (Bairro bairro : bairros) {
					
					print.println("<option value='"+ bairro.getCodigo()+"'>"+bairro.getDescricao()+"</option>");
				}
				
				if(bairros == null || bairros.isEmpty()){
					print.println("<option value=''>SELECIONE</option>");
				}else{
					session.setAttribute("bairros", bairros);
				}
			}
		}else if(type != null && type.equals("porCodigoBairro")){
			
			List<Object[]> bairros = fachada.getTodosBairrosDaCidadeDoBairroSelecionado(valor);
			PrintWriter print = resp.getWriter();
			
			for (Object[] bairro : bairros) {
				print.println("<option value='"+ bairro[0]+"'>"+bairro[1]+"</option>");
			}
			
			if(bairros == null || bairros.isEmpty()){
				print.println("<option value=''>SELECIONE</option>");
			}else{
				session.setAttribute("bairros", bairros);
			}
		}
		
		
	}
}
