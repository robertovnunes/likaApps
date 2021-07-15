/**
 * 
 */
package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;

import java.util.List;

import model.Cipe;
import dao.CipeDAO;

/**
 * @author Jesus
 *
 */

public class CipeJPADAO extends DAOGenericoJPA<Cipe,Integer> 
implements CipeDAO{

	@Override
	public Cipe getPorId(int id) {
		
		return this.getManager().find(Cipe.class, id);
	}

	@Override
	public List<Cipe> listarCipePorTermoEixo(String termo, String eixo) {
		List<Cipe> retorno = null;

		String query = "SELECT c.* FROM cipe c WHERE c.termo REGEXP '"+ termo +"' AND c.eixo = '"+ eixo +"';";
		
		retorno = executarQueryLista(query);
		
		return retorno;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Cipe> listarTodaCipe(int pagina, int tamanho) {
		List retorno;
		
		String query = "SELECT c.* FROM cipe c;";
		
		int indiceInicial = pagina*tamanho;
		int indiceFinal = indiceInicial + tamanho;
		
		List<Cipe> retornoTemp = executarQueryLista(query);
		
		retorno = retornoTemp.subList(indiceInicial, (indiceFinal));
		
		int quantidadeTotalPaginas = retornoTemp.size()/tamanho;
		
		retorno.add(0, quantidadeTotalPaginas);
		
		return retorno;
	}

	@Override
	public List<Cipe> listarTodaCipePorEixo(String... eixo) {

		List<Cipe> retorno = null;
		int contador = 0;
		
		String query = "SELECT c.* FROM cipe c";
		
		for (String temp : eixo) {
			
			if(contador == 0){
				
				query += " WHERE (c.eixo = '" + temp + "')";
				
			}else{
				
				query += " || (c.eixo = '" + temp + "')";
			}
		}
		
		query += ";";

		retorno = executarQueryLista(query);
		
		return retorno;
	}


}
