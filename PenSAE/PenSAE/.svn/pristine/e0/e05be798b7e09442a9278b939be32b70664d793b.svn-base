package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import javax.persistence.ManyToOne;

import model.CompetenciaHabilidadeEspecifica;
import dao.CompetenciaHabilidadeEspecificaDAO;


public class CompetenciaHabilidadeEspecificaNegocios {
	
	static CompetenciaHabilidadeEspecificaNegocios instancia;

	public static CompetenciaHabilidadeEspecificaNegocios getInstancia(){

		if(CompetenciaHabilidadeEspecificaNegocios.instancia == null){

			CompetenciaHabilidadeEspecificaNegocios.instancia = new CompetenciaHabilidadeEspecificaNegocios();

		}

		return CompetenciaHabilidadeEspecificaNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private CompetenciaHabilidadeEspecificaNegocios() {

		fabrica = FabricaJPADAO.getInstancia();

	}
	
	public List<CompetenciaHabilidadeEspecifica> listarCompetenciaHabilidadeEspecifica(){
		
		CompetenciaHabilidadeEspecificaDAO dao = fabrica.getCompetenciaHabilidadeEspecificaDAO();
		
		List<CompetenciaHabilidadeEspecifica> retorno = dao.listarCompetenciaHabilidadeEspecifica();
		
		return retorno;
	}
}
