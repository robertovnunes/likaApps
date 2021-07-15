package hpdd.web;

import javax.faces.application.FacesMessage;
import javax.faces.bean.*;
import javax.faces.context.FacesContext;


import java.util.Date;

import java.util.List;

import hpdd.user.User;
import hpdd.user.UserRN;

@ManagedBean(name="userBean")
@RequestScoped
public class UserBean {
	
	private User user = new User();
	java.util.Date dataEHora = new Date();
	java.sql.Timestamp date = new java.sql.Timestamp(dataEHora.getTime());
	private String confirmPassword;
	private List<User> list;

	public String newUser() {

		this.user = new User();
		this.user.setStatus(false);
		this.user.setDate_reg(date);
		System.out.println(date);
		return "newUser";
	}


	
	public String save() {
		FacesContext context = FacesContext.getCurrentInstance();
		
		String password = this.user.getPassword();
		if(!password.equals(this.confirmPassword)) {
			FacesMessage facesMessage = new FacesMessage("The password was not correctly confirmed.");
			context.addMessage(null, facesMessage);
			return null;
		}
		
		UserRN userRN = new UserRN();
		userRN.save(this.user);
		return "userSuccess";
	}
	
	public String delete() {
		UserRN userRN = new UserRN();
		userRN.delete(this.user);
		this.list = null;
		return null;
	}
	
	public String changeStatus() {
		if (this.user.getStatus())
			this.user.setStatus(false);
		else
			this.user.setStatus(true);
		
		UserRN userRN = new UserRN();
		userRN.save(this.user);
		return null;
	}
	
	public List<User> getList() {
		if (this.list == null) {
			UserRN userRN = new UserRN();
			this.list = userRN.list();
		}
		
		return this.list;
	}
	


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	
	
}
