package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Nic;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.diagnosticointervencoes.NicDAO;
import dados.hibernate.DAOGenericoHibernate;

public class NicHibernateDAO extends DAOGenericoHibernate<Nic, Integer>
		implements NicDAO {

	@Override
	public List<Nic> listarNic(String valor) {
		Criteria crit = getSession().createCriteria(Nic.class);
		
		crit.add(Restrictions.or(
							Restrictions.eq("codigo", valor), Restrictions.ilike("descricao", "%"+valor+"%")
					));
		
		return crit.list();
	}

	
}
