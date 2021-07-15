package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.AlunoEstudoCaso;
import model.Curso;
import model.EstudoCaso;
import model.Professor;
import model.Usuario;
import dao.AlunoEstudoCasoDAO;
import define.Define;

public class AlunoEstudoCasoJPADAO extends DAOGenericoJPA<AlunoEstudoCaso, Integer>
implements AlunoEstudoCasoDAO{

	@Override
	public AlunoEstudoCaso getAlunoEstudoCaso(Usuario u, EstudoCaso ec) {

		AlunoEstudoCaso retorno = null;

		String query = "SELECT aec.* FROM aluno a, alunoestudocaso aec WHERE a.usuario_id = "+u.getId()+ " "
				+ "AND a.id = aec.Aluno_id AND aec.EstudoCaso_id = " + ec.getId() +";";

		retorno = executarQueryObjeto(query);

		return retorno;
	}

	@Override
	public AlunoEstudoCaso getPorId(int id) {

		return this.getManager().find(AlunoEstudoCaso.class, id);
	}

	@Override
	public boolean getTodosTerminaramFasePontosChave(int idEstudoCaso) {

		boolean retorno = false;

		if(idEstudoCaso >0){

			String query = "SELECT DISTINCT aec.* FROM " +
					"alunoestudocaso aec WHERE aec.EstudoCaso_id='"+idEstudoCaso+"' " +
					"AND aec.faseAtual > "+ Define.FASE_ARCO_OBSERVACAO + ";";


			List<AlunoEstudoCaso> alunos = executarQueryLista(query);

			retorno = (alunos.size() > 0);
		}		


		return retorno;
	}

	@Override
	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorEstudoCaso(EstudoCaso ec) {

		List<AlunoEstudoCaso> retorno = null;

		String query = "SELECT DISTINCT aec.* from alunoestudocaso aec, estudocaso ec WHERE aec.EstudoCaso_id = " + ec.getId();


		retorno = executarQueryLista(query);

		return retorno;
	}
	
	@Override
	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorProfessor(Professor p) {

		List<AlunoEstudoCaso> retorno = null;

		String query = "SELECT DISTINCT aec.* FROM professor p, curso_has_professor chp, curso_has_aluno cha, alunoestudocaso aec " +
				"WHERE chp.Professor_id = "+p.getId()+ " AND chp.Curso_id = cha.Curso_id AND cha.Aluno_id = aec.Aluno_id;";

		retorno = executarQueryLista(query);

		return retorno;
	}

	@Override
	public List<AlunoEstudoCaso> listarAlunoEstudoCasos(Usuario u) {

		List<AlunoEstudoCaso> retorno = null;

		String query = "";

		if(u.getPerfil() == Define.PERFIL_ALUNO){

			query = "SELECT DISTINCT aec.* FROM aluno a, alunoestudocaso aec WHERE " +
					"a.usuario_id = "+u.getId()+ " AND a.id = aec.Aluno_id;";

		}else {

			query = "SELECT aec.* FROM alunoestudocaso aec, estudocaso ec, " +
					"curso_has_aluno cha, curso_has_professor chp, professor p WHERE " + 
					"p.usuario_id = "+ u.getId() +
					"AND chp.Professor_id = p.id " + 
					"AND ec.curso_id = chp.Curso_id " + 
					"AND cha.Curso_id = chp.Curso_id " +
					"AND aec.Aluno_id = cha.Aluno_id " +
					"AND aec.EstudoCaso_id = ec.id;";
		}



		retorno = executarQueryLista(query);

		return retorno;
	}

	@Override
	public List<AlunoEstudoCaso> listarAlunoEstudoCasosPorUsuarioCurso(Usuario u, Curso c) {
		List<AlunoEstudoCaso> retorno = null;

		String query = "SELECT DISTINCT aec.* FROM alunoestudocaso aec, estudocaso ec, " +
				"curso_has_aluno cha, curso_has_professor chp, professor p WHERE " + 
				"p.usuario_id = "+ u.getId() +
				" AND chp.Professor_id = p.id " + 
				"AND ec.curso_id = " + c.getId() + 
				" AND cha.Curso_id = " + c.getId() +
				" AND aec.Aluno_id = cha.Aluno_id " +
				"AND aec.EstudoCaso_id = ec.id;";

		retorno = executarQueryLista(query);

		return retorno;
	}
}