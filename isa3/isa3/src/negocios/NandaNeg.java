package negocios;

import java.util.List;

import dados.basicas.NandaDAO;
import model.Nanda;

public class NandaNeg extends GenericNeg<Nanda>{

	private static NandaNeg instancia;
	
	private NandaNeg() {
		super(Nanda.class);
	}
	
	public static NandaNeg getInstancia(){
		if(NandaNeg.instancia == null){
			NandaNeg.instancia = new NandaNeg();
		}
		return NandaNeg.instancia;
	}
	

	public List<Nanda> getNandaPorTituloAutocomplete(String termo) {
		NandaDAO dao = fabrica.getNandaDAO();
		return dao.getNandaPorTituloAutocomplete(termo);
	}
}
