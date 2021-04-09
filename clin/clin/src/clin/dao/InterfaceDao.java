package clin.dao;

import java.io.Serializable;
import java.util.List;



public interface InterfaceDao<T, PK extends Serializable> {
	@SuppressWarnings("unchecked")
	public abstract Class getObjectClass();

	public abstract T save(final T object);

	public abstract T saveOrUpdate(final T object);

	public abstract void update(final T object);

	public abstract void refresh(final T object);

	public abstract void delete(final T object);

	public abstract T load(final PK primaryKey);

	public abstract T get(final PK primaryKey);

	public abstract int listAllPageCount();


	public abstract List<T> listarTudo();

	public abstract List<T> listarTudo(final int first, final int max);
}
