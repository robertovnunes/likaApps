package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.Ambulatorio;
import model.Curso;
import model.Usuario;
import dao.AmbulatorioDAO;

public class AmbulatorioJAPDAO extends DAOGenericoJPA<Ambulatorio,Integer> implements AmbulatorioDAO {

	@Override
	public Ambulatorio getAmbulatorioUsuarioEstudoCaso(Usuario u, Curso c) {

		Ambulatorio retorno = null;
		
		String query = "SELECT DISTINCT am.* FROM ambulatorio am, aluno a WHERE a.usuario_id = " + u.getId() + " "
				+ "AND am.aluno_id = a.id " + 
				" AND am.curso_id = " + c.getId() + ";";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
	}

	@Override
	public Ambulatorio getPorId(int id) {
		
		return this.getManager().find(Ambulatorio.class, id);
	}

}
