package dados.hibernate.conteudo.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Resultados;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.diagnosticointervencoes.ResultadosDAO;
import dados.hibernate.DAOGenericoHibernate;

public class ResultadosHibernateDAO extends DAOGenericoHibernate<Resultados, Integer>
		implements ResultadosDAO {

	@Override
	public List<Resultados> listarResultadosDiagnostico(Diagnostico diagnostico) {
		List<Resultados> retorno = null;

		Criteria crit = getSession().createCriteria(Resultados.class);
		crit.add(Restrictions.eq("diagnostico", diagnostico));
		
		retorno = (List<Resultados>) crit.list();

		return retorno;
	}

	
}
