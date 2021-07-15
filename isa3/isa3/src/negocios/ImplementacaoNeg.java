package negocios;

import model.curso.matricula.arcomaguerez.Implementacao;

public class ImplementacaoNeg extends GenericNeg<Implementacao>{

	private static ImplementacaoNeg instancia;
	
	private ImplementacaoNeg() {
		super(Implementacao.class);
	}
	
	public static ImplementacaoNeg getInstancia(){
		if(ImplementacaoNeg.instancia == null){
			ImplementacaoNeg.instancia = new ImplementacaoNeg();
		}
		return ImplementacaoNeg.instancia;
	}
	
	
}
