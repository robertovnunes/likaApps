package dados.hibernate.conteudo;

import dados.basicas.EstudoDeCasoDAO;
import dados.hibernate.DAOGenericoHibernate;
import model.curso.EstudoDeCaso;

public class EstudoDeCasoHibernateDAO extends DAOGenericoHibernate<EstudoDeCaso, Integer>
		implements EstudoDeCasoDAO {

	/*@Override
	public List<EstudoDeCaso> listarEstudosDeCasosPorCurso(Curso curso) {
		List<EstudoDeCaso>  retorno = null;

		Criteria crit = getSession().createCriteria(EstudoDeCaso.class);
		crit.add(Restrictions.eq("curso", curso));
		
		retorno =  crit.list();

		return retorno;
	}

	*/
	
	
		
}
