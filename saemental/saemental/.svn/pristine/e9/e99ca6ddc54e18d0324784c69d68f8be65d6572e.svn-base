package dados.hibernate.conteudo.atendimento;

import java.util.List;

import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.AvaliacaoProfessor;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.AvaliacaoProfessorDAO;
import dados.hibernate.DAOGenericoHibernate;

public class AvaliacaoProfessorHibernateDAO extends DAOGenericoHibernate<AvaliacaoProfessor, Integer>
		implements AvaliacaoProfessorDAO {

	@Override
	public List<AvaliacaoProfessor> getAvaliacaoProfessorAtendimento(
			Atendimento atendimento) {
		Criteria crit = getSession().createCriteria(AvaliacaoProfessor.class);
		crit.add(Restrictions.eq("atendimento.id", atendimento.getId()));

		return crit.list();
	}

	@Override
	public List<AvaliacaoProfessor> getAvaliacaoProfessorPorConsulta(
			String tipo, String valor, Atendimento atendimento) {
		Criteria crit = getSession().createCriteria(AvaliacaoProfessor.class);
		crit.add(Restrictions.eq("atendimento.id", atendimento.getId()));
		
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("professor")){
					crit.add(Restrictions.ilike("professor.nome", "%"+valor+"%"));
  				}else if(tipo.equals("data")){
  					String arrayData[] = valor.split("/");
					String data = arrayData[2]+"-"+arrayData[1]+"-"+arrayData[0];
					crit.add(Restrictions.sqlRestriction("DATE(this_.dataHora) like '" + data + "'"));
				}
		}
		return crit.list();
	}

	@Override
	public AvaliacaoProfessor getAvaliacaoProfessorPorId(String id) {
		Criteria crit = getSession().createCriteria(AvaliacaoProfessor.class);
		crit.add(Restrictions.idEq(Integer.parseInt(id)));

		return (AvaliacaoProfessor) crit.uniqueResult();
	}

	
}
