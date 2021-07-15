package hpdd.images;

import hpdd.doctor.Doctor;
import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class ImagesDAOHibernate implements ImagesDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	@Override
	public void save(Images images) {
		this.session.saveOrUpdate(images);
		
	}

	@Override
	public void delete(Images images) {
		this.session.delete(images);
		
	}

	@Override
	public Images load(Integer images) {
		return (Images) this.session.get(Images.class, images);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Images> list(Doctor user) {
		Criteria criteria = this.session.createCriteria(Images.class);
		criteria.add(Restrictions.eq("user", user));
		return criteria.list();
	}

	@Override
	public Notification getNotification(Integer iduser) {
		System.out.println(new Date()); 
		System.out.println("iduser = " + iduser);
		String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("iduser", iduser);
		return (Notification) consult.uniqueResult();
	}
	

}
