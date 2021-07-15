package dados.hibernate.conteudo.atendimento.antecedentes;

import java.util.List;

import model.paciente.prontuario.atendimento.antecedentes.AntecedenteFamiliar;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import dados.basicas.atendimento.antecedentes.AntecedenteFamiliarDAO;
import dados.hibernate.DAOGenericoHibernate;

public class AntecedenteFamiliarHibernateDAO extends DAOGenericoHibernate<AntecedenteFamiliar, Integer>
		implements AntecedenteFamiliarDAO {

	@Override
	public List<AntecedenteFamiliar> getAntecedentesFamiliarPorIdAntFamiliarPaciente(
			int idAntFamiliar) {
		Criteria crit = getSession().createCriteria(AntecedenteFamiliar.class);
		crit.add(Restrictions.eq("antecedentesFamiliares.id", idAntFamiliar));
		
		return crit.list();
	}

	@Override
	public void removerAntecedenteFamiliarPorIdAntFamiliarPaciente(
			int idAntFamiliar) {
		Query query = getSession().createSQLQuery("DELETE FROM antecedente_familiar WHERE fk_idAntecedentesFamiliares = " + idAntFamiliar );
		query.executeUpdate();
	}


	
}
