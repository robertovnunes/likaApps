package util;

import javax.persistence.EntityManager;

import model.Usuario;

import entityManagerFactory.EntityManageFactoryImpl;
import fachada.Fachada;

public class MainPopulaBD {
	
	public static void execCriarArqvsCurso(){
		try {
			
			Fachada fachada = Fachada.getInstance();
			fachada.inicializacaoBanco();
			EntityManager manager = EntityManageFactoryImpl.currentEntityManager();
			String query = "SELECT u.* FROM usuario u WHERE u.login = 'aluno';";
			Usuario retorno = ((Usuario) manager.createNativeQuery(query, Usuario.class)
					.getSingleResult());
			System.out.println(retorno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		MainPopulaBD.execMainPopulaBD();
//		MainPopulaBD.execPopulaMateriais();
//		MainPopulaBD.execCriarArqvsCurso();
		MainPopulaBD.execCriarArqvsCurso();
	}

}
