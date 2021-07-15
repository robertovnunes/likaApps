package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Cipe;
import dados.basicas.atendimento.diagnosticointervencoes.CipeDAO;
import dados.hibernate.DAOGenericoHibernate;

public class CipeHibernateDAO extends DAOGenericoHibernate<Cipe, Integer>
		implements CipeDAO {

	@Override
	public List<Cipe> listarCipe(String valor) {
		Criteria crit = getSession().createCriteria(Cipe.class);
		
		crit.add(Restrictions.or(
					Restrictions.or(
							Restrictions.eq("codigo", valor), Restrictions.ilike("descricao", "%"+valor+"%")
							), 
					Restrictions.ilike("titulo", "%"+valor+"%")
				));
		
		return crit.list();
	}

	
}
