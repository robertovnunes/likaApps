package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.Curso;
import model.Feedback;
import model.Usuario;

public interface FeedbackDAO extends DAOGenerico<Feedback,Integer>{

	Feedback getFeedback(Usuario u, Curso c);
	List<Feedback> listarFeedbacks();

}
