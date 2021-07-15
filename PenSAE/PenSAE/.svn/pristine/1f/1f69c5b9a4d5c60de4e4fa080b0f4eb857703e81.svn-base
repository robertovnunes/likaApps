package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.Curso;
import model.EstudoCaso;
import model.Usuario;

public interface EstudocasoDAO extends DAOGenerico<EstudoCaso, Integer>{
	EstudoCaso getEstudoPorNome(String nome);
	List<EstudoCaso> getEstudoPorUsuarioCurso(Usuario usuario, Curso c);
}