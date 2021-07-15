package dados.basicas;

import java.util.List;

import model.sistema.CNES;
import dados.DAOGenerico;

public interface  CNESDAO extends DAOGenerico<CNES, Integer>{

	public abstract List<CNES> pesquisarCNES(String valor) ;
	public abstract CNES getPorIDCNES(String idCens);
}
