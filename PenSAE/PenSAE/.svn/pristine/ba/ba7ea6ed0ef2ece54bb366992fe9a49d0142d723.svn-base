package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.AlunoEstudoCaso;
import model.IntervencaoAluno;
import dao.IntervencaoAlunoDAO;



public class IntervencaoAlunoJPADAO extends DAOGenericoJPA<IntervencaoAluno, Integer>
implements IntervencaoAlunoDAO {

	@Override
	public IntervencaoAluno getPorId(int id) {
		
		return this.getManager().find(IntervencaoAluno.class, id);
	}

	@Override
	public List<IntervencaoAluno> listarIntervencaoPorAlunoEstudoCaso(
			AlunoEstudoCaso aec) {
		List<IntervencaoAluno> retorno = null;

		String query = "SELECT DISTINCT {ia.* FROM " +
				"intervencaoaluno ia, metaaluno ma, diagnosticoaluno da, " +
				"diagnosticoresposta_has_metaresposta dhm, " +
				"metaresposta_has_intervencaoresposta mhi WHERE " +
				"da.AlunoEstudoCaso_id = " + aec.getId() + " " +
				"AND da.id = dhm.Diagnostico_id " +
				"AND dhm.Meta_id = ma.id " +
				"AND ma.id = mhi.Meta_id AND mhi.Intervencao_id = ia.id";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

}
