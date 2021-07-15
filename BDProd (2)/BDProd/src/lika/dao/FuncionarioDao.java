package lika.dao;

import java.util.List;

import org.hibernate.Criteria;
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
import lika.services.FuncionarioService;

@Repository("funcionarioService")
public class FuncionarioDao extends Dao<Funcionario, Integer> implements
		FuncionarioService {

	@Autowired
	public FuncionarioDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public Funcionario carregar(Funcionario object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdPessoa());
	}

	@Transactional
	public void excluir(Funcionario object) {
		this.delete(object);

	}

	@Transactional
	public List<Funcionario> listar(String parametro, String tipoPesquisa) {

	Criteria c = super.getSession().createCriteria(Funcionario.class);
		
		c.addOrder(Order.asc("nome"));
		
		if(tipoPesquisa.equals("") || tipoPesquisa == null)
			tipoPesquisa = "nome";
		
		//isso aqui tá horrivel, mas é o que posso fazer com o banco nas atuais circunstancias
		else if(!tipoPesquisa.equals("CPF"))
			tipoPesquisa = tipoPesquisa.toLowerCase();
		

		
		c.add(Restrictions.like(tipoPesquisa, parametro.trim(),MatchMode.ANYWHERE));
		

		return c.list();

	}

	@Transactional
	public void atualizar(Funcionario object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public Funcionario salvar(Funcionario object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

	@Transactional
	public void refresh(Funcionario p) {
		super.refresh(p);
	}

}
