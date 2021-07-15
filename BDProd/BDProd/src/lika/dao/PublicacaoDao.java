package lika.dao;

import java.util.List;

import lika.model.AreaDePesquisa;
import lika.model.Autor;
import lika.model.GrupoDePesquisa;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;
import lika.services.PublicacaoService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("publicacaoService")
@Transactional
public class PublicacaoDao extends Dao<Publicacao, Integer> implements
		PublicacaoService {

	@Autowired
	public PublicacaoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	public void excluir(Publicacao object) {
		this.delete(object);

	}

	public List<Publicacao> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("from Publicacao p where titulo like :titulo and p.tipoPublicacao like :tipo order by p.titulo asc");
		q.setString("titulo", nome.trim() + "%");
		q.setString("tipo", tipoPesquisa);
		return q.list();
	}

	public List<Autor> listarAutores(Publicacao p) {
		Query q = this
				.criarQuery("from Autor p where :pub = p.publicacao order by p.posicao desc");
		q.setEntity("pub", p);
		return q.list();
	}

	@Transactional
	public Publicacao salvar(Publicacao object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

	@Transactional
	public Publicacao carregar(Publicacao object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdPublicacao());
	}

	public List<Publicacao> listarPublicacoesDaPessoa(Pessoa p) {
		Query q = this
				.criarQuery("select new Publicacao(a.publicacao.idPublicacao, a.publicacao.titulo, a.publicacao.tipoPublicacao, a.publicacao.anoPublicacao) from Autor a where a.autorDoLika = :pessoa order by  a.publicacao.anoPublicacao desc");
		q.setEntity("pessoa", p);
		List<Publicacao> publicacoes = q.list();
		return publicacoes;
	}

	@Transactional
	public void atualizar(Publicacao object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public void atualizarAutor(Pessoa object) {
		// TODO Auto-generated method stub
		Query q = this
				.criarQuery("update Autor set autorDoLika = null where autorDoLika = :pessoa");
		q.setEntity("pessoa", object);
		q.executeUpdate();
	}

	public List<Publicacao> listarPublicacaoRelatorio(String anoInicial,
			String anoFinal) {

		Query q = null;

		if (anoInicial == "" && anoFinal == "") {
			q = this
					.criarQuery("from Publicacao publicacao  order by publicacao.anoPublicacao DESC");
		} else {
			q = this
					.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal order by publicacao.anoPublicacao DESC");
			q.setString("anoInicial", anoInicial);
			q.setString("anoFinal", anoFinal);
		}

		List<Publicacao> colecao = q.list();
		return colecao;
	}

	public List<Publicacao> listarPublicacaoRelatorio(String anoInicial,
			String anoFinal, String tipo) {
		Query q = null;
		if (anoInicial == "" && anoFinal == "") {
			q = this
					.criarQuery("from Publicacao publicacao where  publicacao.tipoPublicacao like :tipo order by publicacao.anoPublicacao DESC");

		} else {
			q = this
					.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.tipoPublicacao like :tipo order by publicacao.anoPublicacao DESC");
			q.setString("anoInicial", anoInicial);
			q.setString("anoFinal", anoFinal);

		}
		q.setString("tipo", tipo);
		List<Publicacao> colecao = q.list();
		return colecao;
	}

	public List<Publicacao> publicacoesDaPessoaRelatorio(String anoInicial,
			String anoFinal, Pessoa p, String tipo) {
		Query q = null;
		if (tipo.equals("")) {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("select a.publicacao  from Autor a where a.autorDoLika = :pessoa  order by  a.publicacao.anoPublicacao DESC");
			} else if (tipo.equals("") && anoInicial != "" && anoFinal != "") {
				q = this
						.criarQuery("select a.publicacao  from Autor a where a.autorDoLika = :pessoa  and a.publicacao.anoPublicacao >= :anoInicial and a.publicacao.anoPublicacao <= :anoFinal  order by  a.publicacao.anoPublicacao DESC");

				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		} else {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("select a.publicacao  from Autor a where a.autorDoLika = :pessoa and a.publicacao.tipoPublicacao like :tipo  order by a.publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
			} else {
				q = this
						.criarQuery("select a.publicacao  from Autor a where a.autorDoLika = :pessoa and a.publicacao.tipoPublicacao like :tipo and a.publicacao.anoPublicacao >= :anoInicial and a.publicacao.anoPublicacao <= :anoFinal order by a.publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		}
		q.setEntity("pessoa", p);

		List<Publicacao> colecao = q.list();
		return colecao;
	}

	public List<Publicacao> listarPublicacaoProjetoRelatorio(String anoInicial,
			String anoFinal, Projeto projeto, String tipo) {
		Query q = null;
		if (tipo.equals("")) {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.projeto = :projeto   order by publicacao.anoPublicacao DESC group by publicacao.tipoPublicacao");
			} else if (tipo.equals("") && anoInicial != "" && anoFinal != "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.projeto = :projeto   order by publicacao.anoPublicacao DESC group by publicacao.tipoPublicacao");
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		} else {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.tipoPublicacao like :tipo and publicacao.projeto = :projeto order by publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
			} else {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.tipoPublicacao like :tipo and publicacao.projeto = :projeto order by publicacao.anoPublicacao DESC");

				q.setString("tipo", tipo);
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		}
		q.setEntity("projeto", projeto);

		List<Publicacao> colecao = q.list();
		return colecao;
	}

	public List<Publicacao> listarPublicacaoGrupoRelatorio(String anoInicial,
			String anoFinal, GrupoDePesquisa grupo, String tipo) {
		Query q = null;
		if (tipo.equals("")) {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.projeto.grupo = :grupo order by publicacao.anoPublicacao DESC");

			} else if (anoInicial != "" && anoFinal != "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.projeto.grupo = :grupo order by publicacao.anoPublicacao DESC");
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		} else {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.tipoPublicacao like :tipo and publicacao.projeto.grupo = :grupo order by publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);

			} else {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.tipoPublicacao like :tipo and publicacao.projeto.grupo = :grupo order by publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		}
		q.setEntity("grupo", grupo);

		List<Publicacao> colecao = q.list();
		return colecao;
	}

	public List<Publicacao> listarPublicacaoAreaDePequisaRelatorio(
			String anoInicial, String anoFinal, AreaDePesquisa area, String tipo) {
		Query q = null;
		if (tipo.equals("")) {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.projeto.grandeArea = :grandeArea order by publicacao.anoPublicacao DESC");

			} else if (anoInicial != "" && anoFinal != "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.projeto.grandeArea = :grandeArea order by publicacao.anoPublicacao DESC");
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}
		} else {
			if (anoInicial == "" && anoFinal == "") {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.tipoPublicacao like :tipo and publicacao.projeto.grandeArea = :grandeArea order by publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
			} else {
				q = this
						.criarQuery("from Publicacao publicacao where publicacao.anoPublicacao >= :anoInicial and publicacao.anoPublicacao <= :anoFinal and publicacao.tipoPublicacao like :tipo and publicacao.projeto.grandeArea = :grandeArea order by publicacao.anoPublicacao DESC");
				q.setString("tipo", tipo);
				q.setString("anoInicial", anoInicial);
				q.setString("anoFinal", anoFinal);
			}

		}
		q.setEntity("grandeArea", area);

		List<Publicacao> colecao = q.list();
		return colecao;
	}

}
