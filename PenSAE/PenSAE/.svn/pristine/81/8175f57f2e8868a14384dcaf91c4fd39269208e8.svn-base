package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import javax.persistence.ManyToOne;

import model.Professor;
import model.Usuario;
import dao.ProfessorDAO;


public class ProfessorNegocios {
	private static ProfessorNegocios instancia;
	public static ProfessorNegocios getInstancia(){
		if(ProfessorNegocios.instancia == null){
			ProfessorNegocios.instancia = new ProfessorNegocios();
		}
		return ProfessorNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;
	
	private ProfessorNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}
	
	public Professor getProfessorPorUsuario(Usuario u){
		Professor retorno = null;

		ProfessorDAO dao = fabrica.getProfessorDAO();

		retorno = dao.getProfessorPorUsuario(u);

		return retorno;
	}

}
