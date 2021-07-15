/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.dao;

import java.util.Date;
import java.util.List;

import lika.model.Aluno;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.services.AlunoService;
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
@Repository("alunoService")
public class AlunoDao extends Dao<Aluno, Integer> implements AlunoService {

	@Autowired
	public AlunoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public Aluno salvar(Aluno object) {

		return this.saveOrUpdate(object);
	}

	@Transactional
	public List<Aluno> listar(String parametro, String tipoPesquisa) {

		Criteria c = super.getSession().createCriteria(Aluno.class);

		c.addOrder(Order.asc("nome"));

		if (tipoPesquisa.trim().equals("") || tipoPesquisa == null)
			tipoPesquisa = "nome";

		// isso aqui tá horrivel, mas é o que posso fazer com o banco nas atuais
		// circunstancias
		else if (!tipoPesquisa.equals("CPF"))
			tipoPesquisa = tipoPesquisa.toLowerCase();

		c.add(Restrictions.like(tipoPesquisa, parametro.trim(), MatchMode.ANYWHERE));

		return c.list();

	}

	@Transactional
	public void excluir(Aluno pesquisador) {
		this.delete(pesquisador);
	}

	public String nomeSubProjeto(Pessoa p, Projeto proj) {
		PessoaProjeto pp = new PessoaProjeto();
		PessoaProjetoID id = new PessoaProjetoID();
		id.setPessoa(p);
		id.setProjeto(proj);
		pp.setId(id);
		Query q = this.criarQuery("select nomeSubProjeto  from PessoaProjeto pp where pp = :id");
		q.setEntity("id", pp);
		q.setMaxResults(1);
		String resultado = (String) q.uniqueResult();

		return resultado;
	}

	public List<Projeto> listarProjetosESubProjetos(Pessoa p) {
		Query q = this.criarQuery("select new Projeto(pp.id.projeto.idProjeto, pp.id.projeto.nome, pp.nomeSubProjeto) from PessoaProjeto pp where pp.id.pessoa = :pessoa");
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
	public Aluno carregar(Aluno object) {
		return this.load(object.getIdPessoa());
	}

	@Transactional
	public void refresh(Aluno p) {
		super.refresh(p);
	}

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal, String situacao) {
		Query q;
		if (anoInicial != null && anoFinal != null) {
			if (situacao.equals("")) {
				q = this.criarQuery("from Aluno aluno where aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal order by aluno.nome ASC");

			} else {
				q = this.criarQuery("from Aluno aluno where aluno.situacao like :situacao and aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal order by aluno.nome ASC");
				q.setString("situacao", situacao);

			}
			q.setDate("anoInicial", anoInicial);
			q.setDate("anoFinal", anoFinal);

		} else {
			if (situacao.equals("")) {
				q = this.criarQuery("from Aluno aluno order by aluno.nome ASC");
			} else {
				q = this.criarQuery("from Aluno aluno where aluno.situacao like :situacao order by aluno.nome ASC");
				q.setString("situacao", situacao);
			}
		}
		List<Aluno> colecao = q.list();
		return colecao;
	}

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal, String tipo, String situacao) {
		Query q;
		if (anoInicial != null && anoFinal != null) {
			if (situacao.equals("")) {
				q = this.criarQuery("from Aluno aluno where (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.tipoAluno like :tipo order by aluno.nome ASC");
			} else {
				q = this.criarQuery("from Aluno aluno where aluno.situacao like :situacao and (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.tipoAluno like :tipo order by aluno.nome ASC");
				q.setString("situacao", situacao);
			}

			q.setDate("anoInicial", anoInicial);
			q.setDate("anoFinal", anoFinal);
		} else {
			if (situacao.equals("")) {
				q = this.criarQuery("from Aluno aluno where  aluno.tipoAluno like :tipo order by aluno.nome ASC");
			} else {
				q = this.criarQuery("from Aluno aluno where   aluno.situacao like :situacao and aluno.tipoAluno like :tipo order by aluno.nome ASC");
				q.setString("situacao", situacao);
			}

		}
		q.setString("tipo", tipo);
		List<Aluno> colecao = q.list();
		return colecao;
	}

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal, Pesquisador p, String tipo, String situacao) {
		Query q;
		if (anoInicial != null && anoFinal != null) {
			if (tipo.equals("")) {
				if (situacao.equals("")) {
					q = this.criarQuery("from Aluno aluno where (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.orientador = :p order by aluno.nome ASC");
				} else {
					q = this.criarQuery("from Aluno aluno where aluno.situacao like :situacao and (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.orientador = :p order by aluno.nome ASC");
					q.setString("situacao", situacao);
				}

			} else {
				if (situacao.equals("")) {
					q = this.criarQuery("from Aluno aluno where (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.tipoAluno like :tipo and aluno.orientador = :p order by aluno.nome ASC");
					q.setString("tipo", tipo);
				} else {
					q = this.criarQuery("from Aluno aluno where aluno.situacao like :situacao and (aluno.dataAdmissao >= :anoInicial and aluno.dataAdmissao <= :anoFinal)  and aluno.tipoAluno like :tipo and aluno.orientador = :p order by aluno.nome ASC");
					q.setString("tipo", tipo);
					q.setString("situacao", situacao);

				}

			}

			q.setDate("anoInicial", anoInicial);
			q.setDate("anoFinal", anoFinal);

		} else {
			if (tipo.equals("")) {
				if (situacao.equals("")) {
					q = this.criarQuery("from Aluno aluno where   aluno.orientador = :p order by aluno.nome ASC");
				} else {
					q = this.criarQuery("from Aluno aluno where  aluno.situacao like :situacao and  aluno.orientador = :p order by aluno.nome ASC");
					q.setString("situacao", situacao);
				}

			} else {
				if (situacao.equals("")) {
					q = this.criarQuery("from Aluno aluno where  aluno.tipoAluno like :tipo and aluno.orientador = :p order by aluno.nome ASC");
					q.setString("tipo", tipo);
				} else {
					q = this.criarQuery("from Aluno aluno where  aluno.situacao like :situacao and aluno.tipoAluno like :tipo and aluno.orientador = :p order by aluno.nome ASC");
					q.setString("tipo", tipo);
					q.setString("situacao", situacao);
				}

			}
		}

		q.setEntity("p", p);
		List<Aluno> colecao = q.list();
		return colecao;
	}

	@Transactional
	public void atualizar(Aluno object) {
		// TODO Auto-generated method stub
		this.update(object);
	}
}
