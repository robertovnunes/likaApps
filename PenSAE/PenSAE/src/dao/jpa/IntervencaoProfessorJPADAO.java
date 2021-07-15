package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.IntervencaoProfessor;
import dao.IntervencaoProfessorDAO;



public class IntervencaoProfessorJPADAO extends DAOGenericoJPA<IntervencaoProfessor,Integer>
implements IntervencaoProfessorDAO{

	@Override
	public IntervencaoProfessor getPorId(int id) {
		
		return this.getManager().find(IntervencaoProfessor.class, id);
	}

}
