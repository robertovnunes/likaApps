package hpdd.web;

import hpdd.doctor.Doctor;
import hpdd.doctor.DoctorRN;
import hpdd.notification.*;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

@ManagedBean(name = "contextoBean")
@SessionScoped
public class ContextoBean {
	private Doctor loggedUser = null;
	private Notification activeNotification = null;
	public Doctor getLoggedUser() {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext external = context.getExternalContext();
		String user = external.getRemoteUser();
		if (this.loggedUser == null || !user.equals(this.loggedUser.getEmail())) {
			if (user != null) {
				DoctorRN userRN = new DoctorRN();
				this.loggedUser = userRN.findEmail(user);
				this.activeNotification = null;
			}
		}
		return loggedUser;
	}

public Notification getActiveNotification() {
	System.out.println("get");
	if(this.activeNotification == null){
		this.activeNotification = new Notification();
	}
	
	return this.activeNotification;
	}

public void setActiveNotification(ValueChangeEvent event) {
	System.out.println("set");
	Integer notification = (Integer) event.getNewValue();
	NotificationRN notificationRN = new NotificationRN();
	this.activeNotification = notificationRN.load(notification);
	System.out.println(this.activeNotification.getCodNotification());
	}
	

}