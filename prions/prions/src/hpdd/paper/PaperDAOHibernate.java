	package hpdd.paper;

import hpdd.paper.Paper;
import hpdd.individual.IndividualPaper;
import hpdd.notification.Notification;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class PaperDAOHibernate implements PaperDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void delete(Paper paper){
		this.session.delete(paper);
	}
	public void save(Paper paper){
		this.session.saveOrUpdate(paper);
	}
	public Paper load(Integer paper){
		return (Paper) this.session.get(Paper.class, paper);
	}
	@SuppressWarnings("unchecked")
	public List<Paper> list(Integer id) {
		//Query q1 = this.session.createQuery("from Paper r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		Query q1 = this.session.createQuery("from Paper where notification.codNotification=:id and notification.ativo=:ativo");
		q1.setInteger("id", id);
		q1.setBoolean("ativo", true);
		return q1.list();
	}
	@SuppressWarnings("unchecked")
	public List<Paper> listaPaperNotif(Integer id) {
		//Query q1 = this.session.createQuery("from Paper r where r.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		System.out.println("entrou listaPaperNotif");
		Query q1 = this.session
				//.createQuery("select g from Paper g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
				.createQuery("from Paper where notification.ativo=1 and notification.user.iduser=:id)");
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
	public Paper getPaper(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select p from Paper p, Notification n where p.notification.user.iduser=:id and p.ativo=1 and p.notification.ativo=1";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (Paper) consult.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Paper> listSearch() {
		System.out.println("list");
		List<Paper> lista;
		Query q2 = this.session
		//		.createQuery("from General");
				.createQuery("select i from Paper i where i.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1)");
		lista = q2.list();
		return lista;
	}
	@Override
	public void update(Paper selected) {
		this.session.merge(selected);
		
	}
	
	public void restore(Integer codPaper) {
		System.out.println("(PaperDAOHibernate) Restore");
		System.out.println("(PaperDAOHibernate) codPaper = " + codPaper);
		/*String hql = "UPDATE Notification SET ativo=0  WHERE ativo=1";
		Query consult = this.session.createSQLQuery(hql);*/
		String hql = "UPDATE IndividualPaper SET ativo=:newativo  WHERE ativo=:oldativo and paper.id=:codPaper" ;
		//String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		//Query consult = this.session.createQuery(hql);
		Query updatedEntities = this.session.createQuery(hql);
	    //updatedEntities.setBoolean( "at",true);
		updatedEntities.setBoolean("newativo",false);
		updatedEntities.setBoolean( "oldativo",true);
		updatedEntities.setInteger("codPaper", codPaper);
		updatedEntities.executeUpdate();
	}
	public IndividualPaper getIndividualPaper(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select i from IndividualPaper i where i.ativo=1 and paper.notification.ativo=1 and paper.notification.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (IndividualPaper) consult.uniqueResult();
	}
	public IndividualPaper getIndividualPaperToUpdate(Integer iduser) {
		System.out.println("iduser = " + iduser);
		String hql = "select i from IndividualPaper i where i.ativo=1 and paper.notification.ativo=1 and paper.notification.creationDate = (select max(n1.creationDate) from Notification n1) and paper.notification.user.iduser=:id";
		Query consult = this.session.createQuery(hql);
		consult.setInteger("id", iduser);
		return (IndividualPaper) consult.uniqueResult();}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IndividualPaper> listaIndividualPaperNotif(Integer codNotification) {
		System.out.println("(listaIndividualPaperNotif) codnotification: "+ codNotification);
		Query q1 = this.session
				.createQuery("select r from IndividualPaper r where paper.notification.codNotification=:codNotif and paper.ativo=1");
		q1.setInteger("codNotif", codNotification);
		return q1.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<IndividualPaper> listaUniqueIndividualPaper(Integer codNotification) {
		System.out.println("(listaIndividualPaperNotif) codnotification: "+ codNotification);
		Query q1 = this.session
				.createQuery("select r from IndividualPaper r where paper.notification.codNotification=:codNotif and paper.ativo=1 and r.ativo=1");
		q1.setInteger("codNotif", codNotification);
		return q1.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<IndividualPaper> listaUniqueIndividualPaperSearch(Integer id) {
		Query q1 = this.session
				.createQuery("select r from IndividualPaper r where paper.notification.codNotification=:id");
		q1.setInteger("id", id);
		return q1.list();
	}
}
