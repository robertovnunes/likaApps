package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.Iterator;
import java.util.List;

import javax.persistence.ManyToOne;

import model.Cipe;
import dao.CipeDAO;
import define.Define;


public class CipeNegocios {

	private static CipeNegocios instancia;
	public static CipeNegocios getInstancia(){
		if(CipeNegocios.instancia == null){
			CipeNegocios.instancia = new CipeNegocios();
		}
		return CipeNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private CipeNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public List<Cipe> listarCipeEixoDiagnosticoPorTermo(String termo) {

		List<Cipe> retorno = null;

		CipeDAO daoDiagnostico = fabrica.getCipeDAO();

		retorno = daoDiagnostico.listarCipePorTermoEixo(termo, Define.EIXO_FOCO);

		return retorno;
	}

	public List<Cipe> listarCipeEixoIntervencaoPorTermo(String termo) {

		List<Cipe> retorno = null;

		CipeDAO daoDiagnostico = fabrica.getCipeDAO();

		retorno = daoDiagnostico.listarCipePorTermoEixo(termo, Define.EIXO_ACAO);

		return retorno;
	}

	public List<Cipe> listarTodaCipe(int pagina, int tamanho) {
		List<Cipe> retorno;

		CipeDAO cipeDAO = fabrica.getCipeDAO();

		retorno = cipeDAO.listarTodaCipe(pagina, tamanho);

		return retorno;
	}

	public List<Cipe> listarTodaCipeEixoDiagnostico() {

		List<Cipe> retorno = null;

		CipeDAO daoDiagnostico = fabrica.getCipeDAO();

		retorno = daoDiagnostico.listarTodaCipePorEixo(Define.EIXO_FOCO);

		return retorno;
	}

	public String listarTodaCipeEixoDiagnosticoString() {

		String retorno = "";

		try {

			CipeDAO daoDiagnostico = fabrica.getCipeDAO();

			List<Cipe> rawData = daoDiagnostico.listarTodaCipePorEixo(Define.EIXO_FOCO);

			/*
			 * Essa string retorno e montada assim, porque e assim que javascript consegue
			 * interpretar o array de strings 
			 */

			if(rawData != null && rawData.size() > 0){

				retorno = "[";

				for (Iterator<Cipe> iterator = rawData.iterator(); iterator.hasNext();) {
					Cipe cipe = (Cipe) iterator.next();
					retorno += "\"" + cipe.getTermo() + "\"";

					if(iterator.hasNext()){
						retorno += ",";
					}
				}

				retorno += "]";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}



		return retorno;
	}

	public List<Cipe> listarTodaCipeEixoIntervencao() {

		List<Cipe> retorno = null;

		CipeDAO daoDiagnostico = fabrica.getCipeDAO();

		retorno = daoDiagnostico.listarTodaCipePorEixo(Define.EIXO_ACAO);

		return retorno;
	}

	public String listarTodaCipeEixoIntervencaoString() {

		String retorno = "";

		try {

			CipeDAO daoIntervencao = fabrica.getCipeDAO();

			List<Cipe> rawData = daoIntervencao.listarTodaCipePorEixo(Define.EIXO_ACAO);

			/*
			 * Essa string retorno e montada assim, porque e assim que javascript consegue
			 * interpretar o array de strings 
			 */

			if(rawData != null && rawData.size() > 0){

				retorno = "[";

				for (Iterator<Cipe> iterator = rawData.iterator(); iterator.hasNext();) {
					Cipe cipe = (Cipe) iterator.next();
					retorno += "\"" + cipe.getTermo() + "\"";

					if(iterator.hasNext()){
						retorno += ",";
					}
				}

				retorno += "]";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;
	}

	public void salvarCipe(Cipe cipe) {

		try {
			CipeDAO cipeDAO = fabrica.getCipeDAO();

			cipeDAO.persistir(cipe);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
