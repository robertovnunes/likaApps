package negocios;

import java.util.List;

import dados.basicas.HyperLinkDAO;
import model.curso.matricula.arcomaguerez.HyperLink;

public class HyperLinkNeg extends GenericNeg<HyperLink>{

	private static HyperLinkNeg instancia;
	
	private HyperLinkNeg() {
		super(HyperLink.class);
	}
	
	public static HyperLinkNeg getInstancia(){
		if(HyperLinkNeg.instancia == null){
			HyperLinkNeg.instancia = new HyperLinkNeg();
		}
		return HyperLinkNeg.instancia;
	}
	
	public List<HyperLink> getTodosHyperLinks() {
		HyperLinkDAO dao = fabrica.getHyperLinkDAO();
		return dao.getTodosHyperLinks();
	}
}
