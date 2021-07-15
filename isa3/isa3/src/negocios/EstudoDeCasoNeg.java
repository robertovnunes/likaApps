package negocios;

import model.curso.EstudoDeCaso;

public class EstudoDeCasoNeg extends GenericNeg<EstudoDeCaso>{

	private static EstudoDeCasoNeg instancia;
	
	private EstudoDeCasoNeg() {
		super(EstudoDeCaso.class);
	}
	
	public static EstudoDeCasoNeg getInstancia(){
		if(EstudoDeCasoNeg.instancia == null){
			EstudoDeCasoNeg.instancia = new EstudoDeCasoNeg();
		}
		return EstudoDeCasoNeg.instancia;
	}
	
}
