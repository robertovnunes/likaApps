package hpdd.util;
import hpdd.user.*;

public class DAOFactory {
	public static UserDAO createUserDAO(){
		UserDAOHibernate userDAO = new UserDAOHibernate();
		userDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return userDAO;
	}

}
