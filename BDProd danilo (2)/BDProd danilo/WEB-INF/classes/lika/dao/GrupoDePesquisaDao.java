package lika.dao;

import java.util.List;

import lika.model.Funcionario;
import lika.model.GrupoDePesquisa;
import lika.services.GrupoDePesquisaService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("grupoDePesquisaService")
public class GrupoDePesquisaDao extends Dao<GrupoDePesquisa, Integer> implements
		GrupoDePesquisaService {

	@Autowired
	public GrupoDePesquisaDao(
			@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}
	@Transactional
	public void atualizar(GrupoDePesquisa object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public void excluir(GrupoDePesquisa object) {
		this.delete(object);
	}

	public List<GrupoDePesquisa> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("select new GrupoDePesquisa(p.idGrupoDePesquisa,p.nome) from GrupoDePesquisa p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();

	}

	@Transactional
	public GrupoDePesquisa salvar(GrupoDePesquisa object) {
		return this.saveOrUpdate(object);
	}

	public GrupoDePesquisa carregar(GrupoDePesquisa object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdGrupoDePesquisa());
	}

}
