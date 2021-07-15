package hpdd.user;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;

public class UserDAOHibernate implements UserDAO {
	private Session session;
	
	public void setSession(Session session) {
		this.session = session;
	}


	public void save(User user) {
		this.session.save(user);

	}


	public void update(User user) {
	
		this.session.update(user);

	}

	public void delete(User user) {
		this.session.delete(user);

	}

	public User load(Integer iduser) {
		return (User) this.session.get(User.class, iduser);

	}

	public User findEmail(String email) {
		String hql = "select u from User u where u.email = :email";
		Query consult = this.session.createQuery(hql);
		consult.setString("email", email);
		return (User) consult.uniqueResult();

	}

	@SuppressWarnings("unchecked")

	public List<User> list() {
		return this.session.createCriteria(User.class).list();
	}

}
