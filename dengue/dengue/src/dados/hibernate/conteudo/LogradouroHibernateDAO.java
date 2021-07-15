package dados.hibernate.conteudo;

import model.endereco.Bairro;
import model.endereco.Logradouro;

import org.hibernate.SQLQuery;

import dados.basicas.LogradouroDAO;
import dados.hibernate.DAOGenericoHibernate;

public class LogradouroHibernateDAO extends
		DAOGenericoHibernate<Logradouro, Integer> implements LogradouroDAO {

	@Override
	public Logradouro getLogradouroPorCep(String cep) {
		
		SQLQuery query = getSession().createSQLQuery("SELECT * FROM logradouro WHERE cep ="+cep);
		Object[] logradouroArray =(Object[]) query.uniqueResult();
		Logradouro retorno = new Logradouro();
		retorno.setCodigo(Integer.parseInt(logradouroArray[0]+""));
		retorno.setCep(cep);
		retorno.setComplemento(logradouroArray[2]+"");
		retorno.setRua(logradouroArray[3]+"");
		Bairro bairro = new Bairro();
		bairro.setCodigo(Integer.parseInt(logradouroArray[4]+""));
		retorno.setTipo_logradouro(logradouroArray[5]+"");
		retorno.setBairro(bairro);
		
		return retorno;
	}

}
