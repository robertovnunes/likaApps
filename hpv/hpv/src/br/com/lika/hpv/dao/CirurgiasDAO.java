 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.util.Cirurgias;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class CirurgiasDAO extends DAO<Cirurgias>
 {
   public CirurgiasDAO(Session session)
   {
     super(session, Cirurgias.class);
   }
 
   public void removerCirurgiasHistoricoClinico(HistoricoClinico historicoClinico) {
     String q = "delete from Cirurgias where historicoClinico_id =" + historicoClinico.getId();
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.CirurgiasDAO
 * JD-Core Version:    0.6.0
 */