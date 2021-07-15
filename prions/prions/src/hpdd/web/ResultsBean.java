package hpdd.web;

import hpdd.individual.IndividualRN;
import hpdd.paper.Paper;
import hpdd.paper.PaperRN;
import hpdd.paper.SymptomsRN;
import hpdd.results.Results;
import hpdd.results.ResultsPaper;
import hpdd.results.ResultsRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "resultsBean")
@RequestScoped
public class ResultsBean {
	private List<Results> listSearchPublic = null;
	private Results selected = new Results();
	private ResultsPaper selectedPap = new ResultsPaper();
	private List<Results> list = null;
	private List<ResultsPaper> listResultsPaper = null;
	private List<ResultsPaper> showResultsPaper = null;
	private List<ResultsPaper> showResultsPaperPublic = null;
	private String x;
	private List<ResultsPaper> listResultsPaperEdit = null;
	private Integer id;
//	private boolean loadAttributes = true;
	
	/* public boolean getLoadAttributes() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SymptomsRN symptomsRN = new SymptomsRN();
		Integer codNotification = symptomsRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()).getCodNotification();
		ResultsRN resultsRN = new ResultsRN();
		resultsRN.
		
		return loadAttributes;
	}

	public void setLoadAttributes(boolean loadAttributes) {
		this.loadAttributes = loadAttributes;
	} */

	public String save() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResultsRN resultsRN = new ResultsRN();
		this.selected.setNotification(resultsRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		System.out.println("Tipo da notifica��o = "
				+ this.selected.getNotification().getType());
		x = this.selected.getNotification().getType();
		System.out.println("x = " + x);
		resultsRN.save(this.selected);
		this.selected = new Results();
		this.list = null;
		if (x.equals("Paper")) {
			return "ok";
		} else
			return "resultsCreated";

	}

	public void saveResultPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selectedPap.setIndividualPaper(null);
		PaperRN paperRN = new PaperRN();
		ResultsRN resultsRN = new ResultsRN();
		this.selectedPap.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		resultsRN.save(this.selectedPap);
		this.selectedPap = new ResultsPaper();
		this.list = null;

	}

	public void edit() {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResultsRN resultsRN = new ResultsRN();
		// System.out.println("Id indiv edit" +
		// contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(resultsRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		// System.out.println("Cod indiv edit => antes = " +
		// this.selected.getNotification().getCodNotification());
		if (resultsRN
				.find(this.selected.getNotification().getCodNotification())) {
			System.out.println("(ResultsBean) edit => if");
			resultsRN.update(this.selected);
		} else {
			System.out.println("(ResultsBean) edit => else");
			resultsRN.save(this.selected);
		}
		// System.out.println("Cod indiv edit => depois = " +
		// this.selected.getNotification().getCodNotification());
		this.selected = new Results();
		this.list = null;
	}

	public void editResPaper() {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PaperRN paperRN = new PaperRN();
		ResultsRN resultsRN = new ResultsRN();
		System.out.println("res_EEG(antes) = " + this.selectedPap.getRes_EEG());
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
		this.selectedPap.setId(resultsRN.getResultsPaper(
				contextoBean.getLoggedUser().getIduser()).getId());
		// this.selectedPap.setIndividualPaper(paperRN
		// .getIndividualPaperToUpdate(contextoBean.getLoggedUser().getIduser()));
		resultsRN.update(this.selectedPap);
		System.out.println("get_ID = " + this.selectedPap.getId());
		System.out.println("res_EEG = " + this.selectedPap.getRes_EEG());
		this.selectedPap = new ResultsPaper();
		this.list = null;

	}

	public void delete() {
		ResultsRN resultsRN = new ResultsRN();
		resultsRN.delete(this.selected);
		this.selected = new Results();
		this.list = null;

	}

	public Results getSelected() {
		return selected;
	}

	public void setSelected(Results selected) {
		this.selected = selected;
	}

	public List<Results> getList() {
		if (this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			ResultsRN resultsRN = new ResultsRN();
			this.list = resultsRN
					.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	
	public List<Results> getListSearchPublic() {
		if (this.listSearchPublic == null) {

			ResultsRN resultsRN = new ResultsRN();
			this.listSearchPublic = resultsRN
					.listSearchPublic(getId());
		}
		return this.listSearchPublic;
	}

	public List<ResultsPaper> getListResultsPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ResultsRN resultsRN = new ResultsRN();
		if (resultsRN.getNotification(contextoBean.getLoggedUser().getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			System.out.println("(paperBean) id: "
					+ resultsRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listResultsPaper = resultsRN.listResultsPaper(resultsRN
					.getNotification(contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
		}
		return this.listResultsPaper;
	}

	public List<ResultsPaper> getListResultsPaperEdit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ResultsRN resultsRN = new ResultsRN();
		if (resultsRN.getNotification(contextoBean.getLoggedUser().getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			System.out.println("(paperBean) id: "
					+ resultsRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listResultsPaperEdit = resultsRN.listResultsPaper(resultsRN
					.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
		}
		return this.listResultsPaperEdit;
	}

	public List<ResultsPaper> getShowResultsPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		ResultsRN resultsRN = new ResultsRN();
		System.out.println("(paperBean) id: "
				+ resultsRN.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		this.showResultsPaper = resultsRN.showResultsPaper(resultsRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser())
				.getCodNotification());

		return this.showResultsPaper;
	}
	public List<ResultsPaper> getShowResultsPaperPublic() {
		ResultsRN resultsRN = new ResultsRN();
		this.showResultsPaperPublic = resultsRN.showResultsPaperPublic(getId());

		return this.showResultsPaperPublic;
	}
	public ResultsPaper getSelectedPap() {
		return selectedPap;
	}

	public void setSelectedPap(ResultsPaper selectedPap) {
		this.selectedPap = selectedPap;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
