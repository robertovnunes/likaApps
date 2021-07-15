package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Curso;
import model.Feedback;
import model.Usuario;
import dao.FeedbackDAO;

public class FeedbackJPADAO extends DAOGenericoJPA<Feedback,Integer> implements FeedbackDAO{

	@Override
	public Feedback getFeedback(Usuario u, Curso c) {
		Feedback retorno;
		
		String query = "SELECT DISTINCT f.* FROM feedback f, " +
				"aluno a WHERE a.usuario_id = " + u.getId() + " AND a.id = f.aluno_id;";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
	}

	@Override
	public Feedback getPorId(int id) {
		
		return this.getManager().find(Feedback.class, id);
	}

	@Override
	public List<Feedback> listarFeedbacks() {
		List<Feedback> retorno;
		
		String query = "SELECT DISTINCT f.* FROM feedback f;";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

}
