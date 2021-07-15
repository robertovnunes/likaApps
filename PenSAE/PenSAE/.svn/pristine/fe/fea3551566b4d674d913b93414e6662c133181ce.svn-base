package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import javax.persistence.ManyToOne;

import model.CompetenciaHabilidadeGeral;
import dao.CompetenciaHabilidadeGeralDAO;


public class CompetenciaHabilidadeGeralNegocios {
	
	static CompetenciaHabilidadeGeralNegocios instancia;

	public static CompetenciaHabilidadeGeralNegocios getInstancia(){

		if(CompetenciaHabilidadeGeralNegocios.instancia == null){

			CompetenciaHabilidadeGeralNegocios.instancia = new CompetenciaHabilidadeGeralNegocios();

		}

		return CompetenciaHabilidadeGeralNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private CompetenciaHabilidadeGeralNegocios() {

		fabrica = FabricaJPADAO.getInstancia();

	}
	
	public List<CompetenciaHabilidadeGeral> listarCompetenciaHabilidadeGeral(){
		
		CompetenciaHabilidadeGeralDAO dao = fabrica.getCompetenciaHabilidadeGeralDAO();
		
		List<CompetenciaHabilidadeGeral> retorno = dao.listarCompetenciaHabilidadeGeral();
		
		return retorno;
	}
}
