 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.HistoricoFamiliar;
 import br.com.lika.hpv.model.formulario.util.ParenteDoencaCronica;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class ParenteDoencaCronicaDAO extends DAO<ParenteDoencaCronica>
 {
   public ParenteDoencaCronicaDAO(Session session)
   {
     super(session, ParenteDoencaCronica.class);
   }
 
   public void removerParenteDoencaCronicaHistoricoFamiliar(HistoricoFamiliar historicoFamiliar) {
     if ((historicoFamiliar != null) && (historicoFamiliar.getId() != null) && (historicoFamiliar.getId().longValue() >= 0L)) {
       String sql = "delete from ParenteDoencaCronica where historicoFamiliar_id = " + historicoFamiliar.getId();
       SQLQuery temp = this.session.createSQLQuery(sql);
       temp.executeUpdate();
     }
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.ParenteDoencaCronicaDAO
 * JD-Core Version:    0.6.0
 */