/**
 * 
 */
package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import model.EstudoCaso;
import model.Glossario;
import dao.GlossarioDAO;

/**
 * @author Jesus
 *
 */
public class GlossarioNegocios {
static GlossarioNegocios instancia;
	
	public static GlossarioNegocios getInstancia(){
		if(GlossarioNegocios.instancia == null){
			GlossarioNegocios.instancia = new GlossarioNegocios();
		}
		
		return GlossarioNegocios.instancia;
	}
	
	private FabricaDAO fabrica;
	
	public GlossarioNegocios(){
		fabrica = FabricaJPADAO.getInstancia();
	}

	public List<Glossario> listaGlossario(EstudoCaso estudoSelecionado) {
		
		List<Glossario> retorno = null;
		
		GlossarioDAO glossarioDAO = fabrica.getGlossarioDAO();
		
		retorno = glossarioDAO.listarGlossarios(estudoSelecionado);
		
		return retorno;
	}

	public void salvarGlossario(Glossario glossario) {
		
		GlossarioDAO glossarioDAO = fabrica.getGlossarioDAO();
		
		glossarioDAO.persistir(glossario);
		
	}

	public void excluirGlossario(Glossario glossario) {
		
		GlossarioDAO glossarioDAO = fabrica.getGlossarioDAO();
		
		glossarioDAO.remover(glossario);;
	}
	
	public void editarGlossario(Glossario glossario){
		
		GlossarioDAO glossarioDAO = fabrica.getGlossarioDAO();
		
		glossarioDAO.merge(glossario);;
	}
}
