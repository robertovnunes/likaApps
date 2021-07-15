package dados.hibernate.conteudo;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.ProfessorDAO;
import dados.hibernate.DAOGenericoHibernate;
import model.usuario.Professor;

public class ProfessorHibernateDAO extends
		DAOGenericoHibernate<Professor, Integer> implements ProfessorDAO {

	public Professor getProfessorPorLogin(String login) {

		Professor retorno = null;

		Criteria crit = getSession().createCriteria(Professor.class);
		crit.add(Restrictions.eq("login", login));
		retorno = (Professor) crit.uniqueResult();

		return retorno;
	}

}
