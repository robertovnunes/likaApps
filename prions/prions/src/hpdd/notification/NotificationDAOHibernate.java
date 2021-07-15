package hpdd.notification;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

//import hpdd.auxiliar.NotificationCode;
import hpdd.doctor.*;

public class NotificationDAOHibernate implements NotificationDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}
	public void delete(Notification patient){
		this.session.delete(patient);
	}
	public void save(Notification patient){
		System.out.println("Entrou 3");
		this.session.saveOrUpdate(patient);
	}
	public Notification load(Integer patient){
		return (Notification) this.session.get(Notification.class, patient);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notification> list(Doctor user) {
	//public List<Notification> list(Integer user) {
	//public List<NotificationCode> list(Integer user) {
		Criteria criteria = this.session.createCriteria(Notification.class);
		criteria.add(Restrictions.eq("user", user));
		criteria.addOrder(Order.desc("creationDate"));
		return criteria.list();
		//String hql = "select new hpdd.auxiliar.NotificationCode(cast(concat(ucase(substring(g.country,3,3)),lpad(d.iduser,4,0),lpad(n.codNotification,4,0)) as string),n.codNotification, n.creationDate, n.user, n.ativo , n.status, n.type)  from Doctor d, Notification n, General g where d.iduser=:iduser and d.iduser=n.user.iduser and n.codNotification=g.notification.codNotification";
		//String hql = "select new hpdd.notification.Notification(cast(concat(ucase(substring(g.country,3,3)),lpad(d.iduser,4,0),lpad(n.codNotification,4,0)) as string),n.codNotification, n.creationDate, n.user, n.ativo , n.status, n.type)  from Doctor d, Notification n, General g, Paper p where d.iduser=:iduser and d.iduser=n.user.iduser and (n.codNotification=g.notification.codNotification or n.codNotification=p.notification.codNotification) order by n.creationDate desc";
		//Query consult = this.session.createQuery(hql);
		//consult.setInteger("iduser", user);
		//return consult.list();
	}
	
	public void restore(Integer id) {
		System.out.println("Restore!");
		/*String hql = "UPDATE Notification SET ativo=0  WHERE ativo=1";
		Query consult = this.session.createSQLQuery(hql);*/
		String hql = "UPDATE Notification SET ativo=:newativo  WHERE ativo=:oldativo and user.iduser=:id";
		//String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		//Query consult = this.session.createQuery(hql);
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setBoolean("newativo",false);
		updatedEntities.setBoolean( "oldativo",true);
		updatedEntities.setInteger("id", id);
		updatedEntities.executeUpdate();
	}
	@Override
	public void restoreSearch() {
		System.out.println("Restore!");
		/*String hql = "UPDATE Notification SET ativo=0  WHERE ativo=1";
		Query consult = this.session.createSQLQuery(hql);*/
		String hql = "UPDATE Notification SET ativo=:newativo  WHERE ativo=:oldativo";
		//String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		//Query consult = this.session.createQuery(hql);
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setBoolean("newativo",false);
		updatedEntities.setBoolean( "oldativo",true);
		updatedEntities.executeUpdate();
		
	}
	public void change(Integer id) {
		System.out.println("Restore!");
		/*String hql = "UPDATE Notification SET ativo=0  WHERE ativo=1";
		Query consult = this.session.createSQLQuery(hql);*/
		String hql = "UPDATE Notification SET status=:finalizado  WHERE ativo=:ativo and user=:iduser";
		//String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		//Query consult = this.session.createQuery(hql);
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setString("finalizado", "Completed");
		updatedEntities.setBoolean("ativo",true);
		updatedEntities.setInteger("iduser", id);
		updatedEntities.executeUpdate();
	}
	@Override
	public void keep(Integer iduser) {
		System.out.println("Restore!");
		/*String hql = "UPDATE Notification SET ativo=0  WHERE ativo=1";
		Query consult = this.session.createSQLQuery(hql);*/
		String hql = "UPDATE Notification SET status=:andamento  WHERE ativo=:ativo and user=:iduser";
		//String hql = "select n from Notification n where n.creationDate = (select max(n1.creationDate) from Notification n1) and n.user=:iduser";
		//Query consult = this.session.createQuery(hql);
		Query updatedEntities = this.session.createQuery(hql);
		updatedEntities.setString("andamento", "Incomplete");
		updatedEntities.setBoolean("ativo",true);
		updatedEntities.setInteger("iduser", iduser);
		updatedEntities.executeUpdate();
	}
	/*@SuppressWarnings("unchecked")
	@Override
	public List<Notification> listCodNotif(Integer user) {
			
			Query q1 = this.session.createQuery("from Notification where ativo=:ativo and user=:user");
			q1.setBoolean("ativo",true);
			q1.setInteger("user", user);
			return q1.list();
			
			
	}*/
	@SuppressWarnings("unchecked")
	
	public List<Notification> list2(Integer iduser) {
		Query q1 = this.session.createQuery("from Notification where ativo=:ativo and user.iduser=:iduser");
		q1.setBoolean("ativo",true);
		q1.setInteger("iduser", iduser);
		return q1.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Notification> listUniqueSearch(Integer idSearch) {
		System.out.println("NotificationDAOHibernate (listUniqueSearch): " + idSearch);
		Query q1 = this.session.createQuery("from Notification where codNotification=:idSearch");
		q1.setInteger("idSearch", idSearch);
		return q1.list();
	}
	@Override
	public List<Notification> listNotifSearch(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
