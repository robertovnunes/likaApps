package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Curso;
import model.Professor;
import model.Usuario;
import dao.CursoDAO;



public class CursoJPADAO extends DAOGenericoJPA<Curso, Integer>
implements CursoDAO {

	public Curso getCursoPorNome(String nome){

		Curso retorno = null;

		String query = "SELECT c.* FROM curso c WHERE c.nome = '"+nome+"';";

		retorno = executarQueryObjeto(query);

		return retorno;
	}

	public Curso getCursoPorPessoa(Usuario u){

		Curso retorno = null;

		String query = "SELECT c.* FROM curso c, curso_has_aluno cha, aluno a "
				+ "WHERE c.id = cha.Curso_id AND cha.Aluno_id = a.id AND a.pessoa_id = " + u.getId() + ";";

		retorno = executarQueryObjeto(query);

		return retorno;
	}

	@Override
	public List<Curso> getCursosNaoMatriculadosPorUsuario(Usuario u) {
		List<Curso> retorno = null;

		String query = "SELECT c.* FROM curso c, curso_has_aluno cha, aluno a "
				+ "WHERE c.id != cha.Curso_id AND cha.Aluno_id = a.id AND c.nome !='' AND a.usuario_id = "+u.getId()+";";

		retorno = executarQueryLista(query);

		return retorno;
	}
	
	@Override
	public List<Curso> getCursosPorUsuario(Usuario u){
		List<Curso> retorno = null;

		String query = "SELECT c.* FROM curso c, curso_has_aluno cha, aluno a "
				+ "WHERE c.id = cha.Curso_id AND cha.Aluno_id = a.id AND a.usuario_id = "+u.getId()+";";

		retorno = executarQueryLista(query);

		return retorno;
	}

	public String getNomeCursoPorId(int id){

		String retorno = "";

		String query = "SELECT c.nome FROM curso c WHERE c.id = "+id+";";

		try {

			retorno = (String) getManager().createNativeQuery(query).getSingleResult();

		} catch (Exception e) {
			
		}

		return retorno;
	}

	public String getNomeCursoPorNome(String nome){

		String retorno = null;

		String query = "SELECT c.nome FROM curso c WHERE c.nome = '"+nome+"';";
		
		try {
			
			retorno = (String) getManager().createNativeQuery(query).getSingleResult();
			
		} catch (Exception e) {

		}

		return retorno;
	}

	@Override
	public Curso getPorId(int id) {

		return this.getManager().find(Curso.class, id);
	}

	public String getProfessorResponsavel(int id){

		String professor = "";

		String query = "SELECT u.nome FROM usuario u, professor prof, curso_has_professor chp "
				+ "WHERE u.id = prof.usuario_id AND prof.id = chp.Professor_id AND chp.Curso_id = "+id+";";

		professor = (String) this.getManager().createNativeQuery(query)
				.getSingleResult();

		return professor;
	}

	public int getQuantidadeCasosPorCurso(int id){

		int quantidadeCasos = 0;

		String query = "SELECT count(id) FROM estudocaso WHERE curso_id = "+ id +";";

		quantidadeCasos = ((Long) this.getManager().createNativeQuery(query)
				.getSingleResult()).intValue();

		return quantidadeCasos;
	}

	@Override
	public List<Curso> listarCursosPorProfessor(Professor p) {

		List<Curso> retorno = null;

		String query = "SELECT c.* FROM curso c, curso_has_professor chp WHERE c.id = chp.Curso_id AND chp.Professor_id = "+p.getId()+";";

		retorno = executarQueryLista(query);

		return retorno;
	}

	@Override
	public List<Curso> listarTodosCursos() {

		List<Curso> retorno = null;

		String query = "SELECT c.* FROM curso c;";

		retorno = executarQueryLista(query);

		return retorno;
	}

}
