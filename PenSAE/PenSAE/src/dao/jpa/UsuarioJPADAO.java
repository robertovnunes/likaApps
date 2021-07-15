package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.Usuario;
import dao.UsuarioDAO;

/**
 * @author Jesus
 *
 */

public class UsuarioJPADAO extends DAOGenericoJPA<Usuario, Integer>
implements UsuarioDAO {

	@Override
	public Usuario getPorId(int id) {
		
		return this.getManager().find(Usuario.class, id);
	}

	@Override
	public Usuario getUsuarioPorLogin(String login) {

		Usuario retorno = null;
		
		String query = "SELECT u.* FROM usuario u WHERE u.login = '"+ login 
				+"';";
		
		retorno = executarQueryObjeto(query);

		return retorno;
	}

}
