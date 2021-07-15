package hpdd.faq;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class FaqDAOHibernate implements FaqDAO {
	private Session session;
	
	public void setSession(Session session) {
		this.session = session;
	}
	
	@Override
	public void save(Faq faq) {
		this.session.saveOrUpdate(faq);
		
	}

	@Override
	public void delete(Faq faq) {
		this.session.delete(faq);
		
	}

	@Override
	public Faq load(Integer faq) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Faq> listFAQ() {
		Query q1 = this.session.createQuery("select f from Faq f");
		return q1.list();
	}
	
	
}