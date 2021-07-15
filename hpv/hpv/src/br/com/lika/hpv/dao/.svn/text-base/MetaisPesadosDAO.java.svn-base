 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.util.MetaisPesados;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class MetaisPesadosDAO extends DAO<MetaisPesados>
 {
   public MetaisPesadosDAO(Session session)
   {
     super(session, MetaisPesados.class);
   }
 
   public void removerMetaisPesadosDeSituacaoSocioEconomicaDemografica(Long id) {
     String q = "delete from MetaisPesados where situacaoSocioEconomicaDemografica_id =" + id;
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.MetaisPesadosDAO
 * JD-Core Version:    0.6.0
 */