package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.MetaProfessor;
import dao.MetaProfessorDAO;



public class MetaProfessorJPADAO extends DAOGenericoJPA<MetaProfessor,Integer>
implements MetaProfessorDAO{

	@Override
	public MetaProfessor getPorId(int id) {
		
		return this.getManager().find(MetaProfessor.class, id);
	}

}
