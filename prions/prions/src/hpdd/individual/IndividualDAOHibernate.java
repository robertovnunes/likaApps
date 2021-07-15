package hpdd.individual;
import java.util.Date;
import java.util.List;
import org.hibernate.*;

import hpdd.notification.Notification;

public class IndividualDAOHibernate implements IndividualDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void delete(Individual individual){
		this.session.delete(individual);
	}
	public void save(Individual individual){
		this.session.save(individual);
	}
	public void update(Individual individual){
		this.session.merge(individual);
	}
	public Individual load(Integer individual){
		return (Individual) this.session.get(Individual.class, individual);
	}
	@SuppressWarnings("unchecked")
	public List<Individual> list(Integer id) {
		Query q1 = this.session.createQuery("select i from Individual i where i.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	
	}
	
	@SuppressWarnings("unchecked")
	public List<Individual> listSearch() {
		System.out.println("list");
		List<Individual> lista;
		Query q2 = this.session
		//		.createQuery("from General");
				.createQuery("select i from Individual i where i.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1)");
		lista = q2.list();
		return lista;
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
	@Override
	public boolean find(Integer codNotification) {
		String hql = "select n from Individual n where n.notification.codNotification=:codNotification";
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
	public void save(IndividualPaper individualPaper) {
		this.session.save(individualPaper);
		
	}
	@Override
	public void delete(IndividualPaper individualPaper) {
		this.session.delete(individualPaper);
		
	}
	@Override
	public IndividualPaper loadIndividualPaper(Integer individual) {
		System.out.println("loadIndividualPaper");
		return (IndividualPaper) this.session.get(IndividualPaper.class, individual);
	}
	@Override
	public List<IndividualPaper> listIndividualPaper(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<IndividualPaper> listSearchPaper() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void update(IndividualPaper individualPaper) {
		this.session.merge(individualPaper);
		
	}
	@Override
	public void restore(Integer id) {
		String hql = "UPDATE IndividualPaper SET ativo=:newativo WHERE ativo=:oldativo and paper.id=:id";
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setBoolean("newativo",false);
		updatedEntities.setBoolean( "oldativo",true);
		updatedEntities.setInteger("id", id);
		updatedEntities.executeUpdate();
		
	}
	@Override
	public void activateIndPaper(Integer id) {
		String hql = "UPDATE IndividualPaper i SET ativo=:newativo WHERE i.id=:id";
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setBoolean("newativo",true);
		updatedEntities.setInteger("id", id);
		updatedEntities.executeUpdate();
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Individual> listSearchPublic(Integer id) {
		Query q1 = this.session.createQuery("select i from Individual i where i.notification.codNotification = :id");
		q1.setInteger("id", id);
		return q1.list();
	}
	
	
}

