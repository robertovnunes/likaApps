package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.Descritor;

public interface DescritorDAO extends DAOGenerico<Descritor,Integer>{
	
	public List<Descritor> listarDescritores();
	
}
