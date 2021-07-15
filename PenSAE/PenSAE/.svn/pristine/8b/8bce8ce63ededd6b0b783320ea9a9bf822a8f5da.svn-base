package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Curso;
import model.EstudoCaso;
import model.Usuario;
import dao.EstudocasoDAO;
import define.Define;



public class EstudocasoJPADAO extends DAOGenericoJPA <EstudoCaso, Integer> 
implements  EstudocasoDAO{

	public EstudoCaso getEstudoPorNome(String nome){
		EstudoCaso retorno = null;

		String query = "SELECT e.* FROM estudocaso e WHERE e.nome='"+nome+"';";

		retorno = executarQueryObjeto(query);

		return retorno;
	}

	@Override
	public List<EstudoCaso> getEstudoPorUsuarioCurso (Usuario u, Curso c){

		List<EstudoCaso> retorno = null;

		String query = "";

		if(u.getPerfil() == Define.PERFIL_PROFESSOR){

			query = "SELECT ec.* FROM professor p, " +
					"curso_has_professor chp, estudocaso ec WHERE p.usuario_id = " + u.getId() + " " +
					"AND chp.Professor_id = p.id AND chp.Curso_id = ec.Curso_id AND ec.Curso_id = "+ c.getId() +";";

		}else if(u.getPerfil() == Define.PERFIL_ALUNO){

			query  = "SELECT ec.* FROM aluno a, curso_has_aluno cha, estudocaso ec "
					+ "WHERE a.usuario_id = " + u.getId() + " AND cha.Aluno_id = a.id " +
					"AND cha.Curso_id = ec.Curso_id AND ec.Curso_id ="+ c.getId() + 
					" AND ec.habilitado = 1;";
		}

		retorno = executarQueryLista(query);

		return retorno; 
	}

	@Override
	public EstudoCaso getPorId(int id) {

		return this.getManager().find(EstudoCaso.class, id);
	}
}
