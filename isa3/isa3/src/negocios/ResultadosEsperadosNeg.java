package negocios;

import model.curso.matricula.arcomaguerez.ResultadosEsperados;

public class ResultadosEsperadosNeg extends GenericNeg<ResultadosEsperados>{

	private static ResultadosEsperadosNeg instancia;
	
	private ResultadosEsperadosNeg() {
		super(ResultadosEsperados.class);
	}
	
	public static ResultadosEsperadosNeg getInstancia(){
		if(ResultadosEsperadosNeg.instancia == null){
			ResultadosEsperadosNeg.instancia = new ResultadosEsperadosNeg();
		}
		return ResultadosEsperadosNeg.instancia;
	}
	
	
	
}
