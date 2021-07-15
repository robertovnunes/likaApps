package br.com.lika.hpv.interceptor;

import br.com.lika.hpv.dao.DAOFactory;
import org.vraptor.Interceptor;
import org.vraptor.LogicException;
import org.vraptor.LogicFlow;
import org.vraptor.annotations.Out;
import org.vraptor.view.ViewException;

public class DAOInterceptor implements Interceptor {
	private final DAOFactory factory = new DAOFactory();

	public void intercept(LogicFlow flow) throws LogicException, ViewException {
		flow.execute();

		if (this.factory.hasTransaction()) {
			this.factory.rollback();
		}
		this.factory.close();
	}

	@Out(key = "br.com.lika.hpv.dao.DAOFactory")
	public DAOFactory getFactory() {
		return this.factory;
	}
}

/*
 * Location: D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name: br.com.lika.hpv.interceptor.DAOInterceptor JD-Core Version:
 * 0.6.0
 */