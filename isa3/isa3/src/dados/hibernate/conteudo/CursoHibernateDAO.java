package dados.hibernate.conteudo;

import java.util.List;

import model.curso.Curso;
import model.curso.EstudoDeCaso;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;

import dados.basicas.CursoDAO;
import dados.hibernate.DAOGenericoHibernate;

public class CursoHibernateDAO extends
		DAOGenericoHibernate<Curso, Integer> implements CursoDAO {

	@Override
	public List<Curso> getTodosCursosPorStatus(int ... status) {
		List<Curso>  retorno = null;

		Criteria crit = getSession().createCriteria(Curso.class);
		
		 Disjunction disjunction = Restrictions.disjunction();
		 for (int i = 0; i < status.length; i++) {
			 disjunction.add(Restrictions.eq("status", status[i]));
		}
		 if(disjunction != null){
			 crit.add(disjunction);
		 }
		retorno =  crit.list();

		return retorno;
	}
	
	@Override
	public List<Curso> getTodosCursos() {

		List<Curso> retorno = null;

		Criteria crit = getSession().createCriteria(Curso.class);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		retorno = (List<Curso>) crit.list();

		return retorno;
	}

	@Override
	public Curso getCursoDoEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		Curso retorno = null;
		
		SQLQuery query = getSession().createSQLQuery("Select cursoId from estudosdecaso_curso where estudoCasoId = :idEstudoCaso");
		query.setParameter("idEstudoCaso", estudoDeCaso.getId());
		Object idCurso = query.uniqueResult();

		Criteria crit = getSession().createCriteria(Curso.class);
		crit.add(Restrictions.idEq(idCurso));
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		retorno = (Curso) crit.uniqueResult();
		
		return retorno;
	}

	@Override
	public Curso inserirEstudoDeCasoNoCurso(EstudoDeCaso estudoDeCaso, Curso curso) {
		Curso retorno = null;
		
		SQLQuery query = getSession().createSQLQuery("Insert into estudosdecaso_curso (estudoCasoId, cursoId) values (:estudoCasoId, :cursoId)");
		query.setParameter("estudoCasoId", estudoDeCaso.getId());
		query.setParameter("cursoId", curso.getId());
		
		query.executeUpdate();
		
		Criteria crit = getSession().createCriteria(Curso.class);
		crit.add(Restrictions.idEq(curso.getId()));
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		retorno = (Curso) crit.uniqueResult();
		
		return retorno;
	}

}
