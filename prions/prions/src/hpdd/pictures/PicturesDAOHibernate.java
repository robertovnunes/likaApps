package hpdd.pictures;

import java.util.List;

import hpdd.notification.Notification;

import org.hibernate.Query;
import org.hibernate.Session;

public class PicturesDAOHibernate implements PicturesDAO {
	private Session session;
	
	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public void save(Pictures pictures) {
		this.session.save(pictures);
		
	}

	@Override
	public Notification getNotification(Integer iduser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notification getNotificationToUPDATE(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select n from Notification n where n.ativo=1 and n.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (Notification) consult.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Pictures> listPictures(Integer id) {
		System.out.println("Id no hib: "+ id);
		
		Query q1 = this.session
				//.createQuery("select g from Paper g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
				.createQuery("from Pictures where notification.ativo=1 and notification.user.iduser=:id");
		q1.setInteger("id", id);
		return q1.list();
	}

	@Override
	public void save(PicturesPaper picturesPaper) {
		this.session.save(picturesPaper);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pictures> listPicturesPaper(Integer id) {
		Query q1 = this.session
				//.createQuery("select g from Paper g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
				.createQuery("from PicturesPaper where individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1");
		q1.setInteger("id", id);
		return q1.list();
	}
}
