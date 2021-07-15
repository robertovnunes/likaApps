package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.paciente.prontuario.atendimento.queixa.Cid;
import fachada.Fachada;

public class AutocompleteServlet extends HttpServlet{

	private Fachada fachada = Fachada.getInstancia();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String valor = req.getParameter("q");
		List<Cid> cids = fachada.pesquisarCid(valor);
		PrintWriter print = resp.getWriter();
		for (Cid cid : cids) {
			print.println(""+ cid.getDescricao() + "-" + cid.getCid()+";");
		}
		
	}
}
