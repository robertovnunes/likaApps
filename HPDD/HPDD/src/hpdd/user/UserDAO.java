package hpdd.user;

import java.util.List;

public interface UserDAO {
	public void save(User user);
	public void update(User user);
	public void delete(User user);
	public User load(Integer iduser);
	public User findEmail(String email);
	public List<User> list();
	
	
}
