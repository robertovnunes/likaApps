package dados.hibernate.conteudo;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import dados.basicas.NandaDAO;
import dados.hibernate.DAOGenericoHibernate;
import model.Nanda;

public class NandaHibernateDAO extends DAOGenericoHibernate<Nanda, Integer>
		implements NandaDAO {

	@Override
	public List<Nanda> pesquisarNanda(String query, String eixo) {
		
		Criteria crit = getSession().createCriteria(Nanda.class);
		if(eixo != null && !eixo.equals("")){
			crit.add(Restrictions.eq("eixo", eixo));
		}
		if(query != null && !query.equals("")){
			crit.add(Restrictions.ilike("termo", "%"+query+"%"));		
		}
		crit.addOrder(Order.asc("termo"));

		return crit.list();
	}
	
	@Override
	public List<Nanda> getNandaPorTituloAutocomplete(String termo) {
		List<Nanda> retorno = null;
		
		Criteria crit = getSession().createCriteria(Nanda.class);
		crit.add(Restrictions.like("termo", termo));
		crit.addOrder(Order.desc("id"));
		retorno = crit.list();
		
		return retorno;
	}

	
	
		
}
