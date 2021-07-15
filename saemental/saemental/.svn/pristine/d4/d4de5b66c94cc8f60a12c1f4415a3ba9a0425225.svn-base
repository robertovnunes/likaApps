package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Noc;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.diagnosticointervencoes.NocDAO;
import dados.hibernate.DAOGenericoHibernate;

public class NocHibernateDAO extends DAOGenericoHibernate<Noc, Integer>
		implements NocDAO {

	@Override
	public List<Noc> listarNoc(String valor) {
		Criteria crit = getSession().createCriteria(Noc.class);
		
		crit.add(Restrictions.or(
				Restrictions.eq("codigo", valor), Restrictions.ilike("descricao", "%"+valor+"%")
		));
		
		return crit.list();
	}

	
}
