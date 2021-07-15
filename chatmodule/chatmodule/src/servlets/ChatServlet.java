package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.queryParser.ParseException;

import repositorio.Dialog;
import repositorio.FachadaChat;
import stm.QuestioningDoneState;
import stm.UnorderedAskState;
import stm.VirtualPatientState;
import util.Directories;

public class ChatServlet extends HttpServlet {

	private static final long serialVersionUID = -3759665526884217729L;
	private Dialogo dialogo;

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		if ( dialogo == null )
		{
			ServletContext context = getServletContext();
			Directories dir = new Directories(context.getRealPath("/"));
			try {
				dialogo = new Dialogo(dir);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		res.setContentType("text/html;charset=ISO-8859-1");
		String question = new String(req.getParameter("textfield").toString()
				.getBytes(), "ISO-8859-1");

		VirtualPatientState currentState;
		try {
			currentState = dialogo.askPatient(question);

			String userSays = String.format("Usu�rio disse: %s.", question);
			FachadaChat fachada = FachadaChat.getInstance();

			if (currentState instanceof QuestioningDoneState
					|| currentState instanceof UnorderedAskState) {
				req.setAttribute("colecao", fachada.exibirDialogo());
				req.setAttribute("alert", currentState.responseState());

			} else {
				String pacientSays = String.format("Paciente disse: %s.",
						currentState.responseState());
				Dialog dialogo = new Dialog(userSays, pacientSays);
				fachada.inserir(dialogo);
				req.setAttribute("colecao", fachada.exibirDialogo());
				req.setAttribute("alert", "");
			}
			req.getRequestDispatcher("home.jsp").forward(req, res);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
