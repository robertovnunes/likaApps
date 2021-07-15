package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.sistema.CNES;
import fachada.Fachada;

public class AutocompleteServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String valor = req.getParameter("term");
		List<CNES> cnes = fachada.pesquisarCNES(valor);
		PrintWriter print = resp.getWriter();
		print.println("[");
		for (int i = 0; i < cnes.size(); i++) {
			CNES obj = cnes.get(i);
			print.println("{");
			print.println("\"id\":" + obj.getCodigo_unidade() + ",");
			
			print.println("\"label\":" +"\"" + obj.getNome_fantasia()+ " - " + obj.getCodigo_unidade() + "\",");
			print.println("\"value\":" +"\"" + obj.getNome_fantasia()+ " - " + obj.getCodigo_unidade() + "\"");
			
			if(i == cnes.size() -1){
				print.println("}");
			}else{
				print.println("},");
			}
		}
		
		print.println("]");
		//array("id"=>$value, "label"=>$key, "value" => strip_tags($key)));
	}
}
