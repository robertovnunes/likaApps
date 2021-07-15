package dados.hibernate.conteudo;

import model.fichainvestigativa.Paciente;
import dados.basicas.PacienteDAO;
import dados.hibernate.DAOGenericoHibernate;

public class PacienteHibernateDAO extends
		DAOGenericoHibernate<Paciente, Integer> implements PacienteDAO {

}
