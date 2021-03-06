package hpdd.source;
import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class SourceDAOHibernate implements SourceDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void delete(Source source) {
		this.session.delete(source);
	}

	public void save(Source source) {
		this.session.save(source);
	}

	public Source load(Integer source) {
		return (Source) this.session.get(Source.class, source);
	}

	@SuppressWarnings("unchecked")
	public List<Source> list(Integer id) {
		System.out.println("list");
		System.out.println(id);

		Query q1 = this.session
				.createQuery("select g from Source g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Source> listSearch() {
		System.out.println("list");
		List<Source> lista;
		Query q2 = this.session
		//		.createQuery("from General");
				.createQuery("select g from Source g where g.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1)");
		lista = q2.list();
		return lista;
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
		String hql = "select n from Source n where n.notification.codNotification=:codNotification";
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

	@Override
	public void update(Source selected) {
		this.session.merge(selected);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Source> listSearchPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select g from Source g where g.notification.codNotification=:id");
		q1.setInteger("id", id);
		return q1.list();
	}

}
