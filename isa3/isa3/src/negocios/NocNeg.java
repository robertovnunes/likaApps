package negocios;

import model.Noc;

public class NocNeg extends GenericNeg<Noc>{

	private static NocNeg instancia;
	
	private NocNeg() {
		super(Noc.class);
	}
	
	public static NocNeg getInstancia(){
		if(NocNeg.instancia == null){
			NocNeg.instancia = new NocNeg();
		}
		return NocNeg.instancia;
	}
	
}
