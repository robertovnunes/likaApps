 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import br.com.lika.hpv.model.formulario.util.Imunossupressoras;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class ImunossupressorasDAO extends DAO<Imunossupressoras>
 {
   public ImunossupressorasDAO(Session session)
   {
     super(session, Imunossupressoras.class);
   }
 
   public void removerImunossupressorasDAO(HistoricoClinico historicoClinico) {
     String q = "delete from Imunossupressoras where historicoClinico_id =" + historicoClinico.getId();
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.ImunossupressorasDAO
 * JD-Core Version:    0.6.0
 */