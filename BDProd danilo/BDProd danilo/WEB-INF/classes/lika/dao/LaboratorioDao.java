package lika.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lika.model.GrupoDePesquisa;
import lika.model.Laboratorio;
import lika.services.LaboratorioService;

@Repository("laboratorioService")
public class LaboratorioDao extends Dao<Laboratorio, Integer> implements
		LaboratorioService {

	@Autowired
	public LaboratorioDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void atualizar(Laboratorio object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	public Laboratorio carregar(Laboratorio object) {
		return this.load(object.getIdLaboratorio());
	}

	@Transactional
	public void excluir(Laboratorio object) {
		this.delete(object);

	}

	public List<Laboratorio> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("select new Laboratorio(p.idLaboratorio,p.nome) from Laboratorio p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();
	}

	@Transactional
	public Laboratorio salvar(Laboratorio object) {

		return this.saveOrUpdate(object);
	}

}
