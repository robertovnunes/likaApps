 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.util.Radiacoes;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class RadiacoesDAO extends DAO<Radiacoes>
 {
   public RadiacoesDAO(Session session)
   {
     super(session, Radiacoes.class);
   }
 
   public void removerRadiacoesDeSituacaoSocioEconomicaDemografica(Long id) {
     String q = "delete from Radiacoes where situacaoSocioEconomicaDemografica_id =" + id;
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.RadiacoesDAO
 * JD-Core Version:    0.6.0
 */