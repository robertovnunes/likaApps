package negocios;

import java.util.Date;

import model.sistema.Erro;
import dados.basicas.ErroDAO;

public class ErroNeg extends GenericNeg<Erro>{

	private static ErroNeg instancia;
	
	private ErroNeg() {
		super(Erro.class);
	}
	
	public static ErroNeg getInstancia(){
		if(ErroNeg.instancia == null){
			ErroNeg.instancia = new ErroNeg();
		}
		return ErroNeg.instancia;
	}
	
	
	public void reportarBug(Erro erro){
		
		erro.setDataHora(new Date());
		
		ErroDAO dao = this.fabrica.getErroDAO();
		
		erro = dao.persistir(erro);
	}
	
	
}
