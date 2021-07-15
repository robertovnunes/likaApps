 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.util.MalEstar;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class MalEstarDAO extends DAO<MalEstar>
 {
   public MalEstarDAO(Session session)
   {
     super(session, MalEstar.class);
   }
   public void removerMalEstarHistoricoClinico(HistoricoClinico historicoClinico) {
     String q = "delete from MalEstar where historicoClinico_id =" + historicoClinico.getId();
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.MalEstarDAO
 * JD-Core Version:    0.6.0
 */