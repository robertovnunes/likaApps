package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.CompetenciaHabilidadeGeral;
import dao.CompetenciaHabilidadeGeralDAO;



public class CompetenciaHabilidadeGeralJPADAO extends DAOGenericoJPA<CompetenciaHabilidadeGeral,Integer>
implements CompetenciaHabilidadeGeralDAO{

	@Override
	public CompetenciaHabilidadeGeral getPorId(int id) {

		return this.getManager().find(CompetenciaHabilidadeGeral.class, id);
	}

	@Override
	public List<CompetenciaHabilidadeGeral> listarCompetenciaHabilidadeGeral(){
		
		List<CompetenciaHabilidadeGeral> retorno = null;
		
		String query = "SELECT chg.* FROM competenciashabilidadesgerais chg;";
		
		retorno = executarQueryLista(query);
		
		return retorno;
		
	}
}
