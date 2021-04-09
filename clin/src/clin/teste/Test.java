package clin.teste;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import clin.dao.DaoGenerico;
import clin.model.Paciente;

public class Test {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");   
		DaoGenerico<Paciente, Integer> pacienteDao = (DaoGenerico<Paciente, Integer>) context.getBean("pacienteDao");
		
		pacienteDao.listarTudo();
		
		pacienteDao.get(12);

	}
}
