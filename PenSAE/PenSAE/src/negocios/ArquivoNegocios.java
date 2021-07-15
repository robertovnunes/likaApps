package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import javax.persistence.ManyToOne;

import model.AlunoEstudoCaso;
import model.Arquivo;
import model.Curso;
import model.EstudoCaso;
import model.Usuario;
import dao.AlunoEstudoCasoDAO;
import dao.ArquivoDAO;
import define.Define;


public class ArquivoNegocios {

	private static ArquivoNegocios instancia;
	public static ArquivoNegocios getInstancia(){
		if(ArquivoNegocios.instancia == null){
			ArquivoNegocios.instancia = new ArquivoNegocios();
		}
		return ArquivoNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private ArquivoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public Arquivo getArquivoPorEntidade(Object o){

		Arquivo retorno = null;

		try{
			int id = 0;
			int tipo = 0;

			if(o.getClass().equals(Curso.class)){

				id = ((Curso)o).getId();
				tipo = Define.ARQUIVO_TIPO_PROGRAMACAO_CURSO;

			}else if(o.getClass().equals(EstudoCaso.class)){

				id = ((EstudoCaso)o).getId();
				tipo = Define.ARQUIVO_TIPO_IMAGEM_ESTUDO_CASO;

			}else if(o.getClass().equals(AlunoEstudoCaso.class)){

				id = ((AlunoEstudoCaso)o).getId();
				tipo = Define.ARQUIVO_TIPO_REFERENCIAS_ESTUDO_CASO;
			}

			ArquivoDAO arquivoDao = fabrica.getArquivoDAO();

			retorno = arquivoDao.getArquivoPorIDMae(id, tipo);

		}catch(Exception e){

			e.printStackTrace();
		}

		return retorno;
	}
	
	public Arquivo getReferenciaAlunoEstudoCaso(AlunoEstudoCaso aec) {
		
		Arquivo retorno = null;

		retorno = getArquivoPorEntidade(aec);

		return retorno;
	}

	public Arquivo getReferenciaUsuarioEstudoCaso(Usuario u, EstudoCaso ec){
		Arquivo retorno = null;

		AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

		AlunoEstudoCaso aec = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);

		retorno = getArquivoPorEntidade(aec);

		return retorno;
	}

	public void salvarArquivo(Arquivo a){

		ArquivoDAO arquivoDAO = fabrica.getArquivoDAO();

		arquivoDAO.persistir(a);

	}

	public void salvarReferencia(Arquivo a, Usuario u, EstudoCaso ec){

		AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();
		AlunoEstudoCaso aec = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);

		a.setId_EntidadeMae(aec.getId());

		salvarArquivo(a);
	}

}
