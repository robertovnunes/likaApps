package hpdd.web;
import javax.faces.bean.*;

import hpdd.doctor.Doctor;
import hpdd.doctor.DoctorRN;
import hpdd.web.util.ContextoUtil;

import java.util.Date;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import java.util.List;


@ManagedBean(name="userBean")
@RequestScoped
public class UserBean {
	
	private Doctor user = new Doctor();
	java.util.Date dataEHora = new Date();
	java.sql.Timestamp date = new java.sql.Timestamp(dataEHora.getTime());
	private String confirmPassword;
	private List<Doctor> list;
	private List<Doctor> listLoggeddUser = null ;

	public List<Doctor> getListLoggeddUser() {
		if(this.listLoggeddUser == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			DoctorRN doctorRN= new DoctorRN();
			this.listLoggeddUser = doctorRN.listLoggeddUser(contextoBean.getLoggedUser().getIduser());
		}
		return listLoggeddUser;
	}


	public String newUser() {

		this.user = new Doctor();
		this.user.setStatus(false);
		this.user.setDate_reg(date);
		System.out.println(date);
		return "newUser";
	}

	public void update() {
		FacesContext context = FacesContext.getCurrentInstance();
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		System.out.println(contextoBean);
		this.user.setIduser(contextoBean.getLoggedUser().getIduser());
		this.user.setStatus(contextoBean.getLoggedUser().getStatus());
		String password = this.user.getPassword();
		if(!password.equals(this.confirmPassword)) {
			FacesMessage facesMessage = new FacesMessage("The password was not correctly confirmed.");
			context.addMessage(null, facesMessage);
			//return null;
		}
		DoctorRN userRN = new DoctorRN();
		userRN.save(this.user);
		//return "userSuccess";
	}

	
	public String save() {
		FacesContext context = FacesContext.getCurrentInstance();
		//ContextoBean contextoBean = ContextoUtil.getContextoBean();
		//System.out.println(contextoBean);
		//this.user.setIduser(contextoBean.getLoggedUser().getIduser());
		//this.user.setStatus(contextoBean.getLoggedUser().getStatus());
		String password = this.user.getPassword();
		if(!password.equals(this.confirmPassword)) {
			FacesMessage facesMessage = new FacesMessage("The password was not correctly confirmed.");
			context.addMessage(null, facesMessage);
			return null;
		}
		
		DoctorRN userRN = new DoctorRN();
		userRN.save(this.user);
		return "userSuccess";
	}
	
	public String delete() {
		DoctorRN userRN = new DoctorRN();
		userRN.delete(this.user);
		this.list = null;
		return null;
	}
	
	public String changeStatus() {
		System.out.println("change");
		if (this.user.getStatus())
			this.user.setStatus(false);
		else
			this.user.setStatus(true);
		
		DoctorRN userRN = new DoctorRN();
		userRN.save(this.user);
		return null;
	}
	
	public List<Doctor> getList() {
		if (this.list == null) {
			DoctorRN userRN = new DoctorRN();
			this.list = userRN.list();
		}
		
		return this.list;
	}
	


	public Doctor getUser() {
		return user;
	}
	public void setUser(Doctor user) {
		this.user = user;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}