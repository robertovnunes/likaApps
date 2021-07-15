 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.formulario.util.ProdutosQuimicos;
 import org.hibernate.SQLQuery;
 import org.hibernate.Session;
 
 public class ProdutosQuimicosDAO extends DAO<ProdutosQuimicos>
 {
   public ProdutosQuimicosDAO(Session session)
   {
     super(session, ProdutosQuimicos.class);
   }
 
   public void removerProdutosQuimicosDeSituacaoSocioEconomicaDemografica(Long id) {
     String q = "delete from ProdutosQuimicos where situacaoSocioEconomicaDemografica_id =" + id;
     this.session.createSQLQuery(q).executeUpdate();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.ProdutosQuimicosDAO
 * JD-Core Version:    0.6.0
 */