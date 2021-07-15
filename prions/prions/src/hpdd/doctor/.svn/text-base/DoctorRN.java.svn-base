package hpdd.doctor;

import java.util.Date;
import java.util.List;

import hpdd.util.DAOFactory;

public class DoctorRN {
	private DoctorDAO userDAO;
	public DoctorRN() {
		this.userDAO = DAOFactory.createUserDAO();
	}
	public Doctor load(Integer idUser){
		return this.userDAO.load(idUser);
	}
	public Doctor findEmail(String email) {
		return this.userDAO.findEmail(email);
	}
	public void save(Doctor user) {
		
		Integer idUser = user.getIduser();
		user.setDate_reg(new Date());
		if(idUser == null || idUser == 0) {
			user.getPermisson().add("ROLE_USUARIO");
			this.userDAO.save(user);
		} else {
			this.userDAO.update(user);
		}
	}
	
	
	public void delete(Doctor user) {
		this.userDAO.delete(user);
	}
	public List<Doctor> list() {
		return this.userDAO.list();
	}
	
	public List<Doctor> listLoggeddUser(Integer id) {
		return this.userDAO.listLoggeddUser(id);
	}
}

