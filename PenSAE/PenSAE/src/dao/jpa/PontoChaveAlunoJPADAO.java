package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.AlunoEstudoCaso;
import model.EstudoCaso;
import model.PontoChaveAluno;
import dao.PontoChaveAlunoDAO;



public class PontoChaveAlunoJPADAO extends DAOGenericoJPA<PontoChaveAluno, Integer>
implements PontoChaveAlunoDAO {

	@Override
	public PontoChaveAluno getPorId(int id) {

		return this.getManager().find(PontoChaveAluno.class, id);
	}

	public List<PontoChaveAluno> listarPontoChaveAlunoPorAlunoEstudoCaso(AlunoEstudoCaso aec){
		List<PontoChaveAluno> retorno = null;

		String query = "SELECT pca.* FROM pontochavealuno pca WHERE pca.alunoestudocaso_id = "+aec.getId()+";";

		retorno = executarQueryLista(query);

		return retorno;
	}

	@Override
	public List<PontoChaveAluno> listarPontoChaveAlunoPorEstudoCaso(
			EstudoCaso estudoSelecionado) {
		List<PontoChaveAluno> retorno = null;

		String query = "SELECT DISTINCT pca.* FROM pontochavealuno pca, alunoestudocaso aec, estudocaso ec " + 
				"WHERE pca.alunoestudocaso_id = aec.id AND aec.EstudoCaso_id = " + estudoSelecionado.getId() + ";";

		retorno = executarQueryLista(query);

		return retorno;
	}

}
