package util;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
 
public class teste 
{
	private SessionFactory sessionFactory;
	private static Configuration configuration;
	
	public static Session teste(){
		
		SessionFactory session = configuration.buildSessionFactory();
		Session retorno = session.openSession();
		
		return retorno;
		
	}
	
	public Session teste2(){

		Session retorno = sessionFactory.openSession();
		
		return null;
	}
 
 public static void main(String[] args) 
	{
	 
	  // Directory path here
	  String path = "C://xampp/htdocs/essesboy/vassoura/teste"; 
	  
	  String path2 = "C://xampp/htdocs/essesboy/images/fotos/"; 
	 
	  String files;
	  File folder = new File(path);
	  File[] listOfFiles = folder.listFiles(); 
	 
	  for (int i = 0; i < listOfFiles.length; i++) 
	  {
	 
	   if (listOfFiles[i].isFile()) 
	   {
		   files = listOfFiles[i].getName();
		  // System.out.println(files);
		   listOfFiles[i].renameTo(new File(path2+"foto" + i + ".jpg"));
	      }
	  }
	  

	}
}