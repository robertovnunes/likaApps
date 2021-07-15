 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.util.Cancer;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class CancerDAO extends DAO<Cancer>
 {
   public CancerDAO(Session session)
   {
     super(session, Cancer.class);
   }
 
   public void removerCancerHistoricoClinico(HistoricoClinico historicoClinico) {
     String q = "delete from Cancer where historicoClinico_id =" + historicoClinico.getId();
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.CancerDAO
 * JD-Core Version:    0.6.0
 */