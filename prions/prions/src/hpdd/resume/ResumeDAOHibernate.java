package hpdd.resume;

import hpdd.resume.Resume;
import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ResumeDAOHibernate implements ResumeDAO{
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void delete(Resume resume){
		this.session.delete(resume);
	}
	public void save(Resume resume){
		this.session.save(resume);
	}
	public void update(Resume resume) {
		this.session.merge(resume);
	}

	public Resume load(Integer resume){
		return (Resume) this.session.get(Resume.class, resume);
	}
	@SuppressWarnings("unchecked")
	public List<Resume> list(Integer id) {
		//Criteria criteria = this.session.createCriteria(Resume.class);
		//criteria.add(Restrictions.eq("user", user));
		//return criteria.list();
		System.out.println("list");
		System.out.println(id);

		Query q1 = this.session
				.createQuery("select g from Resume g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}
	
	public Notification getNotification(Integer iduser) {
		//String hql = "select max(cod_patient), cod_user, creation_date from Patient order by creation_date";
		//String hql = "select p from Patient p order by creation_date";
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
