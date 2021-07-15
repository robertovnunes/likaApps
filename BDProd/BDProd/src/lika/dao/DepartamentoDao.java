package lika.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import lika.model.BolsistaProjeto;
import lika.model.Departamento;
import lika.services.DepartamentoService;

@Repository("departamentoService")
public class DepartamentoDao extends Dao<Departamento, Integer> implements
		DepartamentoService {
	
	@Transactional
	public void atualizar(Departamento object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Autowired
	public DepartamentoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	public Departamento carregar(Departamento object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdDepartamento());
	}

	public void excluir(Departamento object) {
		this.delete(object);

	}

	public List<Departamento> listar(String parametro, String tipoPesquisa) {
		Query q = this
				.criarQuery("from Departamento p where nome like :nome order by p.nome asc");
		q.setString("nome", parametro.trim() + "%");
		return q.list();
	}

	public Departamento salvar(Departamento object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

	public List<Departamento> listarDepartamentos() {
		Query q = this
				.criarQuery("from Departamento p order by p.idDepartamento asc");
		return q.list();
	}

}
