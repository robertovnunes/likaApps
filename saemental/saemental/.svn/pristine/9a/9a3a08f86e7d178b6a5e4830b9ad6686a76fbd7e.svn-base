package dados.hibernate.conteudo;

import model.usuario.Enfermeiro;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.EnfermeiroDAO;
import dados.hibernate.DAOGenericoHibernate;

public class EnfermeiroHibernateDAO extends
		DAOGenericoHibernate<Enfermeiro, Integer> implements EnfermeiroDAO {

	public Enfermeiro getEnfermeiroPorLogin(String login) {

		Enfermeiro retorno = null;

		Criteria crit = getSession().createCriteria(Enfermeiro.class);
		crit.add(Restrictions.eq("login", login));
		retorno = (Enfermeiro) crit.uniqueResult();

		return retorno;
	}

}
