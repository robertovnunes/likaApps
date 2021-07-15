/**
 * 
 */
package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.Arquivo;
import dao.ArquivoDAO;


/**
 * @author Jesus
 *
 */

public class ArquivoJPADAO extends DAOGenericoJPA<Arquivo, Integer>
implements ArquivoDAO {

	/* (non-Javadoc)
	 * @see dao.ArquivoDAO#getProgramacaoCurso(int)
	 */
	@Override
	public Arquivo getArquivoPorIDMae(int id, int tipo) {
		
		Arquivo retorno = null;
		
		String query = "SELECT a.* FROM arquivos a WHERE a.id_EntidadeMae = "+id+" " +
				"AND a.tipoArquivo = " + tipo +";";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
	}

	@Override
	public Arquivo getPorId(int id) {
		
		return this.getManager().find(Arquivo.class, id);
	}

}
