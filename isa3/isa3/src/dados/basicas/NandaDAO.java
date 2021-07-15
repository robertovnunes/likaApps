package dados.basicas;

import java.util.List;

import dados.DAOGenerico;
import model.Nanda;

public interface NandaDAO extends DAOGenerico<Nanda, Integer> {

	List<Nanda> pesquisarNanda(String query, String eixo);
	
	List<Nanda> getNandaPorTituloAutocomplete(String termo);
}
