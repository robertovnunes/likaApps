package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import model.Curso;
import model.Feedback;
import model.Usuario;
import dao.FeedbackDAO;

public class FeedbackNegocios {
	
	static FeedbackNegocios instancia;
	
	public static FeedbackNegocios getInstancia(){
		if(FeedbackNegocios.instancia == null){
			FeedbackNegocios.instancia = new FeedbackNegocios();
		}
		
		return FeedbackNegocios.instancia;
	}
	
	private FabricaDAO fabrica;
	
	public FeedbackNegocios(){
		fabrica = FabricaJPADAO.getInstancia();
	}
	
	public List<Feedback> carregarListaFeedback() {
		List<Feedback> retorno;
		
		FeedbackDAO feedbackDAO = fabrica.getFeedbackDAO();
		
		retorno = feedbackDAO.listarFeedbacks();
		
		return retorno;
	}

	public Feedback getFeebackUsuarioCurso(Usuario u, Curso c) {
		
		Feedback retorno;
		
		FeedbackDAO feedbackDAO = fabrica.getFeedbackDAO();
		
		retorno = feedbackDAO.getFeedback(u, c);
		
		return retorno;
	}

	public void salvarFeedback(Feedback feedback){
		FeedbackDAO feedbackDAO = fabrica.getFeedbackDAO();
		feedbackDAO.persistir(feedback);
	}
}
