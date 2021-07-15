package lika.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lika.model.Aluno;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.model.ProjetoSimples;
import lika.services.PessoaProjetoService;

@Repository("pessoaProjetoService")
public class PessoaProjetoDao extends Dao<PessoaProjeto, PessoaProjetoID>
		implements PessoaProjetoService {

	@Transactional
	public void atualizar(PessoaProjeto object) {
		// TODO Auto-generated method stub
		this.update(object);
	}
	
	@Autowired
	public PessoaProjetoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	public void excluir(PessoaProjeto object) {
		this.delete(object);

	}

	public List<PessoaProjeto> listar(String parametro, String tipoPesquisa) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	public PessoaProjeto salvar(PessoaProjeto object) {

		return this.merge(object);
	}

	public PessoaProjeto carregar(PessoaProjeto object) {
		// TODO Auto-generated method stub
		return this.load(object.getId());
	}

	public List<Aluno> alunoDoProjeto(Projeto p) {
		Query q = this
				.criarQuery("select p.id.pessoa from PessoaProjeto p where p.id.projeto = :projeto order by p.id.pessoa.nome");
		q.setEntity("projeto", p);
		List<Pessoa> colecao = q.list();
		List<Aluno> resultado = new ArrayList<Aluno>();

		Iterator<Pessoa> it = colecao.iterator();
		while (it.hasNext()) {
			Pessoa a = it.next();
			if (a instanceof Aluno) {
				resultado.add((Aluno) a);
			}
		}
		return resultado;
	}

	public List<ProjetoSimples> listarProjetosSimples() {
		Query q = this
				.criarQuery("from ProjetoSimples p order by p.dataInicio DESC");

		List<ProjetoSimples> colecao = q.list();
		return colecao;
	}
}
