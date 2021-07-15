package dados.hibernate.conteudo;

import java.util.List;

import model.endereco.Cidade;
import model.endereco.UF;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;

import dados.basicas.CidadeDAO;
import dados.hibernate.DAOGenericoHibernate;

public class CidadeHibernateDAO extends
		DAOGenericoHibernate<Cidade, Integer> implements CidadeDAO {

	@Override
	public List<Cidade> getCidadePorUF(String idUF) {
		
		Criteria crit = getSession().createCriteria(Cidade.class);
		if(idUF != null && !idUF.equals("")){
					UF uf = new UF();
					uf.setCodigo(new Integer(idUF));
					crit.add(Restrictions.eq("estado", uf));
		}
		return crit.list();
	}
	
	@Override
	public List<Cidade> getCidadePorUFSigla(String siglaUF) {
		
		Criteria crit = getSession().createCriteria(Cidade.class);
		crit.createAlias("estado", "estado");
		
		if(siglaUF != null && !siglaUF.equals("")){
			crit.add(Restrictions.eq("estado.sigla", siglaUF));
		}
		return crit.list();
	}
	
	@Override
	public List<Object[]> getTodasCidadesDoBairroSelecionado(String codigoBairro) {
		SQLQuery query = getSession().createSQLQuery("SELECT * FROM  cidade cid2 WHERE uf_codigo = (select uf_codigo from cidade cid, bairro bar where bar.cidade_codigo = cid.cidade_codigo and bar.bairro_codigo = "+codigoBairro+")");
		return query.list();
	}

}
