package dao;

import genericos.DAOGenerico;
import model.Professor;
import model.Usuario;

/**
 * @author Jesus
 *
 */
public interface ProfessorDAO extends DAOGenerico<Professor, Integer> {

	Professor getProfessorPorUsuario(Usuario usuario);
}
