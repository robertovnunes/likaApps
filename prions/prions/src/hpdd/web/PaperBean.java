package hpdd.web;

import java.util.List;

import hpdd.paper.Paper;
import hpdd.paper.PaperRN;
import hpdd.paper.Symptoms;
import hpdd.paper.SymptomsRN;
import hpdd.individual.IndividualPaper;
import hpdd.individual.IndividualRN;
import hpdd.notification.Notification;
import hpdd.notification.NotificationRN;
import hpdd.web.util.ContextoUtil;

//import javax.faces.application.Application;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
//import javax.faces.component.UIViewRoot;
//import javax.faces.context.FacesContext;

@ManagedBean(name = "paperBean")
@RequestScoped
public class PaperBean {
	private Paper selected = new Paper();
	private Symptoms selectedSym = new Symptoms();
	private String othersSymptoms = "";
	private IndividualPaper selecIndividualPaper = new IndividualPaper();
	private Notification notif = new Notification();
	private List<Symptoms> lista = null;
	private List<Symptoms> listaFirstSym = null;
	private List<Paper> listaPaper = null;
	private List<Paper> listaPaperNotif = null;
	private List<IndividualPaper> listaIndividualPaperNotif = null;
	private List<IndividualPaper> listaUniqueIndividualPaper = null;
	private List<Symptoms> listaSymptomsNotif = null;
	private List<Symptoms> showSymptomsNotif = null;
	private List<Symptoms> showFirstSym = null;
	private List<Symptoms> listaSymptomsNotifEdit;
	private List<Symptoms> listaFirstSymEdit;
	private List<Symptoms> listSymNotifSearch;
	private Integer id;
	private List<IndividualPaper> listaUniqueIndividualPaperSearch = null;
//	private boolean loadAttributes = true;

	/* public boolean getLoadAttributes() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SymptomsRN symptomsRN = new SymptomsRN();
		PaperRN paperRN = new PaperRN();
		Integer codNotification = symptomsRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()).getCodNotification();
		Paper paper = paperRN.load(codNotification);
		this.selected = paper;
		System.out.println("Paper Selecionado:"+paper.getTitle());
		if(paper != null){
			IndividualRN individualRN = new IndividualRN();
			this.selecIndividualPaper = individualRN.loadIndividualPaper(paper.getId());
		}
		
		return loadAttributes;
	}

	public void setLoadAttributes(boolean loadAttributes) {
		this.loadAttributes = loadAttributes;
	} */

	public void delete() {
		IndividualRN individualRN = new IndividualRN();
		individualRN.delete(this.selecIndividualPaper);
		this.selecIndividualPaper = new IndividualPaper();
		this.listaPaper = null;
		this.listaPaperNotif = null;
		this.lista = null;
		this.listaSymptomsNotif = null;
		this.listaIndividualPaperNotif = null;
		this.listaUniqueIndividualPaper = null;

	}

	public String newCasePaper() {

		return "formNewIndPaper";

	}

	public String save() {
		System.out.println("(PaperBean) Save()");
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.restore(contextoBean.getLoggedUser().getIduser());
		this.notif.setUser(contextoBean.getLoggedUser());
		this.notif.setCodNotification(null);
		this.notif.setStatus("Incomplete");
		this.notif.setType("Paper");
		this.notif.setAtivo(true);
		notificationRN.save(this.notif);
		this.notif = new Notification();
		PaperRN paperRN = new PaperRN();
		Integer codNotif = paperRN.getNotificationToUPDATE(
				contextoBean.getLoggedUser().getIduser()).getCodNotification();
		paperRN.restore(codNotif);
		this.selected.setNotification(null);
		this.selected.setId(null);
		this.selected.setAtivo(true);
		this.selected.setNotification(paperRN.getNotification(contextoBean
				.getLoggedUser().getIduser()));
		paperRN.save(this.selected);
		this.selected = new Paper();
		this.listaPaper = null;
		this.lista = null;
		this.listaSymptomsNotif = null;
		this.listaIndividualPaperNotif = null;
		this.listaPaperNotif = null;
		this.listaUniqueIndividualPaper = null;
		return "ok";

	}

