package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import javax.persistence.ManyToOne;

import model.IntervencaoAluno;
import dao.IntervencaoAlunoDAO;


public class IntervencaoAlunoNegocios {

	private static IntervencaoAlunoNegocios instancia;
	public static IntervencaoAlunoNegocios getInstancia(){
		if(IntervencaoAlunoNegocios.instancia == null){
			IntervencaoAlunoNegocios.instancia = new IntervencaoAlunoNegocios();
		}
		return IntervencaoAlunoNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private IntervencaoAlunoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public void excluirIntervencaoAluno(IntervencaoAluno i){

		
		try{
			
			IntervencaoAlunoDAO intervencaoAlunoDAO = fabrica.getIntervencaoAlunoDAO();
			
			i.setMetaalunos(null);
			
			intervencaoAlunoDAO.remover(i);
			
		}catch (Exception e){
			
			e.printStackTrace();
		}
	}

}
