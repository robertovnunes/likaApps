package dados.hibernate.conteudo;

import java.util.List;

import model.endereco.Bairro;
import model.endereco.Cidade;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;

import dados.basicas.BairroDAO;
import dados.hibernate.DAOGenericoHibernate;

public class BairroHibernateDAO extends
		DAOGenericoHibernate<Bairro, Integer> implements BairroDAO {

	@Override
	public List<Bairro> getBairroPorCidade(String idCidade) {
		Criteria crit = getSession().createCriteria(Bairro.class);
		if(idCidade != null && !idCidade.equals("")){
					Cidade cidade = new Cidade();
					cidade.setCodigo_cidade(new Integer(idCidade));
					crit.add(Restrictions.eq("cidade", cidade));
		}
		return crit.list();
	}
	

	@Override
	public List<Object[]> getTodosBairrosDaCidadeDoBairroSelecionado(String codigoBairro) {
		SQLQuery query = getSession().createSQLQuery("SELECT * FROM  bairro WHERE cidade_codigo = ( SELECT cidade_codigo FROM bairro WHERE bairro_codigo ="+codigoBairro+")");
		return query.list();
	}
	
	@Override
	public Object[] getCidadeEstadoDoBairroSelecionado(String codigoBairro) {
		SQLQuery query = getSession().createSQLQuery("select cid.cidade_codigo, uf.uf_codigo, cid.cidade_descricao, uf.uf_sigla from cidade cid inner join uf uf on cid.uf_codigo = uf.uf_codigo where cid.cidade_codigo = (select cidade_codigo from bairro where bairro_codigo = "+codigoBairro+")");
		return (Object[]) query.uniqueResult();
	}

}

 