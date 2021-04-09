package clin.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import clin.exception.ExcecaoDoSistema;

public class Dao<T> {
	protected Session session;
	@SuppressWarnings("unchecked")
	protected final Class classe;

	@SuppressWarnings("unchecked")
	Dao(Class classe, Session session) {
		this.session = session;
		this.classe = classe;
	}

	public void adiciona(T objeto) throws ExcecaoDoSistema {
		try {
			this.session.saveOrUpdate(objeto);
		} catch (HibernateException e) {
			throw new ExcecaoDoSistema(
					"Falha ao tentar gravar o registro no banco de dados" + e,
					e);
		}
	}

	public void remover(T objeto) throws ExcecaoDoSistema {
		try {
			this.session.delete(objeto);
		} catch (HibernateException e) {
			throw new ExcecaoDoSistema(
					"Falha ao tentar gravar o registro no banco de dados" + e,
					e);
		}
	}

	public void remover(Integer codigo) throws ExcecaoDoSistema {
		try {
			this.session.delete(this.procura(codigo));
		} catch (HibernateException e) {
			throw new ExcecaoDoSistema(
					"Falha ao tentar deletar o registro no banco de dados" + e,
					e);
		}
	}

	public void atualiza(T objeto) throws ExcecaoDoSistema {
		try {
			this.session.saveOrUpdate(objeto);
		} catch (HibernateException e) {
			throw new ExcecaoDoSistema(
					"Falha ao tentar atualizar o registro no banco de dados"
							+ e, e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> listaTudo() {
		return this.session.createCriteria(this.classe).list();
	}

	@SuppressWarnings("unchecked")
	public T procura(Integer id) {
		return (T) this.session.load(this.classe, id);
	}

	public void rebind(T objeto) {
		this.session.refresh(objeto);
	}

	protected Session getSession() {
		return this.session;
	}

	@SuppressWarnings("unchecked")
	public List<T> consulta(String atributo, String query) {
		return this.session.createCriteria(this.classe).add(
				Restrictions.ilike(atributo, "%" + query + "%")).list();
	}

}