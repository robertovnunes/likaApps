 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoFamiliar;
 import br.com.lika.hpv.model.formulario.util.ParenteCancer;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class ParenteCancerDAO extends DAO<ParenteCancer>
 {
   public ParenteCancerDAO(Session session)
   {
     super(session, ParenteCancer.class);
   }
 
   public void removerParenteCancerHistoricoFamiliar(HistoricoFamiliar historicoFamiliar) {
     if ((historicoFamiliar != null) && (historicoFamiliar.getId() != null) && (historicoFamiliar.getId().longValue() >= 0L)) {
       String sql = "delete from ParenteCancer where historicoFamiliar_id = " + historicoFamiliar.getId();
       SQLQuery temp = this.session.createSQLQuery(sql);
       temp.executeUpdate();
     }
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.ParenteCancerDAO
 * JD-Core Version:    0.6.0
 */