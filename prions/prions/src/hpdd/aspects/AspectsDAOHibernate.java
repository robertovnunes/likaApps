package hpdd.aspects;

import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class AspectsDAOHibernate implements AspectsDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void save(Aspects aspects) {
		this.session.save(aspects);
	}

	@Override
	public void delete(Aspects aspects) {
		this.session.delete(aspects);
	}

	@Override
	public Aspects load(Integer aspects) {
		return (Aspects) this.session.get(Aspects.class, aspects);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Aspects> list(Integer id) {
		Query q1 = this.session
				.createQuery("select a from Aspects a where a.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}

	@SuppressWarnings("unchecked")
	public List<Aspects> listSearchPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select a from Aspects a where a.notification.codNotification =:id)");
		q1.setInteger("id", id);
		return q1.list();
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

	public Notification getNotificationToUPDATE(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select n from Notification n where n.ativo=1 and n.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (Notification) consult.uniqueResult();
	}

	@Override
	public boolean find(Integer codNotification) {
		String hql = "select n from Aspects n where n.notification.codNotification=:codNotification";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("codNotification", codNotification);
		if (consult.uniqueResult() == null) {
			System.out.println("find => vazio");
			return false;
		} else {
			System.out.println("find => achou");
			return true;
		}
	}

	@Override
	public void update(Aspects selected) {
		this.session.merge(selected);

	}
}
