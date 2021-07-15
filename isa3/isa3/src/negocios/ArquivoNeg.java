package negocios;

import java.util.ArrayList;
import java.util.List;

import dados.basicas.ArquivoDAO;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.sistema.Arquivo;

public class ArquivoNeg extends GenericNeg<Arquivo>{

	private static ArquivoNeg instancia;
	
	private ArquivoNeg() {
		super(Arquivo.class);
	}
	
	public static ArquivoNeg getInstancia(){
		if(ArquivoNeg.instancia == null){
			ArquivoNeg.instancia = new ArquivoNeg();
		}
		return ArquivoNeg.instancia;
	}

	
	public List<Arquivo> inserirArquivosImplementacao(List<Arquivo> arquivos, Implementacao implementacao){
		ArquivoDAO arqDao = fabrica.getArquivoDAO();
		List<Arquivo> retorno = new ArrayList<Arquivo>();
		for (Arquivo arquivo : arquivos) {
			Arquivo temp = arqDao.persistir(arquivo);
			retorno.add(temp);
		}
		return retorno;
	}
	
}
