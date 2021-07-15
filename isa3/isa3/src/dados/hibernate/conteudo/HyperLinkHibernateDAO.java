package dados.hibernate.conteudo;

import java.util.List;

import org.hibernate.Criteria;

import dados.basicas.HyperLinkDAO;
import dados.hibernate.DAOGenericoHibernate;
import model.curso.matricula.arcomaguerez.HyperLink;

public class HyperLinkHibernateDAO extends DAOGenericoHibernate<HyperLink, Integer>
		implements HyperLinkDAO {

	
	
	@Override
	public List<HyperLink> getTodosHyperLinks() {

		List<HyperLink> retorno = null;

		Criteria crit = getSession().createCriteria(HyperLink.class);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		retorno = (List<HyperLink>) crit.list();

		return retorno;
	}
}
