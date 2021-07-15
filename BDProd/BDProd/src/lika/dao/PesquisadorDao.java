/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.dao;

import java.util.List;

import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.services.PesquisadorService;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Marcio
 */
@Repository("pesquisadorService")
public class PesquisadorDao extends Dao<Pesquisador, Integer> implements
		PesquisadorService {

	@Autowired
	public PesquisadorDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public Pesquisador salvar(Pesquisador object) {

		return this.saveOrUpdate(object);
	}

	@Transactional
	public List<Pesquisador> listar(String parametro, String tipoPesquisa) {
		Criteria c = super.getSession().createCriteria(Pesquisador.class);
		
		c.addOrder(Order.asc("nome"));
		
		
		if(tipoPesquisa.trim().equals("")|| tipoPesquisa == null)
			tipoPesquisa = "nome";
		
		//isso aqui tá horrivel, mas é o que posso fazer com o banco nas atuais circunstancias
		else if(!tipoPesquisa.equals("CPF"))
			tipoPesquisa = tipoPesquisa.toLowerCase();
		
		c.add(Restrictions.like(tipoPesquisa, parametro.trim(),MatchMode.ANYWHERE));
		

		return c.list();
	}
	
	@Transactional
	public void atualizar(Pesquisador object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public void excluir(Pesquisador pesquisador) {
		this.delete(pesquisador);
	}

	public String nomeSubProjeto(Pessoa p, Projeto proj) {
		PessoaProjeto pp = new PessoaProjeto();
		PessoaProjetoID id = new PessoaProjetoID();
		id.setPessoa(p);
		id.setProjeto(proj);
		pp.setId(id);
		Query q = this
				.criarQuery("select nomeSubProjeto  from PessoaProjeto pp where pp = :id");
		q.setEntity("id", pp);
		q.setMaxResults(1);
		String resultado = (String) q.uniqueResult();

		return resultado;
	}

	public List<Projeto> listarProjetosESubProjetos(Pessoa p) {
		// Query q = this
		// .criarQuery("select p from Projeto p join p.participantes pa where pa.id = :pessoa order by p.dataInicio desc");
		Query q = this
				.criarQuery("select new Projeto(pp.id.projeto.idProjeto, pp.id.projeto.nome, pp.nomeSubProjeto) from PessoaProjeto pp where pp.id.pessoa = :pessoa order by  pp.id.projeto.nome asc");
		q.setEntity("pessoa", p);
		List<Projeto> projetos = q.list();
		return projetos;
	}
	
	@Transactional
	public Pesquisador tornarAlunoPesquisador(Pesquisador p) {

		try{
			SQLQuery tempQuery = getSession().createSQLQuery("insert into pesquisador (instituicaoOrigem, Pessoa_idPessoa) values    ('Universidade Federal de Pernambuco'," + p.getIdPessoa() + ");");
		    tempQuery.executeUpdate();
		    
		    SQLQuery q = getSession().createSQLQuery("delete   from     aluno   where     pessoa_idPessoa=" + p.getIdPessoa());
			q.executeUpdate();
		    
		}catch(Exception ex){
			System.out.println(ex);
		}
		   
		return p;
	}

	@Transactional
	public void removerProjeto(Pessoa p, Projeto proj) {
		PessoaProjeto pp = new PessoaProjeto();
		PessoaProjetoID id = new PessoaProjetoID();
		id.setPessoa(p);
		id.setProjeto(proj);
		pp.setId(id);
		Query q = this.criarQuery("delete from PessoaProjeto pp where pp = :p");
		q.setEntity("p", pp);
		q.executeUpdate();
	}

	@Transactional
	public Pesquisador carregar(Pesquisador object) {
		return this.load(object.getIdPessoa());
	}

	@Transactional
	public void refresh(Pesquisador p) {
		super.refresh(p);
	}

}
