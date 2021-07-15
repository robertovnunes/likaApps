package negocios;

import model.Nic;

public class NicNeg extends GenericNeg<Nic>{

	private static NicNeg instancia;
	
	private NicNeg() {
		super(Nic.class);
	}
	
	public static NicNeg getInstancia(){
		if(NicNeg.instancia == null){
			NicNeg.instancia = new NicNeg();
		}
		return NicNeg.instancia;
	}
	
}
