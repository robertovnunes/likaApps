package negocios;

import model.curso.matricula.arcomaguerez.DiagnosticosResultados;

public class DiagnosticosResultadosNeg extends GenericNeg<DiagnosticosResultados>{

	private static DiagnosticosResultadosNeg instancia;
	
	private DiagnosticosResultadosNeg() {
		super(DiagnosticosResultados.class);
	}
	
	public static DiagnosticosResultadosNeg getInstancia(){
		if(DiagnosticosResultadosNeg.instancia == null){
			DiagnosticosResultadosNeg.instancia = new DiagnosticosResultadosNeg();
		}
		return DiagnosticosResultadosNeg.instancia;
	}
	
}
