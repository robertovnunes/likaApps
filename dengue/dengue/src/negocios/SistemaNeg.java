package negocios;

import java.util.List;

import model.sistema.Arquivo;
import model.sistema.CNES;
import dados.FabricaDAO;
import dados.basicas.ArquivoDAO;
import dados.basicas.CNESDAO;
import dados.hibernate.FabricaHibernateDAO;

public class SistemaNeg {

	private static SistemaNeg instancia;
	private FabricaDAO fabrica;
	
	private SistemaNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}
	
	public static SistemaNeg getInstancia(){
		if(SistemaNeg.instancia == null){
			SistemaNeg.instancia = new SistemaNeg();
		}
		return SistemaNeg.instancia;
	}
	
	public List<CNES> getTodosCNES(){
		CNESDAO dao = fabrica.getCNESDAO();
		return dao.getTodos();
	}
	
	public List<CNES> pesquisarCNES(String valor) {
		CNESDAO dao = fabrica.getCNESDAO();
		return dao.pesquisarCNES(valor);
	}
	
	public Arquivo getArquivoPorId(int id){
		ArquivoDAO dao = fabrica.getArquivoDAO();
		return dao.getPorId(id, true);
	}
}
