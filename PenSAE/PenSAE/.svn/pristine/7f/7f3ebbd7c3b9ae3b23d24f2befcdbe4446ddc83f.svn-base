package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.AlunoEstudoCaso;
import model.Curso;
import model.EstudoCaso;
import model.Professor;
import model.Usuario;

public interface AlunoEstudoCasoDAO extends DAOGenerico<AlunoEstudoCaso, Integer> {

	public AlunoEstudoCaso getAlunoEstudoCaso(Usuario u, EstudoCaso ec);

	public boolean getTodosTerminaramFasePontosChave(int idEstudoCaso);

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorEstudoCaso(EstudoCaso ec);
	
	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorProfessor(Professor p);
	
	public List<AlunoEstudoCaso> listarAlunoEstudoCasos(Usuario u);
	
	public List<AlunoEstudoCaso> listarAlunoEstudoCasosPorUsuarioCurso(Usuario u, Curso c);
	
}
