package lika.dao;

import java.util.List;

import lika.model.Aluno;
import lika.model.AreaDePesquisa;
import lika.model.SubAreaDePesquisa;
import lika.services.AreaDePesquisaService;
import lika.services.SubAreaDePesquisaService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("areaDePesquisaService")
public class AreaDePesquisaDao extends Dao<AreaDePesquisa, Integer> implements
		AreaDePesquisaService {

	@Transactional
	public void atualizar(AreaDePesquisa object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Autowired
	public AreaDePesquisaDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void excluir(AreaDePesquisa object) {
		this.delete(object);
	}

	public List<AreaDePesquisa> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("select new AreaDePesquisa(p.idAreaDePesquisa,p.nome) from AreaDePesquisa p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();

	}

	@Transactional
	public AreaDePesquisa salvar(AreaDePesquisa object) {
		return this.saveOrUpdate(object);
	}

	@Transactional
	public AreaDePesquisa carregar(AreaDePesquisa object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdAreaDePesquisa());
	}

	public List<SubAreaDePesquisa> listarSubAreas(AreaDePesquisa area) {
		Query q = this
				.criarQuery("select new SubAreaDePesquisa(a.idSubAreaDePesquisa,a.nome) from SubAreaDePesquisa a join a.grandesAreasDePesquisas as area where :area = area order by a.nome asc");
		q.setEntity("area", area);
		return q.list();

	}
}
