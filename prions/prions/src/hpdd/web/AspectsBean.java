package hpdd.web;

import hpdd.aspects.Aspects;
import hpdd.aspects.AspectsRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "aspectsBean")
@RequestScoped
public class AspectsBean {
	private Aspects selected = new Aspects();
	private List<Aspects> list = null;
	private List<Aspects> listSearchPublic = null;
	private Integer id;

	public String save() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		// this.selected.setLastTrip(null);
		// this.selected.setCountry(null);
		AspectsRN aspectsRN = new AspectsRN();
		this.selected.setNotification(aspectsRN.getNotification(contextoBean
				.getLoggedUser().getIduser()));
		aspectsRN.save(this.selected);
		this.selected = new Aspects();
		this.list = null;
		return "aspectsCreated";

	}

	public void edit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		AspectsRN aspectsRN = new AspectsRN();
		//System.out.println("Id indiv edit" + contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(aspectsRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		//System.out.println("Cod indiv edit => antes = " + this.selected.getNotification().getCodNotification());
		if (aspectsRN.find(this.selected.getNotification()
				.getCodNotification())) {
			aspectsRN.update(this.selected);
		} else aspectsRN.save(this.selected);
		//System.out.println("Cod indiv edit => depois = " + this.selected.getNotification().getCodNotification());
		this.selected = new Aspects();
		this.list = null;

	}

	public void delete() {
		AspectsRN aspectsRN = new AspectsRN();
		aspectsRN.delete(this.selected);
		this.selected = new Aspects();
		this.list = null;

	}

	public Aspects getSelected() {
		return selected;
	}

	public void setSelected(Aspects selected) {
		this.selected = selected;
	}

	public List<Aspects> getList() {
		if (this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			AspectsRN aspectsRN = new AspectsRN();
			this.list = aspectsRN
					.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	public List<Aspects> getListSearchPublic() {
		if (this.listSearchPublic == null) {
			AspectsRN aspectsRN = new AspectsRN();
			this.listSearchPublic = aspectsRN
					.listSearchPublic(getId());
		}
		return this.listSearchPublic;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
