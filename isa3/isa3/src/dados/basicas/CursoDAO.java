package dados.basicas;

import java.util.List;

import model.curso.Curso;
import model.curso.EstudoDeCaso;
import dados.DAOGenerico;

public interface CursoDAO extends DAOGenerico<Curso, Integer> {


	public List<Curso> getTodosCursosPorStatus(int ... status);
	public List<Curso> getTodosCursos();
	public Curso getCursoDoEstudoDeCaso(EstudoDeCaso estudoDeCaso);
	public Curso inserirEstudoDeCasoNoCurso(EstudoDeCaso estudoDeCaso, Curso curso);
	
}
