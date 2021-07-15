package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.EstudoCaso;
import model.PontoChaveProfessor;

public interface PontoChaveProfessorDAO   extends DAOGenerico<PontoChaveProfessor, Integer> {

	public List<PontoChaveProfessor> listarPontoChaveProfessorPorEstudoCaso(
			EstudoCaso estudoSelecionado);
}
