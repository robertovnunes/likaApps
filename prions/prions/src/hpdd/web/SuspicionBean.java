package hpdd.web;

import hpdd.paper.PaperRN;
import hpdd.suspicion.Suspicion;
import hpdd.suspicion.SuspicionRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "suspicionBean")
@RequestScoped
public class SuspicionBean {
	private Suspicion selected = new Suspicion();
	private List<Suspicion> list = null;
	private List<Suspicion> listEdit = null;
	private List<Suspicion> showSuspicion = null;

	public String save() {
		System.out.println("entrou no save");
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setIndividualPaper(null);
		PaperRN paperRN = new PaperRN();
		SuspicionRN suspicionRN = new SuspicionRN();
		this.selected.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		suspicionRN.save(this.selected);
		this.selected = new Suspicion();
		this.list = null;
		return "a";

	}

	public void edit() {
		// ContextoBean contextoBean = ContextoUtil.getContextoBean();
		// this.selected.setNotification(null);
		// SuspicionRN suspicionRN = new SuspicionRN();
		// System.out.println("Id indiv edit" +
		// contextoBean.getLoggedUser().getIduser());
		// this.selected.setNotification(suspicionRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		// System.out.println("Cod indiv edit => antes = " +
		// this.selected.getNotification().getCodNotification());
		// if (suspicionRN.find(this.selected.getNotification()
		// .getCodNotification())) {
		// / suspicionRN.update(this.selected);
		// } else suspicionRN.save(this.selected);
		// System.out.println("Cod indiv edit => depois = " +
		// this.selected.getNotification().getCodNotification());
		// this.selected = new Suspicion();
		// this.list = null;

	}

	public void delete() {
		SuspicionRN suspicionRN = new SuspicionRN();
		suspicionRN.delete(this.selected);
		this.selected = new Suspicion();
		this.list = null;

	}

	public Suspicion getSelected() {
		return selected;
	}

	public void setSelected(Suspicion selected) {
		this.selected = selected;
	}

	public List<Suspicion> getList() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SuspicionRN suspicionRN = new SuspicionRN();
		if (suspicionRN.getNotification(contextoBean.getLoggedUser()
				.getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {

			System.out.println("(paperBean) id: "
					+ suspicionRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.list = suspicionRN.list(suspicionRN.getNotification(
					contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
		}
		return this.list;
	}

	public List<Suspicion> getListEdit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SuspicionRN suspicionRN = new SuspicionRN();
		if (suspicionRN.getNotificationToUPDATE(contextoBean.getLoggedUser()
				.getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {

			System.out.println("(paperBean) id: "
					+ suspicionRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listEdit = suspicionRN.list(suspicionRN
					.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
		}
		return this.listEdit;
	}

	public List<Suspicion> getShowSuspicion() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SuspicionRN suspicionRN = new SuspicionRN();
		System.out.println("(paperBean) id: "
				+ suspicionRN.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		this.showSuspicion = suspicionRN.list(suspicionRN
				.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
				.getCodNotification());

		return this.showSuspicion;
	}
}
