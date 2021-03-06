package hpdd.clinData;

import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ClinDataDAOHibernate implements ClinDataDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public void save(ClinData clinData) {
		this.session.save(clinData);

	}
	
	@Override
	public void update(ClinData clinData) {
		this.session.merge(clinData);
		
	}

	@Override
	public void delete(ClinData clinData) {
		this.session.delete(clinData);

	}

	@Override
	public ClinData load(Integer clinData) {
		return (ClinData) this.session.get(ClinData.class, clinData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ClinData> list(Integer id) {
		Query q1 = this.session
				.createQuery("select c from ClinData c where c.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}

	@Override
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
	
	public boolean find(Integer codNotification) {
		String hql = "select n from ClinData n where n.notification.codNotification=:codNotification";
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



	@SuppressWarnings("unchecked")
	@Override
	public List<ClinData> listDataNotifSearch(Integer id) {
		Query q1 = this.session.createQuery("select c from ClinData c where c.notification.codNotification =:id)");
		q1.setInteger("id",id);
		return q1.list();
	}
	}
