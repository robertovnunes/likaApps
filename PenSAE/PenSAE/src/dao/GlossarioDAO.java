package dao;

import genericos.DAOGenerico;

import java.util.List;

import model.EstudoCaso;
import model.Glossario;

public interface GlossarioDAO extends DAOGenerico<Glossario,Integer>{

	List<Glossario> listarGlossarios(EstudoCaso estudoSelecionado);

}
