package hpdd.web;

import hpdd.notification.Notification;
import hpdd.notification.NotificationRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.primefaces.component.accordionpanel.AccordionPanel;
import org.primefaces.event.TabChangeEvent;

@ManagedBean(name = "notificationBean")
@RequestScoped
public class NotificationBean {
	private Notification selected = new Notification();
	private String message = "";
	private boolean showAlert = false;
	private Integer idSearch = null;
	private String index = null;
	private List<Notification> list = null;
	private List<Notification> list2 = null;
	private List<Notification> listUniqueSearch = null; // para Search
														// notification
	private List<Notification> listNotifSearch = null; //public search
	public List<Notification> getListUniqueSearch() {
		if (this.listUniqueSearch == null) {
			NotificationRN notificationRN = new NotificationRN();
			this.listUniqueSearch = notificationRN
					.listUniqueSearch(this.idSearch);
			System.out.println(this.listUniqueSearch);
			
		}
		this.idSearch = null;
		this.list = null;
		this.list2 = null;
		System.out.println(this.listUniqueSearch);
		return this.listUniqueSearch;

	}
	
	public List<Notification> getListNotifSearch(Integer id) { //fun��o n�o utilizada
		if (this.listNotifSearch == null) {
			NotificationRN notificationRN = new NotificationRN();
			this.listNotifSearch = notificationRN.listNotifSearch(id);
			
		}
		this.idSearch = null;
		this.listUniqueSearch = null;
		this.list2 = null;
		return this.listNotifSearch;
	}

	public String teste(){
		this.list = null;
		this.listUniqueSearch = null;
		return "searchNotifResult";
		
	}
	
	public List<Notification> getList() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		if (this.list == null) {
			NotificationRN notificationRN = new NotificationRN();
			this.list = notificationRN.list(contextoBean.getLoggedUser());
			
		}
		this.idSearch = null;
		this.listUniqueSearch = null;
		this.list2 = null;
		return this.list;
	}

	public List<Notification> getList2() {
		if (this.list2 == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();

			NotificationRN notificationRN = new NotificationRN();
			this.list2 = notificationRN.list2(contextoBean.getLoggedUser()
					.getIduser());
		}
		return this.list2;
	}

	public void save() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.restore(contextoBean.getLoggedUser().getIduser());
		this.selected.setUser(contextoBean.getLoggedUser());
		this.selected.setCodNotification(null);
		this.selected.setStatus("Incomplete");
		this.selected.setType("Form");
		this.selected.setAtivo(true);
		notificationRN.save(this.selected);

		this.selected = new Notification();
		this.list = null;
	}

	public void delete() {
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.delete(this.selected);
		this.selected = new Notification();
		this.list = null;

	}

	public Notification getSelected() {
		return selected;
	}

	public void setSelected(Notification selected) {
		this.selected = selected;
	}

	public String changeStatus() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		System.out.println("Nome:" + contextoBean.getLoggedUser().getIduser());
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.change(contextoBean.getLoggedUser().getIduser());

		System.out.println("(NotificationBean) changestatus");
		this.selected = new Notification();
		this.list = null;
		this.index = null;
		return "mynotifications";
	}

	public String keepStatus() {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		System.out.println("Nome:" + contextoBean.getLoggedUser().getIduser());
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.keep(contextoBean.getLoggedUser().getIduser());
		this.selected = new Notification();
		this.list = null;
		this.index = null;
		return null;
	}

	public String activate() {
		System.out.println("activate!");
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.restore(contextoBean.getLoggedUser().getIduser());
		this.selected = notificationRN.load(this.selected.getCodNotification());
		this.selected.setAtivo(true);
		notificationRN.save(selected);
		System.out.println("tipo =" + this.selected.getType());
		System.out.println("tipo =" + this.selected.getCodNotification());
		// To DO -- se estiver finalizado, gere pdf
		// sen�o mostre para editar
		if (this.selected.getType().equals("Paper")) {
			System.out.println("entrou paper");
			return "listIndividualPapers";
		} else {
			System.out.println("aee");
			return "listnotification";
		}

	}

	public Integer getIdSearch() {
		return idSearch;
	}

	public void setIdSearch(Integer idSearch) {
		this.idSearch = idSearch;
	}
	public void onTabChange(TabChangeEvent event) {
		String ix = event.getTab().getId();
	/*	String idTab = ix.substring(ix.length()-1, ix.length());
		AccordionPanel accordion = (AccordionPanel) event.getComponent();
		if(this.selected.getUser() == null && Integer.parseInt(idTab) > 0){
			this.showAlert = true;
			this.message = "Please save the form or click on unknown before see the next tab";
			accordion.setActiveIndex(null);
			event.getTab().setRendered(false);
		}else{
		}*/
		System.out.println("......................................event.getTab().getId(): " + event.getTab().getId());
		System.out.println("..................................Index: " + ix);
		this.index = ix;
		System.out.println("..................................Index: " + this.index);
		this.showAlert = false;
		this.message = "";
    }

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

}
