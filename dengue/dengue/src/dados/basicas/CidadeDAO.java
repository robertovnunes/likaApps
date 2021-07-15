package dados.basicas;

import java.util.List;

import model.endereco.Cidade;
import dados.DAOGenerico;

public interface  CidadeDAO extends DAOGenerico<Cidade, Integer>{
	
	
	public List<Cidade> getCidadePorUF(String idUF);
	public List<Cidade> getCidadePorUFSigla(String siglaUF);
	public List<Object[]> getTodasCidadesDoBairroSelecionado(String codigoBairro) ;
}
