/**
 * 
 */
package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import model.Descritor;
import dao.DescritorDAO;

/**
 * @author Jesus
 *
 */
public class DescritorNegocios {
	private static DescritorNegocios instancia;
	public static DescritorNegocios getInstancia(){
		if(DescritorNegocios.instancia == null){
			DescritorNegocios.instancia = new DescritorNegocios();
		}
		return DescritorNegocios.instancia;
	}

	private FabricaDAO fabrica;

	private DescritorNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}
	
	public List<Descritor> listarDescritores(){
		
		List<Descritor> retorno = null;
		
		DescritorDAO dao =  fabrica.getDescritorDAO();
		
		retorno = dao.listarDescritores();
		
		return retorno;
	}
}
