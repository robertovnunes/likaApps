/**
 * 
 */
package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.AlunoEstudoCaso;
import model.MetaAluno;
import dao.MetaAlunoDAO;


/**
 * @author Jesus
 *
 */

public class MetaAlunoJPADAO extends DAOGenericoJPA<MetaAluno, Integer> 
implements MetaAlunoDAO {

	@Override
	public MetaAluno getPorId(int id) {
		
		return this.getManager().find(MetaAluno.class, id);
	}

	@Override
	public List<MetaAluno> listarMetasPorAlunoEstudoCaso(AlunoEstudoCaso aec) {
		List<MetaAluno> retorno = null;
		
		String query = "SELECT DISTINCT {ma.* FROM " +
				"metaaluno ma, diagnosticoaluno da, diagnosticoresposta_has_metaresposta dhm WHERE " +
				"da.AlunoEstudoCaso_id = " + aec.getId() + " AND da.id = dhm.Diagnostico_id AND dhm.Meta_id = ma.id";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

}
