package dados.hibernate.conteudo.atendimento;

import java.util.List;

import model.paciente.prontuario.atendimento.Adendo;
import model.paciente.prontuario.atendimento.Atendimento;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.AdendoDAO;
import dados.hibernate.DAOGenericoHibernate;

public class AdendoHibernateDAO extends DAOGenericoHibernate<Adendo, Integer>
		implements AdendoDAO {

	@Override
	public List<Adendo> getAdendosAtendimento(Atendimento atendimento) {

		Criteria crit = getSession().createCriteria(Adendo.class);
		crit.add(Restrictions.eq("atendimento.id", atendimento.getId()));

		return crit.list();
	}

	@Override
	public List<Adendo> getAdendosPorConsulta(String tipo, String valor,
			Atendimento atendimento) {
		
		Criteria crit = getSession().createCriteria(Adendo.class);
		crit.add(Restrictions.eq("atendimento.id", atendimento.getId()));
		
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("autor")){
					crit.add(Restrictions.ilike("autor.nome", "%"+valor+"%"));
  				}else if(tipo.equals("data")){
  					String arrayData[] = valor.split("/");
					String data = arrayData[2]+"-"+arrayData[1]+"-"+arrayData[0];
					crit.add(Restrictions.sqlRestriction("DATE(this_.dataHora) like '" + data + "'"));
				}
		}
		return crit.list();
	}

	@Override
	public Adendo getAdendoPorId(String id) {
		
		Criteria crit = getSession().createCriteria(Adendo.class);
		crit.add(Restrictions.idEq(Integer.parseInt(id)));

		return (Adendo) crit.uniqueResult();
	}
	
	

	
}
