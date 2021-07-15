/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.dao;

import java.util.List;

import lika.model.SubAreaDePesquisa;
import lika.model.Usuario;
import lika.services.UsuarioService;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Marcio
 */
@Repository("usuarioService")
@Transactional
public class UsuarioDao extends Dao<Usuario, Integer> implements UsuarioService {

	@Autowired
	public UsuarioDao(@Qualifier("sessionFactory") SessionFactory factory) {
		setSessionFactory(factory);
	}

	public Usuario salvar(Usuario object) {
		return this.saveOrUpdate(object);
	}

	public List<Usuario> listar(String nome, String tipoPesquisa) {
		Query q = this
				.criarQuery("from Usuario p where login like :login order by p.login");
		q.setString("login", nome.trim() + "%");
		return q.list();
	}

	public void excluir(Usuario usuario) {
		this.delete(usuario);
	}

	public Usuario autenticarUsuario(Usuario ex) {
		Criteria c = this.criarCriteria();
		c.add(Restrictions.ilike("login", ex.getLogin(), MatchMode.EXACT));
		c.add(Restrictions.ilike("senha", ex.getSenha(), MatchMode.EXACT));
		c.setMaxResults(1);
		Usuario usr = (Usuario) c.uniqueResult();
		return usr;
	}

	@Transactional
	public void atualizar(Usuario object) {
		// TODO Auto-generated method stub
		this.update(object);
	}

	public Usuario carregar(Usuario object) {
		// TODO Auto-generated method stub
		return this.load(object.getIdUsuario());
	}

	public String getSenhaUsuario(Usuario ex) {
		Query q = this
				.criarQuery("select senha from Usuario a where a = :usuario");
		q.setEntity("usuario", ex);
		return (String) q.uniqueResult();
	}

}
