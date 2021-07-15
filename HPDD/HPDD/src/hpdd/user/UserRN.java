package hpdd.user;

import java.util.List;

import hpdd.util.DAOFactory;

public class UserRN {
	private UserDAO userDAO;
	public UserRN() {
		this.userDAO = DAOFactory.createUserDAO();
	}
	public User load(Integer idUser){
		return this.userDAO.load(idUser);
	}
	public User findEmail(String email) {
		return this.userDAO.findEmail(email);
	}
	public void save(User user) {
		
		Integer idUser = user.getIduser();
		
		if(idUser == null || idUser == 0) {
			//user.getPermission().add("ROLE_USER");
			this.userDAO.save(user);
		} else {
			this.userDAO.update(user);
		}
	}
	public void delete(User user) {
		this.userDAO.delete(user);
	}
	public List<User> list() {
		return this.userDAO.list();
	}
}
