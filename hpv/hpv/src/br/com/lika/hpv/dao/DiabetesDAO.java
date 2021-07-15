 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.util.Diabetes;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class DiabetesDAO extends DAO<Diabetes>
 {
   public DiabetesDAO(Session session)
   {
     super(session, Diabetes.class);
   }
 
   public void removerDiabetesHistoricoClinico(HistoricoClinico historicoClinico) {
     String q = "delete from Diabetes where historicoClinico_id =" + historicoClinico.getId();
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.DiabetesDAO
 * JD-Core Version:    0.6.0
 */