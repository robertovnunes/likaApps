package hpdd.suspicion;

import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class SuspicionDAOHibernate implements SuspicionDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void save(Suspicion suspicion) {
		this.session.save(suspicion);
		
	}
	public void update(Suspicion suspicion){
		this.session.merge(suspicion);
	}

	@Override
	public void delete(Suspicion suspicion) {
		this.session.delete(suspicion);
		
	}

	@Override
	public Suspicion load(Integer suspicion) {
		return (Suspicion) this.session.get(Suspicion.class, suspicion);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Suspicion> list(Integer codNotif) {
		Query q1 = this.session.createQuery("select s from Suspicion s where individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1");
		q1.setInteger("codNotif", codNotif);
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

	public boolean find(Integer codNotification) {
			String hql = "select n from Suspicion n where n.notification.codNotification=:codNotification";
			Query consult = this.session.createQuery(hql);
			consult.setInteger("codNotification", codNotification);
			if(consult.uniqueResult()==null){
				System.out.println("find => vazio");
				return false;
			}else {
				System.out.println("find => achou");
				return true;
			}
		
	}

	


	
}
