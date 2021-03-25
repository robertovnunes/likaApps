

package clin.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public abstract class DaoGenerico<T, PK extends Serializable> extends HibernateDaoSupport implements InterfaceDao<T, PK> {
    private final Class<T> objectClass;
    private static final Log logger = LogFactory.getLog(DaoGenerico.class);
    public DaoGenerico(final Class<T> objectClass) {
        this.objectClass = objectClass;
    }

    public Class<T> getObjectClass() {
        return this.objectClass;
    }
    public T save(final T object) {
        try {
            final Session s = getSession(false);
            s.save(object);
            s.flush();
            return object;
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }

    public void update(final T object) {
        try {
            final Session s = getSession(false);
            s.update(object);
            s.flush();
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }
    
    public T saveOrUpdate(final T object) {
        try {
        	 final Session s = getSession(false);
             s.saveOrUpdate(object);
             s.flush();
             return object;
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }
    

    public void refresh(final T object) {
        try {
            getSession(false).refresh(object);
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }

    public void delete(final T object) {
        try {
            getSession(false).delete(object);
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }

    @SuppressWarnings("unchecked")
    public T load(final PK primaryKey) {
        try {
            final Session s = getSession(false);
            final Object o = s.load(objectClass, primaryKey);
            return (T) o;
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }

    @SuppressWarnings("unchecked")
    public T get(final PK primaryKey) {
        try {
            final Session s = getSession(false);
            final Object o = s.load(objectClass, primaryKey);
            return (T) o;
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }





	public int listAllPageCount() {
        final List<T> l = listarTudo();
        final Integer i = new Integer(l.size());
        return i.intValue();
    }


    @SuppressWarnings("unchecked")
    public List<T> listarTudo() {
        try {
            final Session s = getSession(false);
            final Criteria c = s.createCriteria(objectClass);
          
            return c.list();
        } catch (final HibernateException ex) {
        	DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }


    @SuppressWarnings("unchecked")
    public List<T> listarTudo(final int first, final int max) {
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
            DaoGenerico.logger.error(ex);
            throw convertHibernateAccessException(ex);
        }
    }

    
	@SuppressWarnings("unchecked")
	public List<T> consulta(String atributo, String query){
		final Session  s = this.getSession(false);
		return s.createCriteria(this.objectClass).add(Restrictions.ilike(atributo, "%" + query + "%")).list();
	}
	
	public Criteria criarCriteria(){
		return this.getSession(false).createCriteria(this.objectClass);
	}
	
	
	
		

    
    
}

