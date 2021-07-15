package hpdd.doctor;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

public class DoctorDAOHibernate implements DoctorDAO {
	private Session session;
	
	public void setSession(Session session) {
		this.session = session;
	}


	public void save(Doctor user) {
		this.session.save(user);

	}


	public void update(Doctor user) {
		if (user.getPermisson()==null||user.getPermisson().size()==0) {
			Doctor userPermission = this.load(user.getIduser());
			user.setPermisson(userPermission.getPermisson());
			this.session.evict(userPermission);
		}
		this.session.update(user);
	}

	public void delete(Doctor user) {
		this.session.delete(user);

	}

	public Doctor load(Integer iduser) {
		return (Doctor) this.session.get(Doctor.class, iduser);

	}

	public Doctor findEmail(String email) {
		String hql = "select u from Doctor u where u.email = :email";
		Query consult = this.session.createQuery(hql);
		consult.setString("email", email);
		return (Doctor) consult.uniqueResult();

	}

	@SuppressWarnings("unchecked")

	public List<Doctor> list() {
		return this.session.createCriteria(Doctor.class).addOrder(Order.desc("date_reg")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Doctor> listLoggeddUser(Integer id) {
		Query q1 = this.session.createQuery("select d from Doctor d where d.iduser=:id");
		q1.setInteger("id", id);
		return q1.list();
	}


}
