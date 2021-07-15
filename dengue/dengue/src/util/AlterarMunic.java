package util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import model.endereco.Cidade;
import model.sistema.CNES;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import dados.hibernate.HibernateUtil;

public class AlterarMunic {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 try {
					 
			SessionFactory sf = HibernateUtil.getFabricaDeSessao();
			
			Transaction transaction = sf.getCurrentSession().beginTransaction();

			SQLQuery query =  sf.getCurrentSession().createSQLQuery("SELECT * FROM CIDADE WHERE IBGE_CODIGO IS NULL LIMIT 50000");
			query.addEntity(Cidade.class);
			List<Cidade> results = query.list();
			
			sf.getCurrentSession().close();
			
			
			
			for (Cidade cidade : results) {
				transaction = sf.getCurrentSession().beginTransaction();	
				
				String codMunc = cidade.getCodigo_cidade() + "";
				
				String sql = "SELECT ibge_codigo FROM IBGE where cidade_codigo = " + codMunc +"";
				query = sf.getCurrentSession().createSQLQuery(sql);
				List lista = query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
				Iterator iter = lista.iterator();
				String ibgeNovo = "";
				while ( iter.hasNext() ) {
				   Map map = (Map) iter.next();
				   ibgeNovo = (String)  map.get("ibge_codigo");
				}
				
				cidade.setIbge_codigo(ibgeNovo);
				sf.getCurrentSession().update(cidade);
				transaction.commit();
		        
//				String sqlUpdate = "UPDATE CNES set CO_MUNICIPIO_GESTOR2 = '" + ibgeNovo  + "' where CO_UNIDADE equals "+ cnes.getCodigo_unidade();
//				SQLQuery query2 = sf.getCurrentSession().createSQLQuery(sqlUpdate);
//				query2.executeUpdate();
				
				sf.getCurrentSession().close();
			}
			
			
		 }catch(Exception ex){
			 System.out.println(ex.getMessage());
		 }
	}

}
