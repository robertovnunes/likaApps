package hpdd.residential;

import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ResidentialDAOHibernate implements ResidentialDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void delete(Residential residential){
		this.session.delete(residential);
	}
	public void save(Residential residential){
		this.session.saveOrUpdate(residential);
	}
	public Residential load(Integer residential){
		return (Residential) this.session.get(Residential.class, residential);
	}
	@SuppressWarnings("unchecked")
	public List<Residential> list(Integer id) {
		Query q1 = this.session.createQuery("select r from Residential r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}
	public Notification getNotification(Integer iduser) {
		System.out.println(new Date()); 
		System.out.println("iduser = " + iduser);
		String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("iduser", iduser);
		return (Notification) consult.uniqueResult();
	}
	public Notification getNotificationToUPDATE(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select n from Notification n where n.ativo=1 and n.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (Notification) consult.uniqueResult();
	}
	
}
