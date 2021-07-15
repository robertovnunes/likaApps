package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.CompetenciaHabilidadeEspecifica;

public interface CompetenciaHabilidadeEspecificaDAO extends DAOGenerico<CompetenciaHabilidadeEspecifica,Integer>{
	public List<CompetenciaHabilidadeEspecifica> listarCompetenciaHabilidadeEspecifica();
}