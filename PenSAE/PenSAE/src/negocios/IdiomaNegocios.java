package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import javax.persistence.ManyToOne;

import model.Idioma;
import dao.IdiomaDAO;


public class IdiomaNegocios {

	private static IdiomaNegocios instancia;
	public static IdiomaNegocios getInstancia(){
		if(IdiomaNegocios.instancia == null){
			IdiomaNegocios.instancia = new IdiomaNegocios();
		}
		return IdiomaNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private IdiomaNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public Idioma getIdiomaPorNome(String nome){
		
		Idioma retorno = null;
		
		IdiomaDAO dao = fabrica.getIdiomaDAO();

		retorno = dao.getIdiomaPorNome(nome);

		return retorno;	
		
	}
	
	public List<Idioma> listarIdiomas(){

		List <Idioma> retorno = null;

		IdiomaDAO dao = fabrica.getIdiomaDAO();
		
		retorno = dao.listarIdiomas();

		return retorno;

	}
	
	public List<String> listarNomeIdiomas(){

		List <String> retorno = null;

		IdiomaDAO dao = fabrica.getIdiomaDAO();

		retorno = dao.listarNomeIdiomas();

		return retorno;

	}

}
