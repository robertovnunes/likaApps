package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.Curso;
import model.Professor;
import model.Usuario;


public interface CursoDAO extends DAOGenerico<Curso, Integer> {

	Curso getCursoPorNome(String nome);
	List<Curso> getCursosNaoMatriculadosPorUsuario(Usuario u);
	List<Curso> getCursosPorUsuario(Usuario u);
	String getNomeCursoPorId(int id);
	String getNomeCursoPorNome(String nome);
	String getProfessorResponsavel(int id);
	int getQuantidadeCasosPorCurso(int id);
	List<Curso> listarCursosPorProfessor(Professor p);
	List<Curso> listarTodosCursos();
}
