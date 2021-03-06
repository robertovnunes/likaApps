package hpdd.web;

import hpdd.clinData.ClinData;
import hpdd.clinData.ClinDataRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
@ManagedBean(name = "clinDataBean")
@RequestScoped
public class ClinDataBean {
	private ClinData selected = new ClinData();
	private List<ClinData> list = null;
	private List<ClinData> listDataNotifSearch = null;
	private Integer id;

	public String save() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ClinDataRN clinDataRN = new ClinDataRN();
		this.selected.setNotification(clinDataRN.getNotification(contextoBean
				.getLoggedUser().getIduser()));
		clinDataRN.save(this.selected);
		this.selected = new ClinData();
		this.list = null;

		return "clinDataCreated";

	}

	public List<ClinData> getListDataNotifSearch() {
		if (this.listDataNotifSearch == null) {
			ClinDataRN clinDataRN = new ClinDataRN();
			System.out.println("(getListDataNotifSearch)id="+getId());
			this.listDataNotifSearch = clinDataRN.listDataNotifSearch(getId());
		}
		return this.listDataNotifSearch;
	}

	public void edit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ClinDataRN clinDataRN = new ClinDataRN();
		// System.out.println("Id indiv edit" +
		// contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(clinDataRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		// System.out.println("Cod indiv edit => antes = " +
		// this.selected.getNotification().getCodNotification());
		if (clinDataRN.find(this.selected.getNotification()
				.getCodNotification())) {
			clinDataRN.update(this.selected);
		} else
			clinDataRN.save(this.selected);
		// System.out.println("Cod indiv edit => depois = " +
		// this.selected.getNotification().getCodNotification());
		this.selected = new ClinData();
		this.list = null;

	}

	public void delete() {
		ClinDataRN clinDataRN = new ClinDataRN();
		clinDataRN.delete(this.selected);
		this.selected = new ClinData();
		this.list = null;

	}

	public ClinData getSelected() {
		return selected;
	}

	public void setSelected(ClinData selected) {
		this.selected = selected;
	}

	public List<ClinData> getList() {
		if (this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			ClinDataRN clinDataRN = new ClinDataRN();
			this.list = clinDataRN.list(contextoBean.getLoggedUser()
					.getIduser());
		}
		return this.list;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
