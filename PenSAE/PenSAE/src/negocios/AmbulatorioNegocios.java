package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;
import model.Ambulatorio;
import model.Curso;
import model.Usuario;
import dao.AmbulatorioDAO;

public class AmbulatorioNegocios {

	static AmbulatorioNegocios instancia;
	
	public static AmbulatorioNegocios getInstancia(){
		
		if(AmbulatorioNegocios.instancia == null){
			AmbulatorioNegocios.instancia = new AmbulatorioNegocios();
		}
		
		return AmbulatorioNegocios.instancia;
		
	}

	private FabricaDAO fabrica;
	
	private AmbulatorioNegocios(){
		fabrica = FabricaJPADAO.getInstancia();
	}

	
	public Ambulatorio getAmbulatorioPorUsuarioCurso(Usuario usuarioLogado, Curso cursoAtual) {
		Ambulatorio retorno = null;
		
		AmbulatorioDAO ambulatorioDAO = fabrica.getAmbulatorioDAO();
		
		retorno = ambulatorioDAO.getAmbulatorioUsuarioEstudoCaso(usuarioLogado, cursoAtual);
		
		return retorno;
	}

	public Ambulatorio salvarAmbulatorio(Ambulatorio ambulatorio){
		try {
			AmbulatorioDAO daoAmbulatorio = fabrica.getAmbulatorioDAO();
			
			daoAmbulatorio.persistir(ambulatorio);
			
			ambulatorio = daoAmbulatorio.getPorId(ambulatorio.getId());
		} catch(Exception e){
			e.printStackTrace();
		}
		return ambulatorio;
	}
}
