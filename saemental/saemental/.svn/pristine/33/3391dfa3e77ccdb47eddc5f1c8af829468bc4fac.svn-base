package dados.hibernate.conteudo;

import java.util.List;

import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.Evolucao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import dados.basicas.AtendimentoDAO;
import dados.hibernate.DAOGenericoHibernate;

public class AtendimentoHibernateDAO extends
		DAOGenericoHibernate<Atendimento, Integer> implements AtendimentoDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Atendimento> getTodosAtendimentos(int idProntuario) {

		Criteria crit = getSession().createCriteria(Atendimento.class);
		crit.createAlias("prontuario", "pront");
		crit.add(Restrictions.eq("pront.id", idProntuario));
		crit.addOrder(Order.desc("dataHoraCriacao"));

		return crit.list();
	}
	
	@Override
	public List<Atendimento> getAtendimentosPacientePorConsulta(String tipo, String valor, int idPront) {
		Criteria crit = getSession().createCriteria(Atendimento.class);
		crit.createAlias("prontuario", "pront");
		crit.add(Restrictions.eq("pront.id", idPront));
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("autor")){
					crit.createAlias("usuario", "user");
					crit.add(Restrictions.ilike("user.nome", "%"+valor+"%"));
  				}else if(tipo.equals("tipo")){
  					if(tipo.toUpperCase().equals("EVOLUÇÃO")){
  						crit = getSession().createCriteria(Evolucao.class);
  					}else{
  						crit = getSession().createCriteria(Admissao.class);
  						if(valor.toUpperCase().equals("ADMISSÃO")){
  							crit.add(Restrictions.eq("ehReadmissao", false));
  						}else{
  							crit.add(Restrictions.eq("ehReadmissao", true));	
  						}
  					}
  					
				}else if(tipo.equals("data")){
					String arrayData[] = valor.split("/");
					String data = arrayData[2]+"-"+arrayData[1]+"-"+arrayData[0];
					crit.add(Restrictions.sqlRestriction("DATE(dataHoraCriacao) like '" + data + "'"));
				}
				
		}
		crit.addOrder(Order.desc("dataHoraCriacao"));
		return crit.list();
	}

	@Override
	public Atendimento getUltimoAtendimento(int idProntuario) {
		Criteria crit = getSession().createCriteria(Atendimento.class);
		crit.setMaxResults(1);
		crit.createAlias("prontuario", "pront");
		crit.add(Restrictions.eq("pront.id", idProntuario));
		crit.addOrder(Order.desc("dataHoraCriacao"));

		if (!crit.list().isEmpty()) {
		    return (Atendimento) crit.list().iterator().next();
		} else {
		    return null;
		}
	}
	
	@Override
	public Admissao getultimoAtendimentoAdmissao(int idProntuario) {
		Criteria crit = getSession().createCriteria(Admissao.class);
		crit.setMaxResults(1);
		crit.createAlias("prontuario", "pront");
		crit.add(Restrictions.eq("pront.id", idProntuario));
		crit.addOrder(Order.desc("dataHoraCriacao"));

		if (!crit.list().isEmpty()) {
		    return (Admissao) crit.list().iterator().next();
		} else {
		    return null;
		}
	}

}
