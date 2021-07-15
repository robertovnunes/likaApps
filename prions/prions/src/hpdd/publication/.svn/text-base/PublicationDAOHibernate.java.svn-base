package hpdd.publication;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class PublicationDAOHibernate implements PublicationDAO {
private Session session;
	
	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public void save(Publication publication) {
		this.session.saveOrUpdate(publication);
		
	}

	@Override
	public void delete(Publication publication) {
		this.session.delete(publication);
		
	}

	@Override
	public Publication load(Integer publication) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Publication> listPub() {
		Query q1 = this.session.createQuery("select p from Publication p");
		return q1.list();
	}
}
