package negocios;

import model.curso.matricula.arcomaguerez.DiagnosticosImplementacoes;

public class DiagnosticosImplementacoesNeg extends GenericNeg<DiagnosticosImplementacoes>{

	private static DiagnosticosImplementacoesNeg instancia;
	
	private DiagnosticosImplementacoesNeg() {
		super(DiagnosticosImplementacoes.class);
	}
	
	public static DiagnosticosImplementacoesNeg getInstancia(){
		if(DiagnosticosImplementacoesNeg.instancia == null){
			DiagnosticosImplementacoesNeg.instancia = new DiagnosticosImplementacoesNeg();
		}
		return DiagnosticosImplementacoesNeg.instancia;
	}
	
}
