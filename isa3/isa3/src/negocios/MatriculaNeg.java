package negocios;

import java.util.List;

import model.curso.Curso;
import model.curso.matricula.MatriculaCursoAluno;
import model.usuario.Aluno;
import dados.basicas.MatriculaCursoAlunoDAO;

public class MatriculaNeg extends GenericNeg<MatriculaCursoAluno>{

	private static MatriculaNeg instancia;
	
	private MatriculaNeg() {
		super(MatriculaCursoAluno.class);
	}
	
	public static MatriculaNeg getInstancia(){
		if(MatriculaNeg.instancia == null){
			MatriculaNeg.instancia = new MatriculaNeg();
		}
		return MatriculaNeg.instancia;
	}
	
	public List<MatriculaCursoAluno> getTodasMatriculasAluno(Aluno aluno) {
		MatriculaCursoAlunoDAO dao = fabrica.getMatriculaCursoAlunoDAO();
		return dao.getTodasMatriculasAluno(aluno);
	}
	
	public List<Curso> getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(List<MatriculaCursoAluno> matriculas){
		MatriculaCursoAlunoDAO dao = fabrica.getMatriculaCursoAlunoDAO();
		return dao.getTodosCursosDisponiveisEAndamentoDiferentesDeMatriculado(matriculas);
	}
	
	public List<MatriculaCursoAluno> getTodosMatriculaCursoAluno() {
		MatriculaCursoAlunoDAO dao = fabrica.getMatriculaCursoAlunoDAO();
		return dao.getTodosMatriculaCursoAluno();
	}
}
