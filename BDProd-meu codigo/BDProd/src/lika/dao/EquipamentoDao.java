package lika.dao;

import java.util.List;

import lika.model.Departamento;
import lika.model.Equipamento;
import lika.services.EquipamentoService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("equipamentoService")
public class EquipamentoDao extends Dao<Equipamento, Integer> implements
		EquipamentoService {

	@Transactional
	public void atualizar(Equipamento object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Autowired
	public EquipamentoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	public void refresh(Equipamento p) {
		super.refresh(p);

	}

	public Equipamento carregar(Equipamento object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdEquipamento());
	}

	public void excluir(Equipamento object) {
		this.delete(object);

	}

	public List<Equipamento> listar(String parametro, String tipoPesquisa) {
		Query q = this
				.criarQuery(" from Equipamento e where nome like :nome order by e.nome asc");
		q.setString("nome", parametro.trim() + "%");
		return q.list();
	}

	public Equipamento salvar(Equipamento object) {
		// TODO Auto-generated method stub
		return this.saveOrUpdate(object);
	}

}
