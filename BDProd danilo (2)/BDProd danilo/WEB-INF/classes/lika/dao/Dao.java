/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 
 * @author Marcio
 */
public class Dao<T, PK extends Serializable> extends HibernateDaoSupport {

	private final Class<T> objectClass;

	public T merge(final T object) {
		try {
			final Session s = getSession(false);
			s.merge(object);
			s.flush();
			return object;
		} catch (final HibernateException ex) {
			throw new HibernateException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public Dao() {
		this.objectClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public Class<T> getObjectClass() {
		return this.objectClass;
	}

	public T save(final T object) throws HibernateException {
		try {
			final Session s = getSession(false);
			s.save(object);
			s.flush();
			return object;
		} catch (final HibernateException ex) {
			throw new HibernateException(ex);
		}
	}

	public void update(final T object) throws HibernateException {
		try {
			final Session s = getSession(false);
			s.update(object);
			s.flush();
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	public T saveOrUpdate(final T object) throws HibernateException {
		Session s = null;
		try {
			s = getSession(false);
			s.saveOrUpdate(object);
			s.flush();
			return object;
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	public void refresh(final T object) throws HibernateException {
		try {
			getSession(false).refresh(object);
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	public void delete(final T object) throws HibernateException {
		try {
			getSession(false).delete(object);

		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public T load(final PK primaryKey) throws HibernateException {
		try {
			final Session s = getSession(false);
			final Object o = s.load(objectClass, primaryKey);
			return (T) o;
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public T get(final PK primaryKey) throws HibernateException {
		try {
			final Session s = getSession(false);
			final Object o = s.load(objectClass, primaryKey);
			return (T) o;
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	public int listAllPageCount() {
		final List<T> l = listarTudo();
		final Integer i = new Integer(l.size());
		return i.intValue();
	}

	@SuppressWarnings("unchecked")
	public List<T> listarTudo() throws HibernateException {
		try {
			final Session s = getSession(false);
			final Criteria c = s.createCriteria(objectClass);

			return c.list();
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> listarTudo(final int first, final int max)
			throws HibernateException {
		try {
			final Session s = getSession(false);
			final Criteria c = s.createCriteria(objectClass);
			if (first != 0) {
				c.setFirstResult(first);
			}
			if (max != 0) {
				c.setMaxResults(max);
			}
			return c.list();
		} catch (final HibernateException ex) {

			throw new HibernateException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> consulta(String atributo, String query) {
		final Session s = this.getSession(false);
		return s.createCriteria(this.objectClass).add(
				Restrictions.ilike(atributo, query + "%")).list();
	}

	public Criteria criarCriteria() {
		return this.getSession(false).createCriteria(this.objectClass);
	}

	@SuppressWarnings("unchecked")
	public Criteria criarCriteria(Class classe) {
		return this.getSession(false).createCriteria(classe);
	}

	public Query criarQuery(String consulta) {
		return this.getSession(false).createQuery(consulta);
	}
}
