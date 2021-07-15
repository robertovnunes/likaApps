package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.endereco.Logradouro;

import com.google.gson.Gson;

import fachada.Fachada;

public class LogradouroServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
			String valor = req.getParameter("q");
			String type = req.getParameter("type");

			if(type == null || type.equals("")){
				if(valor != null && !valor.equals("")){
					
					Logradouro logradouro = fachada.getLogradouroPorCep(valor);
					Gson gson = new Gson();
					
					PrintWriter print = resp.getWriter();
					if(logradouro != null){
						print.println(gson.toJson(logradouro));
					}else{
						
					}
				}
			}else if(type != null && type.equals("buscarCidadeEstadoPorBairro")){
				if(valor != null && !valor.equals("")){
					
					Object[] cidadeEstado= fachada.getCidadeEstadoDoBairroSelecionado(valor);
					
					PrintWriter print = resp.getWriter();
					if(cidadeEstado != null){
						print.println("{\"cidade\":"+cidadeEstado[0]+",\"estado\":"+cidadeEstado[1]+",\"estadoSigla\": \""+cidadeEstado[3]+"\",\"cidadeDescricao\":\""+cidadeEstado[2]+"\"}");
					}else{
					}
				}
			}
			
	}
	
	
}
