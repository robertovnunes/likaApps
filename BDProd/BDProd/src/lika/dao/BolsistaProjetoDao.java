/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.dao;

import java.util.List;

import lika.model.Aluno;
import lika.model.AreaDePesquisa;
import lika.model.BolsistaProjeto;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.services.AlunoService;
import lika.services.BolsistaProjetoService;
import lika.services.PesquisadorService;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Marcio
 */
@Repository("bolsistaProjetoService")
public class BolsistaProjetoDao extends Dao<BolsistaProjeto, Integer> implements
		BolsistaProjetoService {

	@Autowired
	public BolsistaProjetoDao(
			@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public BolsistaProjeto salvar(BolsistaProjeto object) {

		return this.saveOrUpdate(object);
	}

	@Transactional
	public void atualizar(BolsistaProjeto object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public List<BolsistaProjeto> listar(String parametro, String tipoPesquisa) {

	Criteria c = super.getSession().createCriteria(BolsistaProjeto.class);
		
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
	public void excluir(BolsistaProjeto pesquisador) {
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
		Query q = this
				.criarQuery("select new Projeto(pp.id.projeto.idProjeto, pp.id.projeto.nome, pp.nomeSubProjeto) from PessoaProjeto pp where pp.id.pessoa = :pessoa");
		q.setEntity("pessoa", p);
		List<Projeto> projetos = q.list();
		return projetos;
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
	public BolsistaProjeto carregar(BolsistaProjeto object) {
		return this.load(object.getIdPessoa());
	}

	@Transactional
	public void refresh(BolsistaProjeto p) {
		super.refresh(p);
	}

}
