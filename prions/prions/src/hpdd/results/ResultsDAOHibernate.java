package hpdd.results;

import hpdd.results.Results;
import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ResultsDAOHibernate implements ResultsDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void delete(Results results) {
		this.session.delete(results);
	}

	public void save(Results results) {
		this.session.saveOrUpdate(results);
	}

	public Results load(Integer results) {
		return (Results) this.session.get(Results.class, results);
	}

	@SuppressWarnings("unchecked")
	public List<Results> list(Integer id) {
		Query q1 = this.session
				.createQuery("select r from Results r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
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
		String hql = "select n from Results n where n.notification.codNotification=:codNotification";
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
	public void update(Results selected) {
		this.session.merge(selected);

	}

	// results paper
	@SuppressWarnings("unchecked")
	@Override
	public List<ResultsPaper> listResultsPaper(Integer codNotif) {
		Query q1 = this.session
				.createQuery("select r from ResultsPaper r where individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1");
		q1.setInteger("codNotif", codNotif);
		return q1.list();
	}

	@Override
	public void save(ResultsPaper resultsPaper) {
		this.session.saveOrUpdate(resultsPaper);

	}

	@Override
	public void delete(ResultsPaper resultsPaper) {
		this.session.delete(resultsPaper);

	}

	@Override
	public void update(ResultsPaper selected) {
		System.out.println("Update respap");
		this.session.merge(selected);

	}

	@Override
	public ResultsPaper loadResultsPaper(Integer results) {
		return (ResultsPaper) this.session.get(ResultsPaper.class, results);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ResultsPaper> showResultsPaper(Integer id) {
		Query q1 = this.session
				.createQuery("select r from ResultsPaper r where individualPaper.paper.notification.codNotification=:id and individualPaper.ativo=1");
		q1.setInteger("id", id);
		return q1.list();
	}

	public ResultsPaper getResultsPaper(Integer iduser) { // pega o ultimo
															// result (ativo)
		System.out.println("iduser = " + iduser);
		String hql = "select i from ResultsPaper i where individualPaper.ativo=1 and individualPaper.paper.notification.ativo=1 and individualPaper.paper.notification.creationDate = (select max(n1.creationDate) from Notification n1) and individualPaper.paper.notification.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (ResultsPaper) consult.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Results> listSearchPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select r from Results r where r.notification.codNotification =:id)");
		q1.setInteger("id", id);
		return q1.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ResultsPaper> showResultsPaperPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select r from ResultsPaper r where individualPaper.paper.notification.codNotification=:id");
		q1.setInteger("id", id);
		return q1.list();
	}
}
