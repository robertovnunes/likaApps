package entityManagerFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManageFactoryImpl {

	private static EntityManagerFactory FACTORY;  

	private static EntityManageFactoryImpl instance;
	
	public static final ThreadLocal<EntityManager> SESSION = new ThreadLocal<EntityManager>();  

	private static final String UNIT_NAME = "PenSAE";  

	public static void closeEntityManager() {  
		EntityManager manager = (EntityManager) SESSION.get();  
		if (manager != null) {  
			currentEntityManager().close();  
		}  
		SESSION.set(null);  
	}

	public static EntityManager currentEntityManager() {  
		EntityManager manager = (EntityManager) SESSION.get();  
		if (manager == null) {    
			loadInstance();  
			manager = FACTORY.createEntityManager();
			SESSION.set(manager);
		}  
		return manager;  
	}  

	public static EntityManageFactoryImpl getInstance() {

		if(instance == null){
			instance = new EntityManageFactoryImpl();
		}

		return instance;
	}  

	private static synchronized void loadInstance() {  
		if (FACTORY == null) {  
			FACTORY = Persistence.createEntityManagerFactory(UNIT_NAME);  
		}  
	}  
}
