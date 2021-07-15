package negocios;

import model.curso.matricula.AvaliacaoProfessor;

public class AvaliacaoProfessorNeg extends GenericNeg<AvaliacaoProfessor>{

	private static AvaliacaoProfessorNeg instancia;
	
	private AvaliacaoProfessorNeg() {
		super(AvaliacaoProfessor.class);
	}
	
	public static AvaliacaoProfessorNeg getInstancia(){
		if(AvaliacaoProfessorNeg.instancia == null){
			AvaliacaoProfessorNeg.instancia = new AvaliacaoProfessorNeg();
		}
		return AvaliacaoProfessorNeg.instancia;
	}
	
	
}
