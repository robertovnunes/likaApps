package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.DiagnosticoProfessor;
import dao.DiagnosticoProfessorDAO;

public class DiagnosticoProfessorJPADAO extends DAOGenericoJPA<DiagnosticoProfessor,Integer>
implements DiagnosticoProfessorDAO{

	@Override
	public DiagnosticoProfessor getPorId(int id) {
		
		return this.getManager().find(DiagnosticoProfessor.class, id);
	}

}
