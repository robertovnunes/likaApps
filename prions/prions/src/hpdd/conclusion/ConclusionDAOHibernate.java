package hpdd.conclusion;

import hpdd.conclusion.Conclusion;
import hpdd.notification.Notification;
import hpdd.conclusion.ConclusionPaper;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ConclusionDAOHibernate implements ConclusionDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void delete(Conclusion conclusion) {
		this.session.delete(conclusion);
	}

	public void save(Conclusion conclusion) {
		this.session.save(conclusion);
	}

	public Conclusion load(Integer conclusion) {
		return (Conclusion) this.session.get(Conclusion.class, conclusion);
	}

	@SuppressWarnings("unchecked")
	public List<Conclusion> list(Integer id) {
		Query q1 = this.session
				.createQuery("select c from Conclusion c where c.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}

	public Notification getNotification(Integer iduser) {
		// String hql =
		// "select max(cod_patient), cod_user, creation_date from Patient order by creation_date";
		// String hql = "select p from Patient p order by creation_date";
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
		String hql = "select n from Conclusion n where n.notification.codNotification=:codNotification";
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
	public void update(Conclusion selected) {
		this.session.merge(selected);

	}

	// conclusion paper
	@SuppressWarnings("unchecked")
	@Override
	public List<ConclusionPaper> listConclusionPaper(Integer codNotif) {
		Query q1 = this.session
				.createQuery("select r from ConclusionPaper r where individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1");
		q1.setInteger("codNotif", codNotif);
		return q1.list();
	}

	@Override
	public void save(ConclusionPaper conclusionPaper) {
		this.session.saveOrUpdate(conclusionPaper);

	}

	@Override
	public void delete(ConclusionPaper conclusionPaper) {
		this.session.delete(conclusionPaper);

	}

	@Override
	public void update(ConclusionPaper selected) {
		this.session.merge(selected);

	}

	@Override
	public ConclusionPaper loadConclusionPaper(Integer conclusion) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ConclusionPaper> showConclusionPaper(Integer id) {
		Query q1 = this.session
				.createQuery("select r from ConclusionPaper r where individualPaper.paper.notification.codNotification=:id and individualPaper.ativo=1");
		q1.setInteger("id", id);
		return q1.list();
	}

	public ConclusionPaper getConclusionPaper(Integer id) { // pega o ultimo
																// result
																// (ativo)
		System.out.println("iduser = " + id);
		String hql = "select i from ConclusionPaper i where individualPaper.ativo=1 and individualPaper.paper.notification.ativo=1 and individualPaper.paper.notification.creationDate = (select max(n1.creationDate) from Notification n1) and individualPaper.paper.notification.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", id);
		return (ConclusionPaper) consult.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Conclusion> listSearchPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select c from Conclusion c where c.notification.codNotification = :id");
		q1.setInteger("id", id);
		return q1.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ConclusionPaper> listConclusionPaperPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select r from ConclusionPaper r where individualPaper.paper.notification.codNotification=:id");
		q1.setInteger("id", id);
		return q1.list();
	}


}
