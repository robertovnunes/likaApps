package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.EstudoCaso;
import model.PontoChaveProfessor;
import dao.PontoChaveProfessorDAO;



public class PontoChaveProfessorJPADAO extends DAOGenericoJPA<PontoChaveProfessor, Integer>
implements PontoChaveProfessorDAO {

	@Override
	public PontoChaveProfessor getPorId(int id) {
		
		return this.getManager().find(PontoChaveProfessor.class, id);
	}

	@Override
	public List<PontoChaveProfessor> listarPontoChaveProfessorPorEstudoCaso(
			EstudoCaso estudoSelecionado) {
		
		List<PontoChaveProfessor> retorno = null;
		
		String query = "SELECT DISTINCT pcp.* FROM pontochaveprofessor pcp " + 
				"WHERE pcp.EstudoCaso_id = " + estudoSelecionado.getId() + ";";

		retorno = executarQueryLista(query);

		return retorno;
	}

}
