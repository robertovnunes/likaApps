package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import model.EstudoCaso;
import model.PontoChaveProfessor;
import dao.PontoChaveProfessorDAO;



public class PontoChaveProfessorNegocios {

	private static FabricaDAO fabrica;

	static PontoChaveProfessorNegocios instancia;

	public static PontoChaveProfessorNegocios getInstancia(){

		if(PontoChaveProfessorNegocios.instancia == null){

			PontoChaveProfessorNegocios.instancia = new PontoChaveProfessorNegocios();

		}

		return PontoChaveProfessorNegocios.instancia;
	}

	public static List<PontoChaveProfessor> listaPontoChaveProfessorPorEstudoCaso(
			EstudoCaso estudoSelecionado) {

		List<PontoChaveProfessor> retorno = null;

		PontoChaveProfessorDAO pontoChaveProfessorDAO = fabrica.getPontoChaveProfessorDAO();

		retorno = pontoChaveProfessorDAO.listarPontoChaveProfessorPorEstudoCaso(estudoSelecionado);

		return retorno;
	}

	private PontoChaveProfessorNegocios() {

		fabrica = FabricaJPADAO.getInstancia();

	}

	public void excluirPontoChaveProfessor(PontoChaveProfessor ponto){

		try{

			PontoChaveProfessorDAO dao = fabrica.getPontoChaveProfessorDAO();

			dao.remover(ponto);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void salvarPontoChaveAluno(PontoChaveProfessor ponto){

		PontoChaveProfessorDAO pontoChaveProfessorDAO = fabrica.getPontoChaveProfessorDAO();
		PontoChaveProfessor instancia;
		if(ponto.getIdpontochaveprofessor() > 0){
			instancia = pontoChaveProfessorDAO.getPorId(ponto.getIdpontochaveprofessor());
			instancia.setNome(ponto.getNome());
			instancia.setJustificativa(ponto.getJustificativa());
		}else{
			instancia = ponto;
		}
		
		pontoChaveProfessorDAO.persistir(instancia);
		
		ponto = instancia;

	}

}
