package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Idioma;
import dao.IdiomaDAO;



public class IdiomaJPADAO extends DAOGenericoJPA<Idioma, Integer>
implements IdiomaDAO {
	
	public Idioma getIdiomaPorNome(String nome){
		
		Idioma retorno = null;
		
		String query = "SELECT i.* FROM idioma i WHERE i.idioma = '" + nome + "';";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
		
	}
	
	@Override
	public Idioma getPorId(int id) {
		
		return this.getManager().find(Idioma.class, id);
	}

	public List<Idioma> listarIdiomas(){
		
		List<Idioma> retorno = null;
		
		String query = "SELECT i.* FROM idioma i;";
		
		retorno = executarQueryLista(query);
		
		return retorno;
		
	}

	@SuppressWarnings("unchecked")
	public List<String> listarNomeIdiomas(){
		
		List<String> retorno = null;
		
		String query = "SELECT i.idioma FROM idioma i;";
		
		try {
			
			retorno = (List<String>) getManager().createNativeQuery(query, String.class);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return retorno;
		
	}
}
