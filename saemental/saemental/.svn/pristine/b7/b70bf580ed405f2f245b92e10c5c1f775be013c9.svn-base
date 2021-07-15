package dados.hibernate.conteudo.atendimento.queixa;

import java.util.List;

import model.paciente.prontuario.atendimento.queixa.Cid;
import model.paciente.prontuario.atendimento.queixa.Queixa;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.queixa.QueixaDAO;
import dados.hibernate.DAOGenericoHibernate;

public class QueixaHibernateDAO extends DAOGenericoHibernate<Queixa, Integer>
		implements QueixaDAO {

	@Override
	public List<Cid> getCids(int idQueixa) {
		List<Cid> retorno = null;

		Criteria crit = getSession().createCriteria(Queixa.class);
		crit.add(Restrictions.idEq(idQueixa));
		Queixa queixa = (Queixa) crit.uniqueResult();
		retorno = queixa.getCids();

		return retorno;
	}

	@Override
	public Cid getCidPorId(int idCid) {
		Cid retorno = null;

		Criteria crit = getSession().createCriteria(Cid.class);
		crit.add(Restrictions.idEq(idCid));
		retorno = (Cid) crit.uniqueResult();

		return retorno;
	}

	@Override
	public List<Cid> pesquisarCid(String valor) {

		Criteria crit = getSession().createCriteria(Cid.class);
		crit.add(Restrictions.or(
				Restrictions.ilike("descricao", "%"+valor+"%"),Restrictions.ilike("cid", "%"+valor+"%"))
				);		

		return crit.list();
	}

	@Override
	public Cid getCidPorIdentificador(String cid) {
		Cid retorno = null;

		Criteria crit = getSession().createCriteria(Cid.class);
		crit.add(Restrictions.eq("cid", cid));
		retorno = (Cid) crit.uniqueResult();

		return retorno;
	}
}