	public String saveIndividualPaper() {
		System.out.println("entrou indbean");
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selecIndividualPaper.setPaper(null);
		IndividualRN individualRN = new IndividualRN();
		PaperRN paperRN = new PaperRN();
		paperRN.restore(paperRN.getPaper(
				contextoBean.getLoggedUser().getIduser()).getId());
		this.selecIndividualPaper.setAtivo(true);
		this.selecIndividualPaper.setPaper(paperRN.getPaper(contextoBean
				.getLoggedUser().getIduser()));
		System.out.println("(individualbean)codUser "
				+ this.selecIndividualPaper.getPaper().getId());
		individualRN.save(this.selecIndividualPaper);
		this.selecIndividualPaper = new IndividualPaper();
		return "ok";

	}

	public void includeFirstSym() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selectedSym.setIndividualPaper(null);
		this.selectedSym.setType("first");
		this.selectedSym.setPeriod(null);
		PaperRN paperRN = new PaperRN();
		SymptomsRN symptomsRN = new SymptomsRN();
		this.selectedSym.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		symptomsRN.save(this.selectedSym);
		this.selectedSym = new Symptoms();
		this.lista = null;

	}

	public void edit() {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		this.selected.setAtivo(true);
		System.out.println("Link update: " + this.selected.getLink());
		PaperRN paperRN = new PaperRN();
		this.selected.setNotification(paperRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		paperRN.update(this.selected);
//		this.selected = new Paper();
		this.listaPaper = null;

	}

	public void editIndividualPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PaperRN paperRN = new PaperRN();
		IndividualRN individualRN = new IndividualRN();
		this.selecIndividualPaper.setAtivo(true);
		System.out.println("cidade update = "
				+ this.selecIndividualPaper.getCityResidence());
		this.selecIndividualPaper.setPaper(paperRN.getPaper(contextoBean
				.getLoggedUser().getIduser()));
		System.out.println("(Paperbean) paper = "
				+ paperRN.getPaper(contextoBean.getLoggedUser().getIduser())
						.getId());
		this.selecIndividualPaper.setId(paperRN.getIndividualPaper(
				contextoBean.getLoggedUser().getIduser()).getId());
		System.out.println("(Paperbean) id = "
				+ paperRN.getIndividualPaper(
						contextoBean.getLoggedUser().getIduser()).getId());
		individualRN.update(this.selecIndividualPaper);
		this.selecIndividualPaper = new IndividualPaper();
		this.listaPaper = null;

	}

	public void editSym() {

		// ContextoBean contextoBean = ContextoUtil.getContextoBean();
		// this.selectedSym.setNotification(null);
		SymptomsRN symptomsRN = new SymptomsRN();
		// this.selectedSym.setNotification(symptomsRN
		// .getNotificationToUPDATE(contextoBean.getLoggedUser()
		// .getIduser()));
		symptomsRN.save(this.selectedSym);
		this.selectedSym = new Symptoms();

	}

	public void includeFinalSym() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();

			if(this.othersSymptoms != null && !this.othersSymptoms.equals("")){
				String listSyms[] = this.othersSymptoms.split("\r\n");
				for (String newSyms : listSyms) {
					try{
						String symptomTitle = newSyms.split("#")[0];
						String period = newSyms.split("#")[1];
						
						Symptoms symtomsTemp = new Symptoms();
						symtomsTemp.setPeriod(Integer.parseInt(period));
						symtomsTemp.setSymptom(symptomTitle);
						symtomsTemp.setIndividualPaper(null);
						symtomsTemp.setType("final");
						symtomsTemp.setSymDate(null);
						PaperRN paperRN = new PaperRN();
						
						symtomsTemp.setIndividualPaper(paperRN
								.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
						
						SymptomsRN symptomsRN = new SymptomsRN();
						symptomsRN.save(symtomsTemp);
					}catch(Exception ex){
						System.out.println(ex.getMessage());
					}
				}
			}
		
		this.othersSymptoms = "";
//		this.selectedSym = new Symptoms();
		this.lista = null;
		this.listaPaperNotif = null;
		this.listaSymptomsNotif = null;
		
	}

	public String selectandRestore() {
		System.out.println("activate!");
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.restore(contextoBean.getLoggedUser().getIduser());
		return "restrictednotifypaper";
	}

	public Paper getSelected() {
		return selected;
	}

	public void setSelected(Paper selected) {
		this.selected = selected;
	}

	public Notification getNotif() {
		return notif;
	}

	public void setNotif(Notification notif) {
		this.notif = notif;
	}

	public Symptoms getSelectedSym() {
		return selectedSym;
	}

	public void setSelectedSym(Symptoms selectedSym) {
		this.selectedSym = selectedSym;
	}

	public String getOthersSymptoms() {
		return othersSymptoms;
	}

	public void setOthersSymptoms(String othersSymptoms) {
		this.othersSymptoms = othersSymptoms;
	}

	public List<Symptoms> getLista() { // final symptoms

		if (this.lista == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			SymptomsRN symptomsRN = new SymptomsRN();
			System.out.println("id: "
					+ symptomsRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.lista = symptomsRN.list(symptomsRN.getNotification(
					contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
			System.out.println("passou!" + this.lista);
		}
		return lista;
	}

	public List<Symptoms> getListaFirstSym() { // first symptoms
		if (this.listaFirstSym == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			SymptomsRN symptomsRN = new SymptomsRN();
			if (symptomsRN.getNotification(contextoBean.getLoggedUser()
					.getIduser()) == null) {
				System.out.println("eh nuuuulll");
				return null;
			} else {
				System.out.println("(paperBean) id: "
						+ symptomsRN.getNotification(
								contextoBean.getLoggedUser().getIduser())
								.getCodNotification());

				this.listaFirstSym = symptomsRN.listFirstSym(symptomsRN
						.getNotification(
								contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
				System.out.println("passou!");
			}
		}
		return listaFirstSym;

	}

	public List<Symptoms> getListaFirstSymEdit() { // first symptoms
		if (this.listaFirstSym == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			SymptomsRN symptomsRN = new SymptomsRN();
			if (symptomsRN.getNotificationToUPDATE(contextoBean.getLoggedUser()
					.getIduser()) == null) {
				System.out.println("eh nuuuulll");
				return null;
			} else {
				System.out.println("(paperBean) id: "
						+ symptomsRN.getNotificationToUPDATE(
								contextoBean.getLoggedUser().getIduser())
								.getCodNotification());

				this.listaFirstSymEdit = symptomsRN.listFirstSym(symptomsRN
						.getNotificationToUPDATE(
								contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
				System.out.println("passou!");
			}
		}
		return listaFirstSymEdit;

	}

	public List<Symptoms> getShowFirstSym() { // first symptoms

		if (this.showFirstSym == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			SymptomsRN symptomsRN = new SymptomsRN();
			System.out.println("(paperBean) id: "
					+ symptomsRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.showFirstSym = symptomsRN.listFirstSym(symptomsRN
					.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
			System.out.println("passou!");
		}
		return showFirstSym;
	}

	public List<Paper> getListaPaper() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();

		PaperRN paperRN = new PaperRN();
		System.out.println("id: "
				+ paperRN.getNotification(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		this.listaPaper = paperRN.list(paperRN.getNotification(
				contextoBean.getLoggedUser().getIduser()).getCodNotification());
		System.out.println("passou!" + this.listaPaper);
		return this.listaPaper;
	}

	public List<Paper> getListaPaperNotif() {
		if (this.listaPaperNotif == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			PaperRN paperRN = new PaperRN();
			this.listaPaperNotif = paperRN.listaPaperNotif(contextoBean
					.getLoggedUser().getIduser());
		}
		return this.listaPaperNotif;
	}

	public List<IndividualPaper> getListaIndividualPaperNotif() {
		if (this.listaIndividualPaperNotif == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			PaperRN paperRN = new PaperRN();
			this.listaIndividualPaperNotif = paperRN
					.listaIndividualPaperNotif(paperRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
		}
		return this.listaIndividualPaperNotif;
	}

	public List<IndividualPaper> getListaUniqueIndividualPaper() {
		// if (this.listaUniqueIndividualPaper == null) {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PaperRN paperRN = new PaperRN();
		this.listaUniqueIndividualPaper = paperRN
				.listauniqueIndividualPaper(paperRN.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		// }
		return this.listaUniqueIndividualPaper;
	}
	
	public List<IndividualPaper> getListaUniqueIndividualPaperSearch() {
		// if (this.listaUniqueIndividualPaper == null) {

		PaperRN paperRN = new PaperRN();
		this.listaUniqueIndividualPaperSearch = paperRN
				.listauniqueIndividualPaperSearch(getId());
		// }
		return this.listaUniqueIndividualPaperSearch;
	}

	public List<Symptoms> getListaSymptomsNotif() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SymptomsRN symptomsRN = new SymptomsRN();
		if (symptomsRN
				.getNotification(contextoBean.getLoggedUser().getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			System.out.println("(paperBean) id: "
					+ symptomsRN.getNotification(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listaSymptomsNotif = symptomsRN.listaSymptomsNotif(symptomsRN
					.getNotification(contextoBean.getLoggedUser().getIduser())
					.getCodNotification());
		}

		return this.listaSymptomsNotif;
	}

	public List<Symptoms> getListaSymptomsNotifEdit() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SymptomsRN symptomsRN = new SymptomsRN();
		if (symptomsRN.getNotificationToUPDATE(contextoBean.getLoggedUser()
				.getIduser()) == null) {
			System.out.println("eh nuuuulll");
			return null;
		} else {
			
			System.out.println("(paperBean) id: "
					+ symptomsRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			this.listaSymptomsNotifEdit = symptomsRN
					.listaSymptomsNotif(symptomsRN.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser())
							.getCodNotification());
			
		}

		return this.listaSymptomsNotifEdit;
	}

	public List<Symptoms> getShowSymptomsNotif() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		SymptomsRN symptomsRN = new SymptomsRN();
		System.out.println("(paperBean) id: "
				+ symptomsRN.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
						.getCodNotification());
		this.showSymptomsNotif = symptomsRN.listaSymptomsNotif(symptomsRN
				.getNotificationToUPDATE(
						contextoBean.getLoggedUser().getIduser())
				.getCodNotification());

		return this.showSymptomsNotif;
	}

	public void deleteSym() {
		SymptomsRN symptomsRN = new SymptomsRN();
		symptomsRN.deleteSym(this.selectedSym);
		this.selectedSym = new Symptoms();
		this.selected = new Paper();
		this.listaPaper = null;
		this.listaPaperNotif = null;
		this.lista = null;
		this.listaSymptomsNotif = null;
		this.listaFirstSym = null;

	}

	public IndividualPaper getSelecIndividualPaper() {
		return selecIndividualPaper;
	}

	public void setSelecIndividualPaper(IndividualPaper selecIndividualPaper) {
		this.selecIndividualPaper = selecIndividualPaper;
	}

	public String activateIndividualPaper() {
		System.out.println("activateIndividualPaper!");
		IndividualRN individualRN = new IndividualRN();
		this.selecIndividualPaper = individualRN
				.loadIndividualPaper(this.selecIndividualPaper.getId());
		individualRN.restore(this.selecIndividualPaper.getPaper().getId());
		System.out.println("id indpaper:" + this.selecIndividualPaper.getId());
		// this.selecIndividualPaper.setAtivo(true);
		// individualRN.save(this.selecIndividualPaper);
		individualRN.activateIndPaper(this.selecIndividualPaper.getId());
		System.out.println(">>>> ID indpaper :"
				+ this.selecIndividualPaper.getId());
		System.out.println(">>>> Ativo indpaper :"
				+ this.selecIndividualPaper.getAtivo());
		this.selecIndividualPaper = new IndividualPaper();
		// this.refresh();
		return "listuniqueIndPaperx";
	}

	public List<Symptoms> getListSymNotifSearch() {
		if (this.listSymNotifSearch == null) {
			SymptomsRN symptomsRN = new SymptomsRN();
			System.out.println("(getListSymNotifSearch)id=" + getId());
			this.listSymNotifSearch = symptomsRN.listSymNotifSearch(getId());
		}
		
		return this.listSymNotifSearch;
	}
	
	
	/*
	 * public void refresh() { FacesContext context =
	 * FacesContext.getCurrentInstance(); Application application =
	 * context.getApplication(); javax.faces.application.ViewHandler viewHandler
	 * = application.getViewHandler(); UIViewRoot viewRoot =
	 * viewHandler.createView(context, context.getViewRoot().getViewId());
	 * context.setViewRoot(viewRoot); context.renderResponse();
	 * 
	 * }
	 */

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
