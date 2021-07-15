package dados.basicas;

import model.endereco.Logradouro;
import dados.DAOGenerico;

public interface  LogradouroDAO extends DAOGenerico<Logradouro, Integer>{
	
	public Logradouro getLogradouroPorCep(String cep);

}
