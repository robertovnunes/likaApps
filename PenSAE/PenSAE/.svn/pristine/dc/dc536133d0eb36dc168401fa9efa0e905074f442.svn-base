package genericos;

import java.io.Serializable;
import java.util.List;

/**
 * @author Jesus
 *
 */
public interface DAOGenerico<T, ID extends Serializable> {
	
	List<T> executarQueryLista(String query);
	
	T executarQueryObjeto(String query);
	
	T getPorId(int id);
	
	void merge(T entity);
	
	void persistir(T entity);
	
	void remover(T entity);
}
