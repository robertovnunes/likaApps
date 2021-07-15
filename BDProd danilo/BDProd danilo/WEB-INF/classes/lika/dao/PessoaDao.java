package lika.dao;

import java.util.List;

import org.apache.myfaces.trinidadinternal.skin.AgentAtRuleMatcher.Match;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lika.model.Funcionario;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.services.FuncionarioService;
import lika.services.PessoaService;

@Repository("pessoaService")
public class PessoaDao extends Dao<Pessoa, Integer> implements PessoaService {

	@Autowired
	public PessoaDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void atualizar(Pessoa object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public Pessoa carregar(Pessoa object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdPessoa());
	}

	@Transactional
	public void excluir(Pessoa object) {
		this.delete(object);

	}

	@Transactional
	public List<Pessoa> listar(String parametro, String tipoPesquisa) {
		
		Criteria c = super.getSession().createCriteria(Pessoa.class);
		
		c.addOrder(Order.asc("nome"));
		c.add(Restrictions.like("nome", parametro.trim(),MatchMode.ANYWHERE));
		return c.list();
	}

	@Transactional
	public Pessoa salvar(Pessoa object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

	@Transactional
	public void refresh(Pessoa p) {
		super.refresh(p);
	}

}
