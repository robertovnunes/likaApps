package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.AlunoEstudoCaso;
import model.MetaAluno;

public interface MetaAlunoDAO extends DAOGenerico<MetaAluno, Integer>{

	public List<MetaAluno> listarMetasPorAlunoEstudoCaso(AlunoEstudoCaso aec);
}
