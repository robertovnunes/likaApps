package dados.hibernate.conteudo;

import java.util.List;

import model.paciente.Paciente;
import model.usuario.Usuario;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import dados.basicas.PacienteDAO;
import dados.hibernate.DAOGenericoHibernate;

public class PacienteHibernateDAO extends DAOGenericoHibernate<Paciente, Integer>
		implements PacienteDAO {

	@Override
	public List<Paciente> getPacientesPorConsulta(String tipo, String valor) {
		Criteria crit = getSession().createCriteria(Paciente.class);
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("mae")){
					crit.add(Restrictions.ilike("nomeMae", "%"+valor+"%"));
				}else if(tipo.equals("cpf")){
					crit.add(Restrictions.eq("cpf", valor));
  				}else if(tipo.equals("nome")){
					crit.add(Restrictions.ilike("nome", "%"+valor+"%"));
				}else if(tipo.equals("data")){
					crit.add(Restrictions.eq("nascimento", valor));
				}
				
		}
		crit.addOrder(Order.desc("id"));
		return crit.list();
	}
	
	@Override
	public List<Paciente> getPacientesDoUsuario(Usuario usuario) {
		Criteria crit = getSession().createCriteria(Paciente.class);
		crit.add(Restrictions.eq("usuario", usuario));
		crit.addOrder(Order.desc("id"));
		return crit.list();
	}
	
	@Override
	public List<Paciente> getPacientesDoUsuarioPorConsulta(String tipo, String valor, Usuario usuario) {
		Criteria crit = getSession().createCriteria(Paciente.class);
		crit.add(Restrictions.eq("usuario", usuario));
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("mae")){
					crit.add(Restrictions.ilike("nomeMae", "%"+valor+"%"));
				}else if(tipo.equals("cpf")){
					crit.add(Restrictions.eq("cpf", valor));
  				}else if(tipo.equals("nome")){
					crit.add(Restrictions.ilike("nome", "%"+valor+"%"));
				}else if(tipo.equals("data")){
					crit.add(Restrictions.eq("nascimento", valor));
				}
				
		}
		crit.addOrder(Order.desc("id"));
		return crit.list();
	}


}
