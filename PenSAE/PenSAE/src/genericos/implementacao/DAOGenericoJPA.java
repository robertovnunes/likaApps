package genericos.implementacao;

import entityManagerFactory.EntityManageFactoryImpl;
import genericos.DAOGenerico;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;

/**
 * @author Jesus
 *
 */
public abstract class DAOGenericoJPA<T, ID extends Serializable>
implements DAOGenerico<T, ID> {

	private Class<T> classPersistente;

	private EntityManager manager;

	@SuppressWarnings("unchecked")
	public DAOGenericoJPA() {
		this.classPersistente = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];

		manager = EntityManageFactoryImpl.currentEntityManager();
	}

	@SuppressWarnings("unchecked")
	public List<T> executarQueryLista(String query){

		List<T> retorno = null;

		try {
			retorno = ((List<T>) this.getManager().createNativeQuery(query, classPersistente)
					.getResultList());

		} catch (Exception e) {

			System.out.println(e.getMessage());
		}

		return retorno;
	}

	@SuppressWarnings("unchecked")
	public T executarQueryObjeto(String query){
		T retorno = null;

		try {
			retorno = ((T) this.getManager().createNativeQuery(query, classPersistente)
					.getSingleResult());

		} catch (Exception e) {

			System.out.println(e.getMessage());
		}

		return retorno;
	}

	public EntityManager getManager() {
		return manager;
	}

	public Class<T> getPersistentClass() {
		return classPersistente;
	}

	public void limpar() {
		getManager().clear();
	}

	public void merge(T entity){

		getManager().getTransaction().begin();
		getManager().merge(entity);
		getManager().getTransaction().commit();

	}

	public void persistir(T entity) {

		getManager().getTransaction().begin();
		getManager().persist(entity);
		getManager().getTransaction().commit();
	}

	public void remover(T entity) {

		getManager().getTransaction().begin();
		getManager().remove(entity);
		getManager().getTransaction().commit();
	}

	public void setManager(EntityManager manager) {
		this.manager = manager;
	}
}
