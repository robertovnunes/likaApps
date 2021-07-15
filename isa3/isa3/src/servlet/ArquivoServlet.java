package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.sistema.Arquivo;
import fachada.Fachada;

public class ArquivoServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			  throws ServletException, IOException {


		try 
		{
			 String id = request.getParameter("idArquivo");
			ServletOutputStream out = response.getOutputStream();
			
			Arquivo download = fachada.getArquivoPorId(Integer.parseInt(id));
			
			response.setContentType(download.getExtensao());
			response.setHeader("Content-Disposition","attachment;filename="+download.getNomeArqv());
			out.write(download.getDadosArqv());
			out.flush();
			out.close();
	  }catch(Exception ex){
		  ex.printStackTrace();
		 request.setAttribute("mensagem", "DiagnosticoAlunoPlanejamento de conexão com o Banco de Dados!");
	  }

		}
}
