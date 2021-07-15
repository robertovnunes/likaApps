package dados.hibernate.conteudo;

import java.util.List;

import model.sistema.CNES;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.CNESDAO;
import dados.hibernate.DAOGenericoHibernate;

public class CNESHibernateDAO extends
		DAOGenericoHibernate<CNES, Integer> implements CNESDAO {

	@Override
	public List<CNES> pesquisarCNES(String valor) {

		Criteria crit = getSession().createCriteria(CNES.class);
		crit.add(Restrictions.or(
				Restrictions.ilike("nome_fantasia", "%"+valor+"%"),Restrictions.ilike("codigo_cnes", "%"+valor+"%"))
				);		
		crit.setMaxResults(20);
		return crit.list();
	}

	@Override
	public CNES getPorIDCNES(String idCens) {
		Criteria crit = getSession().createCriteria(CNES.class);
		crit.add(
				Restrictions.idEq(idCens)
				);		
		return (CNES) crit.uniqueResult();
	}
}
