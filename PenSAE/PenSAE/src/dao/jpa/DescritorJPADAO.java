/**
 * 
 */
package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Descritor;
import dao.DescritorDAO;

/**
 * @author Jesus
 *
 */

public class DescritorJPADAO extends DAOGenericoJPA<Descritor,Integer> 
implements DescritorDAO{

	@Override
	public Descritor getPorId(int id) {
		
		return this.getManager().find(Descritor.class, id);
	}

	@Override
	public List<Descritor> listarDescritores() {
		List<Descritor> retorno = null;

		String query = "SELECT d.* FROM descritores d;";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}
}
