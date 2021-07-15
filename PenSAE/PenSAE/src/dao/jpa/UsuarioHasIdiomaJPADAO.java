package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.UsuarioHasIdioma;
import dao.UsuarioHasIdiomaDAO;



public class UsuarioHasIdiomaJPADAO extends DAOGenericoJPA<UsuarioHasIdioma, Integer>
implements UsuarioHasIdiomaDAO {

	public List<UsuarioHasIdioma> getPessoaHasIdiomasPorUsuario(int id){
		
		List<UsuarioHasIdioma> retorno = null;
		
		String query = "SELECT uhi.* FROM usuario_has_idioma uhi WHERE uhi.usuario_id = " + id + ";";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

	@Override
	public UsuarioHasIdioma getPorId(int id) {

		return this.getManager().find(UsuarioHasIdioma.class, id);
	}
	

}
