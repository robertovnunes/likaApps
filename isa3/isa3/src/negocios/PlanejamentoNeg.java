package negocios;

import model.curso.matricula.arcomaguerez.Planejamento;

public class PlanejamentoNeg extends GenericNeg<Planejamento>{

	private static PlanejamentoNeg instancia;
	
	private PlanejamentoNeg() {
		super(Planejamento.class);
	}
	
	public static PlanejamentoNeg getInstancia(){
		if(PlanejamentoNeg.instancia == null){
			PlanejamentoNeg.instancia = new PlanejamentoNeg();
		}
		return PlanejamentoNeg.instancia;
	}
	
	
	
}
