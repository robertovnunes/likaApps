package lika.dao;

import java.util.List;

import lika.model.Publicacao;
import lika.model.SubAreaDePesquisa;
import lika.services.SubAreaDePesquisaService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("subAreaDePesquisaService")
public class SubAreaDePesquisaDao extends Dao<SubAreaDePesquisa, Integer>
		implements SubAreaDePesquisaService {

	@Autowired
	public SubAreaDePesquisaDao(
			@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void atualizar(SubAreaDePesquisa object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public void excluir(SubAreaDePesquisa object) {
		this.delete(object);
	}

	public List<SubAreaDePesquisa> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("select new SubAreaDePesquisa(p.idSubAreaDePesquisa,p.nome) from SubAreaDePesquisa p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();

	}

	@Transactional
	public SubAreaDePesquisa salvar(SubAreaDePesquisa object) {
		return this.saveOrUpdate(object);
	}

	public SubAreaDePesquisa carregar(SubAreaDePesquisa object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdSubAreaDePesquisa());
	}

}
