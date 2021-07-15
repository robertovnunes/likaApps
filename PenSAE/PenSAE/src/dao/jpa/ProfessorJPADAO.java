package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.Professor;
import model.Usuario;
import dao.ProfessorDAO;


/**
 * @author Jesus
 *
 */

public class ProfessorJPADAO extends DAOGenericoJPA<Professor, Integer>
implements ProfessorDAO {

	@Override
	public Professor getPorId(int id) {
		
		return this.getManager().find(Professor.class, id);
	}

	@Override
	public Professor getProfessorPorUsuario(Usuario usuario) {
		
		Professor retorno = null;

		String query = "SELECT p.* FROM professor p WHERE p.usuario_id='"+usuario.getId()+"';";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
	}

}
