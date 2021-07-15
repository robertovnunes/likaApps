package lika.dao;

import java.util.List;

import lika.model.Equipamento;
import lika.model.Funcao;
import lika.services.FuncaoService;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("funcaoService")
public class FuncaoDao extends Dao<Funcao, Integer> implements FuncaoService {

	@Autowired
	public FuncaoDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	@Transactional
	public void atualizar(Funcao object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	@Transactional
	public void excluir(Funcao object) {
		this.delete(object);
	}

	public List<Funcao> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("from Funcao p where nome like :nome order by p.nome asc");
		q.setString("nome", nome.trim() + "%");
		return q.list();

	}

	@Transactional
	public Funcao salvar(Funcao object) {
		return this.saveOrUpdate(object);
	}

	public Funcao carregar(Funcao object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdFuncao());
	}

}
