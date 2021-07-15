package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.EstudoCaso;
import model.Glossario;
import dao.GlossarioDAO;

public class GlossarioJPADAO extends DAOGenericoJPA<Glossario,Integer> implements GlossarioDAO{

	@Override
	public Glossario getPorId(int id) {
		
		return this.getManager().find(Glossario.class, id);
	}

	@Override
	public List<Glossario> listarGlossarios(EstudoCaso ec) {
		List<Glossario> retorno;
		
		String query = "SELECT DISTINCT g.* FROM glossario g WHERE g.estudocaso_id = " + ec.getId() +";";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

}
