package hpdd.paper;

import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class SymptomDAOHibernate implements SymptomDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void deleteSym(Symptoms symptom){
		this.session.delete(symptom);
	}
	public void save(Symptoms symptom){
		//this.session.saveOrUpdate(symptom);
		this.session.save(symptom);
	}
	public Symptoms load(Integer symptom){
		return (Symptoms) this.session.get(Symptoms.class, symptom);
	}
	@SuppressWarnings("unchecked")
	public List<Symptoms> list(Integer id) { // sintomas finais errado
		System.out.println("Id no hib: "+ id);
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification=:id");
		//q1.setInteger("id", id);
		Query q1 = this.session.createQuery("from Symptoms where notification.codNotification=:id and notification.ativo=:ativo and type=:final");
		q1.setInteger("id", id);
		q1.setBoolean("ativo", true);
		q1.setString("final", "final");
		System.out.println("passou aki no hib");
		return q1.list();
	}
	@SuppressWarnings("unchecked")
	public List<Symptoms> listaSymptomsNotif(Integer codNotif) { // sintomas finais
		System.out.println("(SymDAOHIb) codNotif: "+ codNotif);
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification=:id");
		//q1.setInteger("id", id);
		Query q1 = this.session
				//.createQuery("select g from Paper g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
				.createQuery("from Symptoms where type=:final and individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1 and individualPaper.paper.notification.ativo=1");
		//q1.setInteger("id", id);
		q1.setString("final", "final");
		q1.setInteger("codNotif", codNotif);
		return q1.list();
	}
	public Notification getNotification(Integer iduser) { //TENTAR PEGAR AS NOTIFICAÇÕES ATIVAS(ERRO: sintomas aparecem antes de começar a NOTIFICAR POR PAPER) => remover MAX
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
	@SuppressWarnings("unchecked")
	@Override
	public List<Symptoms> listSearch() {
		System.out.println("list");
		List<Symptoms> lista;
		Query q2 = this.session
		//		.createQuery("from General");
				.createQuery("select i from Symptoms i where i.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1)");
		lista = q2.list();
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Symptoms> listFirstSym(Integer codNotif) {
		System.out.println("(SymDAOHIb) codNotif: "+ codNotif);
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		//Query q1 = this.session.createQuery("select r from Symptoms r where r.notification.codNotification=:id");
		//q1.setInteger("id", id);
		Query q1 = this.session
				//.createQuery("select g from Paper g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
				.createQuery("from Symptoms where type=:first and individualPaper.paper.notification.codNotification=:codNotif and individualPaper.ativo=1 and individualPaper.paper.notification.ativo=1");
		//q1.setInteger("id", id);
		q1.setString("first", "first");
		q1.setInteger("codNotif", codNotif);
		return q1.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Symptoms> listSymNotifSearch(Integer id) {
		Query q1 = this.session.createQuery("select s from Symptoms s where s.individualPaper.paper.notification.codNotification =:id)");
		q1.setInteger("id",id);
		return q1.list();
	}
	
}
