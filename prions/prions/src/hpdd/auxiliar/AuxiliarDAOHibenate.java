package hpdd.auxiliar;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class AuxiliarDAOHibenate implements AuxiliarDAO {
	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	public List<CasosPaises> listPaises() {

		/*
		 * Query q1 = this.session
		 * .createQuery("from General order by country");
		 */

		/*
		 * Como fazer!! Select campo1 as TX1, campo2 as TX2 from tab1 UNION ALL
		 * select campo3 as TX1, campo4 as TX2 from tab2
		 */

		Query q1 = this.session
				.createQuery("select new hpdd.auxiliar.CasosPaises(gen.country, count(gen)) from General AS gen where gen.notification.status='Finalizado' group by gen.country");
		System.out.println("Passou query paper");
		return q1.list();
	}

	@SuppressWarnings("unchecked")
	public List<CasosIdade> listIdade() {

		Query q1 = this.session
				.createQuery("select new hpdd.auxiliar.CasosIdade(str(ind.age), count(ind)) from Individual AS ind where ind.notification.status='Finalizado' group by ind.age");

		return q1.list();
	}

	@SuppressWarnings("unchecked")
	public List<CasosGenero> listGenero() {
		Query q1 = this.session
				.createQuery("select new hpdd.auxiliar.CasosGenero(str(ind.gender), count(ind)) from Individual AS ind where ind.notification.status='Finalizado' group by ind.gender");

		return q1.list();
	}

	@SuppressWarnings("unchecked")
	public List<CasosGenero> listGeneroPaper() {
		Query q1 = this.session
				.createQuery("select new hpdd.auxiliar.CasosGenero(str(ind.gender), count(ind)) from Paper AS ind where ind.notification.status='Finalizado' group by ind.gender");

		return q1.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CasosSintomas> listSintomas() {
		Query q1 = this.session
				.createQuery("select new hpdd.auxiliar.CasosGenero(str(gen.gender), count(gen)) from Individual AS gen group by gen.gender");

		return q1.list();
	}

	@Override
	public List<ResultadoBusca> listBusca2(Integer age, String country,
			String gender, String state) {

		List<ResultadoBusca> list = null;
		return list;
	}

	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @Override public List<ResultadoBusca> listBusca(String country, String
	 * state, String city, Integer age, String gender, String ethnicGroup,
	 * String educationalLevel, String zone, String progDementia, String
	 * visualDisorder, String myoclonus, String cerebellarDisorders, String
	 * persistentPainDys, String ataxy, String pyramidalSigns, String
	 * extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
	 * String sleepDisorders) {
	 * 
	 * List<ResultadoBusca> list = null; return list; }
	 */

	@SuppressWarnings({ "rawtypes", "unchecked", "null" })
	@Override
	public List<ResultadoBusca> listBusca(Integer age, String country,
			String gender, String state) {
		Query consult1 = null;
		Query consult2 = null;
		if (country.isEmpty() && state.isEmpty() && age.equals(0)
				&& gender.isEmpty()) {
			return consult1.list();
		} else {
			String hql1 = "select new hpdd.auxiliar.ResultadoBusca(ind.notification.codNotification, ind.age,ind.country,ind.gender,ind.state) from Individual ind, Notification notif where ind.notification.codNotification=notif.codNotification and notif.status='Completed' ";
			if (!country.isEmpty()) {
				hql1 = hql1 + " and ind.country like :country";
				consult1 = this.session.createQuery(hql1);
			}
			if (!state.isEmpty()) {
				hql1 = hql1 + " and ind.state like :state";
				consult1 = this.session.createQuery(hql1);
			}
			if (!gender.isEmpty()) {
				hql1 = hql1 + " and ind.gender like :gender";
				consult1 = this.session.createQuery(hql1);
			}
			if (!age.equals(0)) {
				hql1 = hql1
						+ " and ind.age = :age and ind.notification.codNotification=notif.codNotification";
				consult1 = this.session.createQuery(hql1);
			}
			if (!country.isEmpty()) {
				consult1.setString("country", "%" + country + "%");
			}
			if (!state.isEmpty()) {
				consult1.setString("state", "%" + state + "%");
			}
			if (!gender.isEmpty()) {
				consult1.setString("gender", gender);
			}
			if (!age.equals(0)) {
				consult1.setInteger("age", age);
			}
			String hql2 = "select distinct new hpdd.auxiliar.ResultadoBusca(indP.paper.notification.codNotification,indP.age,indP.country,indP.gender,indP.state) from IndividualPaper indP, Notification notif where indP.paper.notification.codNotification=notif.codNotification and notif.status='Completed' ";
			if (!country.isEmpty()) {
				hql2 = hql2 + " and indP.country like :country";
				consult2 = this.session.createQuery(hql2);
			}
			if (!state.isEmpty()) {
				hql2 = hql2 + " and indP.state like :state";
				consult2 = this.session.createQuery(hql2);
			}
			if (!gender.isEmpty()) {
				hql2 = hql2 + " and indP.gender like :gender";
				consult2 = this.session.createQuery(hql2);
			}
			if (!age.equals(0)) {
				hql2 = hql2
						+ " and indP.age = :age and indP.paper.notification.codNotification=notif.codNotification";
				consult2 = this.session.createQuery(hql2);
			}
			if (!country.isEmpty()) {
				consult2.setString("country", "%" + country + "%");
			}
			if (!state.isEmpty()) {
				consult2.setString("state", "%" + state + "%");
			}
			if (!gender.isEmpty()) {
				consult2.setString("gender", gender);
			}
			if (!age.equals(0)) {
				consult2.setInteger("age", age);
			}
			List<ResultadoBusca> lista1 = consult1.list();
			List<ResultadoBusca> lista2 = consult2.list();
			lista1.addAll(lista2);
			List nonUniqueCollection = lista1;
			return nonUniqueCollection;
		}

	}

	/*
	 * @Override public List<ResultadoBusca> listBusca(String country, String
	 * state, String city, Integer age, String gender, String ethnicGroup,
	 * String educationalLevel, String zone, String progDementia, String
	 * visualDisorder, String myoclonus, String cerebellarDisorders, String
	 * persistentPainDys, String ataxy, String pyramidalSigns, String
	 * extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
	 * String sleepDisorders) { // TODO Auto-generated method stub return null;
	 * }
	 */

		
	@SuppressWarnings({ "unchecked", "null", "rawtypes" })
	@Override
	public List<ResultadoBusca> listBusca3(String symptom) {
		Query consult1 = null;
		Query consult2 = null;
		if (symptom.isEmpty()) {
			return consult1.list();
		} else {
			String hql1 = "select new hpdd.auxiliar.ResultadoBusca(ind.notification.codNotification, ind.country) "
					+ "from Individual ind, Notification notif, ClinData c where "
					+ "ind.notification.codNotification=notif.codNotification and notif.status='Completed' and ind.notification.codNotification=c.notification.codNotification and (";
			if (!symptom.isEmpty()) {
				hql1 = hql1
						+ " c.progDementia like :symptom  or c.visualDisorder like :symptom"
						+ "  or c.myoclonus like :symptom or c.cerebellarDisorders like :symptom "
						+ "or c.persistentPainDys like :symptom or c.ataxy like :symptom "
						+ "or c.pyramidalSigns like :symptom or c.extrapyramidalSigns like :symptom or c.akineticMutism like :symptom "
						+ "or c.psychiatricDisorders like :symptom or c.sleepDisorders like :symptom)";
				consult1 = this.session.createQuery(hql1);
			}
			if (!symptom.isEmpty()) {
				consult1.setString("symptom", "%"+symptom+"%");
			}
			String hql2 = "select distinct new hpdd.auxiliar.ResultadoBusca(indP.paper.notification.codNotification, indP.country) from IndividualPaper indP, Notification notif, Symptoms s where indP.paper.notification.codNotification=notif.codNotification "
					+ "and notif.status='Completed' and indP.paper.notification.codNotification=s.individualPaper.paper.notification.codNotification";
			if (!symptom.isEmpty()) {
				hql2 = hql2 + " and s.symptom like :symptom";
				consult2 = this.session.createQuery(hql2);
			}
			if (!symptom.isEmpty()) {
				consult2.setString("symptom", "%"+symptom+"%");
			}

			List<ResultadoBusca> lista1 = consult1.list();
			List<ResultadoBusca> lista2 = consult2.list();
			lista1.addAll(lista2);
			List nonUniqueCollection = lista1;
			return nonUniqueCollection;
		}
	}
}

/*
 * @SuppressWarnings({ "unchecked", "null" })
 * 
 * @Override public List<ResultadoBusca> listBusca(Integer age, String country,
 * String gender, String state) { Query consult = null;
 * System.out.println("(AuxiliarDAOHib listBusca())Country: " + country); if
 * (country.isEmpty() && state.isEmpty() && age.equals(0) && gender.isEmpty()) {
 * System.out.println("AuxilarDAOHibernate (listaBusca)"); return
 * consult.list(); } else { String hql =
 * "select new hpdd.auxiliar.ResultadoBusca(ind.age,ind.country,ind.gender,ind.state) from Individual ind, Notification notif where ind.notification.codNotification=notif.codNotification "
 * ; if (!country.isEmpty()) { System.out.println("Entrou país"); hql = hql +
 * " and ind.country like :country"; consult = this.session.createQuery(hql); }
 * if (!state.isEmpty()) { hql = hql + " and ind.state like :state"; consult =
 * this.session.createQuery(hql); } if (!gender.isEmpty()) { hql = hql +
 * " and ind.gender like :gender"; consult = this.session.createQuery(hql); } if
 * (!age.equals(0)) { hql = hql +
 * " and ind.age = :age and ind.notification.codNotification=notif.codNotification"
 * ; consult = this.session.createQuery(hql); } if (!country.isEmpty()) {
 * consult.setString("country", "%" + country + "%"); } if (!state.isEmpty()) {
 * consult.setString("state", "%" + state + "%"); } if (!gender.isEmpty()) {
 * consult.setString("gender",gender); } if (!age.equals(0)) {
 * consult.setInteger("age", age); } hql = hql +
 * " union all select distinct new hpdd.auxiliar.ResultadoBusca(indP.age,indP.country,indP.gender,indP.state) from IndividualPaper indP, Notification notif where indP.paper.notification.cxodNotification=notif.codNotification "
 * ; if (!country.isEmpty()) { System.out.println("Entrou país"); hql = hql +
 * " and indP.country like :country"; consult = this.session.createQuery(hql); }
 * if (!state.isEmpty()) { hql = hql + " and indP.state like :state"; consult =
 * this.session.createQuery(hql); } if (!gender.isEmpty()) { hql = hql +
 * " and indP.gender like :gender"; consult = this.session.createQuery(hql); }
 * if (!age.equals(0)) { hql = hql +
 * " and ind.indP = :age and indP.paper.notification.codNotification=notif.codNotification"
 * ; consult = this.session.createQuery(hql); } if (!country.isEmpty()) {
 * consult.setString("country", "%" + country + "%"); } if (!state.isEmpty()) {
 * consult.setString("state", "%" + state + "%"); } if (!gender.isEmpty()) {
 * consult.setString("gender",gender); } if (!age.equals(0)) {
 * consult.setInteger("age", age); } List<ResultadoBusca> list =
 * (List<ResultadoBusca>) consult.list(); return list; } }
 */

/*
 * @SuppressWarnings({ "unchecked", "null", "rawtypes" })
 * 
 * @Override public List<ResultadoBusca> listBusca(Integer age, String country,
 * String gender, String state) { Query consult = null; Query consult2 = null;
 * System.out.println("(AuxiliarDAOHib listBusca())Country: " + country); if
 * (country.isEmpty() && state.isEmpty() && age.equals(0) && gender.isEmpty()) {
 * System.out.println("AuxilarDAOHibernate (listaBusca)"); return
 * consult.list(); } else { String hql =
 * "select new hpdd.auxiliar.ResultadoBusca(ind.age,ind.country,ind.gender,ind.state) from Individual ind, Notification notif where ind.notification.codNotification=notif.codNotification "
 * ; System.out.println("Entrou país1"); if (!country.isEmpty()) { hql = hql +
 * " and ind.country like :country"; consult = this.session.createQuery(hql); }
 * if (!state.isEmpty()) { hql = hql + " and ind.state like :state"; consult =
 * this.session.createQuery(hql); } if (!gender.isEmpty()) { hql = hql +
 * " and ind.gender like :gender"; consult = this.session.createQuery(hql); } if
 * (!age.equals(0)) { hql = hql +
 * " and ind.age = :age and ind.notification.codNotification=notif.codNotification"
 * ; consult = this.session.createQuery(hql); } if (!country.isEmpty()) {
 * consult.setString("country", "%" + country + "%"); } if (!state.isEmpty()) {
 * consult.setString("state", "%" + state + "%"); } if (!gender.isEmpty()) {
 * consult.setString("gender", gender); } if (!age.equals(0)) {
 * consult.setInteger("age", age); } String hql2 =
 * "select distinct new hpdd.auxiliar.ResultadoBusca(indP.age,indP.country,indP.gender,indP.state) from IndividualPaper indP, Notification notif where indP.paper.notification.codNotification=notif.codNotification "
 * ; if (!country.isEmpty()) { System.out.println("Entrou país2"); hql2 = hql2 +
 * " and indP.country like :country"; consult2 = this.session.createQuery(hql2);
 * } if (!state.isEmpty()) { hql2 = hql2 + " and indP.state like :state";
 * consult2 = this.session.createQuery(hql2); } if (!gender.isEmpty()) { hql2 =
 * hql2 + " and indP.gender like :gender"; consult2 =
 * this.session.createQuery(hql2); } if (!age.equals(0)) { hql2 = hql2 +
 * " and ind.indP = :age and indP.paper.notification.codNotification=notif.codNotification"
 * ; consult2 = this.session.createQuery(hql2); } if (!country.isEmpty()) {
 * consult2.setString("country", "%" + country + "%"); } if (!state.isEmpty()) {
 * consult2.setString("state", "%" + state + "%"); } if (!gender.isEmpty()) {
 * consult2.setString("gender", gender); } if (!age.equals(0)) {
 * consult2.setInteger("age", age); } // List<ResultadoBusca> list =
 * (List<ResultadoBusca>) // consult2.list(); List<ResultadoBusca> lista1 =
 * (List<ResultadoBusca>) consult.list(); System
 * .out.println("lista1.get(0).getState(): "+lista1.get(0).getState());
 * List<ResultadoBusca> lista2 = (List<ResultadoBusca>) consult2.list(); System
 * .out.println("lista2.get(0).getState(): "+lista2.get(0).getState());
 * lista1.add((ResultadoBusca) lista2); List nonUniqueCollection = lista1;
 * //List<ResultadoBusca> list = (List<ResultadoBusca>) consult.list(); HashSet
 * uniqueCollection = new HashSet(nonUniqueCollection); return
 * (List<ResultadoBusca>) uniqueCollection; } };
 */

