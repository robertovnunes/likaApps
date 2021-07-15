package dados.basicas;

import java.util.List;

import model.endereco.Bairro;
import dados.DAOGenerico;

public interface  BairroDAO extends DAOGenerico<Bairro, Integer>{

	
	public List<Bairro> getBairroPorCidade(String idCidade);
	public List<Object[]> getTodosBairrosDaCidadeDoBairroSelecionado(String codigoBairro) ;
	public Object[] getCidadeEstadoDoBairroSelecionado(String codigoBairro);

}
