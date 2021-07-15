package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.diagnosticointervencoes.DiagnosticoDAO;
import dados.hibernate.DAOGenericoHibernate;

public class DiagnosticoHibernateDAO extends DAOGenericoHibernate<Diagnostico, Integer>
		implements DiagnosticoDAO {

	@Override
	public List<Diagnostico> listarDiagnosticosAtendimento(
			Atendimento atendimento) {
		List<Diagnostico> retorno = null;

		Criteria crit = getSession().createCriteria(Diagnostico.class);
		crit.add(Restrictions.eq("atendimento", atendimento));
		
		return crit.list();
	}
	
}
