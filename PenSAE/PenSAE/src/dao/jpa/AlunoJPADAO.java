package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Aluno;
import model.Professor;
import model.Usuario;
import dao.AlunoDAO;


/**
 * @author Jesus
 *
 */

public class AlunoJPADAO extends DAOGenericoJPA<Aluno, Integer>
implements AlunoDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getAlunoPorProfessor(Professor professor){

		List<Usuario> retorno = null;

		String query = "SELECT DISTINCT u.* FROM usuario u, aluno a, curso_has_aluno cha, curso_has_professor chp " +
				"WHERE chp.Professor_id = " + professor.getId() +" AND chp.Curso_id = cha.Curso_id AND cha.Aluno_id = a.id AND a.usuario_id = u.id";
		try {
			
			retorno = (List<Usuario>) getManager().createNativeQuery(query,Usuario.class)
					.getResultList();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return retorno;
	}

	@Override
	public Aluno getAlunoPorUsuario(Usuario usuario) {

		Aluno retorno = null;

		String query = "SELECT a.* FROM aluno a WHERE a.usuario_id = " + usuario.getId() + ";";

		retorno = executarQueryObjeto(query);

		return retorno;
	}

	@Override
	public Aluno getPorId(int id) {

		return this.getManager().find(Aluno.class, id);
	}
}
