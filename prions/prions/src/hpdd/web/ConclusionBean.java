package hpdd.web;

import hpdd.conclusion.Conclusion;
import hpdd.conclusion.ConclusionRN;
import hpdd.paper.PaperRN;
import hpdd.conclusion.ConclusionPaper;
import hpdd.individual.IndividualRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "conclusionBean")
@RequestScoped
public class ConclusionBean {
	private Conclusion selected = new Conclusion();
	private ConclusionPaper selectedPap = new ConclusionPaper();
	private List<Conclusion> list = null;
	private List<Conclusion> listSearchPublic = null;
	private List<ConclusionPaper> showConclusionPaper = null;
	private List<ConclusionPaper> listConclusionPaper = null;
	private List<ConclusionPaper> listConclusionPaperEdit = null;
	private List<ConclusionPaper> listConclusionPaperPublic = null;
	private Integer id;

	public String save() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ConclusionRN conclusionRN = new ConclusionRN();
		this.selected.setNotification(conclusionRN.getNotification(contextoBean
				.getLoggedUser().getIduser()));
		conclusionRN.save(this.selected);
		this.selected = new Conclusion();
		this.list = null;
		return "conclusionCreated";

	}

	public void edit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ConclusionRN conclusionRN = new ConclusionRN();
		// System.out.println("Id indiv edit" +
		// contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(conclusionRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		// System.out.println("Cod indiv edit => antes = " +
		// this.selected.getNotification().getCodNotification());
		if (conclusionRN.find(this.selected.getNotification()
				.getCodNotification())) {
			conclusionRN.update(this.selected);
		} else
			conclusionRN.save(this.selected);
		// System.out.println("Cod indiv edit => depois = " +
		// this.selected.getNotification().getCodNotification());
		this.selected = new Conclusion();
		this.list = null;

	}

	public void delete() {
		ConclusionRN conclusionRN = new ConclusionRN();
		conclusionRN.delete(this.selected);
		this.selected = new Conclusion();
		this.list = null;
		this.listConclusionPaper = null;
		this.listConclusionPaperEdit = null;

	}

	public void deletePap() {
		ConclusionRN conclusionRN = new ConclusionRN();
		conclusionRN.delete(this.selectedPap);
		this.selectedPap = new ConclusionPaper();
		this.list = null;
		this.listConclusionPaper = null;
		this.listConclusionPaperEdit = null;

	}

	public Conclusion getSelected() {
		return selected;
	}

	public void setSelected(Conclusion selected) {
		this.selected = selected;
	}

	public List<Conclusion> getList() {
		if (this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			ConclusionRN conclusionRN = new ConclusionRN();
			this.list = conclusionRN.list(contextoBean.getLoggedUser()
					.getIduser());
		}
		return this.list;
	}

	public List<Conclusion> getListSearchPublic() {
		if (this.listSearchPublic == null) {

			ConclusionRN conclusionRN = new ConclusionRN();
			this.listSearchPublic = conclusionRN.listSearchPublic(getId());
		}
		return this.listSearchPublic;
	}

	public void saveConclusionPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selectedPap.setIndividualPaper(null);
		PaperRN paperRN = new PaperRN();
		ConclusionRN conclusionRN = new ConclusionRN();
		this.selectedPap.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		conclusionRN.save(this.selectedPap);
		this.selectedPap = new ConclusionPaper();
		this.list = null;

	}

	public void editConclusionPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PaperRN paperRN = new PaperRN();
		ConclusionRN conclusionRN = new ConclusionRN();
		// System.out.println("res_EEG(antes) = " +
		// this.selectedPap.getRes_EEG());
		// Integer id =
		// resultsRN.loadResultsPaper(this.selectedPap.getId()).getId();
		// System.out.println("res_EEG(antes) = " +
		// this.selectedPap.getIndividualPaper().getId());
		this.selectedPap.setIndividualPaper(paperRN
				.getIndividualPaperToUpdate(contextoBean.getLoggedUser()
						.getIduser()));
		System.out.println("get_ID = "
				+ this.selectedPap.getIndividualPaper().getPaper().getId());
		IndividualRN individualRN = new IndividualRN();
		individualRN.restore(this.selectedPap.getIndividualPaper().getPaper()
				.getId());
		individualRN.activateIndPaper(this.selectedPap.getIndividualPaper()
				.getId());
		this.selectedPap.setId(conclusionRN.getConclusionPaper(
				contextoBean.getLoggedUser().getIduser()).getId());
		// this.selectedPap.setIndividualPaper(paperRN
		// .getIndividualPaperToUpdate(contextoBean.getLoggedUser().getIduser()));
		conclusionRN.update(this.selectedPap);
		System.out.println("get_ID = " + this.selectedPap.getId());
		this.selectedPap = new ConclusionPaper();
		this.list = null;

	}

	public List<ConclusionPaper> getListConclusionPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ConclusionRN conclusionRN = new ConclusionRN();

		if (conclusionRN.getNotification(contextoBean.getLoggedUser()
				.getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			System.out.println("(paperBean) id: "
					+ conclusionRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listConclusionPaper = conclusionRN
					.listConclusionPaper(conclusionRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
		}
		return this.listConclusionPaper;
	}

	public List<ConclusionPaper> getListConclusionPaperEdit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ConclusionRN conclusionRN = new ConclusionRN();

		if (conclusionRN.getNotification(contextoBean.getLoggedUser()
				.getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			System.out.println("(paperBean) id: "
					+ conclusionRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listConclusionPaperEdit = conclusionRN
					.listConclusionPaper(conclusionRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
		}
		return this.listConclusionPaperEdit;
	}

	public List<ConclusionPaper> getListConclusionPaperPublic() {
		ConclusionRN conclusionRN = new ConclusionRN();

		this.listConclusionPaperPublic = conclusionRN
				.listConclusionPaperPublic(getId());

		return this.listConclusionPaperPublic;
	}

	public List<ConclusionPaper> getShowConclusionPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ConclusionRN conclusionRN = new ConclusionRN();
		System.out.println("(paperBean) id: "
				+ conclusionRN.getNotification(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		this.showConclusionPaper = conclusionRN
				.showConclusionPaper(conclusionRN.getNotification(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());

		return this.showConclusionPaper;
	}

	public ConclusionPaper getSelectedPap() {
		return selectedPap;
	}

	public void setSelectedPap(ConclusionPaper selectedPap) {
		this.selectedPap = selectedPap;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
