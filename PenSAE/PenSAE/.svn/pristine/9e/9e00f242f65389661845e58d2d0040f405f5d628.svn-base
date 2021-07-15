package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.CompetenciaHabilidadeEspecifica;
import dao.CompetenciaHabilidadeEspecificaDAO;



public class CompetenciaHabilidadeEspecificaJPADAO extends DAOGenericoJPA<CompetenciaHabilidadeEspecifica,Integer> 
implements CompetenciaHabilidadeEspecificaDAO{

	@Override
	public CompetenciaHabilidadeEspecifica getPorId(int id) {

		return this.getManager().find(CompetenciaHabilidadeEspecifica.class, id);
	}

	public List<CompetenciaHabilidadeEspecifica> listarCompetenciaHabilidadeEspecifica(){

		List<CompetenciaHabilidadeEspecifica> retorno = null;

		String query = "SELECT che.* FROM competenciashabilidadesespecificas che;";

		retorno = executarQueryLista(query);

		return retorno;
	}

}
