package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.Aluno;
import model.Professor;
import model.Usuario;

/**
 * @author Jesus
 *
 */
public interface AlunoDAO extends DAOGenerico<Aluno, Integer> {

	List<Usuario> getAlunoPorProfessor(Professor professor);
	Aluno getAlunoPorUsuario(Usuario usuario);
}
