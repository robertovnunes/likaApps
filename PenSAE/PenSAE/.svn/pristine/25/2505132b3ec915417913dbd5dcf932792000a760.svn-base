package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.AlunoEstudoCaso;
import model.DiagnosticoAluno;
import dao.DiagnosticoAlunoDAO;



public class DiagnosticoAlunoJPADAO extends DAOGenericoJPA<DiagnosticoAluno,Integer> 
implements DiagnosticoAlunoDAO{

	@Override
	public DiagnosticoAluno getPorId(int id) {
		
		return this.getManager().find(DiagnosticoAluno.class, id);
	}

	@Override
	public List<DiagnosticoAluno> listarDiagnosticoPorAlunoEstudoCaso(
			AlunoEstudoCaso aec) {
		List<DiagnosticoAluno> retorno = null;

		String query = "SELECT da.* FROM diagnosticoaluno da WHERE da.AlunoEstudoCaso_id = "+aec.getId()+";";

		retorno = executarQueryLista(query);

		return retorno;
	}

}
