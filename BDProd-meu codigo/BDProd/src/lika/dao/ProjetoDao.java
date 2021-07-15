package lika.dao;

import java.util.Date;
import java.util.List;

import lika.model.AreaDePesquisa;
import lika.model.GrupoDePesquisa;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.PessoaProjeto;
import lika.model.PessoaProjetoID;
import lika.model.Projeto;
import lika.services.ProjetoService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("projetoService")
public class ProjetoDao extends Dao<Projeto, Integer> implements ProjetoService {

	@Autowired
	public ProjetoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void excluir(Projeto object) {
		this.delete(object);

	}

	public List<Projeto> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("select new Projeto(p.idProjeto,p.nome) from Projeto p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();
	}

	@Transactional
	public Projeto salvar(Projeto object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

	public Projeto carregar(Projeto object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdProjeto());
	}

	@Transactional
	public void refresh(Projeto p) {
		super.refresh(p);
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

	public List<Pessoa> listarPessoasESubProjetos(Projeto p) {
		Query q = this
				.criarQuery("select new Pessoa(pp.id.pessoa.idPessoa, pp.id.pessoa.nome, pp.nomeSubProjeto,pp.nomeSubProjeto) from PessoaProjeto pp where pp.id.projeto = :projeto order by pp.id.pessoa.nome asc");
		q.setEntity("projeto", p);
		List<Pessoa> pessoas = q.list();
		return pessoas;
	}

	public List<Pessoa> listarPessoas(Projeto p) {
		Query q = this
				.criarQuery("select new Pessoa(pp.id.pessoa.idPessoa, pp.id.pessoa.nome,  pp.id.pessoa.situacao, pp.id.pessoa.dataDesligamento) from PessoaProjeto pp where pp.id.projeto = :projeto order by pp.id.pessoa.nome asc");
		q.setEntity("projeto", p);
		List<Pessoa> pessoas = q.list();
		return pessoas;
	}

	@Transactional
	public void removerPessoa(Pessoa p, Projeto proj) {
		PessoaProjeto pp = new PessoaProjeto();
		PessoaProjetoID id = new PessoaProjetoID();
		id.setPessoa(p);
		id.setProjeto(proj);
		pp.setId(id);
		Query q = this.criarQuery("delete from PessoaProjeto pp where pp = :p");
		q.setEntity("p", pp);
		q.executeUpdate();
	}

	public List<Projeto> listarProjetoRelatorio(Date dataInicio, Date dataFim,
			boolean financiamento, String tipo) {
		Query q = null;
		if (tipo.equals("")) {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.financiamento = :financiamento order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
			} else if (dataFim != null && dataInicio != null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.financiamento = :financiamento order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
			}

		} else {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto  order by projeto.dataInicio DESC");
			} else {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim order by projeto.dataInicio DESC");

				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);
			}

		}

		List<Projeto> colecao = q.list();
		return colecao;
	}

	@Transactional
	public void atualizar(Projeto object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	public List<Projeto> listarProjetoRelatorioData(Date dataInicio,
			Date dataFim) {
		Query q = null;
		if (dataInicio == null || dataFim == null) {
			q = this
					.criarQuery("from Projeto projeto order by projeto.dataInicio DESC");

		} else {
			q = this
					.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim order by projeto.dataInicio DESC");
			q.setDate("dataInicio", dataInicio);
			q.setDate("dataFim", dataFim);
		}
		List<Projeto> colecao = q.list();
		return colecao;
	}

	public List<Projeto> listarProjetoGrupoRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			GrupoDePesquisa grupo) {
		Query q = null;
		if (tipo.equals("")) {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where  projeto.financiamento = :financiamento and projeto.grupo = :grupo order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
			} else if (dataFim != null && dataInicio != null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.financiamento = :financiamento and projeto.grupo = :grupo order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);
			}
		} else {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.grupo = :grupo order by projeto.dataInicio DESC");
			} else {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.grupo = :grupo order by projeto.dataInicio DESC");

				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);
			}

		}
		q.setEntity("grupo", grupo);

		List<Projeto> colecao = q.list();
		return colecao;
	}

	public List<Projeto> listarProjetoResponsavelRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			Pesquisador responsavel) {
		Query q = null;
		if (tipo.equals("")) {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where  projeto.financiamento = :financiamento and projeto.gerente = :responsavel order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
			} else if (dataFim != null && dataInicio != null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.financiamento = :financiamento and projeto.gerente = :responsavel order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
				q.setDate("dataFim", dataFim);
				q.setDate("dataInicio", dataInicio);
			}
		} else {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where  projeto.gerente = :responsavel order by projeto.dataInicio DESC");
			} else {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.gerente = :responsavel order by projeto.dataInicio DESC");

				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);
			}

		}

		q.setEntity("responsavel", responsavel);

		List<Projeto> colecao = q.list();
		return colecao;
	}

	public List<Projeto> listarProjetoAreaRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			AreaDePesquisa area) {
		Query q = null;
		if (tipo.equals("")) {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.grandeArea = :area and projeto.financiamento = :financiamento order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
			} else if (dataFim != null && dataInicio != null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.grandeArea = :area and projeto.financiamento = :financiamento order by projeto.dataInicio DESC");
				q.setBoolean("financiamento", financiamento);
				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);

			}

		} else {
			if (dataFim == null && dataInicio == null) {
				q = this
						.criarQuery("from Projeto projeto where projeto.grandeArea = :area order by projeto.dataInicio DESC");
			} else {
				q = this
						.criarQuery("from Projeto projeto where projeto.dataInicio between :dataInicio and :dataFim and projeto.grandeArea = :area order by projeto.dataInicio DESC");
				q.setDate("dataInicio", dataInicio);
				q.setDate("dataFim", dataFim);
			}

		}
		q.setEntity("area", area);

		List<Projeto> colecao = q.list();
		return colecao;
	}

}
