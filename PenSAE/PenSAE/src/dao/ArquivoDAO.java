package dao;

import genericos.DAOGenerico;
import model.Arquivo;

/**
 * @author Jesus
 *
 */
public interface ArquivoDAO extends DAOGenerico<Arquivo, Integer> {

	Arquivo getArquivoPorIDMae(int id, int tipo);
}
