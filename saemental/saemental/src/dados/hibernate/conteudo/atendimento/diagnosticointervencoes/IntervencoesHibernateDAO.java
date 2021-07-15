package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Intervencoes;
import dados.basicas.atendimento.diagnosticointervencoes.IntervencoesDAO;
import dados.hibernate.DAOGenericoHibernate;

public class IntervencoesHibernateDAO extends DAOGenericoHibernate<Intervencoes, Integer>
		implements IntervencoesDAO {

	@Override
	public List<Intervencoes> listarIntervencoesDiagnostico(
			Diagnostico diagnostico) {
		List<Intervencoes> retorno = null;

		Criteria crit = getSession().createCriteria(Intervencoes.class);
		crit.add(Restrictions.eq("diagnostico", diagnostico));
		
		retorno = (List<Intervencoes>) crit.list();

		return retorno;
	}


	
}
