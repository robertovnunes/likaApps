package negocios;

import model.curso.matricula.arcomaguerez.Avaliacao;

public class AvaliacaoNeg extends GenericNeg<Avaliacao>{

	private static AvaliacaoNeg instancia;
	
	private AvaliacaoNeg() {
		super(Avaliacao.class);
	}
	
	public static AvaliacaoNeg getInstancia(){
		if(AvaliacaoNeg.instancia == null){
			AvaliacaoNeg.instancia = new AvaliacaoNeg();
		}
		return AvaliacaoNeg.instancia;
	}
	
}
