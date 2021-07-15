package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import javax.persistence.ManyToOne;

import model.MetaAluno;
import dao.MetaAlunoDAO;


public class MetaAlunoNegocios {

	private static MetaAlunoNegocios instancia;
	public static MetaAlunoNegocios getInstancia(){
		if(MetaAlunoNegocios.instancia == null){
			MetaAlunoNegocios.instancia = new MetaAlunoNegocios();
		}
		return MetaAlunoNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private MetaAlunoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public void excluirMetaAluno(MetaAluno meta){

		try {
			
			MetaAlunoDAO metaAlunoDAO = fabrica.getMetaAlunoDAO();
			
			metaAlunoDAO.remover(meta);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
