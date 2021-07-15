 package br.com.lika.hpv.dao;
 
 import antlr.collections.impl.Vector;
import br.com.lika.hpv.model.formulario.Formulario;
 import java.util.List;
 import org.hibernate.Criteria;
 import org.hibernate.Session;
 import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
 
 public class FormularioDAO extends DAO<Formulario>
 {
   public FormularioDAO(Session session)
   {
     super(session, Formulario.class);
   }
   
   public List<Formulario> procuraPorcodigoPronex(String codigoPronex){
	   
	  Criteria c = super.session.createCriteria(Formulario.class);
	  c.add(Restrictions.like("codigoPronex", codigoPronex,MatchMode.ANYWHERE));
	  ProjectionList pl = Projections.projectionList();
	  pl.add(Projections.property("id"));
	  pl.add(Projections.property("codigoPronex"));
	  c.setProjection(pl);
	  c.setMaxResults(20);
	  List<Object[]> temp = c.list(); 
	  
	  List<Formulario> retorno = new java.util.Vector<Formulario>(temp.size());
	  
	  for(Object[] o : temp){
		  Formulario f = new Formulario();
		  f.setId((Long)o[0]);
		  f.setCodigoPronex((String)o[1]);
		  retorno.add(f);
	  }
	  
	  
	  
	  return retorno;
			  
   }
 
   public boolean existeFormularioComCodigoBarrasQueNaoEsteId(Long id, String codigoBarras)
   {
     Criterion c1 = Restrictions.not(Restrictions.eq("id", id));
     Criterion c2 = Restrictions.eq("codigoBarras", codigoBarras);
     Criterion c3 = Restrictions.and(c1, c2);
     List temp = this.session.createCriteria(Formulario.class).add(c3).list();
     return (temp != null) && (temp.size() > 0);
   }
 
   public boolean existeFormularioComCodigoBarras(String codigoBarras)
   {
     Criterion c2 = Restrictions.eq("codigoBarras", codigoBarras);
     List temp = this.session.createCriteria(Formulario.class).add(c2).list();
     return (temp != null) && (temp.size() > 0);
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.FormularioDAO
 * JD-Core Version:    0.6.0
 */