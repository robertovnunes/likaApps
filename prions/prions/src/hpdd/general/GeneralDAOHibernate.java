package hpdd.general;

import java.util.Date;
import java.util.List;

import org.hibernate.*;

import hpdd.notification.Notification;

public class GeneralDAOHibernate implements GeneralDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	public void delete(General general) {
		this.session.delete(general);
	}

	public void save(General general) {
		this.session.save(general);
	}
	public void update(General general) {
		this.session.merge(general);
	}

	public General load(Integer general) {
		return (General) this.session.get(General.class, general);
	}

	@SuppressWarnings("unchecked")
	public List<General> list(Integer id) {
		System.out.println("list");
		System.out.println(id);

		Query q1 = this.session
				.createQuery("select g from General g where g.notification.codNotification in (select n.codNotification from Notification n where n.ativo=1 and n.user.iduser=:id)");
		q1.setInteger("id", id);
		return q1.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<General> listSearch() {
		System.out.println("list");
		List<General> lista;
		Query q2 = this.session
		//		.createQuery("from General");
				.createQuery("select g from General g where g.notification.codNotification = (select n.codNotification from Notification n where n.ativo=1)");
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

	// ////Filtro //////

	public List<General> listFiltro(String country, String state,
			String city, Integer age, String gender, String ethnicGroup,
			String educationalLevel, String zone,String progDementia, 
			String visualDisorder, String myoclonus, String cerebellarDisorders, 
			String persistentPainDys, String ataxy, String pyramidalSigns,
			String extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
			String sleepDisorders) {
		Query consult = null;
		
		if (country.isEmpty() && state.isEmpty() && city.isEmpty()
				&& age.equals(0) && gender.isEmpty() && ethnicGroup.isEmpty()
				&& educationalLevel.isEmpty() && zone.isEmpty()){
			String hql = "select DISTINCT g from General g where g.state=NULL";
			consult = this.session.createQuery(hql);
			System.out.println("vazio");
			@SuppressWarnings("unchecked")
			List<General> list = (List<General>) consult.list();
			return list;
		} else {

			String hql = "select DISTINCT g from General g, Individual i, Residential r, Notification n, ClinData c " +
					"where n.status ='Finalizado' and n.codNotification = g.notification.codNotification ";
			if (!country.isEmpty()) {
				hql = hql + " and g.country like :country";
				consult = this.session.createQuery(hql);
			}
			if (!state.isEmpty()) {
				hql = hql + " and g.state like :state";
				consult = this.session.createQuery(hql);
			}
			if (!city.isEmpty()) {
				hql = hql + " and g.city like :city";
				consult = this.session.createQuery(hql);
			}
			if (!age.equals(0)) {
				hql = hql + " and i.age = :age and g.notification.codNotification=i.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!ethnicGroup.isEmpty()) {
				hql = hql
						+ " and i.ethnicGroup like :ethnicGroup and g.notification.codNotification=i.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!gender.isEmpty()) {
				hql = hql
						+ " and i.gender= :gender and g.notification.codNotification=i.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!educationalLevel.isEmpty()) {
				hql = hql
						+ " and i.scholarity like :educationalLevel and g.notification.codNotification=i.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!zone.isEmpty()) {
				hql = hql
						+ " and r.zone like :zone and r.notification.codNotification=g.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			//clindata
			if (!progDementia.isEmpty()) {
				hql = hql
						+ " and c.progDementia= :progDementia and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!visualDisorder.isEmpty()) {
				hql = hql
						+ " and c.visualDisorder like :visualDisorder and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!myoclonus.isEmpty()) {
				hql = hql
						+ " and c.myoclonus like :myoclonus and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!cerebellarDisorders.isEmpty()) {
				hql = hql
						+ " and c.cerebellarDisorders like :cerebellarDisorders and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!persistentPainDys.isEmpty()) {
				hql = hql
						+ " and c.persistentPainDys like :persistentPainDys and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!ataxy.isEmpty()) {
				hql = hql
						+ " and c.ataxy like :ataxy and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!pyramidalSigns.isEmpty()) {
				hql = hql
						+ " and c.pyramidalSigns like :pyramidalSigns and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!extrapyramidalSigns.isEmpty()) {
				hql = hql
						+ " and c.extrapyramidalSigns like :extrapyramidalSigns and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!akineticMutism.isEmpty()) {
				hql = hql
						+ " and c.akineticMutism like :akineticMutism and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!psychiatricDisorders.isEmpty()) {
				hql = hql
						+ " and c.psychiatricDisorders like :psychiatricDisorders and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			if (!sleepDisorders.isEmpty()) {
				hql = hql
						+ " and c.sleepDisorders like = sleepDisorders and g.notification.codNotification=c.notification.codNotification";
				consult = this.session.createQuery(hql);
			}
			//linka nomes
			if (!country.isEmpty()) {
				consult.setString("country", "%" + country + "%");
			}
			if (!state.isEmpty()) {
				consult.setString("state", "%" + state + "%");
			}
			if (!city.isEmpty()) {
				consult.setString("city", "%" + city + "%");
			}
			if (!age.equals(0)) {
				consult.setInteger("age", age);
			}
			if (!ethnicGroup.isEmpty()) {
				consult.setString("ethnicGroup", "%" + ethnicGroup + "%");
			}
			if (!gender.isEmpty()) {
				consult.setString("gender", gender);
			}
			if (!educationalLevel.isEmpty()) {
				consult.setString("educationalLevel", "%" + educationalLevel
						+ "%");
			}
			if (!zone.isEmpty()) {
				consult.setString("zone", "%" + zone + "%");
			}
			//clindata
			if (!progDementia.isEmpty()) {
				consult.setString("progDementia", "%" + progDementia + "%");
			}
			if (!visualDisorder.isEmpty()) {
				consult.setString("visualDisorder", visualDisorder);
			}
			if (!myoclonus.isEmpty()) {
				consult.setString("myoclonus", "%" + myoclonus + "%");
			}
			if (!cerebellarDisorders.isEmpty()) {
				consult.setString("cerebellarDisorders", "%" + cerebellarDisorders + "%");
			}
			if (!persistentPainDys.isEmpty()) {
				consult.setString("persistentPainDys", "%" + persistentPainDys
						+ "%");
			}
			if (!ataxy.isEmpty()) {
				consult.setString("ataxy", "%" + ataxy + "%");
			}
			if (!pyramidalSigns.isEmpty()) {
				consult.setString("pyramidalSigns", "%" + pyramidalSigns + "%");
			}
			if (!extrapyramidalSigns.isEmpty()) {
				consult.setString("extrapyramidalSigns", "%" + extrapyramidalSigns
						+ "%");
			}
			if (!akineticMutism.isEmpty()) {
				consult.setString("akineticMutism", "%" + akineticMutism + "%");
			}
			if (!psychiatricDisorders.isEmpty()) {
				consult.setString("psychiatricDisorders", "%" + psychiatricDisorders
						+ "%");
			}
			if (!sleepDisorders.isEmpty()) {
				consult.setString("sleepDisorders", sleepDisorders);
			}

			System.out.println("listar");
			@SuppressWarnings("unchecked")
			List<General> list = (List<General>) consult.list();
			return list;
		}
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
	public List<General> listSearchPublic(Integer id) {
		Query q1 = this.session
				.createQuery("select r from General r where notification.codNotification=:id");
		q1.setInteger("id", id);
		return q1.list();
	}


}
